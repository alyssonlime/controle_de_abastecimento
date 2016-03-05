inherited Frm_CadBombas: TFrm_CadBombas
  Caption = 'Cadastro de Bombas'
  ClientHeight = 329
  ClientWidth = 761
  ExplicitWidth = 767
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 13
  inherited Tab_Form: TPageControl [0]
    Width = 586
    Height = 297
    ActivePage = Tab_Listagem
    ExplicitWidth = 586
    ExplicitHeight = 305
    inherited Tab_Listagem: TTabSheet
      ExplicitWidth = 578
      ExplicitHeight = 277
      inherited DBGrid1: TDBGrid
        Width = 572
        Height = 263
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Title.Caption = 'C'#243'digo'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 290
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoTanque'
            Title.Caption = 'Tanque'
            Width = 192
            Visible = True
          end>
      end
    end
    inherited Tab_Detalhes: TTabSheet
      ExplicitWidth = 578
      ExplicitHeight = 277
      object Label2: TLabel [0]
        Left = 3
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = txt_Descricao
      end
      object Label3: TLabel [1]
        Left = 3
        Top = 95
        Width = 36
        Height = 13
        Caption = 'Tanque'
        FocusControl = cbo_Tanque
      end
      object txt_Descricao: TDBEdit [3]
        Left = 3
        Top = 68
        Width = 558
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = DSCadastro
        TabOrder = 0
      end
      object cbo_Tanque: TDBLookupComboBox [4]
        Left = 3
        Top = 114
        Width = 558
        Height = 21
        DataField = 'DescricaoTanque'
        DataSource = DSCadastro
        TabOrder = 1
      end
      inherited txt_Codigo: TDBEdit
        TabOrder = 2
      end
    end
  end
  inherited Btn_Fechar: TBitBtn [1]
    Left = 608
    Top = 256
    ExplicitLeft = 608
    ExplicitTop = 256
  end
  inherited Btn_Novo: TBitBtn [2]
    Left = 608
    Top = 16
    ExplicitLeft = 608
    ExplicitTop = 16
  end
  inherited Btn_Salvar: TBitBtn [3]
    Left = 608
    Top = 136
    ExplicitLeft = 608
    ExplicitTop = 136
  end
  inherited Btn_Cancelar: TBitBtn [4]
    Left = 608
    Top = 192
    ExplicitLeft = 608
    ExplicitTop = 192
  end
  inherited Btn_Excluir: TBitBtn [5]
    Left = 608
    Top = 72
    ExplicitLeft = 608
    ExplicitTop = 72
  end
  inherited TCadastro: TIBTable
    TableName = 'BOMBAS'
    Left = 208
    object TCadastroDESCRICAO: TIBStringField [0]
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object TCadastroTANQUE: TIntegerField [1]
      FieldName = 'TANQUE'
      Required = True
    end
    object TCadastroDescricaoTanque: TIBStringField [2]
      FieldKind = fkLookup
      FieldName = 'DescricaoTanque'
      LookupDataSet = TTanques
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TANQUE'
      Size = 50
      Lookup = True
    end
  end
  inherited DSCadastro: TDataSource
    Left = 264
  end
  object TTanques: TIBTable
    Database = DM.Conexao
    Transaction = DM.Transacao
    BeforeDelete = TCadastroBeforeDelete
    BeforePost = TCadastroBeforePost
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 10
      end>
    StoreDefs = True
    TableName = 'TANQUES'
    Left = 352
    object TTanquesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TTanquesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
