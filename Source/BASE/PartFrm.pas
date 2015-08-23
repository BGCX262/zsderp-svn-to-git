unit PartFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ExtCtrls, ComObj, ZSDTool, uDM;

type
  TFrmPart = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    selFrom: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmPart: TFrmPart;

implementation


{$R *.dfm}

procedure TFrmPart.Button1Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
    CheckBox1.Checked := True;
  with cdsView do
  begin
    First;
    while not Eof do
    begin
      DBGrid1DblClick(Self);
      Next;
    end;
    First;
  end;
end;

procedure TFrmPart.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    DataSet.FieldByName('UpdateDate_').AsDateTime := Now();
    DataSet.FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmPart.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    DataSet.FieldByName('AppDate_').AsDateTime := Now();
    DataSet.FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmPart.DBGrid1DblClick(Sender: TObject);
begin
  if selFrom <> '' then
  begin
    if Self.CheckBox1.Checked then
    begin
      DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
        [Self.Name, Self.CheckBox1.Checked, cdsView.FieldByName('Code_')
        .AsString]);
    end
    else
    begin
      DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,
        [Self.Name, Self.CheckBox1.Checked, cdsView.FieldByName('Code_')
        .AsString]);
      Close;
    end;
  end;
end;

procedure TFrmPart.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From Part';
    Open;
  end;
  
end;

procedure TFrmPart.ZSDPostMsg(var AMsg: TWmCopyData);
var
  sPID: String;
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sPID := DM.ZSDargs[0];
        with cdsView do
        begin
          Close;
          CommandText :=
            Format('Select * From Part Where Code_=''%s''', [sPID]);
          Open;
        end;
      end;
    COST_ZSD_SELCODE:
      begin
        selFrom := DM.ZSDargs[0];
        Self.Panel1.Visible := True;
      end;
  end;
end;

initialization

RegisterClass(TFrmPart);

finalization

UnRegisterClass(TFrmPart);

end.
