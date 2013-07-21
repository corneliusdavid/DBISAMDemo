unit udmOdugDemo;
(*
 * as: udmOdugDemo.pas/dfm
 * by: David E. Cornelius
 * of: Cornelius Concepts, Inc.
 * on: November, 2004
 * in: Delphi 6 Professional
 * to: Illustrate various DBISAM 4 techniques
 *
 * This is the data module of the project, where most
 * the interesting things happen.
 *)

interface

uses
  SysUtils, Classes, dbisamtb, DB;

type
  TBackupProgressEvent = procedure (Step: string; PercentDone: Word) of object;
  TBackupLogEvent = procedure (LogMsg: string) of object;
  TInsertEvent = procedure (TableName, KeyValue: string) of Object;
  TdmOdugDemo = class(TDataModule)
    DBISAMDatabase: TDBISAMDatabase;
    tblCustomers: TDBISAMTable;
    tblCustomersCustNo: TAutoIncField;
    tblCustomersCompany: TStringField;
    tblCustomersAddr1: TStringField;
    tblCustomersAddr2: TStringField;
    tblCustomersCity: TStringField;
    tblCustomersState: TStringField;
    tblCustomersZip: TStringField;
    tblCustomersCountry: TStringField;
    tblCustomersPhone: TStringField;
    tblCustomersFAX: TStringField;
    tblCustomersTaxRate: TFloatField;
    tblCustomersContact: TStringField;
    tblCustomersLastInvoiceDate: TDateTimeField;
    qryOrders: TDBISAMQuery;
    DBISAMSession: TDBISAMSession;
    qryCreateTempCust: TDBISAMQuery;
    tblTempCust: TDBISAMTable;
    qryCopyCustFromMem: TDBISAMQuery;
    DBISAMEngine: TDBISAMEngine;
    procedure tblCustomersAfterScroll(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DBISAMSessionPassword(Sender: TObject; var Continue: Boolean);
    procedure DBISAMDatabaseBeforeConnect(Sender: TObject);
    procedure tblTempCustBeforeOpen(DataSet: TDataSet);
    procedure qryCopyCustFromMemAfterExecute(Sender: TObject);
    procedure tblTempCustAfterPost(DataSet: TDataSet);
    procedure DBISAMDatabaseBackupProgress(Sender: TObject;
              const Step: String; PercentDone: Word);
    procedure DBISAMDatabaseBackupLog(Sender: TObject; const LogMessage: String);
    procedure DBISAMEngineAfterInsertTrigger(Sender: TObject;
      TriggerSession: TDBISAMSession; TriggerDatabase: TDBISAMDatabase;
      const TableName: String; CurrentRecord: TDBISAMRecord);
  private
    FOnBackupLog: TBackupLogEvent;
    FOnBackupProgress: TBackupProgressEvent;
    FOnInsertRec: TInsertEvent;
    procedure DoBackupLog(LogMsg: string);
    procedure DoBackupProgress(Step: string; PercentDone: Word);
    procedure DoInsertEvent(TableName, KeyValue: string);
  public
    procedure Backup;
  published
    property OnBackupProgress: TBackupProgressEvent read FOnBackupProgress write FOnBackupProgress;
    property OnBackupLog: TBackupLogEvent read FOnBackupLog write FOnBackupLog;
    property OnInsertRec: TInsertEvent read FOnInsertRec write FOninsertRec;
  end;

var
  dmOdugDemo: TdmOdugDemo;


implementation

{$R *.dfm}

uses
  Forms, Variants;

procedure TdmOdugDemo.DataModuleCreate(Sender: TObject);
begin
  tblCustomers.Open;
end;

procedure TdmOdugDemo.tblCustomersAfterScroll(DataSet: TDataSet);
begin
  // link the customer's orders
  qryOrders.DisableControls;
  qryOrders.Close;
  qryOrders.ParamByName('CustNo').AsInteger := tblCustomersCustNo.AsInteger;
  qryOrders.Open;
  qryOrders.EnableControls;
end;

procedure TdmOdugDemo.DBISAMSessionPassword(Sender: TObject; var Continue: Boolean);
begin
  // allows access to encrypted tables
  DBISAMSession.AddPassword('odug');
  Continue := True;
end;

procedure TdmOdugDemo.DBISAMDatabaseBeforeConnect(Sender: TObject);
begin
  // set the directory dynamically at run-time based on
  // the current location of the application;
  // assumes a "data" directory under the application's directory
  DBISAMDatabase.Directory := ExtractFilePath(Application.ExeName) + '\data';
end;

procedure TdmOdugDemo.tblTempCustBeforeOpen(DataSet: TDataSet);
begin
  // since this is a memory table, create it the first time it's opened
  qryCreateTempCust.ExecSQL;
end;

procedure TdmOdugDemo.qryCopyCustFromMemAfterExecute(Sender: TObject);
begin
  // after the customer as been inserted,
  // refresh the dataset to show the new record
  tblCustomers.Refresh;
end;

procedure TdmOdugDemo.tblTempCustAfterPost(DataSet: TDataSet);
begin
  // After the new customer as been saved to the in-memory dataset,
  // copy the new record to the file-based database and clear the
  // temporary in-memory table.
  DBISAMDatabase.StartTransaction;
  try
    qryCopyCustFromMem.ExecSQL;
    // immediately locate the new customer in the dataset
    // using the just inserted ID number
    tblCustomers.Locate('CustNo', VarArrayOf([tblCustomers.LastAutoIncValue]), []);
    DBISAMDatabase.Commit;
  except
    // if there were any errors, roll back the changes and re-surface the error
    DBISAMDatabase.Rollback;
    raise;
  end;

  // remove the temporary new customer
  tblTempCust.Close;
  tblTempCust.EmptyTable;
end;

procedure TdmOdugDemo.Backup;
var
  Tables: TStringList;
begin
  Tables := TStringList.Create;
  try
    // to backup the entire database, use this line:
    DBISAMSession.GetTableNames(DBISAMDatabase.DatabaseName, Tables);
    // to backup only the two tables customer and orders,
    // comment out the previous line and UNcomment the following two lines:
    {
    Tables.Add('customer');
    Tables.Add('orders');
    }

    // in just these few simple lines, the entire database can be backed up!
    DBISAMDatabase.Backup('OdugBackup.BKP', 'Backup of ODUG demo tables', 9, Tables);
  finally
    Tables.Free;
  end;
end;

procedure TdmOdugDemo.DBISAMDatabaseBackupProgress(Sender: TObject;
  const Step: String; PercentDone: Word);
begin
  // backup progress event handler
  DoBackupProgress(Step, PercentDone);
end;

procedure TdmOdugDemo.DBISAMDatabaseBackupLog(Sender: TObject;
  const LogMessage: String);
begin
  // backup log event handler
  DoBackupLog(LogMessage);
end;

procedure TdmOdugDemo.DoBackupProgress(Step: string; PercentDone: Word);
begin
  // backup progress event launcher
  if Assigned(FOnBackupProgress) then
    FOnBackupProgress(Step, PercentDone);
end;

procedure TdmOdugDemo.DoBackupLog(LogMsg: string);
begin
  // backup log event launcher
  if Assigned(FOnBackupLog) then
    FOnBackupLog(LogMsg);
end;

procedure TdmOdugDemo.DBISAMEngineAfterInsertTrigger(Sender: TObject;
  TriggerSession: TDBISAMSession; TriggerDatabase: TDBISAMDatabase;
  const TableName: String; CurrentRecord: TDBISAMRecord);
begin
  // insert event handler
  if UpperCase(TableName) = 'CUSTOMER' then
    DoInsertEvent(TableName, CurrentRecord.FieldValues['Company']);
end;

procedure TdmOdugDemo.DoInsertEvent(TableName, KeyValue: string);
begin
  // insert event launcher
  if Assigned(FOnInsertRec) then
    FOnInsertRec(TableName, KeyValue);
end;

end.
