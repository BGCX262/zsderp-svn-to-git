unit LTLFrm;

interface

uses
  ZSDFrm, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, ZSDDataSet,
  ZSDTool, Vcl.Grids, Vcl.DBGrids, ZSDDBGrid, Vcl.StdCtrls, Vcl.ComCtrls, uDM;

type
  TFrmLTL = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    ZSDTool1: TZSDTool;
    cdsViewB: TZSDDataSet;
    dsViewB: TDataSource;
    cdsViewBArrivalTime_: TSQLTimeStampField;
    cdsViewBAppUser_: TStringField;
    cdsViewBDeliveryStatus_: TStringField;
    cdsViewBDeliveryNo_: TStringField;
    cdsViewA: TZSDDataSet;
    dsViewA: TDataSource;
    cdsViewADeliveryNo_: TStringField;
    ZSDDBGrid2: TZSDDBGrid;
    cdsViewBPID_: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewBNewRecord(DataSet: TDataSet);
    procedure cdsViewAAfterScroll(DataSet: TDataSet);
    procedure ZSDTool1Save(Sender: TObject);
    procedure cdsViewADeliveryNo_Change(Sender: TField);
    procedure cdsViewABeforeDelete(DataSet: TDataSet);
    procedure cdsViewAAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
   // procedure WMCOPYDATA(var AMsg: TWmCopyData); message WM_COPYDATA;
  end;

var
  FrmLTL: TFrmLTL;

implementation

{$R *.dfm}

procedure TFrmLTL.cdsViewAAfterDelete(DataSet: TDataSet);
begin
  with cdsViewB do
  begin
    First;
    while Not Eof do
    begin
      Delete;
      Next;
    end;
  end;
end;

procedure TFrmLTL.cdsViewAAfterScroll(DataSet: TDataSet);
begin
  with cdsViewB do
  begin
    Close;
    CommandText := Format('Select * From OA_LTLB Where DeliveryNo_=''%s''',
      [cdsViewA.FieldByName('DeliveryNo_').AsString]);
    Open;
  end;
end;

procedure TFrmLTL.cdsViewABeforeDelete(DataSet: TDataSet);
begin
  cdsViewB.Delete;
  cdsViewB.ApplyUpdates(0)
end;

procedure TFrmLTL.cdsViewADeliveryNo_Change(Sender: TField);
begin
  cdsViewA.Edit;
  cdsViewB.Edit;
  cdsViewB.FieldByName('DeliveryNo_').AsString :=
    cdsViewA.FieldByName('DeliveryNo_').AsString;

  // showmessage('why') ;
  with cdsViewA do
  begin
    ApplyUpdates(0);
    // cdsViewB.ApplyUpdates(0);
    Close;
    CommandText := 'SELECT DISTINCT DeliveryNo_ FROM OA_LTLA';
    Open;
  end; // 防止重复输入数据（只针对，datas只有一个字段时）

end;

procedure TFrmLTL.cdsViewBNewRecord(DataSet: TDataSet);
begin

  (* ***********  --- *)
  if cdsViewA.FieldByName('DeliveryNo_').AsString = '' then
  begin
    DataSet.Cancel;
    Exit;
  end;
  (* --- *********** *)

  with DataSet do
  begin

    (* *********** --- *)
    FieldByName('DeliveryNo_').AsString :=
      cdsViewA.FieldByName('DeliveryNo_').AsString;
    FieldByName('PID_').AsString := cdsViewA.FieldByName('DeliveryNo_')
      .AsString;
    (* --- *********** *)

    FieldByName('ArrivalTime_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
  end;
end;

procedure TFrmLTL.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsViewB do
  begin
    Close;
    CommandText := 'Select First 0 * From  OA_LTLB';
    Open;
  end;
  with cdsViewA do
  begin
    Close;
    CommandText := 'Select * From  OA_LTLA';
    Open;
  end;
  // showmessage(IntToStr(ZSDDBGrid2.DataSource.DataSet.RecNo));
end;

procedure TFrmLTL.ZSDPostMsg(var AMsg: TWmCopyData);
begin
  case DM.ZSDMsgType of
    COST_ZSD_SAVCODE:
      begin
        // Showmessage(DM.ZSDargs[1]);

        cdsViewA.Edit;
        cdsViewA.Append;
        cdsViewA.FieldByName('DeliveryNo_').AsString := DM.ZSDargs[1];
        { DM.ZSDargs[1] 对应  FrmSSfinancial 中 DM.ZSDSendMsg('FrmLTL', COST_ZSD_SAVCODE,
          [Self.Name, cdsView.FieldbyName('DeliveryNo_').Asstring])中的cdsView.FieldbyName('DeliveryNo_').Asstring }
      end;
  end;
end;

procedure TFrmLTL.ZSDTool1Save(Sender: TObject);
begin

  cdsViewB.ApplyUpdates(0);

end;

initialization

RegisterClass(TFrmLTL);

finalization

UnRegisterClass(TFrmLTL);

end.
