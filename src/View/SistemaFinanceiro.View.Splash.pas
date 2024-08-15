unit SistemaFinanceiro.View.Splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.ComCtrls;

type
  TfrmSplash = class(TForm)
    PnlPrincipal: TPanel;
    imgLogo: TImage;
    ProgressBar: TProgressBar;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.TimerTimer(Sender: TObject);
begin
  if (ProgressBar.Position < 100) then
    ProgressBar.StepIt
  else
    Close;
end;

end.
