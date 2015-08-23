unit ATTUserTeamFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool, uDM;

type
  TFrmATTUserTeam = class(TZSDForm)
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TGuidField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    cdsViewUser_: TStringField;
    cdsViewDeptCode_: TStringField;
    cdsViewTeamCode_: TStringField;
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
  FrmATTUserTeam: TFrmATTUserTeam;

implementation


{$R *.dfm}

procedure TFrmATTUserTeam.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTUserTeam.cdsViewNewRecord(DataSet: TDataSet);
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

procedure TFrmATTUserTeam.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  ATT_UserTeam';
    Open;
  end;
  
end;


procedure TFrmATTUserTeam.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmATTUserTeam);

finalization

UnRegisterClass(TFrmATTUserTeam);

end.
