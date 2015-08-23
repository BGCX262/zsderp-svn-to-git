unit freetestFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ExtCtrls, ComObj;

type
  TFrmFreetest = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    Button1: TButton;
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
  FrmFreetest: TFrmFreetest;

implementation


{$R *.dfm}

procedure TFrmFreetest.Button1Click(Sender: TObject);
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

procedure TFrmFreetest.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    DataSet.FieldByName('UpdateDate_').AsDateTime := Now();
    DataSet.FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmFreetest.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    DataSet.FieldByName('AppDate_').AsDateTime := Now();
    DataSet.FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmFreetest.DBGrid1DblClick(Sender: TObject);
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

procedure TFrmFreetest.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'select * from MYBOOK';
    Open;
  end;
  
end;

procedure TFrmFreetest.ZSDPostMsg(var AMsg: TWmCopyData);
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
            Format('Select * From CusSup Where PID_=''%s''', [sPID]);
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

RegisterClass(TFrmFreetest);

finalization

UnRegisterClass(TFrmFreetest);

end.
