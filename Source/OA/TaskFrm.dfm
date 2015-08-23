object FrmTask: TFrmTask
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
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'StarDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #24320#22987#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EndDate_'
        Title.Alignment = taCenter
        Title.Caption = #23436#25104#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Subject_'
        Title.Alignment = taCenter
        Title.Caption = #20219#21153'/'#39033#30446
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
        Title.Caption = #28155#21152#26102#38388
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Responsible_'
        Title.Alignment = taCenter
        Title.Caption = #36131#20219#20154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TargetDate_'
        Title.Alignment = taCenter
        Title.Caption = #30446#26631#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Status_'
        Title.Alignment = taCenter
        Title.Caption = #29366#24577
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
    Left = 360
    Top = 200
  end
end
