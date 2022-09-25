unit fMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Separator2: TMenuItem;
    Separator1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  xr_run: String;

implementation

{$R *.lfm}

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  if not OpenDialog1.Execute then
    ShowMessage('File note selected')
  else
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  if MenuItem10.Checked then
  begin
    MenuItem10.Checked := false;
    Memo1.ScrollBars := ssBoth;
  end
  else
  begin
    MenuItem10.Checked := true;
    Memo1.ScrollBars := ssVertical;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Str: String;
  i: Integer;
begin

  xr_run := '2';
  if (ParamCount > 0) then
  begin
    str := ParamStr(1);
    for i := 2 to ParamCount do Str := Str + ' ' + ParamStr(i);
  end;

  if Str <> '' then
    Memo1.Lines.LoadFromFile(str);
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  FontDialog1.Font.Color := Memo1.Font.Color;
  FontDialog1.Font.Style := Memo1.Font.Style;
  FontDialog1.Font.Size := Memo1.Font.Size;
  FontDialog1.Font.CharSet := Memo1.Font.CharSet;
  FontDialog1.Font.Name := Memo1.Font.Name;

  if FontDialog1.Execute then
    begin
      Memo1.Font.Color := FontDialog1.Font.Color;
      Memo1.Font.Style := FontDialog1.Font.Style;
      Memo1.Font.Size := FontDialog1.Font.Size;
      Memo1.Font.CharSet := FontDialog1.Font.CharSet;
      Memo1.Font.Name := FontDialog1.Font.Name;
    end;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  SaveDialog1.InitialDir := GetCurrentDir;
  if not SaveDialog1.Execute then
    ShowMessage('File note saved')
  else
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  if not InputQuery('XOR', 'Added number xor:', xr_run) then
  Exit;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
var
  xr: string;
  i: Integer;
begin
  xr := '';
  for i := 1 to Length(Memo1.Text) do
  begin
    xr := xr + Chr(Ord(Memo1.Text[i]) xor StrToInt(xr_run));
  end;
  Memo1.Text := xr;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.

