unit ufrmAddCust;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons;

type
  TfrmAddCust = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    srcCustomer: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

procedure AddCustomer;


implementation

uses
  udmOdugDemo;

{$R *.dfm}

procedure AddCustomer;
begin
  with TfrmAddCust.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

{ TfrmAddCust }

procedure TfrmAddCust.btnOkClick(Sender: TObject);
begin
  srcCustomer.DataSet.Post;
end;

procedure TfrmAddCust.btnCancelClick(Sender: TObject);
begin
  srcCustomer.DataSet.Cancel;
end;

procedure TfrmAddCust.FormShow(Sender: TObject);
begin
  if not srcCustomer.DataSet.Active then
    srcCustomer.DataSet.Open;

  srcCustomer.DataSet.Append;
end;

end.
