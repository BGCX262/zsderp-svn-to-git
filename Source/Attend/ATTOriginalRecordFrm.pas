unit ATTOriginalRecordFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool, uDM;

type
  TFrmATTOriginalRecord = class(TZSDForm)
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TStringField;
    cdsViewUser_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    cdsViewCardID_: TStringField;
    cdsViewTime_: TStringField;
    cdsViewDate_: TDateField;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmATTOriginalRecord: TFrmATTOriginalRecord;

implementation


{$R *.dfm}

procedure TFrmATTOriginalRecord.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTOriginalRecord.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    Edit;
  end;
end;

procedure TFrmATTOriginalRecord.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  ATT_OriginalRecord';
    Open;
  end;
  
end;


procedure TFrmATTOriginalRecord.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmATTOriginalRecord);

finalization

UnRegisterClass(TFrmATTOriginalRecord);

end.
