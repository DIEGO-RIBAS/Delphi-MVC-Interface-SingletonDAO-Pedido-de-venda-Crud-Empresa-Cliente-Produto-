program PedidoVenda;

uses
  Vcl.Forms,
  uMain.View in 'View\uMain.View.pas' {frmMain},
  uListaEmpresa.View in 'View\uListaEmpresa.View.pas' {frmListaEmpresa},
  uEmpresas.Entity in 'Entity\uEmpresas.Entity.pas',
  uConsultaEmpresaAPI.View in 'View\uConsultaEmpresaAPI.View.pas' {frmConsultaEmpresaAPI},
  uEmpresa.Model in 'Model\uEmpresa.Model.pas',
  uEmpresa.Implements in 'Impl\uEmpresa.Implements.pas',
  uDao.ConexaoSingleton in 'DAO\uDao.ConexaoSingleton.pas',
  uEmpresa.Controller in 'Controller\uEmpresa.Controller.pas',
  uCliente.View in 'View\uCliente.View.pas' {frmClientes},
  uCliente.Model in 'Model\uCliente.Model.pas',
  uCliente.Implements in 'Impl\uCliente.Implements.pas',
  uProdutos.View in 'View\uProdutos.View.pas' {frmProdutos},
  uProdutos.Model in 'Model\uProdutos.Model.pas',
  uProdutos.Implements in 'Impl\uProdutos.Implements.pas',
  uPedido.View in 'View\uPedido.View.pas' {frmPedido},
  uPedidos.implements in 'Impl\uPedidos.implements.pas',
  uPedido.ModeloDB in 'Entity\uPedido.ModeloDB.pas',
  uPedidos.Model in 'Model\uPedidos.Model.pas',
  uFuncoes.Utils in 'Utils\uFuncoes.Utils.pas',
  uCliente.ModeloDB in 'Entity\uCliente.ModeloDB.pas',
  uProduto.ModeloDB in 'Entity\uProduto.ModeloDB.pas';

{$R *.res}

begin
  Application.Initialize;
//  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
