unit uTTanque;

interface

uses uInterfaces;

type
  TTanque = class(TRegistro)
  private
    FDescricao: String;
    FImposto: Currency;
  protected
    property Descricao: String read FDescricao write FDescricao;
    property Imposto: Currency read FImposto write FImposto;
    constructor Create; override;
    procedure Abrir(Codigo: Integer); override;
    procedure Salvar; override;
    procedure Listar; override;
  end;

implementation

constructor TTanque.Create;
begin
  //
end;

procedure TTanque.Abrir(Codigo: Integer);
begin
  //
end;

procedure TTanque.Salvar;
begin
  //
end;

procedure TTanque.Listar;
begin
  //
end;

end.
