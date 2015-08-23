unit RMMSFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, ZSDDataSet,
  ZSDTool, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid, Bde.DBTables, Data.Win.ADODB;

type
  TFrmRMMS = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    cdsView: TZSDDataSet;
    dsView: TDataSource;
    cdsViewReleaseDate_: TSQLTimeStampField;
    cdsViewCollarOrNetwork_: TStringField;
    cdsViewMaterialName_: TStringField;
    cdsViewQuantity_: TStringField;
    cdsViewPaymentStatus_: TStringField;
    cdsViewRemark_: TStringField;
    cdsViewAmount_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRMMS: TFrmRMMS;

implementation



{$R *.dfm}

procedure TFrmRMMS.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ReleaseDate_').AsDateTime := Now();
  end;
end;

procedure TFrmRMMS.FormCreate(Sender: TObject);
begin
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  OA_RMMS';
    Open;
  end;
end;
end;

initialization

RegisterClass(TFrmRMMS);

finalization

UnRegisterClass(TFrmRMMS);


end.
