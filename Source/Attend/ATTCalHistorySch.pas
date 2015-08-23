unit ATTCalHistorySch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool, uDM;

type
  TSchATTCalHistory = class(TZSDForm)
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TGuidField;
    cdsViewTeamCode_: TStringField;
    cdsViewInTime1_: TStringField;
    cdsViewOutTime1_: TStringField;
    cdsViewInTime2_: TStringField;
    cdsViewOutTime2_: TStringField;
    cdsViewInTime3_: TStringField;
    cdsViewOutTime3_: TStringField;
    cdsViewWorkDays_: TSingleField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    cdsViewUser_: TStringField;
    cdsViewMonth_: TIntegerField;
    ZSDTool1: TZSDTool;
    cdsViewDate_: TDateField;
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
  SchATTCalHistory: TSchATTCalHistory;

implementation


{$R *.dfm}

procedure TSchATTCalHistory.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TSchATTCalHistory.cdsViewNewRecord(DataSet: TDataSet);
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

procedure TSchATTCalHistory.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  Att_CalHistory';
    Open;
  end;
  
end;


procedure TSchATTCalHistory.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TSchATTCalHistory);

finalization

UnRegisterClass(TSchATTCalHistory);

end.
