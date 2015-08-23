unit ATTManualCardFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool, uDM;

type
  TFrmATTMaualCard = class(TZSDForm)
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
    cdsViewCardFrom_: TSmallintField;
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
  FrmATTMaualCard: TFrmATTMaualCard;

implementation


{$R *.dfm}

procedure TFrmATTMaualCard.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTMaualCard.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    FieldByName('CardFrom_').AsInteger := 2;
    // add by rasou 2011-11-25 19:32:06 CardFrom_ 用于标识考勤卡数据来源 0：考勤机；1：文档；2：手工
    Edit;
  end;
end;

procedure TFrmATTMaualCard.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  ATT_OriginalRecord where CardFrom_ =2';
    Open;
  end;
end;

procedure TFrmATTMaualCard.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmATTMaualCard);

finalization

UnRegisterClass(TFrmATTMaualCard);

end.
