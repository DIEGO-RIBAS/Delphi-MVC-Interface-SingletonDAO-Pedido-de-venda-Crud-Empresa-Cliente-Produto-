unit uEmpresa.Model;

interface

  uses
    System.SysUtils,
    FireDAC.Comp.Client,
    FireDAC.Phys.MySQL,
    System.JSON,
    RESTRequest4D,
    uEmpresas.Entity,

    uEmpresa.Implements,
    IpPeerClient ;

    type

    TEmpresaModel = class(TInterfacedObject, iEmpresa)
      private
        FQuery : TFDQuery;
        FDPhys : TFDPhysMySQLDriverLink;

        function GetLista  : TListaEmpresas;
        function GetEmpresaLocal( aCNPJ : String ) : TEmpresasEntity;
        function GetEmpresaAPI( aCNPJ : String ) : TJSONObject;
        function Gravar( Empresa : TEmpresasEntity ): Boolean;
      public

        class function New : iEmpresa;

        Constructor Create;
        destructor Destroy;
  end;


implementation

    uses uDao.ConexaoSingleton;

{ TEmpresaModel }

constructor TEmpresaModel.Create;
begin
  FQuery            := TFDQuery.Create(nil);
  FQuery.Connection := TConexaoSingleton.GetInstance.Conexao;
end;

destructor TEmpresaModel.Destroy;
begin
  FreeAndNil(FQuery);
end;

function TEmpresaModel.GetEmpresaAPI(aCNPJ: String): TJSONObject;
var
  Resp : IResponse;
begin
  try
    Resp := TRequest.New.BaseURL('https://publica.cnpj.ws/')
                        .Resource('cnpj/'+aCNPJ)
                        .Accept('application/json')
                        // .BasicAuthentication('login','senha')
                        .Get;
  finally
    Result := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Resp.Content),0) as TJSONObject;
  end;
end;

function TEmpresaModel.GetEmpresaLocal(aCNPJ: String): TEmpresasEntity;
begin

  Result := TEmpresasEntity.Create;

  try
    with FQuery do
    begin
      SQL.Clear;
      SQL.Add(' SELECT Id, RazaoSocial, CNPJ, Email '+
              ' FROM empresas                       '+
              ' WHERE                               '+
              ' cnpj = "'+aCNPJ+'" limit 1');

      try
        Open;
      except On E: Exception do
        begin
          raise Exception.Create('Erro consultar cnpj banco local :'+ e.Message);
        end;
      end;

      with Result do
      begin
        ID          := FieldByName('id').AsInteger;
        RazaoSocial := FieldByName('razaosocial').AsString;
        Cnpj        := FieldByName('cnpj').AsString;
        Email       := FieldByName('email').AsString;
      end;
    end;
  finally
    FreeAndNil(FQuery);
  end;

end;

function TEmpresaModel.GetLista: TListaEmpresas;
begin
  Result := TListaEmpresas.Create;

  try
    with FQuery do
    begin
      SQL.Clear;
      SQL.Add('Select Id, RazaoSocial, CNPJ, Email from empresas ');

      try
        Open;
      except On E: Exception do
        begin
          raise Exception.Create('Erro ao listar empresas :'+ e.Message);
        end;
      end;

      while not Eof do
      begin
        with Result do
        begin
          Empresa.ID          := FieldByName('id').AsInteger;
          Empresa.RazaoSocial := FieldByName('razaosocial').AsString;
          Empresa.Cnpj        := FieldByName('cnpj').AsString;
          Empresa.Email       := FieldByName('email').AsString;
        end;

        Result.AddEmpresa(Result.Empresa);

        Next;
      end;
    end;
  finally
    FreeAndNil(FQuery);
  end;

end;

function TEmpresaModel.Gravar(Empresa: TEmpresasEntity): Boolean;
begin
  Result := False;

  try
    with FQuery do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO empresas(razaosocial,cnpj,email) '+
              'VALUES( "'+Empresa.RazaoSocial+'" , "'+Empresa.Cnpj+'","'+Empresa.Email+'"  )' );

      try
        ExecSQL;
        Result := True;
      except On E: Exception do
        begin
          raise Exception.Create('Erro ao gravar empresa :'+ e.Message);
        end;
      end;
    end;
  finally
    FreeAndNil(FQuery);
  end;

end;

class function TEmpresaModel.New: IEmpresa;
begin
  Result := Self.Create;
end;

end.
