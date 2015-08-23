unit TestFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBClient, MConnect, SConnect, DB, ADODB, ExtCtrls, Grids, DBGrids,
  ZSDFrm, uDM, StrUtils, ZSDDBGrid;

type
  TFrmTest = class(TZSDForm)
    dsFile: TDataSource;
    DBGrid1: TZSDDBGrid;
    OpenDialog1: TOpenDialog;
    cdsFile: TZSDDataSet;
    procedure cdsFileNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTest: TFrmTest;

implementation

{$R *.dfm}

procedure TFrmTest.cdsFileNewRecord(DataSet: TDataSet);
var
  sDir, sLDir, sStr, sFileName: String;
  i: Integer;
  DateTime: TDateTime;
begin
  i := 0;
  with DataSet do
  begin
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
    if OpenDialog1.Execute then
    begin
      sFileName := OpenDialog1.FileName;
      sLDir := ExtractFileDir(sFileName);
      while sStr <> '\' do
      begin
        sStr := MidStr(sLDir, Length(sLDir) - i, 1);
        i := i + 1;
      end;
      sDir := RightStr(sLDir, i - 1);
      if sLDir + '\' = ExtractFilePath(ParamStr(0)) then
        sDir := '.';
      FieldByName('ID_').AsString := DM.NewGUID;
      FieldByName('AppUser_').AsString := DM.User;
      FieldByName('AppDate_').AsDateTime := DM.GetNow;
      FieldByName('UpdateUser_').AsString := DM.User;
      FieldByName('UPdateDate_').AsDateTime := DM.GetNow;
      FieldByName('Dir_').AsString := sDir;
      FileAge(sFileName, DateTime);
      FieldByName('FLastTime_').AsDateTime := DateTime;
      FieldByName('Name_').AsString := ExtractFileName(sFileName);
      FieldByName('FID_').AsString := DM.UpdateFileTODB(sFileName);
      Post;
    end;
  end;
end;

procedure TFrmTest.FormCreate(Sender: TObject);
begin
  inherited;
  with cdsFile do
  begin
    Active := False;
    CommandText := 'Select * From sysFile';
    Open;
  end;
  MDataSet := 'cdsFile';
end;

initialization

RegisterClass(TFrmTest);

finalization

UnRegisterClass(TFrmTest);

end.
