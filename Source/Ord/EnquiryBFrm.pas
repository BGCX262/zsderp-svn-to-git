unit EnquiryBFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ZSDTool, uDM;

type
  TFrmEnquiryB = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewID_: TStringField;
    cdsViewPID_: TStringField;
    cdsViewPartCode_: TStringField;
    cdsViewUP_: TSingleField;
    cdsViewbrand_: TStringField;
    cdsViewDesc_: TStringField;
    cdsViewSpec_: TStringField;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure cdsViewCalcFields(DataSet: TDataSet);

  const
  private
    { Private declarations }
    sPID: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmEnquiryB: TFrmEnquiryB;

implementation


{$R *.dfm}

procedure TFrmEnquiryB.cdsViewCalcFields(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
begin
  with DataSet do
  begin
    cdsTemp := TZSDDataSet.Create(Self);
    DM.RemoteServer(cdsTemp);
    try
      cdsTemp.Close;
      cdsTemp.CommandText := Format('Select * From Part Where Code_=''%s''',
        [FieldByName('PartCode_').AsString]);
      cdsTemp.Open;
      if not cdsTemp.Eof then
      begin
        FieldByName('Brand').AsString := cdsTemp.FieldByName('Brand_').AsString;
        FieldByName('Desc').AsString := cdsTemp.FieldByName('Desc_').AsString;
        FieldByName('Spec').AsString := cdsTemp.FieldByName('Spec_').AsString;
      end;
    Finally
      DM.FreeRemoteServer(cdsTemp);
    end;
  end;
end;

procedure TFrmEnquiryB.cdsViewNewRecord(DataSet: TDataSet);
begin
  if sPID = '' then
  begin
    DataSet.Cancel;
    Exit;
  end;
  with DataSet do
  begin
    DataSet.FieldByName('ID_').AsString := DM.NewGUID;
    DataSet.FieldByName('PID_').AsString := sPID;
  end;
end;

procedure TFrmEnquiryB.DBGrid1EditButtonClick(Sender: TObject);
var
  sField: String;
begin
  if not cdsView.CanModify then
    Exit;
  sField := UpperCase(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName);
  if sField = UpperCase('PartCode_') then
  begin
    DM.ZSDSendMsg('FrmPart', COST_ZSD_SELCODE, [Self.Name])
  end
end;

procedure TFrmEnquiryB.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 100 * From EnquiryB ';
    Open;
    CommandText := 'Select * From EnquiryB ';
  end;
  
end;

procedure TFrmEnquiryB.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sPID := DM.ZSDargs[0];
        with cdsView do
        begin
          Close;
          CommandText :=
            Format('Select * From EnquiryB Where PID_=''%s''', [sPID]);
          Open;
        end;
      end;
    COST_ZSD_SAVCODE:
      begin
        if DM.ZSDargs[0] = 'FrmPart' then
        begin
          if DM.ZSDargs[1] = 'True' then
          cdsView.Append;
            cdsView.FieldByName('PartCode_').AsString := DM.ZSDargs[2];
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmEnquiryB);

finalization

UnRegisterClass(TFrmEnquiryB);

end.
