inherited Frm_RelAbastecimentos: TFrm_RelAbastecimentos
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 178
  ClientWidth = 497
  Position = poOwnerFormCenter
  ExplicitWidth = 503
  ExplicitHeight = 206
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Fechar: TBitBtn
    Left = 344
    Top = 104
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = Btn_FecharClick
  end
  object btn_Gerar: TBitBtn
    Left = 201
    Top = 104
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Gerar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btn_GerarClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 471
    Height = 90
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
    object dtp_DataInicial: TDateTimePicker
      Left = 19
      Top = 40
      Width = 121
      Height = 21
      Date = 42435.702888090280000000
      Time = 42435.702888090280000000
      TabOrder = 0
    end
    object dtp_DataFinal: TDateTimePicker
      Left = 146
      Top = 40
      Width = 121
      Height = 21
      Date = 42435.702888090280000000
      Time = 42435.702888090280000000
      TabOrder = 1
    end
  end
end
