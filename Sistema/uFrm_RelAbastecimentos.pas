unit uFrm_RelAbastecimentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DF, StdCtrls, Buttons, Mask, ComCtrls;

type
  TFrm_RelAbastecimentos = class(T_DF)
    Btn_Fechar: TBitBtn;
    btn_Gerar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtp_DataInicial: TDateTimePicker;
    dtp_DataFinal: TDateTimePicker;
    procedure Btn_FecharClick(Sender: TObject);
    procedure btn_GerarClick(Sender: TObject);
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
begin
  inherited;
  Frm_RelAbastecimentos_RL := TFrm_RelAbastecimentos_RL.Create(Self);
  try
    with Frm_RelAbastecimentos_RL do
    begin
      QRelatorio.Close;
      QRelatorio.Params[0].Value := dtp_DataInicial.DateTime;
      QRelatorio.Params[1].Value := dtp_DataFinal.DateTime;
      QRelatorio.Open;
      if QRelatorio.IsEmpty then
      begin
        DM.MsgBox('Nenhum registro encontrado com os filtros selecionados !', MB_ICONEXCLAMATION);
        exit;
      end;
      lbl_Filtros.Caption := 'Data entre ' + FormatDateTime('dd/MM/yyyy', dtp_DataInicial.Date) +
        ' e ' + FormatDateTime('dd/MM/yyyy', dtp_DataFinal.Date);
      RLReport.PreviewModal;
    end;
  finally
    Frm_RelAbastecimentos_RL.Free;
    Frm_RelAbastecimentos_RL := nil;
  end;
end;

end.
