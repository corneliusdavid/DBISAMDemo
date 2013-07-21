=== ABOUT ===

This simple demonstration of DBISAM's database usaage was built to show some of the capabilities of DBISAM, and to show how similar it is to Borland's BDE.  It was originally written for the Oregon Delphi User Group by David Cornelius, November, 2004, and requires DBISAM 4 and Delphi 6 Pro or greater.


=== SETUP ===

Two tables are used in this demo, both coming from Borland's DBDemos, data files that ship with several versions of the Delphi compiler.  The two tables are customer and orders.  Before running this program, use DBISAM's BDE Transfer Utility to convert the DBDemos tables to DBISAM format.  The program as it was originally written uses a "data" subdirectory under the application's directory for it's database directory.  Create this directory before running the BDE Transfer utility.  I would suggest transfering all data files as the demonstration of the DBISAM's backup feature will be more interesting with more files.  In addition, you may want to extend this demo for your own learning and/or demonstrating purposes and use additional tables.

After transfering the data files, run DBISAM's DBSYS
utility and make two changes: 1) alter the customer
table by changing the CustNo field to AutoInc; and
2) alter the orders table by encrypting with the
password "odug" (without the quotes, of course).


=== FEATURES ===

The following DBISAM features and techniques are demonstrated in DBISAMDemo:

* Setting the database directory at run-time;
* Using familiar "TTable" features such as Open, Refresh, Insert, Post, and Locate;
* Establishing a master-detail relationship using a query with a parameter;
* Adding a session password to access an encrypted table;
* Creating an in-memory table and copying the records to a file-based table using queries;
* Using LastAutoInc in a Transaction to find a newly-inserted record;
* Using the Backup feature with progress and log event handling.


=== DISCLAIMER, ETC. ===

This software is provided as-is with no guarantees whatsoever and is meant for simple educational and demonstration purposes only.  Anyone may take this code and modify it for their own needs without restriction.


November 9, 2004

David E. Cornelius
Cornelius Concepts
http://corneliusconcepts.com
