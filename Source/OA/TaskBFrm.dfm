object FrmTaskB: TFrmTaskB
  Left = 0
  Top = 0
  Caption = #20219#21153#26126#32454#32500#25252
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
  object DBGrid2: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 385
    Align = alClient
    DataSource = dsViewb
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Content_'
        Title.Alignment = taCenter
        Title.Caption = #20869#23481
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsible_'
        Title.Alignment = taCenter
        Title.Caption = #24403#21069#36131#20219#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppUser_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#20154#21592
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AppDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
  end
  object dsViewb: TDataSource
    DataSet = cdsViewb
    Left = 192
    Top = 96
  end
  object cdsViewb: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewbNewRecord
    Left = 144
    Top = 96
  end
end
