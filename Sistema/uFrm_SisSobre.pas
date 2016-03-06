unit uFrm_SisSobre;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls;

type
  TFrm_SisSobre = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    Comments: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_SisSobre: TFrm_SisSobre;

implementation

{$R *.dfm}

end.
 
