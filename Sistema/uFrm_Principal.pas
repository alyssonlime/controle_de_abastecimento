unit uFrm_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TFrm_Principal = class(TForm)
    MnuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Bombas1: TMenuItem;
    anques1: TMenuItem;
    Lanamentos1: TMenuItem;
    Faturamento1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses u_DF;

{$R *.dfm}

end.