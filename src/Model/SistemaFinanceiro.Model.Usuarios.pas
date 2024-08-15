unit SistemaFinanceiro.Model.Usuarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmUsuarios = class(TDataModule)
    QryUsuarios: TFDQuery;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    QryUsuariosID: TIntegerField;
    QryUsuariosNOME: TStringField;
    QryUsuariosLOGIN: TStringField;
    QryUsuariosSENHA: TStringField;
    QryUsuariosSTATUS: TStringField;
    QryUsuariosDATA_CADASTRO: TDateField;
    cdsUsuariosID: TIntegerField;
    cdsUsuariosNOME: TStringField;
    cdsUsuariosLOGIN: TStringField;
    cdsUsuariosSENHA: TStringField;
    cdsUsuariosSTATUS: TStringField;
    cdsUsuariosDATA_CADASTRO: TDateField;
    procedure cdsUsuariosNewRecord(DataSet: TDataSet);
    procedure cdsUsuariosBeforePost(DataSet: TDataSet);
  private
    FStatus: String;
    procedure SetStatus(const Value: String);
    procedure ConsistirDados;
    { Private declarations }
  public
    { Public declarations }
    property Status: String read FStatus write SetStatus;
  end;

var
  dmUsuarios: TdmUsuarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SistemaFinanceiro.Model.Conexao, SistemaFinanceiro.Util.Metodos;

{$R *.dfm}

procedure TdmUsuarios.cdsUsuariosBeforePost(DataSet: TDataSet);
begin
  cdsUsuariosSTATUS.AsString := Status;
  ConsistirDados;
end;

procedure TdmUsuarios.cdsUsuariosNewRecord(DataSet: TDataSet);
begin
  cdsUsuariosID.AsInteger := 0;
  cdsUsuariosSTATUS.AsString := 'A';
  cdsUsuariosDATA_CADASTRO.AsDateTime := Now;
end;

procedure TdmUsuarios.ConsistirDados;
begin
  if (cdsUsuariosNOME.AsString = '') or
    (cdsUsuariosLOGIN.AsString = '') or
    (cdsUsuariosSENHA.AsString = '') or
    (cdsUsuariosSTATUS.AsString = '') or
    (cdsUsuariosDATA_CADASTRO.AsString = '') then
    raise Exception.Create('Todos os dados devem ser preenchidos!');

end;

procedure TdmUsuarios.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

end.
