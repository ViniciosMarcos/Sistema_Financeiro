unit SistemaFinanceiro.Model.Login;

interface

type
  TLogin = class
  private
    Fsenha: String;
    Fusuario: String;
    procedure Setsenha(const Value: String);
    procedure Setusuario(const Value: String);

  public
    property usuario: String read Fusuario write Setusuario;
    property senha: String read Fsenha write Setsenha;
    function ValidarDadosLogin: Boolean;
  end;

implementation

uses
  FireDAC.Comp.Client, SistemaFinanceiro.Model.Conexao, System.SysUtils;

{ TLogin }

procedure TLogin.Setsenha(const Value: String);
begin
  Fsenha := Value;
end;

procedure TLogin.Setusuario(const Value: String);
begin
  Fusuario := Value;
end;

function TLogin.ValidarDadosLogin: Boolean;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  try
    lQry.Connection := dmConexaoFD.Conexao;
    lQry.Transaction := dmConexaoFD.Transacao;
    lQry.Close;
    lQry.SQL.Add('Select ID From USUARIOS');
    lQry.SQL.Add('Where SENHA = :SENHA');
    lQry.SQL.Add('  and LOGIN = :LOGIN');
    lQry.ParamByName('SENHA').AsString := senha;
    lQry.ParamByName('LOGIN').AsString := usuario;
    lQry.Open;

    Result := not lQry.Eof;
  finally
    lQry.Free;
  end;
end;

end.
