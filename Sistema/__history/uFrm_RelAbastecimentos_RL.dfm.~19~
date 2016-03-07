object Frm_RelAbastecimentos_RL: TFrm_RelAbastecimentos_RL
  Left = 0
  Top = 0
  Caption = 'Frm_RelAbastecimentos_RL'
  ClientHeight = 449
  ClientWidth = 992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport: TRLReport
    Left = 8
    Top = 32
    Width = 794
    Height = 1123
    DataSource = DSRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ExpressionParser = ExpParser
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 48
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 3
        Width = 224
        Height = 16
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Filtros: TRLLabel
        Left = 3
        Top = 25
        Width = 40
        Height = 16
        Caption = 'Filtros'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 86
      Width = 718
      Height = 48
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 3
        Top = 20
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel3: TRLLabel
        Left = 115
        Top = 19
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel4: TRLLabel
        Left = 363
        Top = 19
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object RLLabel5: TRLLabel
        Left = 629
        Top = 19
        Width = 86
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor'
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 6
        Width = 712
        Height = 8
        DrawKind = dkLine
      end
      object RLDraw2: TRLDraw
        Left = 3
        Top = 41
        Width = 712
        Height = 7
        DrawKind = dkLine
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 134
      Width = 718
      Height = 32
      object RLDBText1: TRLDBText
        Left = 3
        Top = 6
        Width = 94
        Height = 16
        AutoSize = False
        DataField = 'DATA'
        DataSource = DSRelatorio
      end
      object RLDBText2: TRLDBText
        Left = 115
        Top = 6
        Width = 230
        Height = 16
        AutoSize = False
        DataField = 'TANQUE'
        DataSource = DSRelatorio
      end
      object RLDBText3: TRLDBText
        Left = 363
        Top = 6
        Width = 246
        Height = 16
        AutoSize = False
        DataField = 'BOMBA'
        DataSource = DSRelatorio
      end
      object RLDBText4: TRLDBText
        Left = 632
        Top = 6
        Width = 83
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = DSRelatorio
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 166
      Width = 718
      Height = 40
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 632
        Top = 21
        Width = 83
        Height = 16
        Alignment = taRightJustify
        DataFormula = 'SUM(Valor)'
      end
      object RLDraw3: TRLDraw
        Left = 3
        Top = 6
        Width = 712
        Height = 8
        DrawKind = dkLine
      end
      object RLLabel6: TRLLabel
        Left = 574
        Top = 20
        Width = 52
        Height = 16
        Caption = 'Total =>'
      end
    end
  end
  object QRelatorio: TIBQuery
    Database = DM.Conexao
    Transaction = DM.Transacao
    SQL.Strings = (
      
        'Select A.Data, T.Descricao Tanque, B.Descricao Bomba, SUM(A.Valo' +
        'r) Valor'
      'From Abastecimentos A'
      'Inner Join Bombas B On A.Bomba = B.Codigo '
      'Inner Join Tanques T On B.Tanque = T.Codigo'
      'Where A.Data Between :DI And :DF'
      'Group By A.Data, T.Descricao, B.Descricao ')
    Left = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DI'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DF'
        ParamType = ptUnknown
      end>
    object QRelatorioDATA: TDateField
      FieldName = 'DATA'
      Origin = '"ABASTECIMENTOS"."DATA"'
      Required = True
    end
    object QRelatorioTANQUE: TIBStringField
      FieldName = 'TANQUE'
      ProviderFlags = []
      Size = 50
    end
    object QRelatorioBOMBA: TIBStringField
      FieldName = 'BOMBA'
      ProviderFlags = []
      Size = 50
    end
    object QRelatorioVALOR: TIBBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      DisplayFormat = '#,###,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DSRelatorio: TDataSource
    DataSet = QRelatorio
    Left = 432
  end
  object ExpParser: TRLExpressionParser
    Left = 496
  end
end
