unit LCFMRFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, ZSDDataSet,
  ZSDTool, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid;

type
  TFrmLCFMR = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    cdsView: TZSDDataSet;
    dsView: TDataSource;
    cdsViewDate_: TSQLTimeStampField;
    cdsViewDeliveryNo_: TStringField;
    cdsViewSalesman_: TStringField;
    cdsViewPaymentStatus_: TStringField;
    cdsViewWeight_: TSingleField;
    cdsViewAmount_: TSingleField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLCFMR: TFrmLCFMR;

implementation



{$R *.dfm}

procedure TFrmLCFMR.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('Date_').AsDateTime := Now();
  end;
end;

procedure TFrmLCFMR.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  OA_LCFMR';
    Open;
  end;
end;


initialization

RegisterClass(TFrmLCFMR);

finalization

UnRegisterClass(TFrmLCFMR);


end.
