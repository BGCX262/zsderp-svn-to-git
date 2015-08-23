object FrmTasks: TFrmTasks
  Left = 0
  Top = 0
  Caption = #20219#21153#31649#29702#21333
  ClientHeight = 402
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
  object Splitter1: TSplitter
    Left = 0
    Top = 114
    Width = 725
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 288
  end
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 114
    Align = alTop
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
  object DBGrid2: TZSDDBGrid
    Left = 0
    Top = 117
    Width = 725
    Height = 285
    Align = alClient
    DataSource = dsViewb
    TabOrder = 1
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
  object dsView: TDataSource
    DataSet = cdsView
    Left = 160
    Top = 56
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterDelete = cdsViewAfterDelete
    AfterScroll = cdsViewAfterScroll
    OnNewRecord = cdsViewNewRecord
    Left = 96
    Top = 56
  end
  object dsViewb: TDataSource
    DataSet = cdsViewb
    Left = 176
    Top = 240
  end
  object cdsViewb: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewbNewRecord
    Left = 96
    Top = 240
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
    Left = 16
    Top = 136
  end
end
