object dmConexaoFD: TdmConexaoFD
  Height = 169
  Width = 284
  PixelsPerInch = 120
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\mvmar\OneDrive\Documentos\Projetos\SistemaFina' +
        'nceiro\database\SISTEMAFINANCEIRO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=ISO8859_3'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = Transacao
    UpdateTransaction = Transacao
    Left = 64
    Top = 40
  end
  object Transacao: TFDTransaction
    Connection = Conexao
    Left = 160
    Top = 40
  end
end
