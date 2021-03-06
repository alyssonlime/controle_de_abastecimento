unit uFrm_CadBombas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, ComCtrls, StdCtrls, Buttons,
  Mask, DBCtrls, Grids, DBGrids, DBClient;

type
  TFrm_CadBombas = class(T_DFCad)
    Label2: TLabel;
    txt_Descricao: TDBEdit;
    TTanques: TIBTable;
    TTanquesCODIGO: TIntegerField;
    TTanquesDESCRICAO: TIBStringField;
    Label3: TLabel;
    cbo_Tanque: TDBLookupComboBox;
    procedure Btn_NovoClick(Sender: TObject);
    procedure txt_DescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbo_TanqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadBombas: TFrm_CadBombas;

implementation

uses uDM;

{$R *.dfm}

procedure TFrm_CadBombas.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  txt_Descricao.Show;
  txt_Descricao.SetFocus;
end;

procedure TFrm_CadBombas.cbo_TanqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then
    if Btn_Salvar.Enabled then Btn_Salvar.SetFocus else SetFocusDefault;
end;

procedure TFrm_CadBombas.txt_DescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then cbo_Tanque.SetFocus;
end;

end.
