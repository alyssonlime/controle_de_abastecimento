program Controle;

uses
  Forms,
  uFrm_Principal in 'uFrm_Principal.pas' {Frm_Principal},
  u_DF in 'u_DF.pas' {_DF},
  uDM in 'uDM.pas' {DM: TDataModule},
  u_DFCad in 'u_DFCad.pas' {_DFCad},
  uFrm_CadBombas in 'uFrm_CadBombas.pas' {Frm_CadBombas},
  uFrm_CadTanques in 'uFrm_CadTanques.pas' {Frm_CadTanques},
  uFrm_MovAbastecimentos in 'uFrm_MovAbastecimentos.pas' {Frm_MovAbastecimentos},
  uFrm_RelAbastecimentos in 'uFrm_RelAbastecimentos.pas' {Frm_RelAbastecimentos},
  uFrm_RelAbastecimentos_RL in 'uFrm_RelAbastecimentos_RL.pas' {Frm_RelAbastecimentos_RL},
  uFrm_SisSobre in 'uFrm_SisSobre.pas' {Frm_SisSobre},
  uFrm_SisSplash in 'uFrm_SisSplash.pas' {Frm_SisSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Controle de Abastecimentos';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
