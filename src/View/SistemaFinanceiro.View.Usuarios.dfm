inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 286
  ClientWidth = 531
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 543
  ExplicitHeight = 324
  TextHeight = 15
  inherited PnlPrincipal: TCardPanel
    Width = 531
    Height = 286
    inherited CardCadastro: TCard
      Width = 529
      Height = 284
      ExplicitLeft = -63
      ExplicitTop = -79
      ExplicitWidth = 529
      ExplicitHeight = 284
      object lblID: TLabel [0]
        Left = 16
        Top = 67
        Width = 11
        Height = 15
        Caption = 'ID'
      end
      object lblNome: TLabel [1]
        Left = 106
        Top = 67
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object lblLogin: TLabel [2]
        Left = 16
        Top = 123
        Width = 30
        Height = 15
        Caption = 'Login'
      end
      object lblSenha: TLabel [3]
        Left = 238
        Top = 123
        Width = 32
        Height = 15
        Caption = 'Senha'
      end
      inherited PnlTop: TPanel
        Width = 529
        inherited BtnSalvar: TButton
          OnClick = BtnSalvarClick
        end
        inherited BtnCancelar: TButton
          OnClick = BtnCancelarClick
        end
      end
      object EditID: TDBEdit
        Left = 16
        Top = 88
        Width = 80
        Height = 23
        CharCase = ecUpperCase
        DataField = 'ID'
        DataSource = dsUsuarios
        ReadOnly = True
        TabOrder = 1
      end
      object EditNome: TDBEdit
        Left = 106
        Top = 88
        Width = 344
        Height = 23
        CharCase = ecUpperCase
        DataField = 'NOME'
        DataSource = dsUsuarios
        TabOrder = 2
      end
      object EditPassword: TDBEdit
        Left = 238
        Top = 144
        Width = 212
        Height = 23
        CharCase = ecUpperCase
        DataField = 'SENHA'
        DataSource = dsUsuarios
        TabOrder = 4
      end
      object EditLogin: TDBEdit
        Left = 16
        Top = 144
        Width = 212
        Height = 23
        CharCase = ecUpperCase
        DataField = 'LOGIN'
        DataSource = dsUsuarios
        TabOrder = 3
      end
      object ToggleStatus: TToggleSwitch
        Left = 16
        Top = 189
        Width = 113
        Height = 20
        State = tssOn
        StateCaptions.CaptionOn = 'Ativo'
        StateCaptions.CaptionOff = 'Bloqueado'
        TabOrder = 5
        OnClick = ToggleStatusClick
      end
    end
    inherited CardPesquisa: TCard
      Width = 529
      Height = 284
      inherited PnlPesquisa: TPanel
        Width = 529
        inherited BtnFechar: TButton
          Left = 432
        end
      end
      inherited PnlPesquisaGrid: TPanel
        Width = 529
        Height = 185
        inherited DBGrid1: TDBGrid
          Width = 529
          Height = 185
          DataSource = dsUsuarios
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 349
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SENHA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Visible = False
            end>
        end
      end
    end
  end
  object dsUsuarios: TDataSource
    DataSet = dmUsuarios.cdsUsuarios
    Left = 657
    Top = 25
  end
end
