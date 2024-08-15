unit SistemaFinanceiro.View.Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SistemaFinanceiro.View.CadastroDefault,
  Data.DB, System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.Mask, Vcl.DBCtrls, SistemaFinanceiro.Model.Usuarios,
  Vcl.WinXCtrls;

type
  TfrmUsuarios = class(TfrmCadastroDefault)
    dsUsuarios: TDataSource;
    EditID: TDBEdit;
    EditNome: TDBEdit;
    EditPassword: TDBEdit;
    EditLogin: TDBEdit;
    ToggleStatus: TToggleSwitch;
    lblID: TLabel;
    lblNome: TLabel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure ToggleStatusClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConsistirDados;
    procedure PopulaStatus;
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

procedure TfrmUsuarios.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  if dmUsuarios.cdsUsuarios.State in [dsInsert, dsEdit] then
  begin
    dmUsuarios.cdsUsuarios.Close;
    dmUsuarios.cdsUsuarios.Open;   
  end
  else
    PnlPrincipal.ActiveCard := CardPesquisa;
end;

procedure TfrmUsuarios.BtnEditarClick(Sender: TObject);
begin
  inherited;
  PopulaStatus;
end;

procedure TfrmUsuarios.BtnNovoClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Insert;
end;

procedure TfrmUsuarios.BtnSalvarClick(Sender: TObject);
begin
  inherited;
  ConsistirDados;  
  dmUsuarios.cdsUsuarios.Post;
  dmUsuarios.cdsUsuarios.ApplyUpdates(0);
  dmUsuarios.cdsUsuarios.Refresh;
  dmUsuarios.cdsUsuarios.Last;
end;

procedure TfrmUsuarios.ConsistirDados;
begin
  if dmUsuarios.cdsUsuarios.State in [dsInsert, dsEdit] then
  begin  
    if ToggleStatus.State = tssOn then
      dmUsuarios.Status := 'A'
    else
      dmUsuarios.Status := 'B';      
  end;  
end;

procedure TfrmUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  PopulaStatus;
end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(dmUsuarios);
end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(dmUsuarios) then
    dmUsuarios := TdmUsuarios.Create(nil);
  EditPassword.PasswordChar := '*';
end;

procedure TfrmUsuarios.PopulaStatus;
begin
  if dmUsuarios.cdsUsuariosSTATUS.AsString = 'A' then
    ToggleStatus.State := tssOn
  else
    ToggleStatus.State := tssOff;
end;

procedure TfrmUsuarios.ToggleStatusClick(Sender: TObject);
begin
  inherited;
  dmUsuarios.cdsUsuarios.Edit;
end;

end.
