object FrmSPTPMR: TFrmSPTPMR
  Left = 0
  Top = 0
  Caption = #27966#20214#21040#20184#27454#30331#35760#31995#32479
  ClientHeight = 399
  ClientWidth = 785
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
    Width = 785
    Height = 399
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEditButtonClick = ZSDDBGrid1EditButtonClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
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
        FieldName = 'ToPayAmount_'
        Title.Alignment = taCenter
        Title.Caption = #21040#20184#37329#39069'('#65509')'
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Distributer_'
        Title.Alignment = taCenter
        Title.Caption = #27966#20214#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaySituation_'
        Title.Alignment = taCenter
        Title.Caption = #32564#32435#24773#20917
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
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 188
    Top = 114
    object cdsViewDate_: TSQLTimeStampField
      FieldName = 'Date_'
    end
    object cdsViewDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewToPayAmount_: TSingleField
      FieldName = 'ToPayAmount_'
    end
    object cdsViewDistributer_: TStringField
      FieldName = 'Distributer_'
    end
    object cdsViewPaySituation_: TStringField
      FieldName = 'PaySituation_'
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
    Left = 90
    Top = 108
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 268
    Top = 118
  end
end
