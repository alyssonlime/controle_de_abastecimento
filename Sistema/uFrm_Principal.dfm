inherited Frm_Principal: TFrm_Principal
  Caption = 'Controle de Abastecimento'
  ClientHeight = 352
  ClientWidth = 621
  Color = clMoneyGreen
  FormStyle = fsMDIForm
  Menu = MnuPrincipal
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 637
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_Nome: TLabel
    Left = 16
    Top = 8
    Width = 332
    Height = 36
    Caption = 'Controle de Abastecimentos'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 333
    Width = 621
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object MnuPrincipal: TMainMenu
    Left = 544
    Top = 112
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      object mnu_CadTanques: TMenuItem
        Caption = 'Tanques de Combust'#237'vel'
        OnClick = mnu_CadTanquesClick
      end
      object mnu_CadBombas: TMenuItem
        Caption = 'Bombas de Combust'#237'vel'
        OnClick = mnu_CadBombasClick
      end
    end
    object mnu_Movimentos: TMenuItem
      Caption = 'Movimentos'
      object mnu_MovAbastecimentos: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = mnu_MovAbastecimentosClick
      end
    end
    object mnu_Relatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mnu_RelAbastecimentos: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = mnu_RelAbastecimentosClick
      end
    end
    object mnu_Ajuda: TMenuItem
      Caption = 'Ajuda'
      object mnu_SisSobre: TMenuItem
        Caption = 'Sorbe'
        OnClick = mnu_SisSobreClick
      end
      object esteClasses1: TMenuItem
        Caption = 'TesteClasses'
        OnClick = esteClasses1Click
      end
    end
  end
  object Tmr_Sistema: TTimer
    Interval = 500
    OnTimer = Tmr_SistemaTimer
    Left = 312
    Top = 160
  end
end
