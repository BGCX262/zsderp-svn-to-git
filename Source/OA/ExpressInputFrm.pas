unit ExpressInputFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Dialogs, Data.DB, ZSDTool, Datasnap.DBClient,
  ZSDDataSet, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid, Vcl.Controls, uDM;

type
  TFrmExpressInput = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewDeliveryNo_: TStringField;
    cdsViewRemark_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpDateUser_: TStringField;
    cdsViewUpDateDate_: TSQLTimeStampField;
    cdsViewBasicInfo_: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
    procedure ZSDDBGrid1DblClick(Sender: TObject);
  private
    selFrom: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmExpressInput: TFrmExpressInput;

implementation



{$R *.dfm}

procedure TFrmExpressInput.ZSDPostMsg(var AMsg: TWmCopyData);
var
  sPID: String;
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_SELCODE:
      begin
        selFrom := DM.ZSDargs[0];
      end;
  end;
end;

procedure TFrmExpressInput.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmExpressInput.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;

end;

procedure TFrmExpressInput.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    close;
    CommandText := 'Select * From  OA_ExpressInput';
    Open;
  end;
end;

procedure TFrmExpressInput.ZSDDBGrid1DblClick(Sender: TObject);
begin
  if selFrom = '' then
    Exit;
  DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
    [Self.Name, cdsView.FieldByName('DeliveryNo_').AsString]);
  close;
end;


initialization

RegisterClass(TFrmExpressInput);

finalization

UnRegisterClass(TFrmExpressInput);

end.
