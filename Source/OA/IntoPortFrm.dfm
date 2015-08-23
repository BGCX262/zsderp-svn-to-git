object FrmIntoPort: TFrmIntoPort
  Left = 0
  Top = 0
  Caption = #36827#28207#20449#24687#31649#29702
  ClientHeight = 430
  ClientWidth = 764
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
    Width = 764
    Height = 430
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
        FieldName = 'FLIGHTDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #33322#29677#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPPER_'
        Title.Alignment = taCenter
        Title.Caption = #21457#20214#20844#21496
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLIGHTNO_'
        Title.Alignment = taCenter
        Title.Caption = #33322#29677
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FQUANTITY_'
        Title.Alignment = taCenter
        Title.Caption = #39044#25253#20214#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FWEIGHT_'
        Title.Alignment = taCenter
        Title.Caption = #39044#25253#37325#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RQUANTITY_'
        Title.Alignment = taCenter
        Title.Caption = #23454#25552#20214#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RWEIGHT_'
        Title.Alignment = taCenter
        Title.Caption = #23454#25552#37325#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNSITUATION_'
        Title.Alignment = taCenter
        Title.Caption = #24322#24120#24773#20917
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
        Width = 100
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
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 264
    Top = 304
    object cdsViewFLIGHTDATE_: TDateField
      FieldName = 'FLIGHTDATE_'
    end
    object cdsViewSHIPPER_: TStringField
      FieldName = 'SHIPPER_'
    end
    object cdsViewFLIGHTNO_: TStringField
      FieldName = 'FLIGHTNO_'
    end
    object cdsViewFQUANTITY_: TSmallintField
      FieldName = 'FQUANTITY_'
    end
    object cdsViewFWEIGHT_: TSingleField
      FieldName = 'FWEIGHT_'
    end
    object cdsViewRQUANTITY_: TSmallintField
      FieldName = 'RQUANTITY_'
    end
    object cdsViewRWEIGHT_: TSingleField
      FieldName = 'RWEIGHT_'
    end
    object cdsViewUNSITUATION_: TStringField
      FieldName = 'UNSITUATION_'
      Size = 40
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
    Left = 184
    Top = 288
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 400
    Top = 312
  end
end
