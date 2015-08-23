object FrmLCFMR: TFrmLCFMR
  Left = 0
  Top = 0
  Caption = #22823#36135#36153#29992#30331#35760#31995#32479
  ClientHeight = 415
  ClientWidth = 780
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
    Width = 780
    Height = 415
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
        FieldName = 'Weight_'
        Title.Alignment = taCenter
        Title.Caption = #37325#37327'(Kg)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount_'
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Salesman_'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentStatus_'
        Title.Alignment = taCenter
        Title.Caption = #25903#20184#24773#20917
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPUSER_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26102#38388
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATEUSER_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATEDATE_'
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
    Left = 100
    Top = 324
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewNewRecord
    Left = 178
    Top = 320
    object cdsViewDate_: TSQLTimeStampField
      FieldName = 'Date_'
    end
    object cdsViewDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewWeight_: TSingleField
      FieldName = 'Weight_'
    end
    object cdsViewAmount_: TSingleField
      FieldName = 'Amount_'
    end
    object cdsViewSalesman_: TStringField
      FieldName = 'Salesman_'
    end
    object cdsViewPaymentStatus_: TStringField
      FieldName = 'PaymentStatus_'
    end
    object cdsViewAPPUSER_: TStringField
      FieldName = 'APPUSER_'
    end
    object cdsViewAPPDATE_: TSQLTimeStampField
      FieldName = 'APPDATE_'
    end
    object cdsViewUPDATEUSER_: TStringField
      FieldName = 'UPDATEUSER_'
    end
    object cdsViewUPDATEDATE_: TSQLTimeStampField
      FieldName = 'UPDATEDATE_'
    end
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 268
    Top = 328
  end
end
