unit uPedido.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  numedit,uPedido.ModeloDB;

type
  TfrmPedido = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    btnFechar: TSpeedButton;
    PageControl1: TPageControl;
    tsConsulta: TTabSheet;
    Tsdados: TTabSheet;
    Panel22: TPanel;
    Shape10: TShape;
    lbDescrPesq: TLabel;
    btnPesquisar: TSpeedButton;
    Shape11: TShape;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Shape12: TShape;
    Label20: TLabel;
    edtDescrPesq: TEdit;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    edtDataAte: TJvDateEdit;
    edtDataDe: TJvDateEdit;
    rbCodPedido: TRadioButton;
    rbCodCliente: TRadioButton;
    rbNomeCliente: TRadioButton;
    rbTodos: TRadioButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel29: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Shape13: TShape;
    Label21: TLabel;
    mPedidos: TFDMemTable;
    dsPedido: TDataSource;
    mPedidosid: TIntegerField;
    mPedidosdata: TStringField;
    mPedidosidCliente: TIntegerField;
    mPedidosvlrTotal: TFloatField;
    GridConsulta: TDBGrid;
    mPedidosNome: TStringField;
    Panel4: TPanel;
    btnFinalizar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Panel7: TPanel;
    Shape5: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    Panel32: TPanel;
    Panel9: TPanel;
    Shape6: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    btnIncluir: TSpeedButton;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel10: TPanel;
    edtCodProduto: TEdit;
    edtDescricao: TEdit;
    mItens: TFDMemTable;
    dsItensPedido: TDataSource;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Shape7: TShape;
    Shape1: TShape;
    Label4: TLabel;
    lbTotal: TLabel;
    GridItens: TDBGrid;
    Label5: TLabel;
    mItensid: TIntegerField;
    mItensidPedido: TIntegerField;
    mItensidProduto: TIntegerField;
    mItensDescricao: TStringField;
    mItensqtde: TFloatField;
    mItenspreco: TFloatField;
    mItensvSubTotal: TFloatField;
    Panel15: TPanel;
    btnDeletarItem: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnSelecionarPedido: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    edtQtde: TEdit;
    edtPreco: TEdit;
    edtSubTotal: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure rbCodPedidoClick(Sender: TObject);
    procedure rbCodClienteClick(Sender: TObject);
    procedure rbNomeClienteClick(Sender: TObject);
    procedure rbTodosClick(Sender: TObject);
    procedure GridConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDataDeChange(Sender: TObject);
    procedure edtDataAteChange(Sender: TObject);
    procedure edtCodClienteChange(Sender: TObject);
    procedure edtCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodProdutoChange(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
    procedure edtQtde1Change(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure mItensCalcFields(DataSet: TDataSet);
    procedure GridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeletarItemClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnSelecionarPedidoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeChange(Sender: TObject);
    procedure edtSubTotalChange(Sender: TObject);
  private
    { Private declarations }
    FdtDe, FdtAte : string;
    ExistePeriodo : Boolean;
    B : TBookmark;
    FIdPedido : integer;
    FvlrTotal : Double;

    procedure ConferePeriododata;
    procedure GetSubTotal;

    procedure Limpsr;
    function ValidaInclusaoItem : Boolean;
    function ValidaCamposFinalizar : Boolean;
    procedure GetTotal;
    procedure CarregaPedido(aPedido : TPedidoModeloDB);

  public
    { Public declarations }
  end;

var
  frmPedido: TfrmPedido;

implementation

  uses
    uPedidos.Model,
    uFuncoes.Utils,
    uCliente.Model,
    uCliente.ModeloDB,
    uProduto.ModeloDB,
    uProdutos.Model;

{$R *.dfm}

procedure TfrmPedido.btnAlterarClick(Sender: TObject);
begin
  if mItensid.Value > 0 then
  begin
    if Application.MessageBox('O ítem será removido do banco de dados e estará disponível para edição.'+#13+'Confirma alteração ?','Confirmação !',MB_ICONQUESTION + mb_yesno)= id_yes then
    begin
      if TPedidosModel
                      .New
                      .deletarItem(mItensid.Value)then
      begin
        edtCodProduto.Text := mItensidProduto.AsString;
        edtDescricao.Text  := mItensDescricao.AsString;
        edtQtde.Text       := mItensqtde.AsString;
        edtPreco.Text      := mItenspreco.AsString;
        mItens.Delete;
        GetTotal;
      end;
    end;
  end
    else
    begin
      if mItens.RecordCount > 0 then
      begin
        edtCodProduto.Text := mItensidProduto.AsString;
        edtDescricao.Text  := mItensDescricao.AsString;
        edtQtde.text       := mItensqtde.AsString;
        edtPreco.Text      := mItenspreco.AsString;

        mItens.Delete;
        GetTotal;
      end;

    end;
end;

procedure TfrmPedido.btnAnteriorClick(Sender: TObject);
begin
  if mPedidos.IsEmpty then
    Exit;

  mPedidos.Prior;

  if mPedidosid.AsInteger = FIdPedido then
    Exit;

  CarregaPedido( TPedidosModel
                              .New
                              .Id(mPedidosid.AsInteger)
                              .GetPedido);
end;

procedure TfrmPedido.btnDeletarItemClick(Sender: TObject);
begin
  if mItensid.Value > 0 then
  begin
    if Application.MessageBox('Confirma a exclusão do ítem ?','Confirmação !',MB_ICONQUESTION + mb_yesno)= id_yes then
    begin
      if TPedidosModel
                      .New
                      .deletarItem(mItensid.Value)then
      begin
        mItens.Delete;
        GetTotal;
        Application.MessageBox('Ítem excluido com sucesso ','Informação',MB_ICONMASK);
      end;
    end;
  end
    else
    if mItens.RecordCount > 0 then
    begin
      if Application.MessageBox('Confirma a exclusão do ítem ?','Confirmação !',MB_ICONQUESTION + mb_yesno)= id_yes then
      begin
          mItens.Delete;
          GetTotal;
          Application.MessageBox('Ítem excluido com sucesso ','Informação',MB_ICONMASK);
      end;
    end;
end;

procedure TfrmPedido.btnExcluirClick(Sender: TObject);
begin
  if FIdPedido > 0 then
  begin
    if Application.MessageBox('Confima exclusão do pedido ?','Confirmação',MB_ICONQUESTION + mb_yesno)= id_yes then
    begin
      if TPedidosModel
                     .New
                     .Deletar(FIdPedido)then
      mPedidos.Delete;
    end;
  end;

  Limpsr;
end;

procedure TfrmPedido.btnFinalizarClick(Sender: TObject);
var
  LPedido : TPedidoModeloDB;
begin
  if ValidaCamposFinalizar then
  begin
    LPedido := TPedidoModeloDB.Create;
    try
      LPedido.id         := FIdPedido;
      LPedido.Data       := FormatDateTime('yyyy-mm-dd',Now);
      LPedido.idCliente  := StrToIntDef(edtCodCliente.Text,0);
      LPedido.NomeCli    := edtNomeCliente.Text;
      LPedido.ValorTotal := FvlrTotal;

      mItens.First;
      while not mItens.Eof do
        begin

          with LPedido do
          begin
            Item.id        := StrToIntDef(mItensid.AsString,0);
            Item.idPedido  := FIdPedido;
            Item.idProduto := mItensidProduto.AsInteger;
            Item.Qtde      := mItensqtde.AsFloat;
            Item.PrecoUn   := mItenspreco.AsFloat;

            AddItem(Item);
          end;

          mItens.Next;
        end;

      if TPedidosModel
                      .New
                      .Gravar(LPedido)then
      begin
        Limpsr;
        Application.MessageBox('Pèdido armazenado com sucesso !','Informação !',MB_ICONINFORMATION);
      end;

    finally
      FreeAndNil(LPedido);
    end;
  end;
end;

procedure TfrmPedido.btnIncluirClick(Sender: TObject);
begin
  if ValidaInclusaoItem then
  begin
    mItens.Append;
    mItensidProduto.Value := StrToInt(edtCodProduto.Text);
    mItensDescricao.Value := edtDescricao.Text;
    mItensqtde.AsString   := edtQtde.Text;
    mItenspreco.AsString  := edtPreco.Text;
    mItens.Post;

    edtCodProduto.Clear;
    edtDescricao.Clear;
    edtQtde.Text := '0,00';
    edtPreco.Text := '0,00';

    edtCodProduto.SetFocus;

    GetTotal;
  end;
end;

procedure TfrmPedido.btnLimparClick(Sender: TObject);
begin
  Limpsr;
end;

procedure TfrmPedido.btnPesquisarClick(Sender: TObject);
begin
  mPedidos.Close;
  mPedidos.CreateDataSet;

  if rbCodPedido.Checked then
  begin
    try
      StrToInt(edtDescrPesq.Text);
    except
      Application.MessageBox('Informe um código válido !','Atenção !',MB_ICONMASK);
      Exit;
    end;

    if ExistePeriodo then
    begin
        TPedidosModel
                     .New
                     .Id(StrToIntDef(edtDescrPesq.Text,0))
                     .dtDE(FdtDe)
                     .dtAte(FdtAte)
                     .Listar(mPedidos);
    end
      else
      begin
        TPedidosModel
                     .New
                     .Id(StrToIntDef(edtDescrPesq.Text,0))
                     .Listar(mPedidos);
      end;

  end
    else
    if rbCodCliente.Checked then
    begin
      try
        StrToInt(edtDescrPesq.Text);
      except
        Application.MessageBox('Informe um código válido !','Atenção !',MB_ICONMASK);
        Exit;
      end;

      if ExistePeriodo then
      begin
        TPedidosModel
                     .New
                     .codCliente(StrToIntDef(edtDescrPesq.Text,0))
                     .dtDE(FdtDe)
                     .dtAte(FdtAte)
                     .Listar(mPedidos);
      end
        else
        begin
          TPedidosModel
                       .New
                       .codCliente(StrToIntDef(edtDescrPesq.Text,0))
                       .Listar(mPedidos);
        end;
    end
      else
      if rbNomeCliente.Checked then
      begin
        if edtDescrPesq.Text = '' then
        begin
          Application.MessageBox('Informe parte do nome do cliente.','Atenção !',MB_ICONMASK);
          Exit;
        end;

        if ExistePeriodo then
        begin
          TPedidosModel
                       .New
                       .NomeCliente(edtDescrPesq.Text)
                       .dtDE(FdtDe)
                       .dtAte(FdtAte)
                       .Listar(mPedidos);
        end
          else
          begin
            TPedidosModel
                         .New
                         .NomeCliente(edtDescrPesq.Text)
                         .Listar(mPedidos)
          end;

      end
        else
          if rbTodos.Checked then
          begin
            if ExistePeriodo then
            begin
                TPedidosModel
                             .New
                             .dtDE(FdtDe)
                             .dtAte(FdtAte)
                             .Listar(mPedidos)
            end
              else
              begin
                TPedidosModel
                             .New
                             .Listar(mPedidos)
              end;

          end;
end;

procedure TfrmPedido.btnPrimeiroClick(Sender: TObject);
begin
  if mPedidos.IsEmpty then
    Exit;

  mPedidos.First;

  if mPedidosid.AsInteger = FIdPedido then
    Exit;

  CarregaPedido( TPedidosModel
                              .New
                              .Id(mPedidosid.AsInteger)
                              .GetPedido);
end;

procedure TfrmPedido.btnProximoClick(Sender: TObject);
begin
  if mPedidos.IsEmpty then
    Exit;

  mPedidos.Next;

  if mPedidosid.AsInteger = FIdPedido then
    Exit;

  CarregaPedido( TPedidosModel
                              .New
                              .Id(mPedidosid.AsInteger)
                              .GetPedido);
end;

procedure TfrmPedido.btnUltimoClick(Sender: TObject);
begin
  if mPedidos.IsEmpty then
    Exit;

  mPedidos.Last;

  if mPedidosid.AsInteger = FIdPedido then
    Exit;

  CarregaPedido( TPedidosModel
                              .New
                              .Id(mPedidosid.AsInteger)
                              .GetPedido);
end;

procedure TfrmPedido.CarregaPedido(aPedido: TPedidoModeloDB);
var
  i : Integer;
begin
  Limpsr;

  with aPedido do
  begin
    FIdPedido := id;
    FvlrTotal := ValorTotal;
    edtCodCliente.Text := IntToStr(idCliente);

    for I := 0 to Pred(Itens.Count) do
      begin
        mItens.Append;
        mItensid.Value        := Itens[i].id;
        mItensidPedido.Value  := Itens[i].idPedido;
        mItensidProduto.Value := Itens[i].idProduto;
        mItensDescricao.Value := Itens[i].Descricao;
        mItensqtde.Value      := Itens[i].Qtde;
        mItenspreco.Value     := Itens[i].PrecoUn;
        mItens.Post;
      end;
  end;

  GetTotal;
end;

procedure TfrmPedido.ConferePeriododata;
begin
  ExistePeriodo := False;

  if ((TAuxiliar.OnlyNumber(edtDataDe.EditText)).Length = 8)and(TAuxiliar.OnlyNumber(edtDataAte.EditText).Length = 8)  then
  begin
    FdtDe  := FormatDateTime('yyyy-mm-dd',edtDataDe.Date);
    FdtAte := FormatDateTime('yyyy-mm-dd',edtDataAte.Date);

    ExistePeriodo := True;
  end;
end;

procedure TfrmPedido.edtQtdeChange(Sender: TObject);
var
  Num : Integer;
begin
  try
    num := edtQtde.SelStart;
    edtQtde.Text := FormatFloat('#,,,0.00',StrToFloat(edtQtde.Text));
    edtQtde.SelStart := Num;
  except
  end;
end;

procedure TfrmPedido.GridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if State = [] then
  begin
    if mItens.RecNo mod 2 = 1 then
      GridItens.Canvas.Brush.Color := clMenu
    else
      GridItens.Canvas.Brush.Color := clWhite;
  end;

  if gdSelected in State then
  GridItens.Canvas.Brush.Color := $00FFD9D9;

  GridItens.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPedido.edtCodProdutoChange(Sender: TObject);
var
  LProduto : TProdutoModeloDb;
begin
  if edtCodProduto.Text <> '' then
  begin
    LProduto := TProdutosModel
                             .New
                             .id(StrToInt(edtCodProduto.Text))
                             .GetProduto;

    edtDescricao.Text := LProduto.descricao;
    edtPreco.Text     := LProduto.preco.ToString;
  end
    else
     edtNomeCliente.Clear;
end;

procedure TfrmPedido.edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9','.',',',#8,#13]) then
    key := #0;
end;

procedure TfrmPedido.edtCodClienteChange(Sender: TObject);
var
  LCliente : TClienteModeloDB;
begin
  if edtCodCliente.Text <> '' then
  begin
    LCliente := TClienteModel
                             .New
                             .id(StrToInt(edtCodCliente.Text))
                             .GetCliente;

    edtNomeCliente.Text := LCliente.Nome;
  end
    else
     edtNomeCliente.Clear;
end;

procedure TfrmPedido.edtCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9','.',',',#8,#13]) then
    key := #0;
end;

procedure TfrmPedido.edtDataAteChange(Sender: TObject);
begin
  ConferePeriododata;
end;

procedure TfrmPedido.edtDataDeChange(Sender: TObject);
begin
  ConferePeriododata;
end;

procedure TfrmPedido.edtPrecoChange(Sender: TObject);
var
  Num : Integer;
begin
  try
    num := edtPreco.SelStart;
    edtPreco.Text := FormatFloat('#,,,0.00',StrToFloat(edtPreco.Text));
    edtPreco.SelStart := Num;
  except
  end;

  GetSubTotal;
end;

procedure TfrmPedido.edtQtde1Change(Sender: TObject);
begin
  GetSubTotal;
end;

procedure TfrmPedido.edtQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9','.',',',#8,#13]) then
    key := #0;
end;

procedure TfrmPedido.edtSubTotalChange(Sender: TObject);
var
  Num : Integer;
begin
  try
    num := edtSubTotal.SelStart;
    edtSubTotal.Text := FormatFloat('#,,,0.00',StrToFloat(edtSubTotal.Text));
    edtSubTotal.SelStart := Num;
  except
  end;
end;

procedure TfrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE : btnFechar.Click;
    VK_F5     : begin
                    if PageControl1.ActivePage = tsConsulta then
                      btnPesquisar.Click;
                end;
    VK_F6     : begin
                  if PageControl1.ActivePage = Tsdados then
                    btnExcluir.Click;
                end;
    VK_F9     : begin
                  if PageControl1.ActivePage = Tsdados then
                    btnIncluir.Click;
                end;
    VK_F10    : begin
                  if PageControl1.ActivePage = Tsdados then
                  begin
                    if btnFinalizar.Enabled then
                      btnFinalizar.Click;
                  end
                    else
                    if PageControl1.ActivePage = TsConsulta then
                    begin
                      if mPedidos.RecordCount > 0 then
                      begin
                        btnSelecionarPedido.Click;
                      end;
                    end;
                end;
  end;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  mPedidos.Close;
  mPedidos.CreateDataSet;

  Limpsr;
end;

procedure TfrmPedido.GetSubTotal;
begin
  edtSubTotal.Text := FloatToStr(StrToFloat(edtQtde.Text) * StrToFloat(edtPreco.Text));
end;

procedure TfrmPedido.GetTotal;
begin
  FvlrTotal := 0;
  B := mItens.GetBookmark;
  mItens.DisableControls;

  mItens.First;
  while not mItens.Eof do
  begin
    FvlrTotal := FvlrTotal + mItensvSubTotal.Value;
    mItens.Next;
  end;

  mItens.GotoBookmark(B);
  mItens.EnableControls;

  lbTotal.Caption := FormatFloat('#0.00',FvlrTotal);
end;

procedure TfrmPedido.GridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if State = [] then
  begin
    if mPedidos.RecNo mod 2 = 1 then
      GridConsulta.Canvas.Brush.Color := clMenu
    else
      GridConsulta.Canvas.Brush.Color := clWhite;
  end;

  if gdSelected in State then
  GridConsulta.Canvas.Brush.Color := $00FFD9D9;

  GridConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmPedido.Limpsr;
begin
  FIdPedido := 0;
  FvlrTotal := 0; // isto esta errado, mas é o que pediram - não precisaria ter esta variavel
  lbTotal.Caption := '0,00';

  mItens.Close;
  mItens.CreateDataSet;

  edtCodCliente.Clear;
  edtCodProduto.Clear;
  edtDescricao.Clear;
  edtQtde.Text  := '0,00';
  edtPreco.Text := '0,00';
  edtSubTotal.Text := '0,00';
end;

procedure TfrmPedido.mItensCalcFields(DataSet: TDataSet);
begin
  mItensvSubTotal.Value := mItensqtde.Value * mItenspreco.Value;
end;

procedure TfrmPedido.rbCodClienteClick(Sender: TObject);
begin
  edtDescrPesq.Enabled := True;
  lbDescrPesq.Caption  := 'Informe o código do cliente';
end;

procedure TfrmPedido.rbCodPedidoClick(Sender: TObject);
begin
  edtDescrPesq.Enabled := True;
  lbDescrPesq.Caption  := 'Informe o código do pedido';
end;

procedure TfrmPedido.rbNomeClienteClick(Sender: TObject);
begin
  edtDescrPesq.Enabled := True;
  lbDescrPesq.Caption  := 'Informe o nome do cliente';
end;

procedure TfrmPedido.rbTodosClick(Sender: TObject);
begin
  edtDescrPesq.Enabled := False;
  lbDescrPesq.Caption  := 'Aguardando pesquisa';
end;

procedure TfrmPedido.btnSelecionarPedidoClick(Sender: TObject);
begin
  if mPedidos.RecordCount > 0 then
  begin
    CarregaPedido( TPedidosModel
                                .New
                                .Id(mPedidosid.AsInteger)
                                .GetPedido);

    PageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmPedido.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmPedido.ValidaCamposFinalizar: Boolean;
begin
  Result := False;
{ se for obrigatorio preencher cliente - descomentar este codigo
  if edtNomeCliente.Text = '' then
  begin
    Application.MessageBox('Informe o cliente ','Atenção',MB_ICONMASK);
    edtCodCliente.SetFocus;
    Exit;
  end;}

  if mItens.RecordCount = 0 then
  begin
    Application.MessageBox('Informe os ítens ','Atenção',MB_ICONMASK);
    edtCodCliente.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TfrmPedido.ValidaInclusaoItem: Boolean;
begin
  Result := False;

  if edtDescricao.Text = '' then
    begin
      Application.MessageBox('Informe o produto.','Atenção !',MB_ICONMASK);
      edtCodProduto.SetFocus;
      Exit;
    end;

  if StrToFloat(edtQtde.Text) <= 0 then
    begin
      Application.MessageBox('Informe a quantidade.','Atenção !',MB_ICONMASK);
      edtQtde.SetFocus;
      Exit;
    end;

  if StrToFloat(edtPreco.Text) <= 0 then
    begin
      Application.MessageBox('Informe o preço.','Atenção !',MB_ICONMASK);
      edtPreco.SetFocus;
      Exit;
    end;

  Result := True;
end;

end.
