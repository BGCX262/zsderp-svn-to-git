unit IntoPortFrm;

interface

uses
  ZSDFrm,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZSDTool, Datasnap.DBClient,
  ZSDDataSet, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid;

type
  TFrmIntoPort = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewSHIPPER_: TStringField;
    cdsViewFLIGHTNO_: TStringField;
    cdsViewFQUANTITY_: TSmallintField;
    cdsViewRQUANTITY_: TSmallintField;
    cdsViewUNSITUATION_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    cdsViewFLIGHTDATE_: TDateField;
    cdsViewFWEIGHT_: TSingleField;
    cdsViewRWEIGHT_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIntoPort: TFrmIntoPort;

implementation

uses uDM;

{$R *.dfm}

procedure TFrmIntoPort.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmIntoPort.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmIntoPort.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    close;
    CommandText := 'Select * From  OA_INTOPORT';
    Open;
  end;
end;

initialization

RegisterClass(TFrmIntoPort);

finalization

UnRegisterClass(TFrmIntoPort);

end.
