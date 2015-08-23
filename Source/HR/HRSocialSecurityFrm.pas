unit HRSocialSecurityFrm;

interface

uses
  Windows, Messages, SysUtils, ZSDFrm, DB, ZSDDataSet, ZSDDBGrid, ZSDTool,
  Datasnap.DBClient, System.Classes, Vcl.Controls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Dialogs, Data.DBXFirebird, Data.FMTBcd,
  Data.SqlExpr, uDM;

type
  TFrmHRSocialSecurity = class(TZSDForm)
    dsViewA: TDataSource;
    ZSDTool1: TZSDTool;
    DBGrid1: TZSDDBGrid;
    Panel1: TPanel;
    dsViewB: TDataSource;
    cdsViewB: TZSDDataSet;
    DBGrid2: TZSDDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Splitter1: TSplitter;
    cdsViewA: TZSDDataSet;
    cdsViewAID_: TStringField;
    cdsViewAUserCode_: TStringField;
    cdsViewAPaymentStatus_: TSmallintField;
    cdsViewAPCNO_: TStringField;
    cdsViewAInjuryInsurance_: TSmallintField;
    cdsViewAMaternityInsurance_: TSmallintField;
    cdsViewAMedicalInsurance_: TSmallintField;
    cdsViewAUneInsurance_: TSmallintField;
    cdsViewAAppUser_: TStringField;
    cdsViewAAppDate_: TSQLTimeStampField;
    cdsViewAUpdateUser_: TStringField;
    cdsViewAUpdateDate_: TSQLTimeStampField;
    cdsViewAOldageInsurance_: TSmallintField;
    cdsViewAuName: TStringField;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1ID_: TStringField;
    SQLDataSet1USERCODE_: TStringField;
    SQLDataSet1PCNO_: TStringField;
    SQLDataSet1NAME_: TStringField;
    SQLDataSet1TOTALAMOUNT_: TSingleField;
    SQLDataSet1WAGES_: TSingleField;
    SQLDataSet1OLDPPAY_: TSingleField;
    SQLDataSet1OLDUPAY_: TSingleField;
    SQLDataSet1INJURYPPAY_: TSingleField;
    SQLDataSet1INJURYUPAY_: TSingleField;
    SQLDataSet1MATERNITYPPAY_: TSingleField;
    SQLDataSet1MATERNITYUPAY_: TSingleField;
    SQLDataSet1MEDICALPPAY_: TSingleField;
    SQLDataSet1MEDICALUPAY_: TSingleField;
    SQLDataSet1UNEMPLOYMENTPPAY_: TSingleField;
    SQLDataSet1UNEMPLOYMENTUPAY_: TSingleField;
    SQLDataSet1APPUSER_: TStringField;
    SQLDataSet1APPDATE_: TSQLTimeStampField;
    SQLDataSet1UPDATEUSER_: TStringField;
    SQLDataSet1UPDATEDATE_: TSQLTimeStampField;
    SQLDataSet1UTOTALAMOUNT_: TSingleField;
    SQLDataSet1PTOTALAMOUNT_: TSingleField;
    cdsViewBID_: TStringField;
    cdsViewBUSERCODE_: TStringField;
    cdsViewBPCNO_: TStringField;
    cdsViewBNAME_: TStringField;
    cdsViewBTOTALAMOUNT_: TSingleField;
    cdsViewBWAGES_: TSingleField;
    cdsViewBOLDPPAY_: TSingleField;
    cdsViewBOLDUPAY_: TSingleField;
    cdsViewBINJURYPPAY_: TSingleField;
    cdsViewBINJURYUPAY_: TSingleField;
    cdsViewBMATERNITYPPAY_: TSingleField;
    cdsViewBMATERNITYUPAY_: TSingleField;
    cdsViewBMEDICALPPAY_: TSingleField;
    cdsViewBMEDICALUPAY_: TSingleField;
    cdsViewBUNEMPLOYMENTPPAY_: TSingleField;
    cdsViewBUNEMPLOYMENTUPAY_: TSingleField;
    cdsViewBAPPUSER_: TStringField;
    cdsViewBAPPDATE_: TSQLTimeStampField;
    cdsViewBUPDATEUSER_: TStringField;
    cdsViewBUPDATEDATE_: TSQLTimeStampField;
    cdsViewBUTOTALAMOUNT_: TSingleField;
    cdsViewBPTOTALAMOUNT_: TSingleField;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewANewRecord(DataSet: TDataSet);
    procedure cdsViewAAfterEdit(DataSet: TDataSet);
    procedure cdsViewACalcFields(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure cdsViewAAfterScroll(DataSet: TDataSet);
    procedure ZSDTool1Save(Sender: TObject);
    procedure cdsViewBAfterEdit(DataSet: TDataSet);
    procedure cdsViewBNewRecord(DataSet: TDataSet);
    procedure cdsViewBCalcFields(DataSet: TDataSet);
    procedure cdsViewAUserCode_Change(Sender: TField);
    procedure ComboBox1Change(Sender: TObject);
    procedure cdsViewABeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmHRSocialSecurity: TFrmHRSocialSecurity;

implementation


{$R *.dfm}

procedure TFrmHRSocialSecurity.Button1Click(Sender: TObject);
var
  cdsTemp: TZSDDataSet; // 定义数据集
begin
  cdsTemp := TZSDDataSet.Create(self); // 创建Dataset
  DM.RemoteServer(cdsTemp); // 让 DataSet 获取链接
  try
    with cdsTemp do
    begin
      Close; // 先关闭Dataset（cdsTemp）
      CommandText := 'Select UserID_ From PERSONNEL  Where  UserID_ not in' +
        ' (Select UserCode_ From HR_SOCIALSECURITY)';
      Open;
      cdsViewA.DisableControls;
      while not Eof do // 循环直到数据结尾（Eof：结尾）
      begin
        // 要处理的事情
        cdsViewA.Append; // 向cdsView附加数据
        cdsViewA.FieldByName('UserCode_').AsString :=
          FieldByName('UserID_').AsString;
        // 将已找到数据赋值给UserCode_
        Next;
      end;
      Close; // 先关闭Dataset（cdsTemp）
      CommandText := 'Select UserCode_ From HR_SOCIALSECURITY Where' +
        ' USERCODE_ not in (Select UserID_ From PERSONNEL)';
      Open;
      while not Eof do // 循环直到数据结尾（Eof：结尾）
      begin
        // 要处理的事情
        DM.DBExSql
          (Format('Delete From HR_SOCIALSECURITY Where UserCode_=''%s''',
          [FieldByName('UserCode_').AsString]));
        // 将已找到数据赋值给UserCode_
        Next;
      end;

    end;

  finally
    DM.FreeRemoteServer(cdsTemp); // 释放“DataSet”
    cdsViewA.EnableControls;
  end;

end;

procedure TFrmHRSocialSecurity.cdsViewAAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHRSocialSecurity.cdsViewAAfterScroll(DataSet: TDataSet);
begin
  with cdsViewB do
  begin
    Close;
    CommandText :=
      Format('Select * From HR_SOCIALSECURITYDETAILS Where UserCode_=''%s''',
      [cdsViewA.FieldByName('UserCode_').AsString]);
    Open;
  end;
end;

procedure TFrmHRSocialSecurity.cdsViewABeforeDelete(DataSet: TDataSet);
begin
  cdsViewB.Delete;
  cdsViewB.ApplyUpdates(0)
end;

procedure TFrmHRSocialSecurity.cdsViewACalcFields(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    cdsTemp := TZSDDataSet.Create(self);
    DM.RemoteServer(cdsTemp);
    try
      cdsTemp.Close;
      cdsTemp.CommandText :=
        Format('Select Name_ From Personnel Where UserID_=''%s''',
        [FieldByName('UserCode_').AsString]); // Format指 带参数 格式
      // ｛【[FieldByName('UserCode_').AsString]为参数】｝
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

procedure TFrmHRSocialSecurity.cdsViewANewRecord(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    // FieldByName('User_').AsString := DM.User;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    FieldByName('PaymentStatus_').AsInteger := 0;
    FieldByName('OldageInsurance_').AsInteger := 0;
    FieldByName('InjuryInsurance_').AsInteger := 0;
    FieldByName('MaternityInsurance_').AsInteger := 0;
    FieldByName('MedicalInsurance_').AsInteger := 0;
    FieldByName('UneInsurance_').AsInteger := 0;
  end;

  cdsViewB.Append;
end;

procedure TFrmHRSocialSecurity.cdsViewAUserCode_Change(Sender: TField);
begin
  cdsViewB.Edit;
  cdsViewB.FieldByName('UserCode_').AsString :=
    cdsViewA.FieldByName('UserCode_').AsString;
end;

procedure TFrmHRSocialSecurity.cdsViewBAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHRSocialSecurity.cdsViewBCalcFields(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    cdsTemp := TZSDDataSet.Create(self);
    DM.RemoteServer(cdsTemp);
    try
      cdsTemp.Close;
      cdsTemp.CommandText :=
        Format('Select UserCode_ From HR_SOCIALSECURITY Where UserCode_=''%s''',
        [FieldByName('UserCode_').AsString]);
      cdsTemp.Open;
      if not cdsTemp.Eof then
      begin
        FieldByName('ID_').AsString := cdsTemp.FieldByName('ID_').AsString;
      end;
    Finally
      DM.FreeRemoteServer(cdsTemp);
    end;
  end;
end;

procedure TFrmHRSocialSecurity.cdsViewBNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHRSocialSecurity.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        DBGrid2.Columns.Items[3].Visible := True;
        DBGrid2.Columns.Items[5].Visible := True;
        DBGrid2.Columns.Items[7].Visible := True;
        DBGrid2.Columns.Items[9].Visible := True;
        DBGrid2.Columns.Items[11].Visible := True;
        DBGrid2.Columns.Items[13].Visible := True;

        DBGrid2.Columns.Items[4].Visible := False;
        DBGrid2.Columns.Items[6].Visible := False;
        DBGrid2.Columns.Items[8].Visible := False;
        DBGrid2.Columns.Items[10].Visible := False;
        DBGrid2.Columns.Items[12].Visible := False;
        DBGrid2.Columns.Items[14].Visible := False;
      end;
    1:
      begin
        DBGrid2.Columns.Items[4].Visible := True;
        DBGrid2.Columns.Items[6].Visible := True;
        DBGrid2.Columns.Items[8].Visible := True;
        DBGrid2.Columns.Items[10].Visible := True;
        DBGrid2.Columns.Items[12].Visible := True;
        DBGrid2.Columns.Items[14].Visible := True;

        DBGrid2.Columns.Items[3].Visible := False;
        DBGrid2.Columns.Items[5].Visible := False;
        DBGrid2.Columns.Items[7].Visible := False;
        DBGrid2.Columns.Items[9].Visible := False;
        DBGrid2.Columns.Items[11].Visible := False;
        DBGrid2.Columns.Items[13].Visible := False;
      end;
    2:
      begin
        DBGrid2.Columns.Items[4].Visible := True;
        DBGrid2.Columns.Items[6].Visible := True;
        DBGrid2.Columns.Items[8].Visible := True;
        DBGrid2.Columns.Items[10].Visible := True;
        DBGrid2.Columns.Items[12].Visible := True;
        DBGrid2.Columns.Items[14].Visible := True;
        DBGrid2.Columns.Items[3].Visible := True;
        DBGrid2.Columns.Items[5].Visible := True;
        DBGrid2.Columns.Items[7].Visible := True;
        DBGrid2.Columns.Items[9].Visible := True;
        DBGrid2.Columns.Items[11].Visible := True;
        DBGrid2.Columns.Items[13].Visible := True;
      end;

  end;

end;

procedure TFrmHRSocialSecurity.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsViewA do
  begin
    Close;
    CommandText := 'Select * From  HR_SocialSecurity';
    Open;
  end;
  with cdsViewB do
  begin
    Close;
    CommandText := 'Select First 0 * From HR_SOCIALSECURITYDETAILS';
    Open;
  end;
end;

procedure TFrmHRSocialSecurity.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

procedure TFrmHRSocialSecurity.ZSDTool1Save(Sender: TObject);
begin
  cdsViewB.ApplyUpdates(0);
end;

initialization

RegisterClass(TFrmHRSocialSecurity);

finalization

UnRegisterClass(TFrmHRSocialSecurity);

end.
