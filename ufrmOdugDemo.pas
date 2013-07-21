unit ufrmOdugDemo;
(*
 * as: ufrmOdugDemo.pas/dfm
 * by: David E. Cornelius
 * of: Cornelius Concepts, Inc.
 * on: November, 2004
 * in: Delphi 6 Professional
 * to: Illustrate various DBISAM 4 techniques
 *
 * This unit is the main form of the project.
 *)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ExtCtrls, ComCtrls;

type
  TfrmOdugDemo = class(TForm)
    srcCustomers: TDataSource;
    dbgCustomers: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dbgOrders: TDBGrid;
    srcOrders: TDataSource;
    Panel1: TPanel;
    btnInsert: TButton;
    btnBackup: TButton;
    ProgressBar: TProgressBar;
    lblBackupStep: TLabel;
    procedure btnInsertClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgCustomersTitleClick(Column: TColumn);
  private
    BackupLog: string;
    procedure RecordInserted(TableName, KeyValue: string);
    procedure OnBackupLog(LogMsg: string);
    procedure OnBackupProgress(Step: string; PercentDone: Word);
  end;

var
  frmOdugDemo: TfrmOdugDemo;


implementation

uses
  udmOdugDemo, ufrmAddCust;

{$R *.dfm}

procedure TfrmOdugDemo.btnInsertClick(Sender: TObject);
begin
  // calls the self-contained procedure of the ufrmAddCust unit
  AddCustomer;
end;

procedure TfrmOdugDemo.btnBackupClick(Sender: TObject);
begin
  // clear the summary message
  BackupLog := EmptyStr;

  Screen.Cursor := crHourGlass;
  try
    // hook into the backup events
    dmOdugDemo.OnBackupProgress := OnBackupProgress;
    dmOdugDemo.OnBackupLog := OnBackupLog;
    // start the backup
    dmOdugDemo.Backup;
  finally
    Screen.Cursor := crDefault;
  end;

  // show the summary message
  ShowMessage('Backup done!'#10#13#13 + BackupLog);
end;


procedure TfrmOdugDemo.OnBackupProgress(Step: string; PercentDone: Word);
begin
  // show the current step and update the progress bar
  lblBackupStep.Caption := step;
  lblBackupStep.Update;
  ProgressBar.Position := PercentDone;
end;

procedure TfrmOdugDemo.OnBackupLog(LogMsg: string);
begin
  // build the backup summary message
  BackupLog := BackupLog + LogMsg + ', ';
end;


procedure TfrmOdugDemo.FormShow(Sender: TObject);
begin
  // this seems as good a place as any to hook up to a database event
  dmOdugDemo.OnInsertRec := RecordInserted;
end;

procedure TfrmOdugDemo.RecordInserted(TableName, KeyValue: string);
begin
  // our handler for a general database engine trigger 
  ShowMessage('A record was just inserted into [' + TableName + ']'#10#13 +
              'The key value inserted is: [' + KeyValue + ']');
end;

procedure TfrmOdugDemo.dbgCustomersTitleClick(Column: TColumn);
begin
  // Sort the table by the field selected...
  // This requires a knowledge of the underlying dataset
  // (or dynamically created indexes on each field).
  // This demo only allows CustNo and Company to be sorted
  if (Column.FieldName = 'CustNo') or (Column.FieldName = 'Company') then 
    dmOdugDemo.tblCustomers.IndexFieldNames := Column.FieldName;
end;

end.
