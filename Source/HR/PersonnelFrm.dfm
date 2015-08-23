object FrmPersonnel: TFrmPersonnel
  Left = 0
  Top = 0
  Caption = #20154#20107#36164#26009#32500#25252
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
  object DBGrid1: TZSDDBGrid
    Left = 137
    Top = 0
    Width = 588
    Height = 311
    Align = alClient
    DataSource = dsView
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
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
        Expanded = False
        FieldName = 'UserID_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name_'
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CardID_'
        Title.Alignment = taCenter
        Title.Caption = #21345#21495
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sex_'
        Title.Alignment = taCenter
        Title.Caption = #22995#21035
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'DeptCode_'
        Title.Alignment = taCenter
        Title.Caption = #37096#38376#20195#30721
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDNumber_'
        Title.Alignment = taCenter
        Title.Caption = #36523#20221#35777#21495#30721
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InDate_'
        Title.Alignment = taCenter
        Title.Caption = #20837#21378#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OutDate_'
        Title.Alignment = taCenter
        Title.Caption = #31163#32844#26085#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Post_'
        Title.Alignment = taCenter
        Title.Caption = #32844#21153
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'People_'
        Title.Alignment = taCenter
        Title.Caption = #27665#26063
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Birthday_'
        Title.Alignment = taCenter
        Title.Caption = #29983#26085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDEndDate_'
        Title.Alignment = taCenter
        Title.Caption = #36523#20221#35777#21040#26399#26085
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EduCation_'
        Title.Alignment = taCenter
        Title.Caption = #25945#32946#31243#24230
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Age_'
        Title.Alignment = taCenter
        Title.Caption = #24180#40836
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WorkAge_'
        Title.Alignment = taCenter
        Title.Caption = #24037#40836
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Marital_'
        Title.Alignment = taCenter
        Title.Caption = #23130#23035#29366#20917
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Birthplace_'
        Title.Alignment = taCenter
        Title.Caption = #31821#36143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRACTSTART_'
        Title.Alignment = taCenter
        Title.Caption = #21512#21516#24320#22987
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTRACTEND_'
        Title.Alignment = taCenter
        Title.Caption = #21512#21516#32467#26463
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
        Width = 86
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
        Width = 101
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
  object Panel2: TPanel
    Left = 0
    Top = 311
    Width = 725
    Height = 41
    Align = alBottom
    TabOrder = 2
    object CheckBox2: TCheckBox
      Left = 5
      Top = 6
      Width = 68
      Height = 17
      Caption = #26174#31034#29031#29255
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object Button3: TButton
      Left = 92
      Top = 6
      Width = 75
      Height = 25
      Caption = #32852#31995#26041#24335
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 173
      Top = 6
      Width = 75
      Height = 25
      Caption = #25945#32946#32463#21382
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 254
      Top = 6
      Width = 75
      Height = 25
      Caption = #22521#35757#35760#24405
      TabOrder = 3
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 513
      Top = 6
      Width = 75
      Height = 25
      Caption = #22870#24809#35760#24405
      TabOrder = 4
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 416
      Top = 6
      Width = 91
      Height = 25
      Caption = #20449#24687#21464#26356#35760#24405
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 335
      Top = 6
      Width = 75
      Height = 25
      Caption = #24037#20316#32463#21382
      TabOrder = 6
      OnClick = Button8Click
    end
    object Button10: TButton
      Left = 594
      Top = 6
      Width = 75
      Height = 25
      Caption = #21592#24037#25991#26723
      TabOrder = 7
      OnClick = Button10Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 311
    Align = alLeft
    TabOrder = 3
    Visible = False
    object Button2: TButton
      Left = 16
      Top = 191
      Width = 97
      Height = 25
      Caption = #26356#25442#29031#29255
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button9: TButton
      Left = 16
      Top = 246
      Width = 97
      Height = 25
      Caption = #25668#20687#22836#33719#21462
      TabOrder = 1
      Visible = False
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 135
      Height = 152
      Align = alTop
      TabOrder = 2
      object Image1: TImage
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 127
        Height = 144
        Align = alClient
        AutoSize = True
        Center = True
        Stretch = True
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 123
        ExplicitHeight = 153
      end
    end
  end
  object dsView: TDataSource
    DataSet = cdsView
    Left = 360
    Top = 48
  end
  object cdsView: TZSDDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsViewAfterScroll
    OnCalcFields = cdsViewCalcFields
    OnNewRecord = cdsViewNewRecord
    Left = 304
    Top = 48
    object cdsViewID_: TGuidField
      FieldName = 'ID_'
      FixedChar = True
      Size = 38
    end
    object cdsViewUserID_: TStringField
      FieldName = 'UserID_'
    end
    object cdsViewName_: TStringField
      FieldName = 'Name_'
      Size = 10
    end
    object cdsViewCardID_: TStringField
      FieldName = 'CardID_'
    end
    object cdsViewSex_: TStringField
      FieldName = 'Sex_'
      Size = 2
    end
    object cdsViewDeptCode_: TStringField
      FieldName = 'DeptCode_'
      Size = 50
    end
    object cdsViewPost_: TStringField
      FieldName = 'Post_'
    end
    object cdsViewPeople_: TStringField
      FieldName = 'People_'
    end
    object cdsViewMarital_: TIntegerField
      FieldName = 'Marital_'
    end
    object cdsViewIDNumber_: TStringField
      FieldName = 'IDNumber_'
    end
    object cdsViewBirthplace_: TStringField
      FieldName = 'Birthplace_'
    end
    object cdsViewAppUser_: TStringField
      FieldName = 'AppUser_'
      Size = 10
    end
    object cdsViewAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
      Size = 10
    end
    object cdsViewUpdateDate_: TSQLTimeStampField
      FieldName = 'UpdateDate_'
    end
    object cdsViewEduCation_: TStringField
      FieldName = 'EduCation_'
    end
    object cdsViewAge_: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'Age_'
    end
    object cdsViewWorkAge_: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'WorkAge_'
    end
    object cdsViewInDate_: TDateField
      FieldName = 'InDate_'
    end
    object cdsViewOutDate_: TDateField
      FieldName = 'OutDate_'
    end
    object cdsViewBirthday_: TDateField
      FieldName = 'Birthday_'
    end
    object cdsViewCONTRACTSTART_: TDateField
      FieldName = 'CONTRACTSTART_'
    end
    object cdsViewCONTRACTEND_: TDateField
      FieldName = 'CONTRACTEND_'
    end
    object cdsViewIDEndDate_: TDateField
      FieldName = 'IDEndDate_'
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
    Left = 224
    Top = 40
  end
end
