object FrmFINANCIALM: TFrmFINANCIALM
  Left = 0
  Top = 0
  Caption = #20844#21496#26085#24120#36130#21153#31649#29702
  ClientHeight = 402
  ClientWidth = 781
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
    Width = 781
    Height = 402
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
        FieldName = 'DATE_'
        Title.Alignment = taCenter
        Title.Caption = #26085#26399
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUTAMOUNT_'
        Title.Alignment = taCenter
        Title.Caption = #25903#20986#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUTPRO_'
        Title.Alignment = taCenter
        Title.Caption = #25903#20986#39033#30446
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTOAMOUNT_'
        Title.Alignment = taCenter
        Title.Caption = #25903#20837#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INTOPRO_'
        Title.Alignment = taCenter
        Title.Caption = #25903#20837#39033#30446
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BALANCE_'
        Title.Alignment = taCenter
        Title.Caption = #32467#20313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARKS_'
        Title.Alignment = taCenter
        Title.Caption = #22791#27880
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
    Left = 168
    Top = 304
    object cdsViewDATE_: TSQLTimeStampField
      FieldName = 'DATE_'
    end
    object cdsViewOUTAMOUNT_: TSingleField
      FieldName = 'OUTAMOUNT_'
    end
    object cdsViewOUTPRO_: TStringField
      FieldName = 'OUTPRO_'
    end
    object cdsViewINTOAMOUNT_: TSingleField
      FieldName = 'INTOAMOUNT_'
    end
    object cdsViewINTOPRO_: TStringField
      FieldName = 'INTOPRO_'
    end
    object cdsViewREMARKS_: TStringField
      FieldName = 'REMARKS_'
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
    object cdsViewBALANCE_: TSingleField
      FieldName = 'BALANCE_'
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
    Left = 272
    Top = 304
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 88
    Top = 304
  end
end
