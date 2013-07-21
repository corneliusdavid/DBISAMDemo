object dmOdugDemo: TdmOdugDemo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 232
  Top = 107
  Height = 324
  Width = 342
  object DBISAMDatabase: TDBISAMDatabase
    EngineVersion = '4.14'
    DatabaseName = 'OdugDemo'
    SessionName = 'OdugSession'
    BeforeConnect = DBISAMDatabaseBeforeConnect
    OnBackupProgress = DBISAMDatabaseBackupProgress
    OnBackupLog = DBISAMDatabaseBackupLog
    Left = 72
    Top = 48
  end
  object tblCustomers: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    AfterScroll = tblCustomersAfterScroll
    DatabaseName = 'OdugDemo'
    SessionName = 'OdugSession'
    EngineVersion = '4.14'
    TableName = 'customer'
    Left = 72
    Top = 112
    object tblCustomersCustNo: TAutoIncField
      FieldName = 'CustNo'
      Origin = 'customer.CustNo'
    end
    object tblCustomersCompany: TStringField
      FieldName = 'Company'
      Origin = 'customer.Company'
      Size = 30
    end
    object tblCustomersAddr1: TStringField
      FieldName = 'Addr1'
      Origin = 'customer.Addr1'
      Size = 30
    end
    object tblCustomersAddr2: TStringField
      FieldName = 'Addr2'
      Origin = 'customer.Addr2'
      Size = 30
    end
    object tblCustomersCity: TStringField
      FieldName = 'City'
      Origin = 'customer.City'
      Size = 15
    end
    object tblCustomersState: TStringField
      FieldName = 'State'
      Origin = 'customer.State'
    end
    object tblCustomersZip: TStringField
      FieldName = 'Zip'
      Origin = 'customer.Zip'
      Size = 10
    end
    object tblCustomersCountry: TStringField
      FieldName = 'Country'
      Origin = 'customer.Country'
    end
    object tblCustomersPhone: TStringField
      FieldName = 'Phone'
      Origin = 'customer.Phone'
      Size = 15
    end
    object tblCustomersFAX: TStringField
      FieldName = 'FAX'
      Origin = 'customer.FAX'
      Size = 15
    end
    object tblCustomersTaxRate: TFloatField
      FieldName = 'TaxRate'
      Origin = 'customer.TaxRate'
    end
    object tblCustomersContact: TStringField
      FieldName = 'Contact'
      Origin = 'customer.Contact'
    end
    object tblCustomersLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
      Origin = 'customer.LastInvoiceDate'
    end
  end
  object qryOrders: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'OdugDemo'
    SessionName = 'OdugSession'
    EngineVersion = '4.14'
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT * FROM Orders WHERE CustNo = :CustNo')
    Params = <
      item
        DataType = ftInteger
        Name = 'CustNo'
        Value = 1231
      end>
    Left = 72
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CustNo'
        Value = 1231
      end>
  end
  object DBISAMSession: TDBISAMSession
    EngineVersion = '4.14'
    LockRetryCount = 15
    LockWaitTime = 100
    LockProtocol = lpPessimistic
    ProgressSteps = 20
    SessionName = 'OdugSession'
    OnPassword = DBISAMSessionPassword
    SessionType = stLocal
    RemoteEncryption = False
    RemoteEncryptionPassword = 'elevatesoft'
    RemoteCompression = 0
    RemoteAddress = '127.0.0.1'
    RemotePort = 12005
    RemoteTrace = False
    RemoteTimeout = 300
    RemotePing = False
    RemotePingInterval = 60
    Left = 160
    Top = 64
  end
  object qryCreateTempCust: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'MEMORY'
    SessionName = 'OdugSession'
    EngineVersion = '4.14'
    MaxRowCount = -1
    SQL.Strings = (
      '/* SQL-92 Table Creation Script with DBISAM Extensions */'
      ''
      'CREATE TABLE IF NOT EXISTS "temp_cust"'
      '('
      '   "CustNo" Integer,'
      '   "Company" VARCHAR(30),'
      '   "Addr1" VARCHAR(30),'
      '   "Addr2" VARCHAR(30),'
      '   "City" VARCHAR(15),'
      '   "State" VARCHAR(20),'
      '   "Zip" VARCHAR(10),'
      '   "Country" VARCHAR(20),'
      '   "Phone" VARCHAR(15),'
      '   "FAX" VARCHAR(15),'
      '   "TaxRate" FLOAT,'
      '   "Contact" VARCHAR(20),'
      '   "LastInvoiceDate" TIMESTAMP,'
      ');'
      '')
    Params = <>
    Left = 160
    Top = 128
  end
  object tblTempCust: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    BeforeOpen = tblTempCustBeforeOpen
    AfterPost = tblTempCustAfterPost
    DatabaseName = 'MEMORY'
    SessionName = 'OdugSession'
    EngineVersion = '4.14'
    TableName = 'temp_cust'
    Left = 160
    Top = 184
  end
  object qryCopyCustFromMem: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'OdugDemo'
    SessionName = 'OdugSession'
    EngineVersion = '4.14'
    MaxRowCount = -1
    SQL.Strings = (
      'INSERT INTO Customer'
      'SELECT * FROM "\MEMORY\Temp_Cust"; ')
    Params = <>
    AfterExecute = qryCopyCustFromMemAfterExecute
    Left = 160
    Top = 240
  end
  object DBISAMEngine: TDBISAMEngine
    Active = True
    EngineVersion = '4.14'
    EngineType = etLocal
    EngineSignature = 'DBISAM_SIG'
    Functions = <>
    LargeFileSupport = False
    FilterRecordCounts = True
    MaxTableDataBufferSize = 32768
    MaxTableDataBufferCount = 8192
    MaxTableIndexBufferSize = 65536
    MaxTableIndexBufferCount = 8192
    MaxTableBlobBufferSize = 32768
    MaxTableBlobBufferCount = 8192
    TableDataExtension = '.dat'
    TableIndexExtension = '.idx'
    TableBlobExtension = '.blb'
    TableDataBackupExtension = '.dbk'
    TableIndexBackupExtension = '.ibk'
    TableBlobBackupExtension = '.bbk'
    TableDataUpgradeExtension = '.dup'
    TableIndexUpgradeExtension = '.iup'
    TableBlobUpgradeExtension = '.bup'
    TableFilterIndexThreshhold = 1
    TableReadLockWaitTime = 3
    TableReadLockRetryCount = 32768
    TableWriteLockWaitTime = 3
    TableWriteLockRetryCount = 32768
    TableTransLockWaitTime = 3
    TableTransLockRetryCount = 32768
    ServerName = 'DBSRVR'
    ServerDescription = 'DBISAM Database Server'
    ServerMainPort = 12005
    ServerMainThreadCacheSize = 10
    ServerAdminPort = 12006
    ServerAdminThreadCacheSize = 1
    ServerEncryptedOnly = False
    ServerEncryptionPassword = 'elevatesoft'
    ServerConfigFileName = 'dbsrvr.scf'
    ServerConfigPassword = 'elevatesoft'
    AfterInsertTrigger = DBISAMEngineAfterInsertTrigger
    Left = 256
    Top = 96
  end
end
