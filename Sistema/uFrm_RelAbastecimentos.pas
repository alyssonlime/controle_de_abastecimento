unit uFrm_RelAbastecimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DF, StdCtrls, Buttons, Mask, ComCtrls, DBCtrls, DB,
  IBCustomDataSet, IBTable, DateUtils;

type
  TFrm_RelAbastecimentos = class(T_DF)
    Btn_Fechar: TBitBtn;
    btn_Gerar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtp_DataInicial: TDateTimePicker;
    dtp_DataFinal: TDateTimePicker;
    TTanques: TIBTable;
    TTanquesCODIGO: TIntegerField;
    TTanquesDESCRICAO: TIBStringField;
    DSTanques: TDataSource;
    cbo_Tanque: TDBLookupComboBox;
    Label3: TLabel;
    TBombas: TIBTable;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    DSBombas: TDataSource;
    cbo_Bombas: TDBLookupComboBox;
    Label4: TLabel;
    procedure Btn_FecharClick(Sender: TObject);
    procedure btn_GerarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtp_DataInicialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtp_DataFinalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cbo_TanqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbo_BombasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbo_TanqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_RelAbastecimentos: TFrm_RelAbastecimentos;

implementation

uses uFrm_RelAbastecimentos_RL, uDM;

{$R *.dfm}

procedure TFrm_RelAbastecimentos.Btn_FecharClick(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TFrm_RelAbastecimentos.btn_GerarClick(Sender: TObject);
var
  SQL: String;
  Rel: TFrm_RelAbastecimentos_RL;
begin
  inherited;
  Rel := TFrm_RelAbastecimentos_RL.Create(Self);
  try
    Rel.QRelatorio.Close;
    Rel.QRelatorio.Params.ParamValues['DI'] := dtp_DataInicial.DateTime;
    Rel.QRelatorio.Params.ParamValues['DF'] := dtp_DataFinal.DateTime;
    Rel.lbl_Filtros.Caption := 'Data entre ' + FormatDateTime('dd/MM/yyyy', dtp_DataInicial.Date) +
        ' e ' + FormatDateTime('dd/MM/yyyy', dtp_DataFinal.Date);
      if cbo_Tanque.Text <> '' then
      begin
        SQL := Rel.QRelatorio.SQL.Text;
        SQL := StringReplace(SQL, 'Group By', ' And B.Tanque = :TQ Group By', [rfIgnoreCase]);
        Rel.QRelatorio.SQL.Text := SQL;
        Rel.QRelatorio.Params.ParamValues['TQ'] := cbo_Tanque.KeyValue;
        Rel.lbl_Filtros.Caption := Rel.lbl_Filtros.Caption + '; Tanque: ' + cbo_Tanque.Text;
      end;
      if cbo_Bombas.Text <> '' then
      begin
        SQL := Rel.QRelatorio.SQL.Text;
        SQL := StringReplace(SQL, 'Group By', ' And A.Bomba = :BB Group By', [rfIgnoreCase]);
        Rel.QRelatorio.SQL.Text := SQL;
        Rel.QRelatorio.Params.ParamValues['BB'] := cbo_Bombas.KeyValue;
        Rel.lbl_Filtros.Caption := Rel.lbl_Filtros.Caption + '; Bomba: ' + cbo_Bombas.Text;
      end;
      Rel.QRelatorio.Open;
      if Rel.QRelatorio.IsEmpty then
      begin
        DM.MsgBox('Nenhum registro encontrado com os filtros selecionados !', MB_ICONEXCLAMATION);
        exit;
      end;
      Rel.RLReport.PreviewModal;
  finally
    FreeAndNil(Rel);
    dtp_DataInicial.SetFocus;
  end;
end;

procedure TFrm_RelAbastecimentos.cbo_BombasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then btn_Gerar.SetFocus;
  if Key = Windows.VK_DELETE then cbo_Bombas.KeyValue := null;
end;

procedure TFrm_RelAbastecimentos.cbo_TanqueClick(Sender: TObject);
begin
  inherited;
  TBombas.Filtered := True;
  if cbo_Tanque.Text = '' then
    TBombas.Filter := ''
  else
    TBombas.Filter := 'Tanque = ' + TTanquesCODIGO.AsString;
end;

procedure TFrm_RelAbastecimentos.cbo_TanqueKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then cbo_Bombas.SetFocus;
  if Key = Windows.VK_DELETE then
  begin
    cbo_Tanque.KeyValue := null;
    TBombas.Filter := ''
  end;
end;

procedure TFrm_RelAbastecimentos.dtp_DataFinalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then cbo_Tanque.SetFocus;
end;

procedure TFrm_RelAbastecimentos.dtp_DataInicialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if DM.EnterOrTab(Key) then dtp_DataFinal.SetFocus;
end;

procedure TFrm_RelAbastecimentos.FormCreate(Sender: TObject);
begin
  inherited;
  TBombas.Open; TBombas.FetchAll;
  TTanques.Open; TTanques.FetchAll;
  dtp_DataInicial.DateTime := EncodeDate(YearOf(Date), MonthOf(Date), 1);
  dtp_DataFinal.DateTime := Date;
end;

procedure TFrm_RelAbastecimentos.FormShow(Sender: TObject);
begin
  inherited;
  dtp_DataInicial.SetFocus;
end;

end.
