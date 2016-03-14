unit uFrm_MovAbastecimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, ComCtrls, Buttons, IBQuery, DBClient;

type
  TFrm_MovAbastecimentos = class(T_DFCad)
    TBombas: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    TBombasTANQUE: TIntegerField;
    Label2: TLabel;
    txt_Data: TDBEdit;
    Label3: TLabel;
    txt_Hora: TDBEdit;
    Label4: TLabel;
    txt_Litros: TDBEdit;
    Label5: TLabel;
    txt_Valor: TDBEdit;
    Label6: TLabel;
    txt_Imposto: TDBEdit;
    Label8: TLabel;
    txt_ValorImposto: TDBEdit;
    Label7: TLabel;
    cbo_Bomba: TDBLookupComboBox;
    procedure DSCadastroDataChange(Sender: TObject; Field: TField);
    procedure Btn_NovoClick(Sender: TObject);
    procedure TCadastroAfterInsert(DataSet: TDataSet);
    procedure txt_LitrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txt_ValorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbo_BombaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_MovAbastecimentos: TFrm_MovAbastecimentos;

implementation

uses uDM;

{$R *.dfm}

procedure TFrm_MovAbastecimentos.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  cbo_Bomba.Show;
  cbo_Bomba.SetFocus;
end;

procedure TFrm_MovAbastecimentos.cbo_BombaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then txt_Litros.SetFocus;
end;

procedure TFrm_MovAbastecimentos.DSCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TCadastro.State in [DSInsert, DSEdit] then
  begin
    if Field <> nil then
    begin
      if Field.FieldName = 'BOMBA' then
      begin
        with TIBQuery.Create(Self) do
        try
          Database := DM.Conexao;
          SQL.Text := 'Select Imposto From Tanques Where Codigo = ' + TBombasTANQUE.AsString;
          Open;
          if not IsEmpty then
            TCadastro.FieldByName('IMPOSTO').Value := Fields[0].AsCurrency;
        finally
          Free;
        end;
      end;
      if (Field.FieldName = 'BOMBA') or (Field.FieldName = 'VALOR') then
      begin
        TCadastro.FieldByName('VALORIMPOSTO').Value :=
        TCadastro.FieldByName('VALOR').Value * TCadastro.FieldByName('IMPOSTO').Value / 100;
      end;
    end;
  end;
end;

procedure TFrm_MovAbastecimentos.TCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TCadastro.FieldByName('DATA').Value := Date;
  TCadastro.FieldByName('HORA').Value := Time;
end;

procedure TFrm_MovAbastecimentos.txt_LitrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then txt_Valor.SetFocus;
end;

procedure TFrm_MovAbastecimentos.txt_ValorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then
    if Btn_Salvar.Enabled then Btn_Salvar.SetFocus else SetFocusDefault;
end;

end.
