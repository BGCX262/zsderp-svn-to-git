unit SSfinancialFrm;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, LTLFrm,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ExtCtrls, ZSDTool, uDM;

type
  TFrmSSfinancial = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    cdsView: TZSDDataSet;
    dsView: TDataSource;
    cdsViewShiftSingleDate_: TSQLTimeStampField;
    cdsViewDeliveryNo_: TStringField;
    cdsViewSourceIncome_: TStringField;
    cdsViewCounterparts_: TStringField;
    cdsViewShiftSingleNo_: TStringField;
    cdsViewRemark_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpDateUser_: TStringField;
    cdsViewUpDateDate_: TSQLTimeStampField;
    cdsViewShiftSingleCost_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
    selFrom: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmSSfinancial: TFrmSSfinancial;

implementation



{$R *.dfm}

procedure TFrmSSfinancial.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSSfinancial.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ShiftSingleDate_').AsDateTime := Now();
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSSfinancial.DBGrid1DblClick(Sender: TObject);
begin
  if DBGrid1.SelectedIndex = 1 then
    DM.ZSDSendMsg('FrmLTL', COST_ZSD_SAVCODE,
      [Self.Name, cdsView.FieldByName('DeliveryNo_').AsString]);

  { // if DBGrid1.SelectedIndex = 1 then
    if cdsView.FieldByName('DeliveryNo_').AsString = '' then
    begin
    Exit;
    end;
    Self.cdsView.ApplyUpdates(0);
    DM.ZSDSendMsg('FrmLTL', COST_ZSD_OPENID,
    [Self.cdsView.FieldByName('DeliveryNo_').AsString]); }

end;

procedure TFrmSSfinancial.DBGrid1EditButtonClick(Sender: TObject);
var
  sField: String;
begin
  if not cdsView.CanModify then
    Exit;
  sField := UpperCase(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName);
  if sField = UpperCase('DeliveryNo_') then
  begin
    DM.ZSDSendMsg('FrmExpressInput', COST_ZSD_SELCODE, [Self.Name])
  end
end;

procedure TFrmSSfinancial.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    close;
    CommandText := 'Select * From  OA_SSfinancial';
    Open;
  end;
end;

procedure TFrmSSfinancial.ZSDPostMsg(var AMsg: TWmCopyData);
begin

  begin
    inherited;
    case DM.ZSDMsgType of
      COST_ZSD_SELCODE:
        begin
          selFrom := DM.ZSDargs[0];
          Self.DBGrid1.ReadOnly := True;
        end;
      COST_ZSD_SAVCODE:
        begin
          cdsView.Edit;
          cdsView.Append;
          cdsView.FieldByName('DeliveryNo_').AsString := DM.ZSDargs[1];
        end;
    end;
  end;

end;

initialization

RegisterClass(TFrmSSfinancial);

finalization

UnRegisterClass(TFrmSSfinancial);

end.
