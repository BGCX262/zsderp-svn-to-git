object FrmSSfinancial: TFrmSSfinancial
  Left = 0
  Top = 0
  Caption = #36716#20214#36130#21153#31649#29702#31995#32479
  ClientHeight = 403
  ClientWidth = 770
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
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 770
    Height = 403
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ShiftSingleDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #36716#21333#26085#26399
        Width = 100
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DeliveryNo_'
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#21333#21495
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SourceIncome_'
        Title.Alignment = taCenter
        Title.Caption = #25910#20837#26469#28304
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Counterparts_'
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#20844#21496
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShiftSingleNo_'
        Title.Alignment = taCenter
        Title.Caption = #36716#21333#21333#21495
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ShiftSingleCost_'
        Title.Alignment = taCenter
        Title.Caption = #36716#21333#36153#29992'('#65509')'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26102#38388
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpDateUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpDateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26102#38388
        Width = 100
        Visible = True
      end>
  end
  object ZSDTool1: TZSDTool
    mAppend = False
    mEdit = True
    mSave = True
    mConfirm = False
    mFind = True
    mRevocation = False
    mDel = True
    mPrint = True
    mFPrint = True
    mAudit = False
    aDataSet = cdsView
    Left = 76
    Top = 122
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 184
    Top = 120
    object cdsViewShiftSingleDate_: TSQLTimeStampField
      FieldName = 'ShiftSingleDate_'
    end
    object cdsViewDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewSourceIncome_: TStringField
      FieldName = 'SourceIncome_'
      Size = 38
    end
    object cdsViewCounterparts_: TStringField
      FieldName = 'Counterparts_'
      Size = 38
    end
    object cdsViewShiftSingleNo_: TStringField
      FieldName = 'ShiftSingleNo_'
      Size = 40
    end
    object cdsViewShiftSingleCost_: TSingleField
      FieldName = 'ShiftSingleCost_'
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
  object dsView: TDataSource
    DataSet = cdsView
    Left = 246
    Top = 124
  end
end
