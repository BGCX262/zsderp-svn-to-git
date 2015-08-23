unit TaskBFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet;

type
  TFrmTaskB = class(TZSDForm)
    DBGrid2: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsViewb: TDataSource;
    cdsViewb: TZSDDataSet;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewbNewRecord(DataSet: TDataSet);

  const
  private
    { Private declarations }
    sPID: String;
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmTaskB: TFrmTaskB;

implementation


{$R *.dfm}

procedure TFrmTaskB.cdsViewbNewRecord(DataSet: TDataSet);
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
    DataSet.FieldByName('AppDate_').AsDateTime := Now();
    DataSet.FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmTaskB.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsViewB do
  begin
    Close;
    CommandText := 'Select first 0 * From TaskB ';
    Open;
  end;
end;

procedure TFrmTaskB.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  inherited;
  case DM.ZSDMsgType of
    COST_ZSD_OPENID:
      begin
        sPID := DM.ZSDargs[0];
        with cdsViewB do
        begin
          Close;
          CommandText :=
            Format('Select * From TaskB Where PID_=''%s''', [sPID]);
          Open;
        end;
      end;
  end;
end;

initialization

RegisterClass(TFrmTaskB);

finalization

UnRegisterClass(TFrmTaskB);

end.
