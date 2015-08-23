unit SalaryBaseFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ZSDTool;

type
  TFrmSalaryBase = class(TZSDForm)
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TStringField;
    cdsViewUser_: TStringField;
    cdsViewEnabled_: TSmallintField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmSalaryBase: TFrmSalaryBase;

implementation


{$R *.dfm}

procedure TFrmSalaryBase.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmSalaryBase.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := Now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := Now();
    FieldByName('UpdateUser_').AsString := DM.User;
    Edit;
  end;
end;

procedure TFrmSalaryBase.FormCreate(Sender: TObject);
begin
  inherited;
  DM.UserAddFileds('Salary_Base', DBGrid1);
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 10 * From Salary_Base';
    Open;
    CommandText := 'Select * From Salary_Base';
  end;
  
end;


procedure TFrmSalaryBase.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmSalaryBase);

finalization

UnRegisterClass(TFrmSalaryBase);

end.
