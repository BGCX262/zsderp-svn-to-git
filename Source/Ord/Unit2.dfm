object frmzbandcl: Tfrmzbandcl
  Left = 0
  Top = 0
  Caption = #25105#30340#27979#35797#31383#20307
  ClientHeight = 389
  ClientWidth = 567
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
    Width = 567
    Height = 389
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'user_'
        ReadOnly = True
        Title.Caption = #29992#25143
        Visible = True
      end
      item
        Expanded = False
        FieldName = '32r32r2'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_'
        ReadOnly = True
        Title.Caption = #22995#21517
        Visible = True
      end>
  end
  object ZSDDataSet1: TZSDDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 104
    object ZSDDataSet1user_: TStringField
      FieldName = 'user_'
    end
    object ZSDDataSet1name_: TStringField
      FieldName = 'name_'
    end
  end
  object DataSource1: TDataSource
    DataSet = ZSDDataSet1
    Left = 72
    Top = 192
  end
end
