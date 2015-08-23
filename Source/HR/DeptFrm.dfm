object FrmDept: TFrmDept
  Left = 0
  Top = 0
  Caption = #20844#21496#32452#32455#32467#26500
  ClientHeight = 438
  ClientWidth = 652
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
    Left = 161
    Top = 0
    Height = 438
    ExplicitLeft = 336
    ExplicitTop = 192
    ExplicitHeight = 100
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 161
    Height = 438
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 0
    OnClick = TreeView1Click
  end
  object ZSDDBGrid1: TZSDDBGrid
    Left = 164
    Top = 0
    Width = 488
    Height = 438
    Align = alClient
    DataSource = dsView
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = ZSDDBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PCode_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #29238#32423#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Code_'
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#20195#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #21517#31216
        Visible = True
      end>
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = cdsViewNewRecord
    Left = 312
    Top = 240
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 368
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
    aDataSet = cdsView
    OnSave = ZSDTool1Save
    Left = 232
    Top = 184
  end
end
