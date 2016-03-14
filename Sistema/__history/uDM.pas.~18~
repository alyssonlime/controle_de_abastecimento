unit uDM;

interface

uses
  SysUtils, Classes, DB, IBDatabase, Windows, Forms, INIFiles;

type
  TDM = class(TDataModule)
    Conexao: TIBDatabase;
    Transacao: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function MsgBox(Mensagem: String; Opcoes: Integer = 0): Integer;
    function EnterOrTab(key: Word): Boolean;
    procedure TratarErro(e: Exception);
  end;

Const
  CRLF = #10#13;
var
  DM: TDM;

implementation

uses uFrm_SisSplash;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  ArqINI: TINIFile;
begin
  TFrm_SisSplash.Create(Application).ShowModal;
  ArqINI := TINIFile.Create(GetCurrentDir + '\CONFIG.INI');
  try
    try
      Conexao.Connected := False; //Se certificar que está desconectado
      Conexao.DatabaseName := ArqINI.ReadString('GERAL', 'Servidor','Localhost');
      Conexao.DatabaseName := Conexao.DatabaseName  + ':' +
        ExpandFileName(ArqINI.ReadString('GERAL', 'Banco','BANCO.FDB'));
      Conexao.Connected := True;
    except
      on e: Exception do
      begin
        TratarErro(e);
        HalT(0);
      end;
    end;
  finally
    ArqINI.Free;
  end;
end;

function TDM.MsgBox(Mensagem: String; Opcoes: Integer = 0): Integer;
begin
  if Opcoes = 0 then Opcoes := MB_ICONINFORMATION;
  Result := Application.MessageBox(PChar(Mensagem), PCHAR(Application.Title), Opcoes);
end;

function TDM.EnterOrTab(key: Word): Boolean;
begin
  Result := False;
  if Key in [windows.VK_RETURN, windows.VK_TAB] then
  begin
    Key := 0;
    Result := True;
  end;
end;

procedure TDM.TratarErro(e: Exception);
var
  ArqLOG: String;
begin
  if e.ClassType <> EAbort then
    MsgBox('Um problema foi encontrado: ' + CRLF + e.Message, MB_ICONERROR);
end;

end.
