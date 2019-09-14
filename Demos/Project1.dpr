program Project1;

uses
  Vcl.Forms,
  System.Classes,
  Vcl.Themes,
  Vcl.Styles,
  Unit1 in 'Unit1.pas' {Form1},
  Vcl.Dialogs in 'Arabic_Units/Vcl.Dialogs.pas',
  Vcl.Consts in 'Arabic_Units/Vcl.Consts.pas',
  Vcl.ComCtrls in 'Arabic_Units/Vcl.ComCtrls.pas',
  Vcl.DBCtrls in 'Arabic_Units/Vcl.DBCtrls.pas',
  System.SysConst in 'Arabic_Units/System.SysConst.pas',
  System.RTLConsts in 'Arabic_Units/System.RTLConsts.pas',
  Data.DBConsts in 'Arabic_Units/Data.DBConsts.pas',
  Data.Win.ADOConst in 'Arabic_Units/Data.Win.ADOConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '   برنامج تجريبي';
  Application.BiDiMode:=bdRightToLeft;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
