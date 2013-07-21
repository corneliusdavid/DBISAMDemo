object frmAddCust: TfrmAddCust
  Left = 363
  Top = 111
  Width = 515
  Height = 490
  Caption = 'Add Customer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 44
    Height = 13
    Caption = 'Company'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 28
    Height = 13
    Caption = 'Addr1'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 8
    Top = 88
    Width = 28
    Height = 13
    Caption = 'Addr2'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 8
    Top = 128
    Width = 17
    Height = 13
    Caption = 'City'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 168
    Width = 25
    Height = 13
    Caption = 'State'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 8
    Top = 208
    Width = 15
    Height = 13
    Caption = 'Zip'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 8
    Top = 248
    Width = 36
    Height = 13
    Caption = 'Country'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 8
    Top = 288
    Width = 31
    Height = 13
    Caption = 'Phone'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 8
    Top = 328
    Width = 20
    Height = 13
    Caption = 'FAX'
    FocusControl = DBEdit9
  end
  object Label10: TLabel
    Left = 8
    Top = 368
    Width = 41
    Height = 13
    Caption = 'TaxRate'
    FocusControl = DBEdit10
  end
  object Label11: TLabel
    Left = 8
    Top = 408
    Width = 37
    Height = 13
    Caption = 'Contact'
    FocusControl = DBEdit11
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 24
    Width = 394
    Height = 21
    DataField = 'Company'
    DataSource = srcCustomer
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 64
    Width = 394
    Height = 21
    DataField = 'Addr1'
    DataSource = srcCustomer
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 8
    Top = 104
    Width = 394
    Height = 21
    DataField = 'Addr2'
    DataSource = srcCustomer
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 8
    Top = 144
    Width = 199
    Height = 21
    DataField = 'City'
    DataSource = srcCustomer
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 8
    Top = 184
    Width = 69
    Height = 21
    DataField = 'State'
    DataSource = srcCustomer
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 8
    Top = 224
    Width = 134
    Height = 21
    DataField = 'Zip'
    DataSource = srcCustomer
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 8
    Top = 264
    Width = 264
    Height = 21
    DataField = 'Country'
    DataSource = srcCustomer
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 8
    Top = 304
    Width = 199
    Height = 21
    DataField = 'Phone'
    DataSource = srcCustomer
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 8
    Top = 344
    Width = 199
    Height = 21
    DataField = 'FAX'
    DataSource = srcCustomer
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 8
    Top = 384
    Width = 134
    Height = 21
    DataField = 'TaxRate'
    DataSource = srcCustomer
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 8
    Top = 424
    Width = 264
    Height = 21
    DataField = 'Contact'
    DataSource = srcCustomer
    TabOrder = 10
  end
  object btnOk: TBitBtn
    Left = 304
    Top = 416
    Width = 75
    Height = 25
    Caption = 'O&K'
    TabOrder = 11
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 392
    Top = 416
    Width = 75
    Height = 25
    TabOrder = 12
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object srcCustomer: TDataSource
    DataSet = dmOdugDemo.tblTempCust
    Left = 312
    Top = 232
  end
end
