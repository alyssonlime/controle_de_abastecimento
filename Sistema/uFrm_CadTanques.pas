unit uFrm_CadTanques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  ComCtrls, Buttons, Grids, DBGrids, DBClient;

type
  TFrm_CadTanques = class(T_DFCad)
    TCadastroDESCRICAO: TIBStringField;
    Label2: TLabel;
    txt_Descricao: TDBEdit;
    Label3: TLabel;
    txt_Imposto: TDBEdit;
    TCadastroIMPOSTO: TIBBCDField;
    TableMemory: TClientDataSet;
    procedure Btn_NovoClick(Sender: TObject);
    procedure txt_DescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_ImpostoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadTanques: TFrm_CadTanques;

implementation

uses uDM;

{$R *.dfm}

procedure TFrm_CadTanques.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  txt_Descricao.Show;
  txt_Descricao.SetFocus;
end;

procedure TFrm_CadTanques.FormCreate(Sender: TObject);
begin
  inherited;
  TableMemory.FieldDefs.Add('Codigo', ftInteger);
  TableMemory.FieldDefs.Add('Descricao', ftString, 50);
  TableMemory.FieldDefs.Add('Imposto', ftCurrency);
  TableMemory.CreateDataSet;
  TableMemory.LogChanges := False;
  TableMemory.Open;
end;

procedure TFrm_CadTanques.txt_DescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then txt_Imposto.SetFocus;
end;

procedure TFrm_CadTanques.txt_ImpostoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then
    if Btn_Salvar.Enabled then Btn_Salvar.SetFocus else SetFocusDefault;
end;

end.
