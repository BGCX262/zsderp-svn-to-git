object FrmATTMaualCard: TFrmATTMaualCard
  Left = 0
  Top = 0
  Caption = #34218#36164#28014#21160#25187#34917#39033#32500#25252
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
        FieldName = 'User_'
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#24080#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CardID_'
        Title.Alignment = taCenter
        Title.Caption = #32771#21220#21345#21495
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
        FieldName = 'Time_'
        Title.Alignment = taCenter
        Title.Caption = #26102#38388
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
    object cdsViewID_: TStringField
      FieldName = 'ID_'
      Size = 40
    end
    object cdsViewUser_: TStringField
      FieldName = 'User_'
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
    object cdsViewCardID_: TStringField
      FieldName = 'CardID_'
      Size = 30
    end
    object cdsViewTime_: TStringField
      FieldName = 'Time_'
    end
    object cdsViewDate_: TDateField
      FieldName = 'Date_'
    end
    object cdsViewCardFrom_: TSmallintField
      FieldName = 'CardFrom_'
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
