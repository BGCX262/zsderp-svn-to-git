object FrmHRRewards: TFrmHRRewards
  Left = 0
  Top = 0
  Caption = #20154#20107#22870#24809#21333
  ClientHeight = 402
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
  object Splitter1: TSplitter
    Left = 0
    Top = 114
    Width = 725
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 288
  end
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 114
    Align = alTop
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
        FieldName = 'DMNO_'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DMDate_'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TYPE_'
        Title.Alignment = taCenter
        Title.Caption = #21333#25569#31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Final_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29983#25928#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS_'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPUSER_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Width = 144
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
        FieldName = 'UPDATEDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
  end
  object DBGrid2: TZSDDBGrid
    Left = 0
    Top = 117
    Width = 725
    Height = 285
    Align = alClient
    DataSource = dsViewb
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEditButtonClick = DBGrid2EditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CODE_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBJECT_'
        Title.Alignment = taCenter
        Title.Caption = #20107#30001
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'manner_'
        Title.Alignment = taCenter
        Title.Caption = #22870#24809#26041#24335
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT_'
        Title.Alignment = taCenter
        Title.Caption = #37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Visible = True
      end>
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 160
    Top = 56
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    BeforeDelete = cdsViewBeforeDelete
    AfterScroll = cdsViewAfterScroll
    OnNewRecord = cdsViewNewRecord
    Left = 96
    Top = 56
    object cdsViewID_: TStringField
      FieldName = 'ID_'
      Size = 38
    end
    object cdsViewDMNO_: TStringField
      FieldName = 'DMNO_'
    end
    object cdsViewDMDate_: TDateField
      FieldName = 'DMDate_'
    end
    object cdsViewSTATUS_: TSmallintField
      FieldName = 'STATUS_'
    end
    object cdsViewTYPE_: TStringField
      FieldName = 'TYPE_'
    end
    object cdsViewREMARK_: TStringField
      FieldName = 'REMARK_'
      Size = 60
    end
    object cdsViewAPPUSER_: TStringField
      FieldName = 'APPUSER_'
    end
    object cdsViewUPDDATEUSE_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewAPPDATE_: TSQLTimeStampField
      FieldName = 'APPDATE_'
    end
    object cdsViewUPDATEDATE_: TSQLTimeStampField
      FieldName = 'UPDATEDATE_'
    end
    object cdsViewFinal_: TIntegerField
      FieldName = 'Final_'
    end
  end
  object dsViewb: TDataSource
    DataSet = cdsViewb
    Left = 176
    Top = 240
  end
  object cdsViewb: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnCalcFields = cdsViewbCalcFields
    OnNewRecord = cdsViewbNewRecord
    Left = 96
    Top = 240
    object cdsViewbPID_: TStringField
      FieldName = 'PID_'
      Size = 38
    end
    object cdsViewbID_: TStringField
      FieldName = 'ID_'
      Size = 38
    end
    object cdsViewbCODE_: TStringField
      FieldName = 'CODE_'
    end
    object cdsViewbSUBJECT_: TStringField
      FieldName = 'SUBJECT_'
    end
    object cdsViewbAMOUNT_: TSingleField
      FieldName = 'AMOUNT_'
    end
    object cdsViewbREMARK_: TStringField
      FieldName = 'REMARK_'
      Size = 60
    end
    object cdsViewbmanner_: TStringField
      FieldName = 'manner_'
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
    mAudit = True
    aDataSet = cdsView
    OnSave = ZSDTool1Save
    OnConfirm = ZSDTool1Confirm
    OnRevocation = ZSDTool1Revocation
    Left = 16
    Top = 168
  end
end
