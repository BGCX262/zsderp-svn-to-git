unit QuoteHFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ZSDTool, uDM;

type
  TFrmQuoteH = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
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
  FrmQuoteH: TFrmQuoteH;

implementation


{$R *.dfm}

procedure TFrmQuoteH.cdsViewCalcFields(DataSet: TDataSet);
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

procedure TFrmQuoteH.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmQuoteH.DBGrid1DblClick(Sender: TObject);
begin
  if cdsView.FieldByName('ID_').AsString = '' then
  begin
    Exit;
  end;
  Self.cdsView.ApplyUpdates(0);
  DM.ZSDSendMsg('FrmQuoteB', COST_ZSD_OPENID,
    [Self.cdsView.FieldByName('ID_').AsString])
end;

procedure TFrmQuoteH.DBGrid1EditButtonClick(Sender: TObject);
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

procedure TFrmQuoteH.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 50 * From QuoteH';
    Open;
    CommandText := 'Select * From QuoteH';
  end;
end;

procedure TFrmQuoteH.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_SAVCODE:
      begin
        cdsView.FieldByName('CusCode_').AsString := DM.ZSDargs[0];
      end;
  end;
end;

initialization

RegisterClass(TFrmQuoteH);

finalization

UnRegisterClass(TFrmQuoteH);

end.
