object frmOdugDemo: TfrmOdugDemo
  Left = 231
  Top = 184
  Width = 680
  Height = 406
  Caption = 'Odug Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 672
    Height = 13
    Align = alTop
    Caption = 'Customers'
  end
  object Label2: TLabel
    Left = 0
    Top = 199
    Width = 672
    Height = 13
    Align = alBottom
    Caption = 'Orders'
  end
  object dbgCustomers: TDBGrid
    Left = 0
    Top = 13
    Width = 672
    Height = 186
    Align = alClient
    DataSource = srcCustomers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = dbgCustomersTitleClick
  end
  object dbgOrders: TDBGrid
    Left = 0
    Top = 212
    Width = 672
    Height = 124
    Align = alBottom
    DataSource = srcOrders
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 672
    Height = 43
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      672
      43)
    object lblBackupStep: TLabel
      Left = 184
      Top = 4
      Width = 69
      Height = 13
      Caption = 'lblBackupStep'
    end
    object btnInsert: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Insert'
      TabOrder = 0
      OnClick = btnInsertClick
    end
    object btnBackup: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Backup'
      TabOrder = 1
      OnClick = btnBackupClick
    end
    object ProgressBar: TProgressBar
      Left = 184
      Top = 16
      Width = 481
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  object srcCustomers: TDataSource
    DataSet = dmOdugDemo.tblCustomers
    Left = 184
    Top = 64
  end
  object srcOrders: TDataSource
    DataSet = dmOdugDemo.qryOrders
    Left = 184
    Top = 232
  end
end
