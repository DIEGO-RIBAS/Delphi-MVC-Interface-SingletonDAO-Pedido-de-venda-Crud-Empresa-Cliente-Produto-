unit uConsultaEmpresaAPI.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, System.JSON;

type
  TfrmConsultaEmpresaAPI = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Image1: TImage;
    lblMsgm: TLabel;
    GroupBox1: TGroupBox;
    edtCNPJ: TMaskEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edtRazaoSocial: TEdit;
    Label3: TLabel;
    edtEmail: TEdit;
    Label4: TLabel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Timer1: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    function FormatarCNPJ( aCNPJ : String ) : string;
    procedure clearFields;
  public
    { Public declarations }
  end;

var
  frmConsultaEmpresaAPI: TfrmConsultaEmpresaAPI;

implementation

  uses
    uEmpresa.Controller,
    uEmpresas.Entity,
    uEmpresa.Model;

{$R *.dfm}


procedure TfrmConsultaEmpresaAPI.clearFields;
begin
  edtCNPJ.Text        :=  '';
  edtRazaoSocial.Text := '';
  edtEmail.Text       := '';
end;

function TfrmConsultaEmpresaAPI.FormatarCNPJ(aCNPJ: String): string;
begin
    Result := StringReplace(aCNPJ, '.','',[rfReplaceAll]);
    Result := StringReplace(Result, '/','',[rfReplaceAll]);
    Result := StringReplace(Result, '-','',[rfReplaceAll]);
end;

procedure TfrmConsultaEmpresaAPI.SpeedButton1Click(Sender: TObject);
var
  jObject : TJSONObject;
begin
  lblMsgm.Caption := 'Realizando consulta ... Aguarde !';
  lblMsgm.Repaint;

  jObject := TJSONObject.Create;
  try
    jObject := TEmpressaController.New.GetEmpresaAPI(FormatarCNPJ( edtCNPJ.Text ));
    edtRazaoSocial.Text := jObject.GetValue<string>('razao_social');

  finally
    FreeAndNil(jObject);
    lblMsgm.Caption := '';
  end;
end;

procedure TfrmConsultaEmpresaAPI.SpeedButton2Click(Sender: TObject);
var
  Empresa : TEmpresasEntity;
begin
  try
    Empresa := TEmpresaModel
                            .New
                            .GetEmpresaLocal( FormatarCNPJ( edtCNPJ.Text ));

    if Empresa.Cnpj <> '' then
    begin
      Application.MessageBox('Empresa já cadastrada !','Atenção !',MB_ICONMASK);
      Exit;
    end
      else
      begin

        Empresa.RazaoSocial := edtRazaoSocial.Text;
        Empresa.Cnpj        := FormatarCNPJ(edtCNPJ.Text);
        Empresa.Email       := edtEmail.Text;

        if TEmpresaModel.New.Gravar(Empresa) then
        begin
          lblMsgm.Caption := 'Registro armazenado com sucesso';
          lblMsgm.Repaint;
          Timer1.Enabled := True;

          clearFields;
        end;
      end;
  finally
    FreeAndNil(Empresa);
  end;
end;

procedure TfrmConsultaEmpresaAPI.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled  := false;
  lblMsgm.Caption := 'Empresa';
end;

end.
