inherited Frm_MovAbastecimentos: TFrm_MovAbastecimentos
  Caption = 'Abastecimentos'
  ClientWidth = 753
  ExplicitWidth = 759
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Btn_Excluir: TBitBtn
    Left = 600
    ExplicitLeft = 600
  end
  inherited Btn_Novo: TBitBtn
    Left = 600
    ExplicitLeft = 600
  end
  inherited Btn_Salvar: TBitBtn
    Left = 600
    ExplicitLeft = 600
  end
  inherited Btn_Cancelar: TBitBtn
    Left = 600
    ExplicitLeft = 600
  end
  inherited Btn_Fechar: TBitBtn
    Left = 600
    ExplicitLeft = 600
  end
  inherited Tab_Form: TPageControl
    Width = 578
    ExplicitWidth = 578
    inherited Tab_Listagem: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 570
      ExplicitHeight = 0
      inherited grid_Listagem: TDBGrid
        Width = 558
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Title.Caption = 'C'#243'digo'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA'
            Title.Caption = 'Hora'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoBomba'
            Title.Caption = 'Bomba'
            Width = 146
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LITROS'
            Title.Caption = 'Litros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALORIMPOSTO'
            Title.Caption = 'Valor Imposto'
            Visible = True
          end>
      end
    end
    inherited Tab_Detalhes: TTabSheet
      ExplicitWidth = 570
      object Label2: TLabel [1]
        Left = 3
        Top = 49
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = txt_Data
      end
      object Label3: TLabel [2]
        Left = 143
        Top = 49
        Width = 23
        Height = 13
        Caption = 'Hora'
        FocusControl = txt_Hora
      end
      object Label4: TLabel [3]
        Left = 3
        Top = 95
        Width = 26
        Height = 13
        Caption = 'Litros'
        FocusControl = txt_Litros
      end
      object Label5: TLabel [4]
        Left = 143
        Top = 95
        Width = 24
        Height = 13
        Caption = 'Valor'
        FocusControl = txt_Valor
      end
      object Label6: TLabel [5]
        Left = 283
        Top = 95
        Width = 82
        Height = 13
        Caption = 'Perc. do Imposto'
        FocusControl = txt_Imposto
      end
      object Label8: TLabel [6]
        Left = 423
        Top = 95
        Width = 81
        Height = 13
        Caption = 'Valor do Imposto'
        FocusControl = txt_ValorImposto
      end
      object Label7: TLabel [7]
        Left = 283
        Top = 49
        Width = 32
        Height = 13
        AutoSize = False
        Caption = 'Bomba'
        FocusControl = cbo_Bomba
      end
      object txt_Data: TDBEdit
        Left = 3
        Top = 68
        Width = 134
        Height = 21
        Color = cl3DLight
        DataField = 'DATA'
        DataSource = DSCadastro
        ReadOnly = True
        TabOrder = 1
      end
      object txt_Hora: TDBEdit
        Left = 143
        Top = 68
        Width = 134
        Height = 21
        Color = cl3DLight
        DataField = 'HORA'
        DataSource = DSCadastro
        ReadOnly = True
        TabOrder = 2
      end
      object txt_Litros: TDBEdit
        Left = 3
        Top = 114
        Width = 134
        Height = 21
        DataField = 'LITROS'
        DataSource = DSCadastro
        TabOrder = 3
        OnKeyDown = txt_LitrosKeyDown
      end
      object txt_Valor: TDBEdit
        Left = 143
        Top = 114
        Width = 134
        Height = 21
        DataField = 'VALOR'
        DataSource = DSCadastro
        TabOrder = 4
        OnKeyDown = txt_ValorKeyDown
      end
      object txt_Imposto: TDBEdit
        Left = 283
        Top = 114
        Width = 134
        Height = 21
        Color = cl3DLight
        DataField = 'IMPOSTO'
        DataSource = DSCadastro
        ReadOnly = True
        TabOrder = 5
      end
      object txt_ValorImposto: TDBEdit
        Left = 423
        Top = 114
        Width = 134
        Height = 21
        Color = cl3DLight
        DataField = 'VALORIMPOSTO'
        DataSource = DSCadastro
        ReadOnly = True
        TabOrder = 6
      end
      object cbo_Bomba: TDBLookupComboBox
        Tag = 1
        Left = 283
        Top = 68
        Width = 274
        Height = 21
        DataField = 'DescricaoBomba'
        DataSource = DSCadastro
        TabOrder = 7
        OnKeyDown = cbo_BombaKeyDown
      end
    end
  end
  inherited DSCadastro: TDataSource
    OnDataChange = DSCadastroDataChange
  end
  inherited TCadastro: TClientDataSet
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DATA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'HORA'
        Attributes = [faRequired]
        DataType = ftTime
      end
      item
        Name = 'BOMBA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LITROS'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 3
      end
      item
        Name = 'VALOR'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'IMPOSTO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VALORIMPOSTO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'PK_ABASTECIMENTOS'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'IX_ABASTECIMENTOS_BOMBAS'
        Fields = 'BOMBA'
      end>
    AfterInsert = TCadastroAfterInsert
  end
  object TBombas: TIBTable
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
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'TANQUE'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_BOMBAS'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end
      item
        Name = 'IX_BOMBAS_TANQUES'
        Fields = 'TANQUE'
      end>
    StoreDefs = True
    TableName = 'BOMBAS'
    Left = 288
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TBombasTANQUE: TIntegerField
      FieldName = 'TANQUE'
      Required = True
    end
  end
end
