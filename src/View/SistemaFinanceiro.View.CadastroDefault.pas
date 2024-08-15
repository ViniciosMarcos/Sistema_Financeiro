unit SistemaFinanceiro.View.CadastroDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPanels, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;

type
  TfrmCadastroDefault = class(TForm)
    PnlPrincipal: TCardPanel;
    CardCadastro: TCard;
    CardPesquisa: TCard;
    PnlPesquisa: TPanel;
    PnlPesquisaGrid: TPanel;
    DBGrid1: TDBGrid;
    EditPesquisa: TEdit;
    LblPesquisa: TLabel;
    BtnPesquisa: TButton;
    ImageList1: TImageList;
    BtnNovo: TButton;
    BtnEditar: TButton;
    BtnFechar: TButton;
    PnlTop: TPanel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroDefault: TfrmCadastroDefault;

implementation

{$R *.dfm}

procedure TfrmCadastroDefault.BtnEditarClick(Sender: TObject);
begin
 PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TfrmCadastroDefault.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroDefault.BtnNovoClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TfrmCadastroDefault.DBGrid1DblClick(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardCadastro;
end;

procedure TfrmCadastroDefault.FormShow(Sender: TObject);
begin
  PnlPrincipal.ActiveCard := CardPesquisa;
end;

end.
