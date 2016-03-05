inherited _DFCad: T_DFCad
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 337
  ClientWidth = 745
  KeyPreview = True
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  ExplicitWidth = 751
  ExplicitHeight = 365
  DesignSize = (
    745
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object Btn_Excluir: TBitBtn
    Left = 592
    Top = 80
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Excluir'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = Btn_ExcluirClick
  end
  object Btn_Novo: TBitBtn
    Left = 592
    Top = 24
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Novo'
    Default = True
    DoubleBuffered = True
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = Btn_NovoClick
    ExplicitLeft = 736
  end
  object Btn_Salvar: TBitBtn
    Left = 592
    Top = 144
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Salvar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = Btn_SalvarClick
  end
  object Btn_Cancelar: TBitBtn
    Left = 592
    Top = 200
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Cancelar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = Btn_CancelarClick
  end
  object Btn_Fechar: TBitBtn
    Left = 592
    Top = 264
    Width = 137
    Height = 57
    Anchors = [akTop, akRight]
    Caption = 'Fechar'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = Btn_FecharClick
  end
  object Tab_Form: TPageControl
    Left = 16
    Top = 16
    Width = 570
    Height = 305
    ActivePage = Tab_Detalhes
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    ExplicitWidth = 714
    ExplicitHeight = 387
    object Tab_Listagem: TTabSheet
      Caption = 'Listagem'
      ExplicitWidth = 706
      ExplicitHeight = 359
      DesignSize = (
        562
        277)
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 550
        Height = 271
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = DSCadastro
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object Tab_Detalhes: TTabSheet
      Caption = 'Detalhes'
      ImageIndex = 1
      ExplicitHeight = 285
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = txt_Codigo
      end
      object txt_Codigo: TDBEdit
        Left = 3
        Top = 22
        Width = 134
        Height = 21
        Color = cl3DLight
        DataField = 'CODIGO'
        DataSource = DSCadastro
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object TCadastro: TIBTable
    Database = DM.Conexao
    Transaction = DM.Transacao
    AfterCancel = TCadastroAfterCancel
    AfterDelete = TCadastroAfterDelete
    AfterPost = TCadastroAfterPost
    BeforeDelete = TCadastroBeforeDelete
    BeforeEdit = TCadastroBeforeEdit
    BeforeInsert = TCadastroBeforeInsert
    BeforePost = TCadastroBeforePost
    Left = 160
    object TCadastroCodigo: TIntegerField
      FieldName = 'Codigo'
      DisplayFormat = '00000'
    end
  end
  object DSCadastro: TDataSource
    DataSet = TCadastro
    Left = 216
  end
end
