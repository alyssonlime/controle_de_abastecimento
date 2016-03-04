inherited Frm_CadTanques: TFrm_CadTanques
  Caption = 'Cadastro de Tanques'
  ClientHeight = 345
  ClientWidth = 801
  ExplicitWidth = 807
  ExplicitHeight = 374
  PixelsPerInch = 96
  TextHeight = 13
  inherited Btn_Excluir: TBitBtn
    Left = 648
    ExplicitLeft = 648
  end
  inherited Btn_Novo: TBitBtn
    Left = 648
    ExplicitLeft = 648
  end
  inherited Btn_Salvar: TBitBtn
    Left = 648
    ExplicitLeft = 648
  end
  inherited Btn_Cancelar: TBitBtn
    Left = 648
    ExplicitLeft = 648
  end
  inherited Btn_Fechar: TBitBtn
    Left = 648
    ExplicitLeft = 648
  end
  inherited Tab_Form: TPageControl
    Width = 626
    Height = 313
    ActivePage = Tab_Detalhes
    ExplicitWidth = 626
    ExplicitHeight = 313
    inherited Tab_Listagem: TTabSheet
      ExplicitWidth = 618
      ExplicitHeight = 285
      inherited DBGrid1: TDBGrid
        Top = 0
        Width = 612
        Height = 282
        Columns = <
          item
            Expanded = False
            FieldName = 'Codigo'
            Title.Caption = 'C'#243'digo'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 414
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPOSTO'
            Title.Caption = 'Imposto (%)'
            Width = 93
            Visible = True
          end>
      end
    end
    inherited Tab_Detalhes: TTabSheet
      ExplicitWidth = 618
      ExplicitHeight = 285
      object Label2: TLabel [1]
        Left = 3
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = txt_Descricao
      end
      object Label3: TLabel [2]
        Left = 3
        Top = 93
        Width = 82
        Height = 13
        Caption = 'Perc. de Imposto'
        FocusControl = txt_Imposto
      end
      object txt_Descricao: TDBEdit
        Left = 3
        Top = 66
        Width = 598
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = DSCadastro
        TabOrder = 1
      end
      object txt_Imposto: TDBEdit
        Left = 3
        Top = 112
        Width = 134
        Height = 21
        DataField = 'IMPOSTO'
        DataSource = DSCadastro
        TabOrder = 2
      end
    end
  end
  inherited TCadastro: TIBTable
    Active = True
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'IMPOSTO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'PK_TANQUES'
        Fields = 'CODIGO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TANQUES'
    object TCadastroDESCRICAO: TIBStringField [0]
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object TCadastroIMPOSTO: TIBBCDField
      FieldName = 'IMPOSTO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
  end
  inherited DSCadastro: TDataSource
    Left = 224
  end
end
