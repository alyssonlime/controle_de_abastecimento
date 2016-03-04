unit uFrm_MovAbastecimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  Grids, DBGrids, ComCtrls, Buttons, IBQuery;

type
  TFrm_MovAbastecimentos = class(T_DFCad)
    TCadastroDATA: TDateField;
    TCadastroHORA: TTimeField;
    TCadastroBOMBA: TIntegerField;
    TBombas: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    TBombasTANQUE: TIntegerField;
    TCadastroDescricaoBomba: TStringField;
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
    TCadastroLITROS: TIBBCDField;
    TCadastroVALOR: TIBBCDField;
    TCadastroIMPOSTO: TIBBCDField;
    TCadastroVALORIMPOSTO: TIBBCDField;
    procedure DSCadastroDataChange(Sender: TObject; Field: TField);
    procedure Btn_NovoClick(Sender: TObject);
    procedure TCadastroAfterInsert(DataSet: TDataSet);
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

procedure TFrm_MovAbastecimentos.DSCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TCadastro.State in [DSInsert, DSEdit] then
  begin
    if Field <> nil then
    begin
      if Field = TCadastroBOMBA then
      begin
        with TIBQuery.Create(Self) do
        try
          Database := DM.Conexao;
          SQL.Text := 'Select Imposto From Tanques Where Codigo = ' + TBombasTANQUE.AsString;
          Open;
          if not IsEmpty then
            TCadastroIMPOSTO.Value := Fields[0].AsCurrency;
        finally
          Free;
        end;
      end;
      if (Field = TCadastroBOMBA) or (Field = TCadastroVALOR) then
      begin
        TCadastroVALORIMPOSTO.Value :=
        TCadastroVALOR.Value * TCadastroIMPOSTO.Value / 100;
      end;
    end;
  end;
end;

procedure TFrm_MovAbastecimentos.TCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  TCadastroDATA.Value := Date;
  TCadastroHORA.Value := Time;
end;

end.
