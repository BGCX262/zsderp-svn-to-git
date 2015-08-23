unit PersonnelFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, ZSDFrm, DB, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ExtCtrls, ZSDTool, Datasnap.DBClient, Vcl.Controls,
  Vcl.Grids, Vcl.DBGrids, uDM;

type
  TFrmPersonnel = class(TZSDForm)
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TGuidField;
    cdsViewUserID_: TStringField;
    cdsViewName_: TStringField;
    cdsViewCardID_: TStringField;
    cdsViewSex_: TStringField;
    cdsViewDeptCode_: TStringField;
    cdsViewPost_: TStringField;
    cdsViewPeople_: TStringField;
    cdsViewMarital_: TIntegerField;
    cdsViewIDNumber_: TStringField;
    cdsViewBirthplace_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUpdateDate_: TSQLTimeStampField;
    cdsViewEduCation_: TStringField;
    cdsViewAge_: TIntegerField;
    cdsViewWorkAge_: TIntegerField;
    cdsViewInDate_: TDateField;
    cdsViewOutDate_: TDateField;
    cdsViewBirthday_: TDateField;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ZSDTool1: TZSDTool;
    Panel2: TPanel;
    CheckBox2: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Panel3: TPanel;
    Button2: TButton;
    Button9: TButton;
    Button10: TButton;
    Panel4: TPanel;
    Image1: TImage;
    cdsViewCONTRACTSTART_: TDateField;
    cdsViewCONTRACTEND_: TDateField;
    cdsViewIDEndDate_: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsViewAfterScroll(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure cdsViewCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    selFrom: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmPersonnel: TFrmPersonnel;

implementation

uses  DateUtils;
{$R *.dfm}

procedure TFrmPersonnel.Button10Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmUpdateFile', COST_ZSD_OPENID,
    [cdsView.FieldByName('ID_').AsString, Self.ClassName]);
end;

procedure TFrmPersonnel.Button1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
    CheckBox1.Checked := True;
  with cdsView do
  begin
    First;
    while not Eof do
    begin
      DBGrid1DblClick(Self);
      Next;
    end;
    First;
  end;
end;

procedure TFrmPersonnel.Button2Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmUpdateFile', COST_ZSD_OPENID,
    [cdsView.FieldByName('ID_').AsString, Self.ClassName, '0']);
end;

procedure TFrmPersonnel.Button3Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmHRContact', COST_ZSD_OPENID,
    [Self.Name, cdsView.FieldByName('ID_').AsString])
end;

procedure TFrmPersonnel.Button4Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmHREducation', COST_ZSD_OPENID,
    [cdsView.FieldByName('UserID_').AsString, '0']);
end;

procedure TFrmPersonnel.Button5Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmHREducation', COST_ZSD_OPENID,
    [cdsView.FieldByName('UserID_').AsString, '1']);
end;

procedure TFrmPersonnel.Button6Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmHRRewards', COST_ZSD_OPENID,
    [cdsView.FieldByName('UserID_').AsString]);
end;

procedure TFrmPersonnel.Button7Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmPersonnelChange', COST_ZSD_OPENID,
    [cdsView.FieldByName('UserID_').AsString]);
end;

procedure TFrmPersonnel.Button8Click(Sender: TObject);
begin
  DM.ZSDSendMsg('FrmHREducation', COST_ZSD_OPENID,
    [cdsView.FieldByName('UserID_').AsString, '2']);
end;

procedure LoadImageFromField(APicture: TPicture; AField: TBlobField);
var
  ABitmap: TBitmap;
  AStream: TMemoryStream;
begin
  if AField.IsNull then
    Exit;
  AStream := TMemoryStream.Create;
  try
    AField.SaveToStream(AStream);
    // Skip   OLE   storage   header
    AStream.Seek(78, soFromBeginning);
    ABitmap := TBitmap.Create;
    try
      ABitmap.LoadFromStream(AStream);
      APicture.Graphic := ABitmap;
    finally
      ABitmap.Free;
    end;
  finally
    AStream.Free;
  end;
end;

procedure TFrmPersonnel.cdsViewAfterScroll(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  if not CheckBox2.Checked then
    Exit;
  Self.Image1.Visible := False;
  cdsTemp := TZSDDataSet.Create(Self);
  try
    DM.RemoteServer(cdsTemp);
    with cdsTemp do
    begin
      Close;
      CommandText :=
        Format('Select * From USERUPDATEFILES Where PID_=''%s'' and Type_=''0''',
        [cdsView.FieldByName('ID_').AsString]);
      Open;
      if not Eof then
      begin
        TBlobField(FieldByName('Data_')).SaveToFile(ExtractFilePath(ParamStr(0))
          + '\temp\' + FieldByName('Name_').AsString);
        Self.Image1.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\temp\'
          + FieldByName('Name_').AsString);
        Self.Image1.Visible := True;
        DeleteFile(ExtractFilePath(ParamStr(0)) + '\temp\' +
          FieldByName('Name_').AsString);
      end;
    end;
  finally
    DM.FreeRemoteServer(cdsTemp);
  end;
end;

procedure TFrmPersonnel.cdsViewCalcFields(DataSet: TDataSet);
begin
{  with cdsView do
  begin
    FieldByName('WorkAge_').AsInteger :=
      YearsBetween(Now(), FieldByName('InDate_').AsDateTime);
    FieldByName('Age_').AsInteger :=
      YearsBetween(Now(), FieldByName('Birthday_').AsDateTime);
  end; }
end;

procedure TFrmPersonnel.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmPersonnel.CheckBox2Click(Sender: TObject);
begin
  if Self.CheckBox2.Checked then
  begin
    Self.Panel3.Visible := True;
    cdsViewAfterScroll(cdsView);
  end
  Else
    Self.Panel3.Visible := False;
end;

procedure TFrmPersonnel.DBGrid1DblClick(Sender: TObject);
begin
  if selFrom <> '' then
  begin
    if Self.CheckBox1.Checked then
    begin
      DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
        [Self.Name, Self.CheckBox1.Checked, cdsView.FieldByName('UserID_')
        .AsString, DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName,
        DBGrid1.Columns[DBGrid1.SelectedIndex].Title.Caption,
        DBGrid1.SelectedField.AsString]);
    end
    else
    begin
      DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
        [Self.Name, Self.CheckBox1.Checked, cdsView.FieldByName('UserID_')
        .AsString, DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName,
        DBGrid1.Columns[DBGrid1.SelectedIndex].Title.Caption,
        DBGrid1.SelectedField.AsString]);
      Close;
    end;
  end;
end;

procedure TFrmPersonnel.DBGrid1EditButtonClick(Sender: TObject);
var
  sField: String;
begin
  if not cdsView.CanModify then
    Exit;
  sField := UpperCase(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName);
  if sField = UpperCase('CusCode_') then
  begin
    DM.ZSDSendMsg('FrmCus', COST_ZSD_SELCODE, [Self.Name])
  end
  else if sField = UpperCase('DeptCode_') then
  begin
    DM.ZSDSendMsg('FrmDept', COST_ZSD_SELCODE, [Self.Name])
  end
end;

procedure TFrmPersonnel.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 100 * From Personnel';
    Open;
    CommandText := 'Select * From Personnel';
  end;
  for i := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[i].FieldName = 'Sex_' then
    begin
      with DBGrid1.Columns[i].PickList do
      begin
        Clear;
        Add('ÄÐ');
        Add('Å®');
      end
    end;
end;

procedure TFrmPersonnel.ZSDPostMsg(var AMsg: TWmCopyData);
var
  sPID: String;
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
            Format('Select * From Personnel Where Code_=''%s''', [sPID]);
          Open;
        end;
      end;
    COST_ZSD_SELCODE:
      begin
        selFrom := DM.ZSDargs[0];
        Self.Panel1.Visible := True;
        Self.DBGrid1.ReadOnly := True;
        Self.Panel2.Visible := True;
      end;
    COST_ZSD_SAVCODE:
      begin
        if DM.ZSDargs[0] = 'FrmDept' then
        begin
          cdsView.Edit;
          cdsView.FieldByName('DeptCode_').AsString := DM.ZSDargs[1];
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmPersonnel);

finalization

UnRegisterClass(TFrmPersonnel);

end.
