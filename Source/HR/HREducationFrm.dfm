object FrmHREducation: TFrmHREducation
  Left = 0
  Top = 0
  Caption = #22521#35757#25945#32946#32463#21385
  ClientHeight = 385
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
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 385
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
        FieldName = 'Type_'
        Title.Alignment = taCenter
        Title.Caption = #31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATESTART_'
        Title.Alignment = taCenter
        Title.Caption = #24320#22987#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATEEND_'
        Title.Alignment = taCenter
        Title.Caption = #32467#26463#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME_'
        Title.Alignment = taCenter
        Title.Caption = #21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS_'
        Title.Alignment = taCenter
        Title.Caption = #22320#22336
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
      end
      item
        Expanded = False
        FieldName = 'CERTIFICATE_'
        Title.Alignment = taCenter
        Title.Caption = #35777#20070
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPUSER_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPDATE_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATEUSER_'
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
  object dsView: TDataSource
    DataSet = cdsView
    Left = 192
    Top = 96
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAfterEdit
    OnNewRecord = cdsViewNewRecord
    Left = 144
    Top = 96
    object cdsViewPID_: TStringField
      FieldName = 'PID_'
      Size = 38
    end
    object cdsViewCODE_: TStringField
      FieldName = 'CODE_'
    end
    object cdsViewDATESTART_: TDateField
      FieldName = 'DATESTART_'
    end
    object cdsViewDATEEND_: TDateField
      FieldName = 'DATEEND_'
    end
    object cdsViewNAME_: TStringField
      FieldName = 'NAME_'
      Size = 30
    end
    object cdsViewADDRESS_: TStringField
      FieldName = 'ADDRESS_'
      Size = 60
    end
    object cdsViewAMOUNT_: TSingleField
      FieldName = 'AMOUNT_'
    end
    object cdsViewREMARK_: TStringField
      FieldName = 'REMARK_'
      Size = 60
    end
    object cdsViewCERTIFICATE_: TStringField
      FieldName = 'CERTIFICATE_'
      Size = 30
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
    object cdsViewType_: TStringField
      FieldName = 'Type_'
      Size = 10
    end
  end
  object ZSDTool1: TZSDTool
    mAppend = False
    mEdit = False
    mSave = False
    mConfirm = False
    mFind = False
    mRevocation = False
    mDel = False
    mPrint = False
    mFPrint = False
    mAudit = False
    aDataSet = cdsView
    Left = 80
    Top = 96
  end
end
