unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvUIB, StdCtrls;

type
  TMainForm = class(TForm)
    Go: TButton;
    DataBase: TJvUIBDataBase;
    Transaction: TJvUIBTransaction;
    Memo: TMemo;
    StoredProc: TJvUIBQuery;
    procedure GoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses JvUIBLib;

{$R *.dfm}

procedure TMainForm.GoClick(Sender: TObject);
var i: Integer;
begin
  Memo.Clear;
  StoredProc.BuildStoredProc('SUB_TOT_BUDGET');
  Memo.Lines.Add(StoredProc.SQL.Text);
  Memo.Lines.Add(StoredProc.Params.FieldName[0] + ': 100');
  Memo.Lines.Add('---');
  StoredProc.Params.ByNameAsString['HEAD_DEPT'] := '100';

  StoredProc.Open;
  with StoredProc.Fields do
  for i := 0 to FieldCount - 1 do
    memo.Lines.Add(AliasName[i] + ': ' + AsString[i]);
  StoredProc.Close(etmCommit);
end;

end.
