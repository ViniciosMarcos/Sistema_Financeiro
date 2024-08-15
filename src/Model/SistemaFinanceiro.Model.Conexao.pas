unit SistemaFinanceiro.Model.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TdmConexaoFD = class(TDataModule)
    Conexao: TFDConnection;
    Transacao: TFDTransaction;
  private
    { Private declarations }
    const CS_ARQUIVO_CONFIGURACAO = 'SistemaFinanceiro.cfg';
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure Conectar;
    procedure Desconectar;
  end;

var
  dmConexaoFD: TdmConexaoFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexaoFD }

procedure TdmConexaoFD.CarregarConfiguracoes;
var
  Nome: String;
begin
  if not FileExists(CS_ARQUIVO_CONFIGURACAO) then
    raise Exception.Create('Arquivo de Configuração não encontrado!');

end;

procedure TdmConexaoFD.Conectar;
begin

end;

procedure TdmConexaoFD.Desconectar;
begin

end;

end.
