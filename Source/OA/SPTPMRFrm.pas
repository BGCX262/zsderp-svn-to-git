unit SPTPMRFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZSDTool, Datasnap.DBClient,
  ZSDDataSet, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid, Vcl.StdCtrls, uDM;

type
  TFrmSPTPMR = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewDeliveryNo_: TStringField;
    cdsViewDistributer_: TStringField;
    cdsViewPaySituation_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewAppUser_: TStringField;
    cdsViewUpDateUser_: TStringField;
    cdsViewUpDateDate_: TSQLTimeStampField;
    cdsViewDate_: TSQLTimeStampField;
    cdsViewToPayAmount_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure ZSDDBGrid1EditButtonClick(Sender: TObject);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmSPTPMR: TFrmSPTPMR;

implementation



{$R *.dfm}


procedure TFrmSPTPMR.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSPTPMR.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('Date_').AsDateTime := Now();
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSPTPMR.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  OA_SPTPMR';
    Open;
  end;
end;

procedure TFrmSPTPMR.ZSDDBGrid1EditButtonClick(Sender: TObject);
var
  sField: String;
begin
  if not cdsView.CanModify then
    Exit;
  sField := UpperCase(ZSDDBGrid1.Columns[ZSDDBGrid1.SelectedIndex].FieldName);
  if sField = UpperCase('Distributer_') then
  begin
    DM.ZSDSendMsg('FrmPersonnel', COST_ZSD_SELCODE, [Self.Name])
  end;
  if sField = UpperCase('DeliveryNo_') then
  begin
    DM.ZSDSendMsg('FrmExpressInput', COST_ZSD_SELCODE, [Self.Name])
  end
end;

procedure TFrmSPTPMR.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_SAVCODE:
      begin
        if DM.ZSDargs[0] = 'FrmPersonnel' then
        begin
          // if DM.ZSDargs[1] = 'True' then
          cdsView.Edit;
          cdsView.FieldByName('Distributer_').AsString := DM.ZSDargs[2];
        end;
        if DM.ZSDargs[0] = 'FrmExpressInput' then
        begin
          // if DM.ZSDargs[1] = 'True' then
          cdsView.Edit;
          cdsView.FieldByName('DeliveryNo_').AsString := DM.ZSDargs[1];
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmSPTPMR);

finalization

UnRegisterClass(TFrmSPTPMR);

end.
