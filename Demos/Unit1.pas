unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ActnPopup, AdvMemo,
  System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  Vcl.BandActn, Vcl.ActnCtrls, Vcl.ActnMenus;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    Button2: TButton;
    ImageList1: TImageList;
    ToolButton8: TToolButton;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    ListView1: TListView;
    TrackBar1: TTrackBar;
    ProgressBar1: TProgressBar;
    TabSheet2: TTabSheet;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionToolBar1: TActionToolBar;
    Memo1: TMemo;
    ActionManager1: TActionManager;
    AdvMemoRedo1: TAdvMemoRedo;
    AdvMemoCut1: TAdvMemoCut;
    AdvMemoCopy1: TAdvMemoCopy;
    AdvMemoPaste1: TAdvMemoPaste;
    AdvMemoDelete1: TAdvMemoDelete;
    PopupActionBar1: TPopupActionBar;
    MenuItem1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    CustomizeActionBars1: TCustomizeActionBars;
    TabSheet4: TTabSheet;
    Button5: TButton;
    TabControl1: TTabControl;
    MonthCalendar1: TMonthCalendar;
    HeaderControl1: THeaderControl;
    procedure TrackBar1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure AdvMemoRedo1Execute(Sender: TObject);
    procedure AdvMemoCut1Execute(Sender: TObject);
    procedure AdvMemoCopy1Execute(Sender: TObject);
    procedure AdvMemoPaste1Execute(Sender: TObject);
    procedure AdvMemoDelete1Execute(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.AdvMemoCopy1Execute(Sender: TObject);
begin
//
end;

procedure TForm1.AdvMemoCut1Execute(Sender: TObject);
begin
//
end;

procedure TForm1.AdvMemoDelete1Execute(Sender: TObject);
begin
//
end;

procedure TForm1.AdvMemoPaste1Execute(Sender: TObject);
begin
//
end;

procedure TForm1.AdvMemoRedo1Execute(Sender: TObject);
begin
//
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
ShowMessage('—”«·… ⁄—»Ì…');

end;

procedure TForm1.Button2Click(Sender: TObject);
var b:tbitmap;
begin
if Form1.BiDiMode=bdLeftToRight then
Form1.BiDiMode:=bdRightToLeft
else
Form1.BiDiMode:=bdLeftToRight;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
MessageDlg('’‰œÊﬁ —”«·… ⁄—»Ì',mtInformation,mbYesNoCancel,0)
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
// Div By Zero
Left:= left div (left-left);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
PageControl1.Pages[500].SetFocus;
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
ProgressBar1.Position:=TrackBar1.Position;

end;

end.
