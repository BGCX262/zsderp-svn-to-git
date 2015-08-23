object FrmLTL: TFrmLTL
  Left = 0
  Top = 0
  Caption = #24555#36882#29366#24577#36319#36394#34920
  ClientHeight = 386
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ZSDDBGrid1: TZSDDBGrid
    Left = 147
    Top = 0
    Width = 594
    Height = 386
    Align = alClient
    DataSource = dsViewB
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DeliveryNo_'
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#21333#21495' '
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ArrivalTime_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21040#36798#26102#38388
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DeliveryStatus_'
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#26356#36394#29366#24577
        Width = 204
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
      end>
  end
  object ZSDDBGrid2: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 147
    Height = 386
    Align = alLeft
    DataSource = dsViewA
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DeliveryNo_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24555#36882#21333#21495
        Width = 130
        Visible = True
      end>
  end
  object ZSDTool1: TZSDTool
    mAppend = True
    mEdit = True
    mSave = True
    mConfirm = True
    mFind = True
    mRevocation = False
    mDel = True
    mPrint = True
    mFPrint = True
    mAudit = False
    aDataSet = cdsViewA
    OnSave = ZSDTool1Save
    Left = 48
    Top = 140
  end
  object cdsViewB: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewBNewRecord
    Left = 278
    Top = 206
    object cdsViewBDeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      Size = 40
    end
    object cdsViewBArrivalTime_: TSQLTimeStampField
      FieldName = 'ArrivalTime_'
    end
    object cdsViewBAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewBDeliveryStatus_: TStringField
      FieldName = 'DeliveryStatus_'
      Size = 40
    end
    object cdsViewBPID_: TStringField
      FieldName = 'PID_'
      Size = 38
    end
  end
  object dsViewB: TDataSource
    DataSet = cdsViewB
    Left = 388
    Top = 222
  end
  object cdsViewA: TZSDDataSet
    Aggregates = <>
    Params = <>
    BeforeDelete = cdsViewABeforeDelete
    AfterDelete = cdsViewAAfterDelete
    AfterScroll = cdsViewAAfterScroll
    Left = 48
    Top = 212
    object cdsViewADeliveryNo_: TStringField
      FieldName = 'DeliveryNo_'
      OnChange = cdsViewADeliveryNo_Change
      Size = 40
    end
  end
  object dsViewA: TDataSource
    DataSet = cdsViewA
    Left = 50
    Top = 276
  end
end
