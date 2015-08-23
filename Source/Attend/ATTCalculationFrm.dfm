object FrmATTCalculation: TFrmATTCalculation
  Left = 0
  Top = 0
  Caption = #32771#21220#26126#32454#25968#25454#32479#35745
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
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 320
    Align = alClient
    DataSource = dsView
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'User_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date_'
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Week'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TeamCode_'
        Title.Alignment = taCenter
        Title.Caption = #29677#27425
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime1_'
        Title.Alignment = taCenter
        Title.Caption = #26089#29677#36827
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime1_'
        Title.Alignment = taCenter
        Title.Caption = #26089#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime2_'
        Title.Alignment = taCenter
        Title.Caption = #26202#29677#20837
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime2_'
        Title.Alignment = taCenter
        Title.Caption = #26202#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime3_'
        Title.Alignment = taCenter
        Title.Caption = #21152#29677#20837
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutTime3_'
        Title.Alignment = taCenter
        Title.Caption = #21152#29677#20986
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Late_'
        Title.Alignment = taCenter
        Title.Caption = #36831#21040
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Early_'
        Title.Alignment = taCenter
        Title.Caption = #26089#36864
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AbsEn_'
        Title.Alignment = taCenter
        Title.Caption = #26103#24037
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Overtime_'
        Title.Alignment = taCenter
        Title.Caption = #21152#29677#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkDays_'
        Title.Alignment = taCenter
        Title.Caption = #26377#25928#22825#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpdateUser_'
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPdateDate_'
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 725
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 464
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Label1'
      Visible = False
    end
    object Button1: TButton
      Left = 93
      Top = 6
      Width = 75
      Height = 25
      Caption = #32771#21220#32479#35745
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 12
      Top = 6
      Width = 75
      Height = 25
      Caption = #23548#20837#25968#25454
      TabOrder = 1
      OnClick = Button2Click
    end
    object ProgressBar1: TProgressBar
      Left = 576
      Top = 14
      Width = 137
      Height = 17
      TabOrder = 2
      Visible = False
    end
    object Button3: TButton
      Left = 174
      Top = 6
      Width = 83
      Height = 25
      Caption = #35745#31639#32467#26524#23384#26723
      TabOrder = 3
      OnClick = Button3Click
    end
    object CheckBox1: TCheckBox
      Left = 280
      Top = 6
      Width = 97
      Height = 17
      Caption = #26174#31034#25171#21345#35760#24405
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 725
    Height = 24
    Align = alBottom
    TabOrder = 2
    Visible = False
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
    AfterScroll = cdsViewAfterScroll
    OnCalcFields = cdsViewCalcFields
    OnNewRecord = cdsViewNewRecord
    Left = 144
    Top = 96
    object cdsViewID_: TGuidField
      FieldName = 'ID_'
      FixedChar = True
      Size = 38
    end
    object cdsViewUser_: TStringField
      FieldName = 'User_'
    end
    object cdsViewTeamCode_: TStringField
      FieldName = 'TeamCode_'
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
    object cdsViewInTime1_: TStringField
      FieldName = 'InTime1_'
      Size = 10
    end
    object cdsViewLate_: TSingleField
      FieldName = 'Late_'
    end
    object cdsViewEarly_: TSingleField
      FieldName = 'Early_'
    end
    object cdsViewAbsEn_: TSingleField
      FieldName = 'AbsEn_'
    end
    object cdsViewWorkDays_: TSingleField
      FieldName = 'WorkDays_'
    end
    object cdsViewDate_: TDateField
      FieldName = 'Date_'
    end
    object cdsViewOvertime_: TSingleField
      FieldName = 'Overtime_'
    end
    object cdsViewWeek: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Week'
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
    Left = 88
    Top = 96
  end
end
