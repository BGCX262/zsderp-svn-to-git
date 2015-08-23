object FrmHRSocialSecurity: TFrmHRSocialSecurity
  Left = 0
  Top = 0
  Caption = #20154#20107#31038#20445#32500#25252
  ClientHeight = 403
  ClientWidth = 768
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
  object Splitter1: TSplitter
    Left = 0
    Top = 257
    Width = 768
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 146
  end
  object DBGrid1: TZSDDBGrid
    Left = 0
    Top = 0
    Width = 768
    Height = 257
    Align = alTop
    DataSource = dsViewA
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'UserCode_'
        Title.Alignment = taCenter
        Title.Caption = #24037#21495
        Width = 142
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #22995#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentStatus_'
        Title.Alignment = taCenter
        Title.Caption = #32564#36153#29366#24577
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PCNO_'
        Title.Alignment = taCenter
        Title.Caption = #30005#33041#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OldageInsurance_'
        Title.Alignment = taCenter
        Title.Caption = #20859#32769#20445#38505
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InjuryInsurance_'
        Title.Alignment = taCenter
        Title.Caption = #24037#20260#20445#38505
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MaternityInsurance_'
        Title.Alignment = taCenter
        Title.Caption = #29983#32946#20445#38505
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MedicalInsurance_'
        Title.Alignment = taCenter
        Title.Caption = #21307#30103#20445#38505
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UneInsurance_'
        Title.Alignment = taCenter
        Title.Caption = #22833#19994#20445#38505
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
        FieldName = 'UpdateDate_'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #26356#26032#26085#26399
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 262
    Width = 768
    Height = 141
    Align = alClient
    TabOrder = 1
    object DBGrid2: TZSDDBGrid
      Left = 1
      Top = 1
      Width = 766
      Height = 106
      Align = alClient
      DataSource = dsViewB
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'USERCODE_'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #24037#21495
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WAGES_'
          Title.Alignment = taCenter
          Title.Caption = #24037#36164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTALAMOUNT_'
          Title.Alignment = taCenter
          Title.Caption = #24635#35745#24212#32564#37329#39069
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'PTOTALAMOUNT_'
          Title.Alignment = taCenter
          Title.Caption = #20010#20154#24212#32564#24635#39069
          Width = 101
          Visible = True
        end
        item
          Alignment = taLeftJustify
          Expanded = False
          FieldName = 'UTOTALAMOUNT_'
          Title.Alignment = taCenter
          Title.Caption = #21333#20301#24212#32564#24635#39069
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDPPAY_'
          Title.Alignment = taCenter
          Title.Caption = #20859#32769#20010#20154#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OLDUPAY_'
          Title.Alignment = taCenter
          Title.Caption = #20859#32769#21333#20301#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INJURYPPAY_'
          Title.Alignment = taCenter
          Title.Caption = #24037#20260#20010#20154#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INJURYUPAY_'
          Title.Alignment = taCenter
          Title.Caption = #24037#20260#21333#20301#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MATERNITYPPAY_'
          Title.Alignment = taCenter
          Title.Caption = #29983#32946#20010#20154#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MATERNITYUPAY_'
          Title.Alignment = taCenter
          Title.Caption = #29983#32946#21333#20301#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDICALPPAY_'
          Title.Alignment = taCenter
          Title.Caption = #21307#30103#20010#20154#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDICALUPAY_'
          Title.Alignment = taCenter
          Title.Caption = #21307#30103#21333#20301#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNEMPLOYMENTPPAY_'
          Title.Alignment = taCenter
          Title.Caption = #22833#19994#20010#20154#32564
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNEMPLOYMENTUPAY_'
          Title.Alignment = taCenter
          Title.Caption = #22833#19994#21333#20301#32564
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APPUSER_'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #28155#21152#20154#21592
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APPDATE_'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #28155#21152#26085#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UPDATEUSER_'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26356#26032#20154#21592
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UPDATEDATE_'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #26356#26032#26085#26399
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 1
      Top = 107
      Width = 766
      Height = 33
      Align = alBottom
      TabOrder = 1
      object Button1: TButton
        Left = 16
        Top = 2
        Width = 81
        Height = 27
        Caption = #20154#20107#26356#26032#21516#27493
        TabOrder = 0
        OnClick = Button1Click
      end
      object ComboBox1: TComboBox
        Left = 128
        Top = 6
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        TextHint = #25968#25454#26174#31034#39033
        OnChange = ComboBox1Change
        Items.Strings = (
          #20010#20154#24212#32564' '
          #21333#20301#24212#32564
          #20840#37096#25968#25454)
      end
    end
  end
  object dsViewA: TDataSource
    DataSet = cdsViewA
    Left = 184
    Top = 168
  end
  object ZSDTool1: TZSDTool
    mAppend = True
    mEdit = True
    mSave = True
    mConfirm = False
    mFind = True
    mRevocation = False
    mDel = True
    mPrint = True
    mFPrint = True
    mAudit = False
    aDataSet = cdsViewA
    OnSave = ZSDTool1Save
    Left = 48
    Top = 160
  end
  object dsViewB: TDataSource
    DataSet = cdsViewB
    Left = 112
    Top = 304
  end
  object cdsViewB: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewBAfterEdit
    OnCalcFields = cdsViewBCalcFields
    OnNewRecord = cdsViewBNewRecord
    Left = 40
    Top = 304
    object cdsViewBID_: TStringField
      FieldName = 'ID_'
      Size = 38
    end
    object cdsViewBUSERCODE_: TStringField
      FieldName = 'USERCODE_'
      Required = True
    end
    object cdsViewBPCNO_: TStringField
      FieldName = 'PCNO_'
    end
    object cdsViewBNAME_: TStringField
      FieldName = 'NAME_'
    end
    object cdsViewBTOTALAMOUNT_: TSingleField
      FieldName = 'TOTALAMOUNT_'
    end
    object cdsViewBWAGES_: TSingleField
      FieldName = 'WAGES_'
    end
    object cdsViewBOLDPPAY_: TSingleField
      FieldName = 'OLDPPAY_'
    end
    object cdsViewBOLDUPAY_: TSingleField
      FieldName = 'OLDUPAY_'
    end
    object cdsViewBINJURYPPAY_: TSingleField
      FieldName = 'INJURYPPAY_'
    end
    object cdsViewBINJURYUPAY_: TSingleField
      FieldName = 'INJURYUPAY_'
    end
    object cdsViewBMATERNITYPPAY_: TSingleField
      FieldName = 'MATERNITYPPAY_'
    end
    object cdsViewBMATERNITYUPAY_: TSingleField
      FieldName = 'MATERNITYUPAY_'
    end
    object cdsViewBMEDICALPPAY_: TSingleField
      FieldName = 'MEDICALPPAY_'
    end
    object cdsViewBMEDICALUPAY_: TSingleField
      FieldName = 'MEDICALUPAY_'
    end
    object cdsViewBUNEMPLOYMENTPPAY_: TSingleField
      FieldName = 'UNEMPLOYMENTPPAY_'
    end
    object cdsViewBUNEMPLOYMENTUPAY_: TSingleField
      FieldName = 'UNEMPLOYMENTUPAY_'
    end
    object cdsViewBAPPUSER_: TStringField
      FieldName = 'APPUSER_'
    end
    object cdsViewBAPPDATE_: TSQLTimeStampField
      FieldName = 'APPDATE_'
    end
    object cdsViewBUPDATEUSER_: TStringField
      FieldName = 'UPDATEUSER_'
    end
    object cdsViewBUPDATEDATE_: TSQLTimeStampField
      FieldName = 'UPDATEDATE_'
    end
    object cdsViewBUTOTALAMOUNT_: TSingleField
      FieldName = 'UTOTALAMOUNT_'
    end
    object cdsViewBPTOTALAMOUNT_: TSingleField
      FieldName = 'PTOTALAMOUNT_'
    end
  end
  object cdsViewA: TZSDDataSet
    Aggregates = <>
    Params = <>
    AfterEdit = cdsViewAAfterEdit
    BeforeDelete = cdsViewABeforeDelete
    AfterScroll = cdsViewAAfterScroll
    OnCalcFields = cdsViewACalcFields
    OnNewRecord = cdsViewANewRecord
    Left = 120
    Top = 160
    object cdsViewAID_: TStringField
      FieldName = 'ID_'
      Size = 40
    end
    object cdsViewAUserCode_: TStringField
      FieldName = 'UserCode_'
      OnChange = cdsViewAUserCode_Change
      Size = 30
    end
    object cdsViewAPaymentStatus_: TSmallintField
      FieldName = 'PaymentStatus_'
    end
    object cdsViewAPCNO_: TStringField
      FieldName = 'PCNO_'
    end
    object cdsViewAInjuryInsurance_: TSmallintField
      FieldName = 'InjuryInsurance_'
    end
    object cdsViewAMaternityInsurance_: TSmallintField
      FieldName = 'MaternityInsurance_'
    end
    object cdsViewAMedicalInsurance_: TSmallintField
      FieldName = 'MedicalInsurance_'
    end
    object cdsViewAUneInsurance_: TSmallintField
      FieldName = 'UneInsurance_'
    end
    object cdsViewAAppUser_: TStringField
      FieldName = 'AppUser_'
    end
    object cdsViewAAppDate_: TSQLTimeStampField
      FieldName = 'AppDate_'
    end
    object cdsViewAUpdateUser_: TStringField
      FieldName = 'UpdateUser_'
    end
    object cdsViewAUpdateDate_: TSQLTimeStampField
      FieldName = 'UpdateDate_'
    end
    object cdsViewAOldageInsurance_: TSmallintField
      FieldName = 'OldageInsurance_'
    end
    object cdsViewAuName: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'uName'
    end
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=E:\ZSDERP\SERVER\MyDB.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    VendorLib = 'fbclient.dll'
    Left = 664
    Top = 312
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 'Select * from HR_SOCIALSECURITYDETAILS'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 712
    Top = 312
    object SQLDataSet1ID_: TStringField
      FieldName = 'ID_'
      Size = 38
    end
    object SQLDataSet1USERCODE_: TStringField
      FieldName = 'USERCODE_'
      Required = True
    end
    object SQLDataSet1PCNO_: TStringField
      FieldName = 'PCNO_'
    end
    object SQLDataSet1NAME_: TStringField
      FieldName = 'NAME_'
    end
    object SQLDataSet1TOTALAMOUNT_: TSingleField
      FieldName = 'TOTALAMOUNT_'
    end
    object SQLDataSet1WAGES_: TSingleField
      FieldName = 'WAGES_'
    end
    object SQLDataSet1OLDPPAY_: TSingleField
      FieldName = 'OLDPPAY_'
    end
    object SQLDataSet1OLDUPAY_: TSingleField
      FieldName = 'OLDUPAY_'
    end
    object SQLDataSet1INJURYPPAY_: TSingleField
      FieldName = 'INJURYPPAY_'
    end
    object SQLDataSet1INJURYUPAY_: TSingleField
      FieldName = 'INJURYUPAY_'
    end
    object SQLDataSet1MATERNITYPPAY_: TSingleField
      FieldName = 'MATERNITYPPAY_'
    end
    object SQLDataSet1MATERNITYUPAY_: TSingleField
      FieldName = 'MATERNITYUPAY_'
    end
    object SQLDataSet1MEDICALPPAY_: TSingleField
      FieldName = 'MEDICALPPAY_'
    end
    object SQLDataSet1MEDICALUPAY_: TSingleField
      FieldName = 'MEDICALUPAY_'
    end
    object SQLDataSet1UNEMPLOYMENTPPAY_: TSingleField
      FieldName = 'UNEMPLOYMENTPPAY_'
    end
    object SQLDataSet1UNEMPLOYMENTUPAY_: TSingleField
      FieldName = 'UNEMPLOYMENTUPAY_'
    end
    object SQLDataSet1APPUSER_: TStringField
      FieldName = 'APPUSER_'
    end
    object SQLDataSet1APPDATE_: TSQLTimeStampField
      FieldName = 'APPDATE_'
    end
    object SQLDataSet1UPDATEUSER_: TStringField
      FieldName = 'UPDATEUSER_'
    end
    object SQLDataSet1UPDATEDATE_: TSQLTimeStampField
      FieldName = 'UPDATEDATE_'
    end
    object SQLDataSet1UTOTALAMOUNT_: TSingleField
      FieldName = 'UTOTALAMOUNT_'
    end
    object SQLDataSet1PTOTALAMOUNT_: TSingleField
      FieldName = 'PTOTALAMOUNT_'
    end
  end
end
