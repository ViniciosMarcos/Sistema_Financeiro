unit SistemaFinanceiro.View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    Panel1: TPanel;
    EditLogin: TEdit;
    lblUsuario: TLabel;
    EditSenha: TEdit;
    lblSenha: TLabel;
    BtnLogin: TButton;
    BtnCancelar: TButton;
    Panel2: TPanel;
    Image2: TImage;
    lblLogin: TLabel;
    procedure BtnLoginClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses SistemaFinanceiro.Model.Login;

procedure TfrmLogin.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrNone;
  Close;
end;

procedure TfrmLogin.BtnLoginClick(Sender: TObject);
var
  lLogin : TLogin;
begin
  lLogin := TLogin.Create;

  try
    lLogin.usuario := EditLogin.Text;
    lLogin.senha := EditSenha.Text;
    if lLogin.ValidarDadosLogin then
      ModalResult := mrOk
    else
      ShowMessage('Login Inv�lido! Usu�rio ou Senha Incorretos.');
  finally
    lLogin.Free;
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  EditSenha.PasswordChar := '*';
end;

end.
