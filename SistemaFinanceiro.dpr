program SistemaFinanceiro;

uses
  Vcl.Forms,
  SistemaFinanceiro.View.Principal in 'src\View\SistemaFinanceiro.View.Principal.pas' {frmPrincipal},
  SistemaFinanceiro.View.CadastroDefault in 'src\View\SistemaFinanceiro.View.CadastroDefault.pas' {frmCadastroDefault},
  SistemaFinanceiro.View.Splash in 'src\View\SistemaFinanceiro.View.Splash.pas' {frmSplash},
  SistemaFinanceiro.Model.Conexao in 'src\Model\SistemaFinanceiro.Model.Conexao.pas' {dmConexaoFD: TDataModule},
  SistemaFinanceiro.View.Usuarios in 'src\View\SistemaFinanceiro.View.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Model.Usuarios in 'src\Model\SistemaFinanceiro.Model.Usuarios.pas' {frmUsuarios},
  SistemaFinanceiro.Util.Metodos in 'src\Util\SistemaFinanceiro.Util.Metodos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroDefault, frmCadastroDefault);
  Application.CreateForm(TdmConexaoFD, dmConexaoFD);
  Application.Run;
end.
