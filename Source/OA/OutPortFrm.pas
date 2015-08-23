unit OutPortFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZSDTool, Datasnap.DBClient,
  ZSDDataSet, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid;

type
  TFrmOutPort = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewLOGISTICSDATE_: TDateField;
    cdsViewUNDERNETWORK_: TStringField;
    cdsViewLOGISTICSINFO_: TStringField;
    cdsViewDELIVERYDATE_: TDateField;
    cdsViewDELIVERYITEMS_: TSmallintField;
    cdsViewUNSITUATION_: TStringField;
    cdsViewAUDIT_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    cdsViewLOGISTICSCOST_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutPort: TFrmOutPort;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmOutPort.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmOutPort.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmOutPort.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    close;
    CommandText := 'Select * From  OA_OUTPORT';
    Open;
  end;
end;

initialization

RegisterClass(TFrmOutPort);

finalization

UnRegisterClass(TFrmOutPort);

end.
