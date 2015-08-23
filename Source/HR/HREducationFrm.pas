unit HREducationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ExtCtrls, DBCtrls, ZSDTool, uDM;

type
  TFrmHREducation = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    cdsViewPID_: TStringField;
    cdsViewCODE_: TStringField;
    cdsViewDATESTART_: TDateField;
    cdsViewDATEEND_: TDateField;
    cdsViewNAME_: TStringField;
    cdsViewADDRESS_: TStringField;
    cdsViewAMOUNT_: TSingleField;
    cdsViewREMARK_: TStringField;
    cdsViewCERTIFICATE_: TStringField;
    cdsViewAPPUSER_: TStringField;
    cdsViewAPPDATE_: TSQLTimeStampField;
    cdsViewUPDATEUSER_: TStringField;
    cdsViewUPDATEDATE_: TSQLTimeStampField;
    cdsViewType_: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    sPID: String;
    sCode: String;
    sType: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmHREducation: TFrmHREducation;

implementation


{$R *.dfm}

procedure TFrmHREducation.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmHREducation.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('PID_').AsString := sPID;
    FieldByName('Code_').AsString := sCode;
    FieldByName('Type_').AsString := sType;
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
  end;
end;

procedure TFrmHREducation.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 100 * From HR_EDUCATION ';
    Open;
    CommandText := 'Select * From HR_EDUCATION ';
  end;
end;

procedure TFrmHREducation.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sCode := DM.ZSDargs[0];
        sType := DM.ZSDargs[1];
        with Self.cdsView do
        begin
          Close;
          CommandText :=
            Format('Select * From HR_EDUCATION Where Code_=''%s'' and Type_=''%s''',
            [sCode, sType]);
          Open;
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmHREducation);

finalization

UnRegisterClass(TFrmHREducation);

end.
