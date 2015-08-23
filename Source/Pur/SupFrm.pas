unit SupFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, ZSDFrm, Grids, ZSDDBGrid, DB, Buttons, StdCtrls, DBGrids, ZSDDataSet,
  DBClient, uDM;

type
  TFrmSup = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewID_: TGuidField;
    cdsViewCode_: TStringField;
    cdsViewSName_: TStringField;
    cdsViewName_: TStringField;
    cdsViewTel_: TStringField;
    cdsViewFax_: TStringField;
    cdsViewQQ_: TStringField;
    cdsViewMSN_: TStringField;
    cdsViewWangWang_: TStringField;
    cdsViewBHI_: TStringField;
    cdsViewAddress_: TStringField;
    cdsViewIsCus_: TSmallintField;
    cdsViewIsSup_: TSmallintField;
    cdsViewIsOur_: TSmallintField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}


procedure TFrmSup.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID();
    FieldByName('isSup_').AsBoolean := True;
  end;
end;

procedure TFrmSup.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Active := False;
    CommandText := 'Select * From CusSup Where isSup_ =1';
    Open;
  end;
  
end;

initialization

RegisterClass(TFrmSup);

finalization

UnRegisterClass(TFrmSup);

end.
