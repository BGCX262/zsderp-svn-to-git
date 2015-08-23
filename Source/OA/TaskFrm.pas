unit TaskFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ZSDTool;

type
  TFrmTask = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    sPID: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmTask: TFrmTask;

implementation


{$R *.dfm}

procedure TFrmTask.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    DataSet.FieldByName('ID_').AsString := DM.NewGUID;
    DataSet.FieldByName('StarDate_').AsDateTime := Now();
    DataSet.FieldByName('EndDate_').AsDateTime := Now();
    DataSet.FieldByName('TargetDate_').AsDateTime := Now();
    DataSet.FieldByName('AppDate_').AsDateTime := Now();
    DataSet.FieldByName('AppUser_').AsString := DM.User;
    DataSet.FieldByName('Responsible_').AsString := DM.User;
    DataSet.FieldByName('Status_').AsInteger := 0;
  end;
end;

procedure TFrmTask.DBGrid1DblClick(Sender: TObject);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    Exit;
  end;
  Self.cdsView.ApplyUpdates(0);
  DM.ZSDSendMsg('FrmTaskB', COST_ZSD_OPENID,
    [Self.cdsView.FieldByName('ID_').AsString]);
end;

procedure TFrmTask.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText :=
      Format('Select * From TaskA Where Responsible_=''%s'' or AppUser_=''%s''',
      [DM.User, DM.User]);
    Open;
    CommandText := 'Select * From TaskA ';
  end;
  Self.IFrmFDel := False;
end;

procedure TFrmTask.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sPID := DM.ZSDargs[0];
        with cdsView do
        begin
          Close;
          CommandText :=
            Format('Select * From TaskA Where Responsible_=''%s'' or AppUser_=''%s''',
            [sPID, sPID]);
          Open;
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmTask);

finalization

UnRegisterClass(TFrmTask);

end.
