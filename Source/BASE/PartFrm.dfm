object FrmPart: TFrmPart
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
    Columns = <
      item
        Expanded = False
        FieldName = 'Code_'
        Title.Alignment = taCenter
        Title.Caption = #20135#21697#32534#30721
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desc_'
        Title.Alignment = taCenter
        Title.Caption = #21697#21517
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Spec_'
        Title.Alignment = taCenter
        Title.Caption = #35268#26684
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Brand_'
        Title.Alignment = taCenter
        Title.Caption = #21697#29260
        Width = 85
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
        FieldName = 'UPdateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
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
