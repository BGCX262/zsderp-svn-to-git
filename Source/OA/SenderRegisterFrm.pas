unit SenderRegisterFrm;

interface

uses
  ZsdFrm, Data.DB, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics, ZSDDBGrid, ZSDDataSet, ZSDTool,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, uDM;

type
  TFrmSenderRegister = class(TZSDForm)
    ZSDDBGrid1: TZSDDBGrid;
    cdsView: TZSDDataSet;
    ZSDTool1: TZSDTool;
    dsView: TDataSource;
    cdsViewDate_: TSQLTimeStampField;
    cdsViewDeliveryNo_: TStringField;
    cdsViewDestination_: TStringField;
    cdsViewPaymentPeople_: TStringField;
    cdsViewPaymentStatus_: TStringField;
    cdsViewUpDateDate_: TSQLTimeStampField;
    cdsViewUpDateUser_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewdffk_: TSingleField;
    cdsViewWeight_: TSingleField;
    cdsViewPayAmount_: TSingleField;
    cdsViewDestinaPrice_: TSingleField;
    cdsViewToPayAmount_: TSingleField;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSenderRegister: TFrmSenderRegister;

implementation



{$R *.dfm}


procedure TFrmSenderRegister.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSenderRegister.cdsViewNewRecord(DataSet: TDataSet);
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

procedure TFrmSenderRegister.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  OA_SenderRegister';
    Open;
  end;
end;

initialization

RegisterClass(TFrmSenderRegister);

finalization

UnRegisterClass(TFrmSenderRegister);

end.
