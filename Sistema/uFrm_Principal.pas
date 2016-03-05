unit uFrm_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, u_DF;

type
  //TFrm_Principal = class(TForm)
  TFrm_Principal = class(T_DF)
    MnuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Bombas1: TMenuItem;
    anques1: TMenuItem;
    Lanamentos1: TMenuItem;
    Faturamento1: TMenuItem;
    procedure Bombas1Click(Sender: TObject);
    procedure anques1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses uFrm_CadBombas, uFrm_CadTanques, uFrm_MovAbastecimentos;



{$R *.dfm}

procedure TFrm_Principal.anques1Click(Sender: TObject);
begin
  inherited;
  Frm_CadTanques := TFrm_CadTanques.Create(Self);
  Frm_CadTanques.ShowModal;
  Frm_CadTanques.Free;
  Frm_CadTanques := nil;
end;

procedure TFrm_Principal.Bombas1Click(Sender: TObject);
begin
  inherited;
  Frm_CadBombas := TFrm_CadBombas.Create(Self);
  Frm_CadBombas.ShowModal;
  Frm_CadBombas.Free;
  Frm_CadBombas := nil;
end;

procedure TFrm_Principal.FormActivate(Sender: TObject);
begin
  inherited;
  if WindowState <> wsMaximized then
    WindowState := wsMaximized;
end;

procedure TFrm_Principal.Lanamentos1Click(Sender: TObject);
begin
  inherited;
  Frm_MovAbastecimentos := TFrm_MovAbastecimentos.Create(Self);
  Frm_MovAbastecimentos.ShowModal;
  Frm_MovAbastecimentos.Free;
  Frm_MovAbastecimentos := nil;
end;

end.
