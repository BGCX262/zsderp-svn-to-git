object FrmEnquriyH: TFrmEnquriyH
  Left = 0
  Top = 0
  Caption = #23458#25143#35810#20215#21333
  ClientHeight = 385
  ClientWidth = 725
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
  object SpeedButton1: TSpeedButton
    Left = 168
    Top = 120
    Width = 23
    Height = 22
  end
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
    OnDblClick = DBGrid1DblClick
    OnEditButtonClick = DBGrid1EditButtonClick
    Columns = <
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'CusCode_'
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#32534#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CusName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #23458#25143#31616#31216
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesCode_'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#22995#21517
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #28155#21152#26085#26399
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
        FieldName = 'UpdateDate_'
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
    OnCalcFields = cdsViewCalcFields
    OnNewRecord = cdsViewNewRecord
    Left = 144
    Top = 96
    object cdsViewID_: TStringField
      FieldName = 'ID_'
      Size = 40
    end
    object cdsViewCusCode_: TStringField
      FieldName = 'CusCode_'
    end
    object cdsViewCusName: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CusName'
      Size = 40
    end
    object cdsViewSalesCode_: TStringField
      FieldName = 'SalesCode_'
    end
    object cdsViewSalesName: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'SalesName'
      Size = 40
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewUpdateDate_: TSQLTimeStampField
      FieldName = 'UpdateDate_'
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
    Left = 360
    Top = 200
  end
end
