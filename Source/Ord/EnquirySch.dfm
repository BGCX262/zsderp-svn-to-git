object SchEnquiry: TSchEnquiry
  Left = 0
  Top = 0
  Caption = #23458#25143#35810#20215#21333#26597#35810
  ClientHeight = 385
  ClientWidth = 725
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
        FieldName = 'CusCode_'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#32534#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesCode_'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#32534#30721
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
        FieldName = 'UpdateDate_'
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'PartCode_'
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brand'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21697#29260
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21697#21517
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Spec'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #35268#26684
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UP_'
        Title.Alignment = taCenter
        Title.Caption = #21333#20215
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
    OnCalcFields = cdsViewCalcFields
    Left = 144
    Top = 96
    object cdsViewPartCode_: TStringField
      FieldName = 'PartCode_'
      Size = 40
    end
    object cdsViewUP_: TSingleField
      FieldName = 'UP_'
    end
    object cdsViewbrand_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'brand'
      Size = 40
    end
    object cdsViewDesc_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Desc'
      Size = 100
    end
    object cdsViewSpec_: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Spec'
      Size = 100
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewUpdateDate_: TSQLTimeStampField
      FieldName = 'UpdateDate_'
    end
    object cdsViewUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewCusCode_: TStringField
      FieldName = 'CusCode_'
    end
    object cdsViewSalesCode_: TStringField
      FieldName = 'SalesCode_'
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
