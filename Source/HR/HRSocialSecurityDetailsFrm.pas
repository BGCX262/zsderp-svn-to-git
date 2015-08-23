unit HRSocialSecurityDetailsFrm;

interface

uses
  Windows, Messages, SysUtils,ZSDFrm, DB,ZSDDataSet, ZSDDBGrid, ZSDTool,
  Vcl.Controls, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, System.Classes, uDM;

type
  TFrmHRSocialSecurityDetails = class(TZSDForm)
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewID_: TStringField;
    cdsViewUser_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    ZSDTool1: TZSDTool;
    DBGrid2: TZSDDBGrid;
    cdsViewTotalAmount_: TSmallintField;
    cdsViewWages_: TSmallintField;
    cdsViewOldPPay_: TSmallintField;
    cdsViewOldUPay_: TSmallintField;
    cdsViewInjuryPPay_: TSmallintField;
    cdsViewInjuryUPay_: TSmallintField;
    cdsViewMaternityPPay_: TSmallintField;
    cdsViewMaternityUPay_: TSmallintField;
    cdsViewMedicalPPay_: TSmallintField;
    cdsViewMedicalUPay_: TSmallintField;
    cdsViewUnemploymentPPay_: TSmallintField;
    cdsViewUnemploymentUPay_: TSmallintField;
    cdsViewPCNO_: TStringField;
    cdsViewuName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
    procedure cdsViewCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmHRSocialSecurityDetails: TFrmHRSocialSecurityDetails;

implementation


{$R *.dfm}

procedure TFrmHRSocialSecurityDetails.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHRSocialSecurityDetails.cdsViewCalcFields(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    cdsTemp := TZSDDataSet.Create(Self);
    DM.RemoteServer(cdsTemp);
    try
      cdsTemp.Close;
      cdsTemp.CommandText := Format('Select Name_ From Personnel Where UserID_=''%s''',
        [FieldByName('UserCode_').AsString]);
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

procedure TFrmHRSocialSecurityDetails.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    // add by rasou
  end;
end;

procedure TFrmHRSocialSecurityDetails.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  HR_SOCIALSECURITYDETAILS';
    Open;
  end;
end;

procedure TFrmHRSocialSecurityDetails.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmHRSocialSecurityDetails);

finalization

UnRegisterClass(TFrmHRSocialSecurityDetails);

end.
