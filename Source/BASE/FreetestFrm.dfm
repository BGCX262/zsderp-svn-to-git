object FrmFreetest: TFrmFreetest
  Left = 0
  Top = 0
  Caption = #20135#21697#36164#26009#32500#25252
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
    Height = 352
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 352
    Width = 725
    Height = 33
    Align = alBottom
    TabOrder = 1
    Visible = False
    object CheckBox1: TCheckBox
      Left = 8
      Top = 6
      Width = 97
      Height = 17
      Caption = #22810#36873
      TabOrder = 0
    end
    object Button1: TButton
      Left = 96
      Top = 6
      Width = 75
      Height = 25
      Caption = #20840#36873
      TabOrder = 1
      OnClick = Button1Click
    end
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
  end
end
