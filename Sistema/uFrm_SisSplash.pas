unit uFrm_SisSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TFrm_SisSplash = class(TForm)
    Tmr_Efeito: TTimer;
    lbl_Nome: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Tmr_EfeitoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SisSplash: TFrm_SisSplash;

implementation

{$R *.dfm}

procedure TFrm_SisSplash.FormCreate(Sender: TObject);
begin
  Width := 1;
end;

procedure TFrm_SisSplash.Tmr_EfeitoTimer(Sender: TObject);
begin
  if Width <= 600 then
  begin
    Width := Width + 10;
    Left := Left - 5;
  end
  else
  begin
    Tmr_Efeito.Enabled := False;
    lbl_Nome.Visible := True;
    Refresh;
    Sleep(1000);
    Close;
  end;
end;

end.
