object FrmHRSocialSecurityDetails: TFrmHRSocialSecurityDetails
  Left = 0
  Top = 0
  Caption = #34218#36164#28014#21160#25187#34917#39033#32500#25252
  ClientHeight = 417
  ClientWidth = 811
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
  object DBGrid2: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 811
    Height = 417
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
        FieldName = 'UserCode_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PCNO_'
        Title.Alignment = taCenter
        Title.Caption = #20010#20154#30005#33041#21495
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotalAmount_'
        Title.Alignment = taCenter
        Title.Caption = #24212#32564#24635#37329#39069
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Wages_'
        Title.Alignment = taCenter
        Title.Caption = #24037#36164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldPPay_'
        Title.Alignment = taCenter
        Title.Caption = #20859#32769#20010#20154#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldUPay_'
        Title.Alignment = taCenter
        Title.Caption = #20859#32769#21333#20301#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InjuryPPay_'
        Title.Alignment = taCenter
        Title.Caption = #24037#20260#20010#20154#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InjuryUPay_'
        Title.Alignment = taCenter
        Title.Caption = #24037#20260#21333#20301#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MaternityPPay_'
        Title.Alignment = taCenter
        Title.Caption = #29983#32946#20010#20154#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MaternityUPay_'
        Title.Alignment = taCenter
        Title.Caption = #29983#32946#21333#20301#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MedicalPPay_'
        Title.Alignment = taCenter
        Title.Caption = #21307#30103#20010#20154#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MedicalUPay_'
        Title.Alignment = taCenter
        Title.Caption = #21307#30103#21333#20301#20132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnemploymentPPay_'
        Title.Alignment = taCenter
        Title.Caption = #22833#19994#20010#20154#20132
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnemploymentUPay_'
        Title.Alignment = taCenter
        Title.Caption = #22833#19994#21333#20301#20132
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
        FieldName = 'UpdateDate'
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
    OnCalcFields = cdsViewCalcFields
    OnNewRecord = cdsViewNewRecord
    Left = 56
    Top = 200
    object cdsViewID_: TStringField
      FieldName = 'ID_'
      Size = 40
    end
    object cdsViewUser_: TStringField
      FieldName = 'UserCode_'
    end
    object cdsViewPCNO_: TStringField
      FieldName = 'PCNO_'
    end
    object cdsViewTotalAmount_: TSmallintField
      FieldName = 'TotalAmount_'
    end
    object cdsViewWages_: TSmallintField
      FieldName = 'Wages_'
    end
    object cdsViewOldPPay_: TSmallintField
      FieldName = 'OldPPay_'
    end
    object cdsViewOldUPay_: TSmallintField
      FieldName = 'OldUPay_'
    end
    object cdsViewInjuryPPay_: TSmallintField
      FieldName = 'InjuryPPay_'
    end
    object cdsViewInjuryUPay_: TSmallintField
      FieldName = 'InjuryUPay_'
    end
    object cdsViewMaternityPPay_: TSmallintField
      FieldName = 'MaternityPPay_'
    end
    object cdsViewMaternityUPay_: TSmallintField
      FieldName = 'MaternityUPay_'
    end
    object cdsViewMedicalPPay_: TSmallintField
      FieldName = 'MedicalPPay_'
    end
    object cdsViewMedicalUPay_: TSmallintField
      FieldName = 'MedicalUPay_'
    end
    object cdsViewUnemploymentPPay_: TSmallintField
      FieldName = 'UnemploymentPPay_'
    end
    object cdsViewUnemploymentUPay_: TSmallintField
      FieldName = 'UnemploymentUPay_'
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
      FieldName = 'UpdateDate_'
    end
    object cdsViewuName: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'uName'
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
