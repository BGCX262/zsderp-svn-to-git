unit EnquiryHFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ZSDTool, uDM;

type
  TFrmEnquriyH = class(TZSDForm)
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewUpdateDate_: TSQLTimeStampField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewCusCode_: TStringField;
    cdsViewCusName: TStringField;
    cdsViewSalesName: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewUpdateUser_: TStringField;
    cdsViewID_: TStringField;
    cdsViewSalesCode_: TStringField;
    DBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure cdsViewCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmEnquriyH: TFrmEnquriyH;

implementation


{$R *.dfm}

procedure TFrmEnquriyH.cdsViewCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CusName').AsString :=
      DM.DBRead(Format('Select SName_ From CusSup Where Code_=''%s''',
      [FieldByName('CusCode_').AsString]));
    FieldByName('SalesName').AsString :=
      DM.DBRead(Format('Select Name_ From Account Where User_=''%s''',
      [FieldByName('SalesCode_').AsString]));;
  end;
end;

procedure TFrmEnquriyH.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmEnquriyH.DBGrid1DblClick(Sender: TObject);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    Exit;
  end;
  Self.cdsView.ApplyUpdates(0);
  DM.ZSDSendMsg('FrmEnquiryB', COST_ZSD_OPENID,
    [Self.cdsView.FieldByName('ID_').AsString])
end;

procedure TFrmEnquriyH.DBGrid1EditButtonClick(Sender: TObject);
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
end;

procedure TFrmEnquriyH.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 100 * From EnquiryH';
    Open;
    CommandText := 'Select * From EnquiryH';
  end;
end;

procedure TFrmEnquriyH.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_SAVCODE:
      begin
        cdsView.FieldByName('CusCode_').AsString := DM.ZSDargs[0];
      end;
  end;
end;

initialization

RegisterClass(TFrmEnquriyH);

finalization

UnRegisterClass(TFrmEnquriyH);

end.
