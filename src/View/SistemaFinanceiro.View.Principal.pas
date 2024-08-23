unit SistemaFinanceiro.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    mnuCadastro: TMenuItem;
    mnuRelatorios: TMenuItem;
    mnuAjuda: TMenuItem;
    Usuarios: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  SistemaFinanceiro.View.Splash,
  SistemaFinanceiro.View.Usuarios,
  SistemaFinanceiro.View.Login;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not Assigned(frmSplash) then
    frmSplash := TfrmSplash.Create(nil);

  try
    frmSplash.ShowModal;
  finally
    FreeAndNil(frmSplash);
  end;

  if not Assigned(frmLogin) then
    frmLogin := TfrmLogin.Create(nil);
  try
    frmLogin.ShowModal;
    if (frmLogin.ModalResult <> mrOk) then
      Application.Terminate;
  finally
    FreeAndNil(frmLogin);
  end;
end;

procedure TfrmPrincipal.UsuariosClick(Sender: TObject);
begin
  if not Assigned(frmUsuarios) then
    frmUsuarios := TfrmUsuarios.Create(nil);

  try
    frmUsuarios.ShowModal;
  finally
    FreeAndNil(frmUsuarios);
  end;
end;

end.
