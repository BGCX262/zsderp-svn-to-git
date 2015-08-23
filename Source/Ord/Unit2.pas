unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, DB, DBClient, ZSDDataSet, Grids, DBGrids, ZSDDBGrid;

type
  Tfrmzbandcl = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    ZSDDataSet1: TZSDDataSet;
    DataSource1: TDataSource;
    ZSDDataSet1user_: TStringField;
    ZSDDataSet1name_: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmzbandcl: Tfrmzbandcl;

implementation

{$R *.dfm}

procedure Tfrmzbandcl.FormCreate(Sender: TObject);
begin
  inherited;
  with ZSDDataSet1 do
  begin
    Close;
    CommandText := 'Select first 100 * From ACCOUNT';
    Open;
  end;
  
end;

initialization

RegisterClass(Tfrmzbandcl);

finalization

UnRegisterClass(Tfrmzbandcl);

end.
