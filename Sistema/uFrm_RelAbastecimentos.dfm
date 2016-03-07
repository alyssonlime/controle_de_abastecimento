inherited Frm_RelAbastecimentos: TFrm_RelAbastecimentos
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 273
  ClientWidth = 497
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 503
  ExplicitHeight = 301
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Fechar: TBitBtn
    Left = 344
    Top = 200
    Width = 137
    Height = 57
    Anchors = [akRight, akBottom]
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = Btn_FecharClick
  end
  object btn_Gerar: TBitBtn
    Left = 200
    Top = 200
    Width = 137
    Height = 57
    Anchors = [akRight, akBottom]
    Caption = 'Gerar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btn_GerarClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 465
    Height = 177
    TabOrder = 2
    object Label1: TLabel
      Left = 19
      Top = 21
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 146
      Top = 21
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object Label3: TLabel
      Left = 19
      Top = 69
      Width = 112
      Height = 13
      Caption = 'Tanque de Combust'#237'vel'
    end
    object Label4: TLabel
      Left = 19
      Top = 114
      Width = 108
      Height = 13
      Caption = 'Bomba de Combust'#237'vel'
    end
    object dtp_DataInicial: TDateTimePicker
      Left = 19
      Top = 40
      Width = 121
      Height = 21
      Date = 42435.702888090280000000
      Time = 42435.702888090280000000
      TabOrder = 0
      OnKeyDown = dtp_DataInicialKeyDown
    end
    object dtp_DataFinal: TDateTimePicker
      Left = 146
      Top = 40
      Width = 121
      Height = 21
      Date = 42435.702888090280000000
      Time = 42435.702888090280000000
      TabOrder = 1
      OnKeyDown = dtp_DataFinalKeyDown
    end
    object cbo_Tanque: TDBLookupComboBox
      Left = 19
      Top = 88
      Width = 430
      Height = 21
      DropDownRows = 10
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = DSTanques
      TabOrder = 2
      OnClick = cbo_TanqueClick
      OnKeyDown = cbo_TanqueKeyDown
    end
    object cbo_Bombas: TDBLookupComboBox
      Left = 19
      Top = 133
      Width = 430
      Height = 21
      DropDownRows = 10
      KeyField = 'CODIGO'
      ListField = 'DESCRICAO'
      ListSource = DSBombas
      TabOrder = 3
      OnKeyDown = cbo_BombasKeyDown
    end
  end
  object TTanques: TIBTable
    Database = DM.Conexao
    Transaction = DM.Transacao
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
    Left = 336
    object TTanquesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object TTanquesDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object DSTanques: TDataSource
    DataSet = TTanques
    Left = 392
  end
  object TBombas: TIBTable
    Database = DM.Conexao
    Transaction = DM.Transacao
    StoreDefs = True
    TableName = 'BOMBAS'
    Left = 336
    Top = 48
    object IntegerField1: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object DSBombas: TDataSource
    DataSet = TBombas
    Left = 392
    Top = 48
  end
end
