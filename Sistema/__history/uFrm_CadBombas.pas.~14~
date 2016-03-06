unit uFrm_CadBombas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, u_DFCad, DB, IBCustomDataSet, IBTable, ComCtrls, StdCtrls, Buttons,
  Mask, DBCtrls, Grids, DBGrids;

type
  TFrm_CadBombas = class(T_DFCad)
    TCadastroDESCRICAO: TIBStringField;
    TCadastroTANQUE: TIntegerField;
    Label2: TLabel;
    txt_Descricao: TDBEdit;
    TTanques: TIBTable;
    TTanquesCODIGO: TIntegerField;
    TTanquesDESCRICAO: TIBStringField;
    TCadastroDescricaoTanque: TIBStringField;
    Label3: TLabel;
    cbo_Tanque: TDBLookupComboBox;
    procedure Btn_NovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_CadBombas: TFrm_CadBombas;

implementation

uses uDM;

{$R *.dfm}

procedure TFrm_CadBombas.Btn_NovoClick(Sender: TObject);
begin
  inherited;
  txt_Descricao.Show;
  txt_Descricao.SetFocus;
end;

end.
