unit EnquirySch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls, ZSDDBGrid,
  ZSDDataSet, ZSDTool, uDM;

type
  TSchEnquiry = class(TZSDForm)
    DBGrid1: TZSDDBGrid;
    SpeedButton1: TSpeedButton;
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    cdsViewPartCode_: TStringField;
    cdsViewUP_: TSingleField;
    cdsViewbrand_: TStringField;
    cdsViewDesc_: TStringField;
    cdsViewSpec_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewCusCode_: TStringField;
    cdsViewSalesCode_: TStringField;
    ZSDTool1: TZSDTool;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewCalcFields(DataSet: TDataSet);

  const
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SchEnquiry: TSchEnquiry;

implementation


{$R *.dfm}

procedure TSchEnquiry.cdsViewCalcFields(DataSet: TDataSet);
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

procedure TSchEnquiry.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsView do
  begin
    Close;
    CommandText := 'Select first 100 * From EnquiryB B Inner Join EnquiryH H On H.ID_=B.PID_ ';
    Open;
    CommandText := 'Select * From EnquiryB B Inner Join EnquiryH H On H.ID_=B.PID_ ';
  end;
  
end;

initialization

RegisterClass(TSchEnquiry);

finalization

UnRegisterClass(TSchEnquiry);

end.
