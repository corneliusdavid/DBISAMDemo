program OdugDemo;

uses
  Forms,
  ufrmOdugDemo in 'ufrmOdugDemo.pas' {frmOdugDemo},
  udmOdugDemo in 'udmOdugDemo.pas' {dmOdugDemo: TDataModule},
  ufrmAddCust in 'ufrmAddCust.pas' {frmAddCust};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'DBISAM 4 Demo';
  Application.CreateForm(TfrmOdugDemo, frmOdugDemo);
  Application.CreateForm(TdmOdugDemo, dmOdugDemo);
  Application.Run;
end.
