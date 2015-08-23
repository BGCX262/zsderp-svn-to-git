object FrmPersonnelChange: TFrmPersonnelChange
  Left = 0
  Top = 0
  Caption = #20154#20107#21464#26356#21333
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
        FieldName = 'STATUS_'
        Title.Alignment = taCenter
        Title.Caption = #21333#25454#29366#24577
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
        FieldName = 'REMARK_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPUSER_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPDATE_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UpdateUser_'
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATEDATE_'
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
        Expanded = False
        FieldName = 'IT_'
        Title.Alignment = taCenter
        Title.Caption = #24207
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Code_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLUMN_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#25968#25454#21015
        Width = 0
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29992#25143#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COLUMNNAME_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20869#23481
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OLDVAR_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21407#20540
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NEWVER_'
        Title.Alignment = taCenter
        Title.Caption = #26032#20540
        Width = 214
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
        Width = 261
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
    object cdsViewbIT_: TSmallintField
      FieldName = 'IT_'
    end
    object cdsViewbSID_: TStringField
      FieldName = 'Code_'
      Size = 38
    end
    object cdsViewbCOLUMN_: TStringField
      FieldName = 'COLUMN_'
    end
    object cdsViewbCOLUMNNAME_: TStringField
      FieldName = 'COLUMNNAME_'
    end
    object cdsViewbOLDVAR_: TStringField
      FieldName = 'OLDVAR_'
      Size = 60
    end
    object cdsViewbNEWVER_: TStringField
      FieldName = 'NEWVER_'
      Size = 60
    end
    object cdsViewbREMARK_: TStringField
      FieldName = 'REMARK_'
      Size = 60
    end
    object cdsViewbuName: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'uName'
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
    Left = 64
    Top = 168
  end
end
