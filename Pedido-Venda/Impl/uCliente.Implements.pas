unit uCliente.Implements;

interface
  uses
    FireDAC.Comp.Client,
    uCliente.ModeloDB;

  type

  iCliente = interface
    function id(AValue : integer):iCliente;
    function Nome(AVAlue : string):iCliente;
    function cidade(AValue : string): iCliente;
    function uf(AValue : string): iCliente;

    function Gravar : Boolean;
    function Listar(AMemTable : TFDMemTable):Boolean;
    function Deletar : Boolean;
    function GetCliente : TClienteModeloDB;
  end;

implementation

end.
