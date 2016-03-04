inherited Frm_Principal: TFrm_Principal
  Caption = 'Controle de Abastecimento'
  ClientHeight = 407
  ClientWidth = 942
  Menu = MnuPrincipal
  OnActivate = FormActivate
  ExplicitWidth = 958
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 13
  object MnuPrincipal: TMainMenu
    Left = 544
    Top = 112
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object anques1: TMenuItem
        Caption = 'Tanques'
        OnClick = anques1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas1Click
      end
    end
    object Movimentos1: TMenuItem
      Caption = 'Movimentos'
      object Lanamentos1: TMenuItem
        Caption = 'Lan'#231'amentos'
        OnClick = Lanamentos1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Faturamento1: TMenuItem
        Caption = 'Faturamento'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
