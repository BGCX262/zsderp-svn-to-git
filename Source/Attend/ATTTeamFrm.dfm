object FrmATTTeam: TFrmATTTeam
  Left = 0
  Top = 0
  Caption = #32771#21220#29677#32452#21035#35774#23450
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
        FieldName = 'Code_'
        Title.Alignment = taCenter
        Title.Caption = #29677#27425#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #29677#27425#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InTime1_'
        Title.Alignment = taCenter
        Title.Caption = #26089#29677#20837
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
        FieldName = 'NotWork_'
        Title.Alignment = taCenter
        Title.Caption = #26143#26399#20960#19981#19978#29677
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
        FieldName = 'APPDATE_'
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
        FieldName = 'UpdateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkTime_'
        Title.Alignment = taCenter
        Title.Caption = #26631#20934#19978#29677#26102#38388#65288#20998#65289
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
    object cdsViewCode_: TStringField
      FieldName = 'Code_'
    end
    object cdsViewName_: TStringField
      FieldName = 'Name_'
    end
    object cdsViewInTime1_: TStringField
      DisplayWidth = 8
      FieldName = 'InTime1_'
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
    object cdsViewUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewAPPDATE_: TSQLTimeStampField
      FieldName = 'APPDATE_'
    end
    object cdsViewUpdateDate_: TSQLTimeStampField
      FieldName = 'UpdateDate_'
    end
    object cdsViewNotWork_: TStringField
      FieldName = 'NotWork_'
    end
    object cdsViewWorkTime_: TSingleField
      FieldName = 'WorkTime_'
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
