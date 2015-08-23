object SchATTCalHistory: TSchATTCalHistory
  Left = 0
  Top = 0
  Caption = #32771#21220#26126#32454#35760#24405
  ClientHeight = 385
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 120
    Width = 23
    Height = 22
  end
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 385
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Month_'
        Title.Alignment = taCenter
        Title.Caption = #26376#20221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'User_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TeamCode_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29677#21035
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime1_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26089#29677#36827
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime1_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26089#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime2_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26202#29677#20837
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime2_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26202#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime3_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21152#29677#20837
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime3_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21152#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkDays_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26377#25928#22825#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpdateUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPdateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 192
    Top = 96
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 144
    Top = 96
    object cdsViewID_: TGuidField
      FieldName = 'ID_'
      FixedChar = True
      Size = 38
    end
    object cdsViewMonth_: TIntegerField
      FieldName = 'Month_'
    end
    object cdsViewUser_: TStringField
      FieldName = 'User_'
    end
    object cdsViewTeamCode_: TStringField
      FieldName = 'TeamCode_'
    end
    object cdsViewInTime1_: TStringField
      FieldName = 'InTime1_'
      Size = 8
    end
    object cdsViewOutTime1_: TStringField
      FieldName = 'OutTime1_'
      Size = 8
    end
    object cdsViewInTime2_: TStringField
      FieldName = 'InTime2_'
      Size = 8
    end
    object cdsViewOutTime2_: TStringField
      FieldName = 'OutTime2_'
      Size = 8
    end
    object cdsViewInTime3_: TStringField
      FieldName = 'InTime3_'
      Size = 8
    end
    object cdsViewOutTime3_: TStringField
      FieldName = 'OutTime3_'
      Size = 8
    end
    object cdsViewWorkDays_: TSingleField
      FieldName = 'WorkDays_'
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewUPdateDate_: TSQLTimeStampField
      FieldName = 'UPdateDate_'
    end
    object cdsViewDate_: TDateField
      FieldName = 'Date_'
    end
  end
  object ZSDTool1: TZSDTool
    mAppend = False
    mEdit = False
    mSave = False
    mConfirm = False
    mFind = False
    mRevocation = False
    mDel = False
    mPrint = False
    mFPrint = False
    mAudit = False
    aDataSet = cdsView
    Left = 72
    Top = 104
  end
end
