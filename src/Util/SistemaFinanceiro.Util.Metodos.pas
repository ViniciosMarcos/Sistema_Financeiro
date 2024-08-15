unit SistemaFinanceiro.Util.Metodos;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TMetodos = class
  public
    function GetIDGenerator(pGenerator: String): Integer;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TMetodos }

uses
  SistemaFinanceiro.Model.Conexao;

constructor TMetodos.Create;
begin

end;

destructor TMetodos.Destroy;
begin

  inherited;
end;

function TMetodos.GetIDGenerator(pGenerator: String): Integer;
var
  QryConsulta: TFDQuery;
  lID: Integer;
begin
  QryConsulta := TFDQuery.Create(nil);
  try
    QryConsulta.Connection := dmConexaoFD.Conexao;
    QryConsulta.Transaction := dmConexaoFD.Transacao;
    QryConsulta.Close;
    QryConsulta.SQL.Text := 'select gen_id('+pGenerator+',1) as id from rdb$database';
    QryConsulta.Open;

    lID := QryConsulta.FieldByName('id').AsInteger;
    if lID > 0 then
      Result := lID
    else
      Result := 0;
  finally
    QryConsulta.Free;
  end;
end;

end.
