object FrmExpressInput: TFrmExpressInput
  Left = 0
  Top = 0
  Caption = #24555#36882#21333#24405#20837
  ClientHeight = 416
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ZSDDBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 782
    Height = 416
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = ZSDDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DeliveryNo_'
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#21333#21495
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BasicInfo_'
        Title.Alignment = taCenter
        Title.Caption = #22522#26412#20449#24687
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpDateUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpDateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Width = 100
        Visible = True
      end>
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 168
    Top = 232
    object cdsViewDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewBasicInfo_: TStringField
      FieldName = 'BasicInfo_'
      Size = 40
    end
    object cdsViewRemark_: TStringField
      FieldName = 'Remark_'
      Size = 40
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewUpDateUser_: TStringField
      FieldName = 'UpDateUser_'
    end
    object cdsViewUpDateDate_: TSQLTimeStampField
      FieldName = 'UpDateDate_'
    end
  end
  object ZSDTool1: TZSDTool
    mAppend = True
    mEdit = True
    mSave = True
    mConfirm = True
    mFind = True
    mRevocation = True
    mDel = True
    mPrint = True
    mFPrint = True
    mAudit = False
    aDataSet = cdsView
    Left = 88
    Top = 232
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 272
    Top = 240
  end
end
