unit uFrm_CadTanques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls,
  ComCtrls, Buttons, Grids, DBGrids;

type
  TFrm_CadTanques = class(T_DFCad)
    TCadastroDESCRICAO: TIBStringField;
    TCadastroIMPOSTO: TIntegerField;
    Label2: TLabel;
    txt_Descricao: TDBEdit;
    Label3: TLabel;
    txt_Imposto: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadTanques: TFrm_CadTanques;

implementation

{$R *.dfm}

end.
