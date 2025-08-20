unit uProduto.ModeloDB;

interface

  type

  TProdutoModeloDb = class
    private
     fid: integer;
     fpreco: Double;
     fdescricao: string;

    public
     property id : integer read fid write fid;
     property descricao : string read fdescricao write fdescricao;
     property preco : Double read fpreco write fpreco;
  end;

implementation

end.
