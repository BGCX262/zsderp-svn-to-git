object FrmHRContact: TFrmHRContact
  Left = 0
  Top = 0
  Caption = #29992#25143#32852#31995#26041#24335#32500#25252
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
        FieldName = 'TYPE_'
        Title.Alignment = taCenter
        Title.Caption = #31867#22411
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE_'
        Title.Alignment = taCenter
        Title.Caption = #25163#26426'/'#24080#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL_'
        Title.Alignment = taCenter
        Title.Caption = #30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX_'
        Title.Alignment = taCenter
        Title.Caption = #20256#30495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RELATIONSHIP_'
        Title.Alignment = taCenter
        Title.Caption = #20851#31995
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROFESSION_'
        Title.Alignment = taCenter
        Title.Caption = #32844#20301
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
        FieldName = 'APPUSER_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'APPDATE_'
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UPDATEUSER_'
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
    object cdsViewFORID_: TStringField
      FieldName = 'FormID_'
      Size = 30
    end
    object cdsViewTYPE_: TStringField
      FieldName = 'TYPE_'
    end
    object cdsViewPHONE_: TStringField
      FieldName = 'PHONE_'
    end
    object cdsViewTEL_: TStringField
      FieldName = 'TEL_'
    end
    object cdsViewFAX_: TStringField
      FieldName = 'FAX_'
    end
    object cdsViewRELATIONSHIP_: TStringField
      FieldName = 'RELATIONSHIP_'
      Size = 10
    end
    object cdsViewPROFESSION_: TStringField
      FieldName = 'PROFESSION_'
      Size = 30
    end
    object cdsViewADDRESS_: TStringField
      FieldName = 'ADDRESS_'
      Size = 50
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
