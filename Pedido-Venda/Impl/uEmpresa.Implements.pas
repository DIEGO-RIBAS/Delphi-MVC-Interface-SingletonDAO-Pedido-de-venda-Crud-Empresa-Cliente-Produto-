unit uEmpresa.Implements;

interface
  uses
    Json,
    uEmpresas.Entity;

  type

  iEmpresa = interface

    function GetLista  : TListaEmpresas;
    function GetEmpresaLocal( aCNPJ : String ) : TEmpresasEntity;

    function Gravar( Empresa : TEmpresasEntity ): Boolean;
  end;

  iEmpresaAPI = interface
    function GetEmpresaAPI( aCNPJ : String ) : TJSONObject;
  end;

implementation

end.
