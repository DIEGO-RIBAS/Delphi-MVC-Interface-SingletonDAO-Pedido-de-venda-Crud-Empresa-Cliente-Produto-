unit uEmpresas.Entity;

interface

  uses
    System.SysUtils,
    System.Generics.Collections;

  type

    TEmpresasEntity = class
      private
        FID: Integer;
        FCNPJ: string;
        FEmail: string;
        FrazaoSocial: string;

      public
        property ID          : Integer read FID          write FID;
        property RazaoSocial : string  read FrazaoSocial write FrazaoSocial;
        property Cnpj        : string  read FCNPJ        write FCNPJ;
        property Email       : string  read FEmail       write FEmail;

    end;

   TListaEmpresas = class
       private
          FListaEmpresas : TObjectList<TEmpresasEntity>;
          FEmpresa       : TEmpresasEntity;
       public
          property ListaEmpresas : TObjectList<TEmpresasEntity> read FListaEmpresas  write FListaEmpresas ;
          property Empresa       : TEmpresasEntity              read FEmpresa        write FEmpresa ;

          procedure AddEmpresa(Empresa  : TEmpresasEntity);

          constructor Create;
          destructor destroy;
     end;


implementation

{ TListaEmpresas }

procedure TListaEmpresas.AddEmpresa(Empresa: TEmpresasEntity);
var
  i : Integer;
begin
  FListaEmpresas.Add(TEmpresasEntity.Create);
  I := FListaEmpresas.Count -1;
  FListaEmpresas[I].FID          := Empresa.FID;
  FListaEmpresas[I].FrazaoSocial := Empresa.FrazaoSocial;
  FListaEmpresas[I].FCNPJ        := Empresa.Cnpj;
  FListaEmpresas[I].FEmail       := Empresa.Email;
end;

constructor TListaEmpresas.Create;
begin
  FListaEmpresas := TObjectList<TEmpresasEntity>.Create;
  FEmpresa       := TEmpresasEntity.Create;
end;

destructor TListaEmpresas.destroy;
begin
  FreeAndNil(FListaEmpresas);
  FreeAndNil(FEmpresa);
end;

end.
