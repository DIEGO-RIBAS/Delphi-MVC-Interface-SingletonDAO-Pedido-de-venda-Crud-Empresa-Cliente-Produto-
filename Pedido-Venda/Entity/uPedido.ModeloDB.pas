unit uPedido.ModeloDB;

interface

  uses
    System.SysUtils,
    System.Generics.Collections;


  type

  TPedidoItem = class
    private
      fid: Integer;
      FPrecoUn: Double;
      fidProduto: integer;
      Fqtde: Double;
      fidPedido: integer;
      Fdescricao : string;
    public
      property id : Integer read fid write Fid;
      property idPedido  : integer read fidPedido write fidPedido;
      property idProduto : integer read fidProduto write fidProduto;
      property Qtde : Double read Fqtde write fqtde;
      property PrecoUn : Double read FPrecoUn write FPrecoUn;
      property Descricao : string read Fdescricao write Fdescricao;
  end;


  TPedidoModeloDB = class
    private
      fid: Integer;
      FValorTotal: Double;
      Fidcliente: integer;
      FNomeCli : string;
      Fdata: string;
      FItens: TObjectList<TPedidoItem>;
      FItem: TPedidoItem;

    public
      property id : Integer read fid write fid;
      property Data : string read Fdata write Fdata;
      property idCliente : integer read Fidcliente write fidcliente;
      property NomeCli : string read FnomeCli write FNomeCli;
      property ValorTotal : Double read FValorTotal write FValorTotal;

      property Item  : TPedidoItem read FItem write FItem;
      property Itens : TObjectList<TPedidoItem>  read FItens write FItens;
      procedure AddItem( aItem  : TPedidoItem);

      Constructor Create;
      Destructor Destroy;
  end;


implementation

{ TPedidoModeloDB }

procedure TPedidoModeloDB.AddItem(aItem: TPedidoItem);
var
  i : Integer;
begin
  FItens.Add(TPedidoItem.Create);
  i := FItens.Count - 1;
  FItens[i].fid        := aItem.id;
  FItens[i].fidProduto := aItem.FIDProduto;
  FItens[i].Qtde       := aItem.Fqtde;
  FItens[i].FPrecoUn   := aItem.FPrecoUn;
  FItens[i].fidPedido  := aItem.fidPedido;
  FItens[i].Fdescricao := aItem.Fdescricao;
end;

constructor TPedidoModeloDB.Create;
begin
  FItens := TObjectList<TPedidoItem>.Create;
  FItem  := TPedidoItem.Create;
end;

destructor TPedidoModeloDB.Destroy;
begin
  FreeAndNil(FItens);
  FreeAndNil(FItem);
end;

end.
