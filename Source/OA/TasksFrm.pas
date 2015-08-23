unit TasksFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ExtCtrls, ZSDTool, uDM;

type
  TFrmTasks = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    Splitter1: TSplitter;
    DBGrid2: TZSDDBGrid;
    dsViewb: TDataSource;
    cdsViewb: TZSDDataSet;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure cdsViewbNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterScroll(DataSet: TDataSet);
    procedure cdsViewAfterDelete(DataSet: TDataSet);
  private
    sPID: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmTasks: TFrmTasks;

implementation


{$R *.dfm}

procedure TFrmTasks.cdsViewAfterDelete(DataSet: TDataSet);
begin
  with cdsViewB do
  begin
    First;
    while Not Eof do
    begin
      Delete;
      Next;
    end;
  end;
end;

procedure TFrmTasks.cdsViewAfterScroll(DataSet: TDataSet);
begin
  with cdsViewb do
  begin
    Close;
    CommandText := Format('Select * From TaskB Where PID_=''%s''',
      [cdsView.FieldByName('ID_').AsString]);
    Open;
  end;
end;

procedure TFrmTasks.cdsViewbNewRecord(DataSet: TDataSet);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    DataSet.Cancel;
    Exit;
  end;
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('PID_').AsString := cdsView.FieldByName('ID_').AsString;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmTasks.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('StarDate_').AsDateTime := Now();
    FieldByName('EndDate_').AsDateTime := Now();
    FieldByName('TargetDate_').AsDateTime := Now();
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('Responsible_').AsString := DM.User;
    FieldByName('Status_').AsInteger := 0;
  end;
end;

procedure TFrmTasks.DBGrid1DblClick(Sender: TObject);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    Exit;
  end;
  Self.cdsView.ApplyUpdates(0);
  DM.ZSDSendMsg('FrmTaskB', COST_ZSD_OPENID,
    [Self.cdsView.FieldByName('ID_').AsString]);
end;

procedure TFrmTasks.FormCreate(Sender: TObject);
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
end;

procedure TFrmTasks.ZSDPostMsg(var AMsg: TWmCopyData);
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
            Format('Select * From TaskA Where ID_=''%s''',
            [sPID]);
          Open;
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmTasks);

finalization

UnRegisterClass(TFrmTasks);

end.
