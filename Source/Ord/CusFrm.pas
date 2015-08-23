unit CusFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, ZSDDBGrid, DB, Buttons, DBClient, StdCtrls, DBGrids,
  ZSDDataSet, ZSDTool, uDM;

type
  TFrmCus = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewID_: TGuidField;
    cdsViewCode_: TStringField;
    cdsViewSName_: TStringField;
    cdsViewName_: TStringField;
    cdsViewIsCus_: TSmallintField;
    cdsViewIsSup_: TSmallintField;
    cdsViewIsOur_: TSmallintField;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    selFrom: String;
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

implementation


{$R *.dfm}

procedure TFrmCus.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID();
    FieldByName('isCus_').AsBoolean := True;
  end;
end;

procedure TFrmCus.DBGrid1DblClick(Sender: TObject);
begin
  if selFrom <> '' then
  begin
    DM.ZSDSendMsg(selFrom, COST_ZSD_SAVCODE,[cdsView.FieldByName('Code_').AsString]);
    Close;
  end;
end;

procedure TFrmCus.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Active := False;
    CommandText := 'Select * From CusSup Where isCus_ =1';
    // Open;
  end;
  
end;

procedure TFrmCus.ZSDPostMsg(var AMsg: TWmCopyData);
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
          if sPID = '' then
            CommandText := 'Select first 0 * From CusSup'
          else
            CommandText :=
              Format('Select * From CusSup Where PID_=''%s''', [sPID]);
          Open;
        end;
      end;
    COST_ZSD_SELCODE:
      begin
        selFrom := DM.ZSDargs[0];
      end;
  end;
end;

initialization

RegisterClass(TFrmCus);

finalization

UnRegisterClass(TFrmCus);

end.
