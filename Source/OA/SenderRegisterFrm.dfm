object FrmSenderRegister: TFrmSenderRegister
  Left = 0
  Top = 0
  Caption = #21457#20214#30331#35760#31995#32479
  ClientHeight = 417
  ClientWidth = 779
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
    Width = 779
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
        FieldName = 'Destination_'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#22320
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Weight_'
        Title.Alignment = taCenter
        Title.Caption = #37325#37327'(Kg)'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PayAmount_'
        Title.Alignment = taCenter
        Title.Caption = #29616#20184#37329#39069'('#65509')'
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
        Expanded = False
        FieldName = 'DestinaPrice_'
        Title.Alignment = taCenter
        Title.Caption = #30446#30340#22320#21333#20215'('#65509')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dffk_'
        Title.Alignment = taCenter
        Title.Caption = #21040#20184#36820#27454
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentPeople_'
        Title.Alignment = taCenter
        Title.Caption = #20132#27454#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentStatus_'
        Title.Alignment = taCenter
        Title.Caption = #20132#27454#29366#24577
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
        Width = 100
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
    Left = 174
    Top = 126
    object cdsViewDate_: TSQLTimeStampField
      FieldName = 'Date_'
    end
    object cdsViewDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewDestination_: TStringField
      FieldName = 'Destination_'
      Size = 40
    end
    object cdsViewWeight_: TSingleField
      FieldName = 'Weight_'
    end
    object cdsViewPayAmount_: TSingleField
      FieldName = 'PayAmount_'
    end
    object cdsViewToPayAmount_: TSingleField
      FieldName = 'ToPayAmount_'
    end
    object cdsViewDestinaPrice_: TSingleField
      FieldName = 'DestinaPrice_'
    end
    object cdsViewPaymentPeople_: TStringField
      FieldName = 'PaymentPeople_'
    end
    object cdsViewPaymentStatus_: TStringField
      FieldName = 'PaymentStatus_'
    end
    object cdsViewUpDateUser_: TStringField
      FieldName = 'UpDateUser_'
    end
    object cdsViewUpDateDate_: TSQLTimeStampField
      FieldName = 'UpDateDate_'
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewdffk_: TSingleField
      FieldName = 'dffk_'
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
    Left = 62
    Top = 126
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 254
    Top = 126
  end
end
