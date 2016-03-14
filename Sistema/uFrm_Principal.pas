unit uFrm_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, u_DF, StdCtrls, ExtCtrls, ComCtrls;

type
  //TFrm_Principal = class(TForm)
  TFrm_Principal = class(T_DF)
    MnuPrincipal: TMainMenu;
    mnuCadastros: TMenuItem;
    mnu_Movimentos: TMenuItem;
    mnu_Relatorios: TMenuItem;
    mnu_CadBombas: TMenuItem;
    mnu_CadTanques: TMenuItem;
    mnu_MovAbastecimentos: TMenuItem;
    mnu_RelAbastecimentos: TMenuItem;
    mnu_Ajuda: TMenuItem;
    mnu_SisSobre: TMenuItem;
    lbl_Nome: TLabel;
    StatusBar: TStatusBar;
    Tmr_Sistema: TTimer;
    esteClasses1: TMenuItem;
    procedure mnu_CadBombasClick(Sender: TObject);
    procedure mnu_CadTanquesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mnu_MovAbastecimentosClick(Sender: TObject);
    procedure mnu_RelAbastecimentosClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnu_SisSobreClick(Sender: TObject);
    procedure Tmr_SistemaTimer(Sender: TObject);
    procedure esteClasses1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses uFrm_CadBombas, uFrm_CadTanques, uFrm_MovAbastecimentos,
  uFrm_RelAbastecimentos, uDM, uFrm_SisSobre, uClasses;



{$R *.dfm}


procedure TFrm_Principal.mnu_CadTanquesClick(Sender: TObject);
begin
  inherited;
  {if Frm_CadTanques = nil then
    Frm_CadTanques := TFrm_CadTanques.Create(Self);
  Frm_CadTanques.Show;}
  Frm_CadTanques := TFrm_CadTanques.Create(Self);
  Frm_CadTanques.ShowModal;
  Frm_CadTanques.Free;
  Frm_CadTanques := nil;
end;

procedure TFrm_Principal.mnu_CadBombasClick(Sender: TObject);
begin
  inherited;
  {if Frm_CadBombas = nil then
    Frm_CadBombas := TFrm_CadBombas.Create(Self);
  Frm_CadBombas.Show; }
  Frm_CadBombas := TFrm_CadBombas.Create(Self);
  Frm_CadBombas.ShowModal;
  Frm_CadBombas.Free;
  Frm_CadBombas := nil;
end;

procedure TFrm_Principal.mnu_RelAbastecimentosClick(Sender: TObject);
begin
  inherited;
 { if Frm_RelAbastecimentos = nil then
    Frm_RelAbastecimentos := TFrm_RelAbastecimentos.Create(Self);
  Frm_RelAbastecimentos.Show;   }
  Frm_RelAbastecimentos := TFrm_RelAbastecimentos.Create(Self);
  Frm_RelAbastecimentos.ShowModal;
  Frm_RelAbastecimentos.Free;
  Frm_RelAbastecimentos := nil;
end;

procedure TFrm_Principal.esteClasses1Click(Sender: TObject);
var
  Tanque: TTanque; Bomba: TBomba; Abastecimento: TAbastecimento;
  TanqueLista: TArray<TTanque>;
  BombaLista: TArray<TBomba>;
  AbastecimentoLista: TArray<TAbastecimento>;
  Cod1, Cod2: Integer;
begin
  inherited;
  //CADASTRA 1
  Tanque := TTanque.Create;
  Tanque.Descricao := 'TESTE 03';
  Tanque.Imposto := 13;
  Tanque.Salvar;
  Cod1 := Tanque.Codigo;
  FreeAndNil(Tanque);
  //CADASTRA 2
  Tanque := TTanque.Create;
  Tanque.Descricao := 'TESTE 04';
  Tanque.Imposto := 13;
  Tanque.Salvar;
  Cod2 := Tanque.Codigo;
  FreeAndNil(Tanque);
  //EDITA 2
  Tanque := TTanque.Create;
  Tanque.Abrir(Cod2);
  Tanque.Descricao := Tanque.Descricao + ' EDITADO';
  Tanque.Imposto := 13;
  Tanque.Salvar;
  Tag := Tanque.Codigo;
  FreeAndNil(Tanque);
  //DELETA 1
  Tanque := TTanque.Create;
  Tanque.Abrir(Cod1);
  Tanque.Deletar;
  FreeAndNil(Tanque);


  //CADASTRA 1
  Bomba := TBomba.Create;
  Bomba.Descricao := 'TESTE 03';
  Bomba.Tanque := 1;
  Bomba.Salvar;
  Cod1 := Bomba.Codigo;
  FreeAndNil(Bomba);
  //CADASTRA 2
  Bomba := TBomba.Create;
  Bomba.Descricao := 'TESTE 04';
  Bomba.Tanque := 1;
  Bomba.Salvar;
  Cod2 := Bomba.Codigo;
  FreeAndNil(Bomba);
  //EDITA 2
  Bomba := TBomba.Create;
  Bomba.Abrir(Cod2);
  Bomba.Descricao := Bomba.Descricao + ' EDITADO';
  Bomba.Tanque := 1;
  Bomba.Salvar;
  Tag := Bomba.Codigo;
  FreeAndNil(Bomba);
  //DELETA 1
  Bomba := TBomba.Create;
  Bomba.Abrir(Cod1);
  Bomba.Deletar;
  FreeAndNil(Bomba);


  //CADASTRA 1
  Abastecimento := TAbastecimento.Create;
  Abastecimento.Data := Date;
  Abastecimento.Hora := Time;
  Abastecimento.Bomba := 1;
  Abastecimento.Litros := 10;
  Abastecimento.Valor := 10;
  Abastecimento.Salvar;
  Cod1 := Abastecimento.Codigo;
  FreeAndNil(Abastecimento);
  //CADASTRA 2
  Abastecimento := TAbastecimento.Create;
  Abastecimento.Data := Date;
  Abastecimento.Hora := Time;
  Abastecimento.Bomba := 1;
  Abastecimento.Litros := 20;
  Abastecimento.Valor := 20;
  Abastecimento.Salvar;
  Cod2 := Abastecimento.Codigo;
  FreeAndNil(Abastecimento);
  //EDITA 2
  Abastecimento := TAbastecimento.Create;
  Abastecimento.Abrir(Cod2);
  Abastecimento.Data := Date;
  Abastecimento.Hora := Time;
  Abastecimento.Bomba := 1;
  Abastecimento.Litros := Abastecimento.Litros + 5;
  Abastecimento.Valor := Abastecimento.Valor + 5;
  Abastecimento.Salvar;
  Tag := Abastecimento.Codigo;
  FreeAndNil(Abastecimento);
  //DELETA 1
  Abastecimento := TAbastecimento.Create;
  Abastecimento.Abrir(Cod1);
  Abastecimento.Deletar;
  FreeAndNil(Abastecimento);


  AbastecimentoLista := TAbastecimento.Listar;
  BombaLista := TBomba.Listar;
  TanqueLista := TTanque.Listar;
end;

procedure TFrm_Principal.FormActivate(Sender: TObject);
begin
  inherited;
  if WindowState <> wsMaximized then
    WindowState := wsMaximized;
end;

procedure TFrm_Principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if DM.MsgBox('Fechar o sistema ?', MB_YESNO+MB_ICONQUESTION) = IDNO then
    CanClose := False;
end;

procedure TFrm_Principal.mnu_MovAbastecimentosClick(Sender: TObject);
begin
  inherited;
  {if Frm_MovAbastecimentos = nil then
    Frm_MovAbastecimentos := TFrm_MovAbastecimentos.Create(Self);
  Frm_MovAbastecimentos.Show;}
  Frm_MovAbastecimentos := TFrm_MovAbastecimentos.Create(Self);
  Frm_MovAbastecimentos.ShowModal;
  Frm_MovAbastecimentos.Free;
  Frm_MovAbastecimentos := nil;
end;

procedure TFrm_Principal.mnu_SisSobreClick(Sender: TObject);
begin
  inherited;
  Frm_SisSobre := TFrm_SisSobre.Create(Self);
  Frm_SisSobre.ShowModal;
  Frm_SisSobre.Free;
  Frm_SisSobre := nil;
end;

procedure TFrm_Principal.Tmr_SistemaTimer(Sender: TObject);
begin
  inherited;
  StatusBar.Panels[0].Text :=
    FormatDateTime('dddd'', ''dd '' de '' MMMM '' de '' yyyy '', '' HH:mm:ss ', Now);
end;

end.
