unit ATTTeamFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool, uDM;

type
  TFrmATTTeam = class(TZSDForm)
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TGuidField;
    cdsViewCode_: TStringField;
    cdsViewName_: TStringField;
    cdsViewOutTime1_: TStringField;
    cdsViewInTime2_: TStringField;
    cdsViewOutTime2_: TStringField;
    cdsViewInTime3_: TStringField;
    cdsViewOutTime3_: TStringField;
    cdsViewUpdateUser_: TStringField;
    cdsViewInTime1_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUpdateDate_: TSQLTimeStampField;
    ZSDTool1: TZSDTool;
    cdsViewNotWork_: TStringField;
    cdsViewWorkTime_: TSingleField;
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
  FrmATTTeam: TFrmATTTeam;

implementation


{$R *.dfm}

procedure TFrmATTTeam.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTTeam.cdsViewNewRecord(DataSet: TDataSet);
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

procedure TFrmATTTeam.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  ATT_Team';
    Open;
  end;
  
end;


procedure TFrmATTTeam.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmATTTeam);

finalization

UnRegisterClass(TFrmATTTeam);

end.
