unit u_DF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  T_DF = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _DF: T_DF;

implementation

uses uDM;

{$R *.dfm}

procedure T_DF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
  begin
    Action := caFree;
    _DF := nil;
  end;
end;

end.
