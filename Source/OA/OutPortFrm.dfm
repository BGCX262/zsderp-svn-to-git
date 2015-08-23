object FrmOutPort: TFrmOutPort
  Left = 0
  Top = 0
  Caption = #20986#28207#20449#24687#31649#29702
  ClientHeight = 388
  ClientWidth = 790
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
    Width = 790
    Height = 388
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
        FieldName = 'LOGISTICSDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29289#27969#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNDERNETWORK_'
        Title.Alignment = taCenter
        Title.Caption = #19979#23646#32593#28857
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGISTICSINFO_'
        Title.Alignment = taCenter
        Title.Caption = #29289#27969#20449#24687
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGISTICSCOST_'
        Title.Alignment = taCenter
        Title.Caption = #29289#27969#36153#29992
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVERYDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #25552#36135#26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DELIVERYITEMS_'
        Title.Alignment = taCenter
        Title.Caption = #25552#36135#20214#25968
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
        FieldName = 'AUDIT_'
        Title.Alignment = taCenter
        Title.Caption = #23457#26680
        Width = 70
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
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 200
    Top = 296
    object cdsViewLOGISTICSDATE_: TDateField
      FieldName = 'LOGISTICSDATE_'
    end
    object cdsViewUNDERNETWORK_: TStringField
      FieldName = 'UNDERNETWORK_'
    end
    object cdsViewLOGISTICSINFO_: TStringField
      FieldName = 'LOGISTICSINFO_'
    end
    object cdsViewDELIVERYDATE_: TDateField
      FieldName = 'DELIVERYDATE_'
    end
    object cdsViewDELIVERYITEMS_: TSmallintField
      FieldName = 'DELIVERYITEMS_'
    end
    object cdsViewUNSITUATION_: TStringField
      FieldName = 'UNSITUATION_'
      Size = 40
    end
    object cdsViewAUDIT_: TStringField
      FieldName = 'AUDIT_'
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
    object cdsViewLOGISTICSCOST_: TSingleField
      FieldName = 'LOGISTICSCOST_'
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
    Left = 104
    Top = 288
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 280
    Top = 304
  end
end
