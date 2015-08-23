unit HRContactFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ExtCtrls, DBCtrls, ZSDTool, uDM;

type
  TFrmHRContact = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    cdsViewPID_: TStringField;
    cdsViewFORID_: TStringField;
    cdsViewTYPE_: TStringField;
    cdsViewPHONE_: TStringField;
    cdsViewTEL_: TStringField;
    cdsViewFAX_: TStringField;
    cdsViewRELATIONSHIP_: TStringField;
    cdsViewPROFESSION_: TStringField;
    cdsViewADDRESS_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    sPID: String;
    sFormID: String;
    sType: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmHRContact: TFrmHRContact;

implementation


{$R *.dfm}

procedure TFrmHRContact.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHRContact.cdsViewNewRecord(DataSet: TDataSet);
begin
  if sPID = '' then
  begin
    DataSet.Cancel;
    Exit;
  end;
  with DataSet do
  begin
    FieldByName('PID_').AsString := sPID;
    FieldByName('FormID_').AsString := sFormID;
    FieldByName('Type_').AsString := sType;
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
  end;
end;

procedure TFrmHRContact.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 0 * From HR_Contact ';
    Open;
    CommandText := 'Select * From HR_Contact ';
  end;
end;

procedure TFrmHRContact.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sFormID := DM.ZSDargs[0];
        sPID := DM.ZSDargs[1];
        with Self.cdsView do
        begin
          Close;
          CommandText :=
            Format('Select * From HR_Contact Where PID_=''%s'' and FormID_=''%s''',
            [sPID, sFormID]);
          Open;
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmHRContact);

finalization

UnRegisterClass(TFrmHRContact);

end.
