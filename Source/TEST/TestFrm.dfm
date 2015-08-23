object FrmTest: TFrmTest
  Left = 0
  Top = 0
  Caption = 'FrmTest'
  ClientHeight = 329
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 578
    Height = 329
    Align = alClient
    DataSource = dsFile
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #25991#20214#21517
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        Title.Alignment = taCenter
        Title.Caption = #19978#20256#20154#21592
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        Title.Alignment = taCenter
        Title.Caption = #19978#20256#26085#26399
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
        FieldName = 'UPdateDate_'
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dir_'
        Title.Alignment = taCenter
        Title.Caption = #25152#22312#30446#24405
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLastTime_'
        Title.Alignment = taCenter
        Title.Caption = #20462#25913#26102#38388
        Visible = True
      end>
  end
  object dsFile: TDataSource
    DataSet = cdsFile
    Left = 192
    Top = 136
  end
  object OpenDialog1: TOpenDialog
    Left = 48
    Top = 137
  end
  object cdsFile: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsFileNewRecord
    Left = 136
    Top = 144
  end
end
