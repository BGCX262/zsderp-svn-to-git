object FrmRMMS: TFrmRMMS
  Left = 0
  Top = 0
  Caption = #29289#26009#31649#29702#30331#35760#31995#32479
  ClientHeight = 393
  ClientWidth = 776
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
    Width = 776
    Height = 393
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
        FieldName = 'ReleaseDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21457#25918#26085#26399
        Width = 100
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CollarOrNetwork_'
        Title.Alignment = taCenter
        Title.Caption = #39046#29992#20154#25110#32593#28857
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MaterialName_'
        Title.Alignment = taCenter
        Title.Caption = #29289#26009#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity_'
        Title.Alignment = taCenter
        Title.Caption = #25968#37327'('#20221')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount_'
        Title.Alignment = taCenter
        Title.Caption = #37329#39069'('#65509')'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentStatus_'
        Title.Alignment = taCenter
        Title.Caption = #20184#27454#24773#20917
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
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
    Left = 116
    Top = 84
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewNewRecord
    Left = 196
    Top = 88
    object cdsViewReleaseDate_: TSQLTimeStampField
      FieldName = 'ReleaseDate_'
    end
    object cdsViewCollarOrNetwork_: TStringField
      FieldName = 'CollarOrNetwork_'
    end
    object cdsViewMaterialName_: TStringField
      FieldName = 'MaterialName_'
    end
    object cdsViewQuantity_: TStringField
      FieldName = 'Quantity_'
    end
    object cdsViewAmount_: TSingleField
      FieldName = 'Amount_'
    end
    object cdsViewPaymentStatus_: TStringField
      FieldName = 'PaymentStatus_'
    end
    object cdsViewRemark_: TStringField
      FieldName = 'Remark_'
      Size = 40
    end
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 252
    Top = 88
  end
end
