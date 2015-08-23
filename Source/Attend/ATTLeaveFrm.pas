unit ATTLeaveFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ExtCtrls, ZSDTool, uDM;

type
  TFrmATTLeave = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    Splitter1: TSplitter;
    DBGrid2: TZSDDBGrid;
    dsViewb: TDataSource;
    cdsViewb: TZSDDataSet;
    cdsViewID_: TStringField;
    cdsViewDMNO_: TStringField;
    cdsViewSTATUS_: TSmallintField;
    cdsViewTYPE_: TStringField;
    cdsViewREMARK_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewUPDDATEUSE_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    cdsViewDMDate_: TDateField;
    ZSDTool1: TZSDTool;
    cdsViewbPID_: TStringField;
    cdsViewbCODE_: TStringField;
    cdsViewbSUBJECT_: TStringField;
    cdsViewbREMARK_: TStringField;
    cdsViewbStartDate_: TSQLTimeStampField;
    cdsViewbEndDate_: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewbNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterScroll(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
    procedure ZSDTool1Confirm(Sender: TObject);
    procedure ZSDTool1Revocation(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure cdsViewbCalcFields(DataSet: TDataSet);
    procedure ZSDTool1Save(Sender: TObject);
    procedure cdsViewBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmATTLeave: TFrmATTLeave;

implementation


{$R *.dfm}

procedure TFrmATTLeave.cdsViewAfterEdit(DataSet: TDataSet);
begin
  inherited;
  with cdsView do
  begin
    Edit;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTLeave.cdsViewAfterScroll(DataSet: TDataSet);
begin
  with cdsViewb do
  begin
    Close;
    CommandText := Format('Select * From ATT_LEAVEB Where PID_=''%s''',
      [cdsView.FieldByName('ID_').AsString]);
    Open;
  end;
end;

procedure TFrmATTLeave.cdsViewbCalcFields(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    cdsTemp := TZSDDataSet.Create(Self);
    DM.RemoteServer(cdsTemp);
    try
      cdsTemp.Close;
      cdsTemp.CommandText := Format('Select * From Personnel Where UserID_=''%s''',
        [FieldByName('Code_').AsString]);
      cdsTemp.Open;
      if not cdsTemp.Eof then
      begin
        FieldByName('uName').AsString := cdsTemp.FieldByName('Name_').AsString;
      end;
    Finally
      DM.FreeRemoteServer(cdsTemp);
    end;
  end;
end;

procedure TFrmATTLeave.cdsViewBeforeDelete(DataSet: TDataSet);
begin
  with cdsViewb do
  begin
    First;
    while Not Eof do
    begin
      Delete;
      Next;
    end;
    ApplyUpdates(0)
  end;
end;

procedure TFrmATTLeave.cdsViewbNewRecord(DataSet: TDataSet);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    DataSet.Cancel;
    Exit;
  end;
  with DataSet do
  begin
    FieldByName('PID_').AsString := cdsView.FieldByName('ID_').AsString;
  end;
end;

procedure TFrmATTLeave.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('DMDate_').AsDateTime := Now();
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    FieldByName('Status_').AsInteger := 0;
  end;
end;

procedure TFrmATTLeave.DBGrid2EditButtonClick(Sender: TObject);
var
  sField: String;
begin
  if not cdsView.CanModify then
    Exit;
  sField := UpperCase(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName);
  if sField = UpperCase('Code_') then
  begin
    DM.ZSDSendMsg('FrmPersonnel', COST_ZSD_SELCODE, [Self.Name])
  end
end;

procedure TFrmATTLeave.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select First 10 * From ATT_LEAVEA ';
    Open;
  end;
end;


procedure TFrmATTLeave.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        Self.DBGrid1.Visible := False;
        Self.DBGrid2.ReadOnly := True;
        with cdsViewB do
        begin
          Close;
          CommandText := Format('Select * From ATT_LEAVEB Where Code_=''%s'' ',
            [DM.ZSDargs[0]]);
          Open;
        end;
      end;
    COST_ZSD_SAVCODE:
      begin
        if DM.ZSDargs[0] = 'FrmPersonnel' then
        begin
          //if DM.ZSDargs[1] = 'True' then
            cdsViewb.Append;
          cdsViewb.FieldByName('Code_').AsString := DM.ZSDargs[2];
        end;
      end;
  end;
end;

procedure TFrmATTLeave.ZSDTool1Confirm(Sender: TObject);
begin
  with cdsView do
  begin
    Edit;
    FieldByName('Status_').AsInteger := 1;
    ApplyUpdates(0)
  end;
end;

procedure TFrmATTLeave.ZSDTool1Revocation(Sender: TObject);
begin
  with cdsView do
  begin
    Edit;
    FieldByName('Status_').AsInteger := 0;
    ApplyUpdates(0)
  end;
end;

procedure TFrmATTLeave.ZSDTool1Save(Sender: TObject);
begin
  cdsViewB.ApplyUpdates(0);
end;

initialization

RegisterClass(TFrmATTLeave);

finalization

UnRegisterClass(TFrmATTLeave);

end.
