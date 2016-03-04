unit u_DFCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DF, StdCtrls, Buttons, ComCtrls, DB, IBCustomDataSet, IBQuery,
  IBTable, Mask, DBCtrls, Grids, DBGrids, ActnList,
  PlatformDefaultStyleActnCtrls, ActnMan;

type
  T_DFCad = class(T_DF)
    Btn_Novo: TBitBtn;
    Btn_Excluir: TBitBtn;
    Btn_Salvar: TBitBtn;
    Btn_Cancelar: TBitBtn;
    Btn_Fechar: TBitBtn;
    Tab_Form: TPageControl;
    Tab_Listagem: TTabSheet;
    Tab_Detalhes: TTabSheet;
    TCadastro: TIBTable;
    DSCadastro: TDataSource;
    txt_Codigo: TDBEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    TCadastroCodigo: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure TCadastroBeforePost(DataSet: TDataSet);
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_ExcluirClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure TCadastroBeforeDelete(DataSet: TDataSet);
    procedure TCadastroBeforeInsert(DataSet: TDataSet);
    procedure Btn_FecharClick(Sender: TObject);
    procedure TCadastroAfterCancel(DataSet: TDataSet);
    procedure TCadastroAfterPost(DataSet: TDataSet);
    procedure TCadastroAfterDelete(DataSet: TDataSet);
    procedure TCadastroBeforeEdit(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitarEdicao;
    procedure DesabilitarEdicao;
  end;

var
  _DFCad: T_DFCad;

implementation

uses uDM;

{$R *.dfm}

procedure T_DFCad.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  TCadastro.Insert;
end;

procedure T_DFCad.Btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  try
    TCadastro.Delete;
  except
    on e: Exception do DM.TratarErro(e);
  end;
end;

procedure T_DFCad.Btn_SalvarClick(Sender: TObject);
begin
  inherited;
  try
    TCadastro.Post;
  except
    on e: Exception do DM.TratarErro(e);
  end;
end;

procedure T_DFCad.HabilitarEdicao;
begin
  inherited;
  Btn_Novo.Enabled := False;
  Btn_Excluir.Enabled := False;
  Btn_Salvar.Enabled := True;
  Btn_Cancelar.Enabled := True;
  Btn_Fechar.Enabled := False;
  Tab_Detalhes.Show;
  Tab_Detalhes.SetFocus;
end;

procedure T_DFCad.DesabilitarEdicao;
begin
  inherited;
  Btn_Novo.Enabled := True;
  Btn_Excluir.Enabled := True;
  Btn_Salvar.Enabled := False;
  Btn_Cancelar.Enabled := False;
  Btn_Fechar.Enabled := True;
  Tab_Listagem.Show;
  Tab_Listagem.SetFocus;
end;

procedure T_DFCad.Btn_CancelarClick(Sender: TObject);
begin
  inherited;
  TCadastro.Cancel;
end;

procedure T_DFCad.Btn_FecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure T_DFCad.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if TCadastro.State in [DSInsert, DSEdit] then
  begin
    DM.MsgBox('Registro em edi��o !', MB_ICONEXCLAMATION);
    CanClose := False;
  end;
end;

procedure T_DFCad.FormCreate(Sender: TObject);
begin
  inherited;
  TCadastro.Open;
  Tab_Form.TabIndex := 0;
end;

procedure T_DFCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := AnsiUpperCase(Key)[1];
end;

procedure T_DFCad.FormShow(Sender: TObject);
begin
  inherited;
  DesabilitarEdicao;
end;

procedure T_DFCad.TCadastroAfterCancel(DataSet: TDataSet);
begin
  inherited;
  DesabilitarEdicao;
end;

procedure T_DFCad.TCadastroAfterDelete(DataSet: TDataSet);
begin
  inherited;
  DesabilitarEdicao;
end;

procedure T_DFCad.TCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  DesabilitarEdicao;
end;

procedure T_DFCad.TCadastroBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if TCadastro.IsEmpty then
  begin
    DM.MsgBox('Nenhum registro para exclus�o !', MB_ICONEXCLAMATION);
    Abort;
  end;
  if DM.MsgBox('Confirma exclus�o ?', MB_YESNO+MB_ICONQUESTION) = IDNO then Abort;
end;

procedure T_DFCad.TCadastroBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  HabilitarEdicao;
end;

procedure T_DFCad.TCadastroBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  HabilitarEdicao;
end;

procedure T_DFCad.TCadastroBeforePost(DataSet: TDataSet);
var
  x: Integer;
  Field: TField;
begin
  inherited;
  if TCadastro.State = DSInsert then
  begin
    if TCadastro.FieldByName('Codigo').AsInteger = 0 then
    begin
      with TIBQuery.Create(Self) do
      try
        Database := TCadastro.Database;
        SQL.Text := 'Select MAX(Codigo) From ' + TCadastro.TableName;
        Open;
        TCadastro['Codigo'] := Fields[0].AsInteger + 1;
      finally
        Close;
        Free;
      end;
    end;
  end;
  //for x := low(TCadastro.Fields) to high(TCadastro.Fields) do
  for Field in TCadastro.Fields do
  begin
    if Field.Required and Field.IsNull then
    begin
      DM.MsgBox('Preenchimento obrigat�rio: '  + Field.FieldName + ' !', MB_ICONEXCLAMATION);
      Field.FocusControl;
      Abort;
    end;
  end;
end;

end.
