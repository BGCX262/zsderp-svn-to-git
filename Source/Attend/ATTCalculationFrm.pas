unit ATTCalculationFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZSDFrm, Grids, DBGrids, DB, Buttons, DBClient, StdCtrls,
  ZSDDataSet, ZSDDBGrid, ADODB, StrUtils, ExtCtrls, DateUtils, ComCtrls,
  ZSDTool, uDM;

type
  TFrmATTCalculation = class(TZSDForm)
    dsView: TDataSource;
    cdsView: TZSDDataSet;
    DBGrid1: TZSDDBGrid;
    cdsViewID_: TGuidField;
    cdsViewTeamCode_: TStringField;
    cdsViewOutTime1_: TStringField;
    cdsViewInTime2_: TStringField;
    cdsViewOutTime2_: TStringField;
    cdsViewInTime3_: TStringField;
    cdsViewOutTime3_: TStringField;
    cdsViewAppUser_: TStringField;
    cdsViewAppDate_: TSQLTimeStampField;
    cdsViewUpdateUser_: TStringField;
    cdsViewUPdateDate_: TSQLTimeStampField;
    cdsViewUser_: TStringField;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    cdsViewInTime1_: TStringField;
    cdsViewLate_: TSingleField;
    cdsViewEarly_: TSingleField;
    cdsViewAbsEn_: TSingleField;
    cdsViewWorkDays_: TSingleField;
    cdsViewDate_: TDateField;
    ZSDTool1: TZSDTool;
    cdsViewOvertime_: TSingleField;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    cdsViewWeek: TIntegerField;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure cdsViewNewRecord(DataSet: TDataSet);
    procedure cdsViewAfterEdit(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure cdsViewCalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure cdsViewAfterScroll(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
  private
    cdsATT_Team, cdsATT_OriginalRecord: TZSDDataSet;
    procedure CalATTData(iDataSet: TZSDDataSet; sUser: String; iDate: TDate;
      sTemam: String);
    procedure CalTime(sUser: String; iDate: TDate; sTemam: String);
    procedure AddLeaveFiled(Sender: TObject);
    procedure CalLeave;
    { Private declarations }
  public
    { Public declarations }
    procedure ZSDPostMsg(var AMsg: TWmCopyData); message COST_ZSD_PostMessage;
  end;

var
  FrmATTCalculation: TFrmATTCalculation;

implementation


{$R *.dfm}

procedure TFrmATTCalculation.Button1Click(Sender: TObject);
var
  sYearMonth, sYear, sMonth, sStartDate, sEndDate: String;
  iDay: integer;
begin
  Label1.Visible := True;
  ProgressBar1.Visible := True;
  Label1.Caption := '正在计算考勤明细';
  ProgressBar1.Min := 0;
  sYearMonth := DM.DBRead('Select YearMonth_ From ATT_SysSet');
  sYear := LeftStr(sYearMonth, 4);
  sMonth := RightStr(sYearMonth, 2);
  iDay := DaysInMonth(StrToDate(sYear + '/' + sMonth + '/' + '01'));
  sStartDate := sYear + '/' + sMonth + '/' + '01';
  sEndDate := sYear + '/' + sMonth + '/' + IntToStr(iDay);
  // 缓存计算数据，防止数据重复取值
  cdsATT_Team := TZSDDataSet.Create(Self);
  cdsATT_OriginalRecord := TZSDDataSet.Create(Self);
  try
    DM.RemoteServer(cdsATT_Team);
    DM.RemoteServer(cdsATT_OriginalRecord);
    cdsATT_Team.Close;
    cdsATT_Team.CommandText := 'Select * From ATT_Team';
    cdsATT_Team.Open;
    // StrToDate(sYear + '/' + sMonth + '/' + '01')
    with cdsView do
    begin
      DisableControls;
      First;
      ProgressBar1.Max := RecordCount;
      while not Eof do
      begin
        Edit;
        CalATTData(cdsView, FieldByName('User_').AsString,
          FieldByName('Date_').AsDateTime, FieldByName('TeamCode_').AsString);
        Application.ProcessMessages;
        ProgressBar1.Position := RecNo;
        Post;
        Next;
      end;
    end;
    // 计算请休假
    CalLeave;
  finally
    DM.FreeRemoteServer(cdsATT_Team);
    DM.FreeRemoteServer(cdsATT_OriginalRecord);
    Label1.Visible := False;
    ProgressBar1.Visible := False;
    cdsView.EnableControls;
  end;
end;

function TimeToInt(Times: String): integer;
begin
  if Length(Times) = 4 then
    Times := '0' + Times;
  if Times <> '00:00' then
  begin
    Result := StrToIntDef(Copy(Times, 1, 2), 0) * 60 +
      StrToIntDef(Copy(Times, 4, 2), 0);
    if Result = 0 then
      Result := -1;
  end
  else
    Result := 0;
end;

function IntToTime(Value: integer): String;
var
  s1, s2: String;
begin
  if Value > -1 then
  begin
    s1 := '00' + IntToStr(Value div 60);
    s2 := '00' + IntToStr(Value mod 60);
    Result := Copy(s1, Length(s1) - 1, 2) + ':' + Copy(s2, Length(s2) - 1, 2);
  end
  else
    Result := '  :  ';
end;

procedure TFrmATTCalculation.CalATTData(iDataSet: TZSDDataSet; sUser: String;
  iDate: TDate; sTemam: String);
var
  iCardTime: integer; // 打卡时间
  iCardUse: Boolean; // 标识卡是否已经被使用。
  sInTime1: integer; // 班次进1
  sInTime2: integer; // 班次进2
  sInTime3: integer; // 班次进3
  sOutTime1: integer; // 班次出1
  sOutTime2: integer; // 班次出2
  sOutTime3: integer; // 班次出3
  { sMidTime1: integer; // 班次中间值1
    sMidTime2: integer; // 班次中间值2
    sMidTime3: integer; // 班次中间值3 }
  sMinTime1: integer; // 班次进1最早
  sMinTime2: integer; // 班次进2最早
  sMinTime3: integer; // 班次进3最早
  sMaxTime1: integer; // 班次出1最晚
  sMaxTime2: integer; // 班次出2最晚
  sMaxTime3: integer; // 班次出3最晚
  vInTime1: String; // 实际上班进1
  vInTime2: String; // 实际上班进2
  vInTime3: String; // 实际上班进3
  vOutTime1: String; // 实际下班出1
  vOutTime2: String; // 实际下班出2
  vOutTime3: String; // 实际下班出3
  lInTime1: integer; // 有效班次进1
  lInTime2: integer; // 有效班次进2
  lInTime3: integer; // 有效班次进3
  lOutTime1: integer; // 有效班次出1
  lOutTime2: integer; // 有效班次出2
  lOutTime3: integer; // 有效班次出3
  isbts, iLate, iEarly, iAbsEn, iOvertime: Double;
begin
  CalTime(sUser, iDate, sTemam);
  sInTime1 := TimeToInt(cdsATT_Team.FieldByName('InTime1_').AsString);
  sInTime2 := TimeToInt(cdsATT_Team.FieldByName('InTime2_').AsString);
  sInTime3 := TimeToInt(cdsATT_Team.FieldByName('InTime3_').AsString);
  sOutTime1 := TimeToInt(cdsATT_Team.FieldByName('OutTime1_').AsString);
  sOutTime2 := TimeToInt(cdsATT_Team.FieldByName('OutTime2_').AsString);
  sOutTime3 := TimeToInt(cdsATT_Team.FieldByName('OutTime3_').AsString);
  {
    sMidTime1 := round(sInTime1 + ((sOutTime1 - sInTime1)));
    sMidTime2 := round(sInTime2 + ((sOutTime2 - sInTime2)));
    sMidTime3 := round(sInTime3 + ((sOutTime3 - sInTime3))); }
  sMinTime1 := round(sInTime1 - ((sOutTime1 - sInTime1)));
  if sOutTime1 > 0 then
    sMinTime2 := sOutTime1
  else
    sMinTime2 := round(sInTime2 - ((sOutTime2 - sInTime2)));
  if sOutTime2 > 0 then
    sMinTime3 := sOutTime2
  else
    sMinTime3 := round(sInTime3 - ((sOutTime3 - sInTime3)));

  if sInTime2 > 0 then
    sMaxTime1 := sInTime2
  else
    sMaxTime1 := round(sOutTime1 + ((sOutTime1 - sInTime1)));
  if sInTime3 > 0 then
    sMaxTime2 := sInTime3
  else
    sMaxTime2 := round(sOutTime2 + ((sOutTime2 - sInTime2)));

  sMaxTime3 := round(sOutTime3 + ((sOutTime3 - sInTime3)));

  vInTime1 := 'No';
  vInTime2 := 'No';
  vInTime3 := 'No';
  vOutTime1 := 'No';
  vOutTime2 := 'No';
  vOutTime3 := 'No';
  if (sInTime1 > 0) or (sOutTime1 > 0) then
  begin
    vInTime1 := '';
    vOutTime1 := '';
  end;
  if (sInTime2 > 0) or (sOutTime2 > 0) then
  begin
    vInTime2 := '';
    vOutTime2 := '';
  end;
  if (sInTime3 > 0) or (sOutTime3 > 0) then
  begin
    vInTime3 := '';
    vOutTime3 := '';
  end;
  with cdsATT_OriginalRecord do
  begin
    First;
    while Not Eof do
    begin
      // 计算实际打卡时间
      iCardTime := TimeToInt(FieldByName('Time_').AsString);
      iCardUse := False;
      { if (vInTime1 = '') and (iCardTime >= sMinTime1) and
        (iCardTime < sMidTime1) and (not iCardUse) then
        begin
        vInTime1 := IntToTime(iCardTime);
        iCardUse := True;
        end;
        if (vOutTime1 = '') and (iCardTime >= sInTime1) and
        (iCardTime <= sMaxTime1) and (not iCardUse) then
        begin
        vOutTime1 := IntToTime(iCardTime);
        iCardUse := True;
        end;
        if (vInTime2 = '') and (iCardTime >= sMinTime2) and
        (iCardTime < sMidTime2) and (not iCardUse) then
        begin
        vInTime2 := IntToTime(iCardTime);
        iCardUse := True;
        end;
        if (vOutTime2 = '') and (iCardTime >= sInTime2) and
        (iCardTime <= sMaxTime2) and (not iCardUse) then
        begin
        vOutTime2 := IntToTime(iCardTime);
        iCardUse := True;
        end;
        if (vInTime3 = '') and (iCardTime >= sMinTime3) and
        (iCardTime < sMidTime3) and (not iCardUse) then
        begin
        vInTime3 := IntToTime(iCardTime);
        iCardUse := True;
        end;
        if (vOutTime3 = '') and (iCardTime >= sInTime3) and
        (iCardTime <= sMaxTime3) and (not iCardUse) then
        begin
        vOutTime3 := IntToTime(iCardTime);
        iCardUse := True;
        end; }
      if (vInTime1 = '') and (iCardTime >= sMinTime1) and
        (iCardTime < sOutTime1) and (not iCardUse) then
      begin
        vInTime1 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      if (vOutTime1 = '') and (iCardTime >= sInTime1) and
        (iCardTime <= sMaxTime1) and (not iCardUse) then
      begin
        vOutTime1 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      if (vInTime2 = '') and (iCardTime >= sMinTime2) and
        (iCardTime < sOutTime2) and (not iCardUse) then
      begin
        vInTime2 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      if (vOutTime2 = '') and (iCardTime >= sInTime2) and
        (iCardTime <= sMaxTime2) and (not iCardUse) then
      begin
        vOutTime2 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      if (vInTime3 = '') and (iCardTime >= sMinTime3) and
        (iCardTime < sOutTime3) and (not iCardUse) then
      begin
        vInTime3 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      if (vOutTime3 = '') and (iCardTime >= sInTime3) and
        (iCardTime <= sMaxTime3) and (not iCardUse) then
      begin
        vOutTime3 := IntToTime(iCardTime);
        iCardUse := True;
      end;
      Next;
    end;
    if (vInTime2 = '') and (vOutTime1 <> '') and (sInTime1 > 0) and
      (vInTime1 = '') and (sInTime2 > 0) and (TimeToInt(vOutTime1) >= sOutTime1)
      and (TimeToInt(vOutTime1) <= sInTime2) then
    begin
      vInTime2 := vOutTime1;
      vOutTime1 := '';
    end;
  end;
  with cdsView do
  begin
    FieldByName('InTime1_').AsString := vInTime1;
    FieldByName('InTime2_').AsString := vInTime2;
    FieldByName('InTime3_').AsString := vInTime3;
    FieldByName('OutTime1_').AsString := vOutTime1;
    FieldByName('OutTime2_').AsString := vOutTime2;
    FieldByName('OutTime3_').AsString := vOutTime3;

    if TimeToInt(vInTime1) <= sInTime1 then
      lInTime1 := sInTime1
    else
      lInTime1 := TimeToInt(vInTime1);

    if TimeToInt(vInTime2) <= sInTime2 then
      lInTime2 := sInTime2
    else
      lInTime2 := TimeToInt(vInTime2);

    if TimeToInt(vInTime3) <= sInTime3 then
      lInTime3 := sInTime3
    else
      lInTime3 := TimeToInt(vInTime3);

    if TimeToInt(vOutTime1) >= sOutTime1 then
      lOutTime1 := sOutTime1
    else
      lOutTime1 := TimeToInt(vOutTime1);

    if TimeToInt(vOutTime2) >= sOutTime2 then
      lOutTime2 := sOutTime2
    else
      lOutTime2 := TimeToInt(vOutTime2);

    if TimeToInt(vOutTime3) >= sOutTime3 then
      lOutTime3 := sOutTime3
    else
      lOutTime3 := TimeToInt(vOutTime3);

    // 计算实际上班天数
    isbts := 0;
    if ((sOutTime1 - sInTime1) <= (lOutTime1 - lInTime1)) and
      (TimeToInt(vInTime1) > 0) and (TimeToInt(vOutTime1) > 0) then
      isbts := isbts + 0.5;
    if ((sOutTime2 - sInTime2) <= (lOutTime2 - lInTime2)) and
      (TimeToInt(vInTime2) > 0) and (TimeToInt(vOutTime2) > 0) then
      isbts := isbts + 0.5;
    if ((sOutTime3 - sInTime3) <= (lOutTime3 - lInTime3)) and
      (TimeToInt(vInTime3) > 0) and (TimeToInt(vOutTime3) > 0) then
      isbts := isbts + 0.5;
    if isbts > 1 then
      isbts := 1;
    FieldByName('WorkDays_').AsFloat := isbts;
    // 计算迟到
    iLate := 0;
    if (TimeToInt(vInTime1) - sInTime1 > 0) and (sInTime1 > 0) and
      (TimeToInt(vInTime1) > 0) then
      iLate := iLate + (TimeToInt(vInTime1) - sInTime1);
    if (TimeToInt(vInTime2) - sInTime2 > 0) and (sInTime2 > 0) and
      (TimeToInt(vInTime2) > 0) then
      iLate := iLate + (TimeToInt(vInTime2) - sInTime2);
    if (TimeToInt(vInTime3) - sInTime3 > 0) and (sInTime3 > 0) and
      (TimeToInt(vInTime3) > 0) then
      iLate := iLate + (TimeToInt(vInTime3) - sInTime3);
    FieldByName('Late_').AsFloat := iLate;
    // 计算早退
    iEarly := 0;
    if (sOutTime1 - TimeToInt(vOutTime1) > 0) and (sOutTime1 > 0) and
      (TimeToInt(vOutTime1) > 0) then
      iEarly := iLate + (TimeToInt(vOutTime1) - sOutTime1);
    if (sOutTime2 - TimeToInt(vOutTime2) > 0) and (sOutTime2 > 0) and
      (TimeToInt(vOutTime2) > 0) then
      iEarly := iLate + (TimeToInt(vOutTime1) - sOutTime1);
    if (sOutTime3 - TimeToInt(vOutTime3) > 0) and (sOutTime3 > 0) and
      (TimeToInt(vOutTime3) > 0) then
      iEarly := iLate + (TimeToInt(vOutTime3) - sOutTime3);
    FieldByName('Early_').AsFloat := iEarly;
    // 计算旷工
    iAbsEn := 0;
    if (sInTime1 > 0) and ((TimeToInt(vInTime1) <= 0) or
      (TimeToInt(vOutTime1) <= 0)) then
      iAbsEn := iAbsEn + (sOutTime1 - sInTime1);
    if (sInTime2 > 0) and ((TimeToInt(vInTime2) <= 0) or
      (TimeToInt(vOutTime2) <= 0)) then
      iAbsEn := iAbsEn + (sOutTime2 - sInTime2);
    if cdsATT_Team.FieldByName('WorkTime_').AsFloat <> 0 then
    begin
      if iAbsEn > cdsATT_Team.FieldByName('WorkTime_').AsFloat then
        iAbsEn := cdsATT_Team.FieldByName('WorkTime_').AsFloat;
    end;
    FieldByName('AbsEn_').AsFloat := iAbsEn;
    // 计算加班
    iOvertime := 0;
    if (sInTime3 > 0) and ((TimeToInt(vInTime3) > 0) or
      (TimeToInt(vOutTime3) > 0)) then
      iOvertime := iOvertime + ((sOutTime3 - sInTime3));
    FieldByName('Overtime_').AsFloat := iOvertime;
  end;
end;

procedure TFrmATTCalculation.CalLeave;
var
  iDay, iStartDay, iEndDay, i: integer;
  cdsATT_Leave: TZSDDataSet;
  sYearMonth, sYear, sMonth, sStartDate, sEndDate: String;
  sl: TStringList;
begin
  sYearMonth := DM.DBRead('Select YearMonth_ From ATT_SysSet');
  sYear := LeftStr(sYearMonth, 4);
  sMonth := RightStr(sYearMonth, 2);
  iDay := DaysInMonth(StrToDate(sYear + '/' + sMonth + '/' + '01'));
  sStartDate := sYear + '/' + sMonth + '/' + '01';
  sEndDate := sYear + '/' + sMonth + '/' + IntToStr(iDay);
  cdsATT_Leave := TZSDDataSet.Create(Self);
  sl := TStringList.Create;
  try
    sl.Text := DM.DBRead
      ('Select SYSLIST_ From SetGridList Where FormID_=''TFrmATTLeave'' and Filed_=''Type_''');
    DM.RemoteServer(cdsATT_Leave);
    cdsATT_Leave.Close;
    cdsATT_Leave.CommandText :=
      Format('Select Type_,Code_,StartDate_,EndDate_ From ATT_LEAVEB B Inner Join ATT_LEAVEA A On A.ID_=B.PID_ Where '
      + ' (Enddate_>=''%s'' and  StartDate_<=''%s'')', [sStartDate, sEndDate]);
    cdsATT_Leave.Open;
    with cdsView do
    begin
      First;
      while not Eof do
      begin
        for i := 0 to sl.Count - 1 do
        begin
          Edit;
          FieldByName('Leave' + IntToStr(i)).AsFloat := 0;
        end;
        cdsATT_Leave.First;
        while not cdsATT_Leave.Eof do
        begin
          if FieldByName('User_').AsString = cdsATT_Leave.FieldByName('Code_').AsString
          then
          begin
            if cdsATT_Team.Locate('Code_', FieldByName('TeamCode_').AsString,
              [loCaseInsensitive]) then
            begin
              if (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('InTime1_').AsString) >=
                cdsATT_Leave.FieldByName('StartDate_').AsDateTime) and
                (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('OutTime2_').AsString) <=
                cdsATT_Leave.FieldByName('EndDate_').AsDateTime) then // 全天请假
              begin
                i := sl.IndexOf(cdsATT_Leave.FieldByName('Type_').AsString);
                if i >= 0 then
                begin
                  FieldByName('Leave' + IntToStr(i)).AsFloat :=
                    cdsATT_Team.FieldByName('WorkTime_').AsFloat;
                end;
                FieldByName('Late_').AsFloat := 0;
                FieldByName('Early_').AsFloat := 0;
                FieldByName('AbsEn_').AsFloat := 0;
              end;

              if (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('InTime1_').AsString) <=
                cdsATT_Leave.FieldByName('StartDate_').AsDateTime) and
                (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('OutTime2_').AsString) >=
                cdsATT_Leave.FieldByName('EndDate_').AsDateTime) then // 当日请假
              begin
                i := sl.IndexOf(cdsATT_Leave.FieldByName('Type_').AsString);
                if i >= 0 then
                begin
                  FieldByName('Leave' + IntToStr(i)).AsFloat :=
                    FieldByName('Leave' + IntToStr(i)).AsFloat +
                    Int((cdsATT_Leave.FieldByName('EndDate_').AsDateTime -
                    cdsATT_Leave.FieldByName('StartDate_').AsDateTime) * 1440);
                  FieldByName('Late_').AsFloat := FieldByName('Late_').AsFloat -
                    FieldByName('Leave' + IntToStr(i)).AsFloat;
                  if FieldByName('Late_').AsFloat < 0 then
                    FieldByName('Late_').AsFloat := 0;
                  FieldByName('Early_').AsFloat := FieldByName('Early_').AsFloat
                    - FieldByName('Leave' + IntToStr(i)).AsFloat;
                  if FieldByName('Early_').AsFloat < 0 then
                    FieldByName('Early_').AsFloat := 0;
                  FieldByName('AbsEn_').AsFloat := FieldByName('AbsEn_').AsFloat
                    - FieldByName('Leave' + IntToStr(i)).AsFloat;
                  if FieldByName('AbsEn_').AsFloat < 0 then
                    FieldByName('AbsEn_').AsFloat := 0;
                end;
              end;
              if (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('InTime1_').AsString) <
                cdsATT_Leave.FieldByName('StartDate_').AsDateTime) and
                (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('OutTime2_').AsString) >
                cdsATT_Leave.FieldByName('StartDate_').AsDateTime) and
                (StrToDateTime(FieldByName('Date_').AsString + ' ' +
                cdsATT_Team.FieldByName('OutTime2_').AsString) <
                cdsATT_Leave.FieldByName('EndDate_').AsDateTime) then
              // 跨天，当日请下半天
              begin
                i := sl.IndexOf(cdsATT_Leave.FieldByName('Type_').AsString);
                if i>=0 then
                begin
                FieldByName('Leave' + IntToStr(i)).AsFloat :=
                  FieldByName('Leave' + IntToStr(i)).AsFloat +
                  Int((cdsATT_Leave.FieldByName('EndDate_').AsDateTime -
                  cdsATT_Leave.FieldByName('StartDate_').AsDateTime) * 1440);
                FieldByName('Late_').AsFloat := FieldByName('Late_').AsFloat -
                  FieldByName('Leave' + IntToStr(i)).AsFloat;
                if FieldByName('Late_').AsFloat < 0 then
                  FieldByName('Late_').AsFloat := 0;
                FieldByName('Early_').AsFloat := FieldByName('Early_').AsFloat -
                  FieldByName('Leave' + IntToStr(i)).AsFloat;
                if FieldByName('Early_').AsFloat < 0 then
                  FieldByName('Early_').AsFloat := 0;
                FieldByName('AbsEn_').AsFloat := FieldByName('AbsEn_').AsFloat -
                  FieldByName('Leave' + IntToStr(i)).AsFloat;
                if FieldByName('AbsEn_').AsFloat < 0 then
                  FieldByName('AbsEn_').AsFloat := 0;
                end;
              end;
            end;
            if (StrToDateTime(FieldByName('Date_').AsString + ' ' +
              cdsATT_Team.FieldByName('InTime1_').AsString) <
              cdsATT_Leave.FieldByName('EndDate_').AsDateTime) and
              (StrToDateTime(FieldByName('Date_').AsString + ' ' +
              cdsATT_Team.FieldByName('OutTime2_').AsString) >
              cdsATT_Leave.FieldByName('EndDate_').AsDateTime) and
              (StrToDateTime(FieldByName('Date_').AsString + ' ' +
              cdsATT_Team.FieldByName('InTime1_').AsString) >
              cdsATT_Leave.FieldByName('StartDate_').AsDateTime) then
            // 跨天，当日请上半天
            begin
              i := sl.IndexOf(cdsATT_Leave.FieldByName('Type_').AsString);
              if i>=0 then
              begin
              FieldByName('Leave' + IntToStr(i)).AsFloat :=
                FieldByName('Leave' + IntToStr(i)).AsFloat +
                Int((cdsATT_Leave.FieldByName('EndDate_').AsDateTime -
                cdsATT_Leave.FieldByName('StartDate_').AsDateTime) * 1440);
              FieldByName('Late_').AsFloat := FieldByName('Late_').AsFloat -
                FieldByName('Leave' + IntToStr(i)).AsFloat;
              if FieldByName('Late_').AsFloat < 0 then
                FieldByName('Late_').AsFloat := 0;
              FieldByName('Early_').AsFloat := FieldByName('Early_').AsFloat -
                FieldByName('Leave' + IntToStr(i)).AsFloat;
              if FieldByName('Early_').AsFloat < 0 then
                FieldByName('Early_').AsFloat := 0;
              FieldByName('AbsEn_').AsFloat := FieldByName('AbsEn_').AsFloat -
                FieldByName('Leave' + IntToStr(i)).AsFloat;
              if FieldByName('AbsEn_').AsFloat < 0 then
                FieldByName('AbsEn_').AsFloat := 0;
              end;
            end;
          end;
          cdsATT_Leave.Next;
        end;
        Next;
      end;
    end;
  finally
    DM.FreeRemoteServer(cdsATT_Leave);
    sl.Free;
  end;
end;

procedure TFrmATTCalculation.CalTime(sUser: String; iDate: TDate;
  sTemam: String);
begin
  if not cdsATT_Team.Locate('Code_', Trim(sTemam), [loCaseInsensitive]) then
    Showmessage(sUser + '用户没有维护班组信息');
  with cdsATT_OriginalRecord do
  begin
    Close;
    CommandText := Format('Select * From ATT_OriginalRecord where ' +
      ' User_=''%s'' and Date_=''%s'' order By Date_,Time_',
      [sUser, DateTimeToStr(iDate)]);
    Open;
  end;
end;

procedure TFrmATTCalculation.Button2Click(Sender: TObject);
var
  cdsTemp, cdsATT_UserTeam, cdsADJUSTTEAMB: TZSDDataSet;
  i, iDay: integer;
  sYearMonth, sYear, sMonth, aduTeam: String;
  isDelete: Boolean;
begin
  Label1.Visible := True;
  ProgressBar1.Visible := True;
  Label1.Caption := '正在导入考勤名单';
  ProgressBar1.Min := 0;
  sYearMonth := DM.DBRead('Select YearMonth_ From ATT_SysSet');
  sYear := LeftStr(sYearMonth, 4);
  sMonth := RightStr(sYearMonth, 2);
  cdsView.EmptyDataSet;
  DM.DBExSql('Delete From Att_Calculation');
  cdsTemp := TZSDDataSet.Create(Self);
  DM.RemoteServer(cdsTemp);
  iDay := DaysInMonth(StrToDate(sYear + '/' + sMonth + '/' + '01'));
  cdsATT_UserTeam := TZSDDataSet.Create(Self);
  DM.RemoteServer(cdsATT_UserTeam);
  cdsADJUSTTEAMB := TZSDDataSet.Create(Self);
  DM.RemoteServer(cdsADJUSTTEAMB);
  cdsATT_Team := TZSDDataSet.Create(Self);
  try
    DM.RemoteServer(cdsATT_Team);
    cdsATT_Team.Close;
    cdsATT_Team.CommandText := 'Select * From ATT_Team';
    cdsATT_Team.Open;
    cdsATT_UserTeam.Close;
    cdsATT_UserTeam.CommandText := 'Select * From ATT_USERTEAM';
    cdsATT_UserTeam.Open;
    with cdsTemp do
    begin
      Close;
      CommandText := Format('Select UserID_, OutDate_ From PERSONNEL ' +
        ' Where (OutDate_ is Null or OutDate_='''' or OutDate_ >= ''%s'' or Outdate_<=%s)',
        [sYear + '/' + sMonth + '/' + '01', sYear + '/' + sMonth + '/' +
        IntToStr(iDay)]);
      Open;
      ProgressBar1.Max := RecordCount;
      while not Eof do
      begin
        if FieldByName('OutDate_').AsString = '' then
          iDay := DaysInMonth(StrToDate(sYear + '/' + sMonth + '/' + '01'))
        else
          iDay := DayOf(FieldByName('OutDate_').AsDateTime);
        for i := 1 to iDay do
        begin
          cdsView.Append;
          cdsView.FieldByName('User_').AsString :=
            FieldByName('UserID_').AsString;
          if not cdsATT_UserTeam.Locate('User_', FieldByName('UserID_')
            .AsString, [loCaseInsensitive]) then
          begin
            Showmessage(FieldByName('UserID_').AsString + '用户没有维护班组信息');
            Exit;
          end
          else
          begin
            cdsView.FieldByName('TeamCode_').AsString :=
              cdsATT_UserTeam.FieldByName('TeamCode_').AsString;
          end;
          cdsView.FieldByName('Date_').AsDateTime :=
            StrToDate(sYear + '/' + sMonth + '/' + IntToStr(i));
        end;
        ProgressBar1.Position := RecNo;
        Application.ProcessMessages;
        Next;
      end;
    end;
    Self.Label1.Caption := '正在参考调班单';
    Self.ProgressBar1.Min := 0;
    with cdsADJUSTTEAMB do
    begin
      Close;
      CommandText :=
        Format('Select * From ATT_ADJUSTTEAMB Where (EndDate_>=''%s'' and StartDate_<=''%s'')',
        [sYear + '/' + sMonth + '/' + '01', sYear + '/' + sMonth + '/' +
        IntToStr(iDay)]);
      Open;
      ProgressBar1.Max := RecordCount;
      cdsView.DisableControls;
      cdsView.First;
      while Not cdsView.Eof do
      begin
        First;
        isDelete := True;
        while not Eof do
        begin
          if (cdsView.FieldByName('User_').AsString = FieldByName('Code_')
            .AsString) and (cdsView.FieldByName('Date_').AsDateTime >=
            FieldByName('StartDate_').AsDateTime) and
            (cdsView.FieldByName('Date_').AsDateTime <= FieldByName('EndDate_')
            .AsDateTime) then
          begin
            cdsView.Edit;
            cdsView.FieldByName('TeamCode_').AsString :=
              FieldByName('NewTeam_').AsString;
            isDelete := False;
          end;
          Next;
        end;
        if cdsATT_Team.Locate('Code_', cdsView.FieldByName('TeamCode_')
          .AsString, [loCaseInsensitive]) then
        begin
          if Pos(IntToStr(DayOfWeek(cdsView.FieldByName('Date_').AsDateTime)),
            cdsATT_Team.FieldByName('NotWork_').AsString) > 0 then
          begin
            if isDelete then
              cdsView.Delete;
          end;
        end;
        ProgressBar1.Position := RecNo;
        Application.ProcessMessages;
        cdsView.Next;
      end;
      cdsView.EnableControls;
      cdsView.First;
    end;
  finally
    DM.FreeRemoteServer(cdsTemp);
    DM.FreeRemoteServer(cdsATT_UserTeam);
    DM.FreeRemoteServer(cdsADJUSTTEAMB);
    Label1.Visible := False;
    ProgressBar1.Visible := False;
  end;
end;

procedure TFrmATTCalculation.Button3Click(Sender: TObject);
var
  cdsTemp: TZSDDataSet;
begin
  cdsTemp := TZSDDataSet.Create(Self);
  try
    DM.RemoteServer(cdsTemp);
    cdsTemp.Close;
    cdsTemp.CommandText := 'Select * From ATT_Team';
    cdsTemp.Open;
  finally
    DM.FreeRemoteServer(cdsTemp);
  end;
end;

procedure TFrmATTCalculation.cdsViewAfterEdit(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('UpdateDate_').AsDateTime := now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTCalculation.cdsViewAfterScroll(DataSet: TDataSet);
var
  cdsTemp: TZSDDataSet;
  sDate: String;
begin
  if CheckBox1.Checked then
  begin
    sDate := '';
    Panel2.Caption := '';
    cdsTemp := TZSDDataSet.Create(Self);
    try
      DM.RemoteServer(cdsTemp);
      with cdsTemp do
      begin
        Close;
        CommandText := Format('Select Date_,Time_ From ATT_ORIGINALRECORD ' +
          ' Where User_=''%s'' and Date_>=''%s'' and Date_<=''%s'' order by Date_, Time_',
          [DataSet.FieldByName('User_').AsString,
          DateToStr(DataSet.FieldByName('Date_').AsDateTime - 1),
          DateToStr(DataSet.FieldByName('Date_').AsDateTime + 1)]);
        Open;
        while not Eof do
        begin
          if sDate <> FieldByName('Date_').AsString then
          begin
            Panel2.Caption := Panel2.Caption + '  ' + FieldByName('Date_')
              .AsString + ' ';
          end;
          Panel2.Caption := Panel2.Caption + FieldByName('Time_')
            .AsString + ' ';
          sDate := FieldByName('Date_').AsString;
          Next;
        end;
      end;
    finally
      DM.FreeRemoteServer(cdsTemp);
    end;
  end;
end;

procedure TFrmATTCalculation.cdsViewCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('Week').AsInteger :=
      DayOfWeek(cdsView.FieldByName('Date_').AsDateTime);
  end;
end;

procedure TFrmATTCalculation.cdsViewNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('ID_').AsString := DM.NewGUID;
    FieldByName('AppDate_').AsDateTime := now();
    FieldByName('AppUser_').AsString := DM.User;
    FieldByName('UpdateDate_').AsDateTime := now();
    FieldByName('UpdateUser_').AsString := DM.User;
  end;
end;

procedure TFrmATTCalculation.CheckBox1Click(Sender: TObject);
begin
  if Self.CheckBox1.Checked then
    Self.Panel2.Visible := True
  else
    Self.Panel2.Visible := False;
end;

procedure TFrmATTCalculation.FormCreate(Sender: TObject);
begin
  inherited;
  AddLeaveFiled(Self);
  with cdsView do
  begin
    Close;
    CommandText := 'Select * From  Att_Calculation';
    Open;
  end;
end;

procedure TFrmATTCalculation.AddLeaveFiled(Sender: TObject);
var
  sl: TStringList;
  i: integer;
  entid: TStringField;
begin
  sl := TStringList.Create;
  try
    // 处理用户定义的休假类别字段
    sl.Text := DM.DBRead
      ('Select SYSLIST_ From SetGridList Where FormID_=''TFrmATTLeave'' and Filed_=''Type_''');
    for i := 0 to sl.Count - 1 do
    begin
      if not DM.DBExists(Format('Select * From RDB$RELATION_FIELDS ' +
        ' Where Trim(RDB$RELATION_NAME)=UPPER(''%s'') and Trim(RDB$FIELD_NAME)=UPPER(''%s'')',
        ['ATT_CALCULATION', 'Leave' + IntToStr(i)])) then
      begin
        DM.DBExSql(Format('alter table %s add %s varchar(30)',
          ['ATT_CALCULATION', 'Leave' + IntToStr(i)]));
      end;
      if not DM.DBExists(Format('Select * From RDB$RELATION_FIELDS ' +
        ' Where Trim(RDB$RELATION_NAME)=UPPER(''%s'') and Trim(RDB$FIELD_NAME)=UPPER(''%s'')',
        ['ATT_CALHISTORY', 'Leave' + IntToStr(i)])) then
      begin
        DM.DBExSql(Format('alter table %s add %s varchar(30)',
          ['ATT_CALHISTORY', 'Leave' + IntToStr(i)]));
      end;
      entid := TStringField.Create(Self);
      entid.FieldName := 'Leave' + IntToStr(i);;
      entid.Name := DBGrid1.DataSource.DataSet.Name + 'Leave' + IntToStr(i);
      entid.FieldKind := fkdata;
      entid.Size := 50;
      entid.DataSet := DBGrid1.DataSource.DataSet;
      DBGrid1.Columns.Insert(14);
      DBGrid1.Columns[14].FieldName := 'Leave' + IntToStr(i);
      DBGrid1.Columns[14].Title.Caption := sl.Strings[i];
      DBGrid1.Columns[14].Width := 75;
      DBGrid1.Columns[14].Title.Alignment := taCenter;
      DBGrid1.Columns[14].ReadOnly := True;
      DBGrid1.Columns[14].Alignment := taRightJustify;
    end;
  finally
    sl.Free;
  end;
end;

procedure TFrmATTCalculation.ZSDPostMsg(var AMsg: TWmCopyData);
begin
end;

initialization

RegisterClass(TFrmATTCalculation);

finalization

UnRegisterClass(TFrmATTCalculation);

end.
