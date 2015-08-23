object FrmSup: TFrmSup
  Left = 0
  Top = 0
  Caption = #29992#25143#33756#21333#31649#29702
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
    Columns = <
      item
        Expanded = False
        FieldName = 'Code_'
        Title.Alignment = taCenter
        Title.Caption = #32534#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SName_'
        Title.Alignment = taCenter
        Title.Caption = #31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #20840#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tel_'
        Title.Alignment = taCenter
        Title.Caption = #30005#35805
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fax_'
        Title.Alignment = taCenter
        Title.Caption = #20256#30495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QQ_'
        Title.Alignment = taCenter
        Title.Caption = 'QQ'#24080#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MSN_'
        Title.Alignment = taCenter
        Title.Caption = 'MSN'#24080#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WangWang_'
        Title.Alignment = taCenter
        Title.Caption = #26106#26106#24080#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BHI_'
        Title.Alignment = taCenter
        Title.Caption = #30334#24230'HI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Address_'
        Title.Alignment = taCenter
        Title.Caption = #22320#22336
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
    OnNewRecord = cdsViewNewRecord
    Left = 144
    Top = 96
    object cdsViewID_: TGuidField
      FieldName = 'ID_'
      FixedChar = True
      Size = 38
    end
    object cdsViewCode_: TStringField
      FieldName = 'Code_'
      Size = 10
    end
    object cdsViewSName_: TStringField
      FieldName = 'SName_'
    end
    object cdsViewName_: TStringField
      FieldName = 'Name_'
      Size = 40
    end
    object cdsViewTel_: TStringField
      FieldName = 'Tel_'
    end
    object cdsViewFax_: TStringField
      FieldName = 'Fax_'
    end
    object cdsViewQQ_: TStringField
      FieldName = 'QQ_'
      Size = 15
    end
    object cdsViewMSN_: TStringField
      FieldName = 'MSN_'
    end
    object cdsViewWangWang_: TStringField
      FieldName = 'WangWang_'
    end
    object cdsViewBHI_: TStringField
      FieldName = 'BHI_'
    end
    object cdsViewAddress_: TStringField
      FieldName = 'Address_'
      Size = 60
    end
    object cdsViewIsCus_: TSmallintField
      FieldName = 'IsCus_'
    end
    object cdsViewIsSup_: TSmallintField
      FieldName = 'IsSup_'
    end
    object cdsViewIsOur_: TSmallintField
      FieldName = 'IsOur_'
    end
  end
end
