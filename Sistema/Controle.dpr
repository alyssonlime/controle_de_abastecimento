program Controle;

uses
  Forms,
  uFrm_Principal in 'uFrm_Principal.pas' {Frm_Principal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
