program Project1;

uses
  Vcl.Forms,
  System.Classes,
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '   »—‰«„Ã  Ã—Ì»Ì';
  Application.BiDiMode:=bdRightToLeft;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
