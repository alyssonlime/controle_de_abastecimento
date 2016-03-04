inherited Frm_CadBombas: TFrm_CadBombas
  Caption = 'Cadastro de Bombas'
  ClientHeight = 345
  ClientWidth = 761
  ExplicitWidth = 767
  ExplicitHeight = 373
  PixelsPerInch = 96
  TextHeight = 13
  inherited Btn_Excluir: TBitBtn
    Left = 608
    Top = 79
    ExplicitLeft = 608
    ExplicitTop = 79
  end
  inherited Btn_Novo: TBitBtn
    Left = 608
    Top = 16
    ExplicitLeft = 608
    ExplicitTop = 16
  end
  inherited Btn_Salvar: TBitBtn
    Left = 608
    Top = 143
    ExplicitLeft = 608
    ExplicitTop = 143
  end
  inherited Btn_Cancelar: TBitBtn
    Left = 608
    Top = 200
    ExplicitLeft = 608
    ExplicitTop = 200
  end
  inherited Btn_Fechar: TBitBtn
    Left = 608
    Top = 263
    ExplicitLeft = 608
    ExplicitTop = 263
  end
  inherited Tab_Form: TPageControl
    Width = 586
    Height = 313
    ExplicitWidth = 586
    ExplicitHeight = 313
    inherited Tab_Listagem: TTabSheet
      ExplicitWidth = 578
      ExplicitHeight = 285
      inherited DBGrid1: TDBGrid
        Width = 572
        Height = 279
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
            Width = 196
            Visible = True
          end>
      end
    end
    inherited Tab_Detalhes: TTabSheet
      ExplicitWidth = 578
      ExplicitHeight = 285
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
  inherited TCadastro: TIBTable
    TableName = 'BOMBAS'
    Left = 208
    object TCadastroDESCRICAO: TIBStringField [0]
      FieldName = 'DESCRICAO'
      Required = True
      Size = 10
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
      Size = 10
    end
  end
end