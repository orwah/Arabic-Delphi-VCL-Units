{*******************************************************}
{                                                       }
{            Arabic Delphi VCL Units                    }
{                                                       }
{ Modified by : Orwah Ali Issa (www.orwah.net)          }
{                                                       }
{ Delphi 10.1 Berline ..  File Version 0.1  1/10/2016   }
{                                                       }
{ Get Last Version From Here :                          }
{ https://github.com/orwah/Arabic-Delphi-VCL-Units      }
{                                                       }
{*******************************************************}

{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{ This unit uses code of the Vcl.Styles.Utils project   }
{ https://github.com/RRUZ/vcl-styles-utils licensed to  }
{ Embarcadero for distribution as part of the VCL.      }
{ Copyright(c) 2015 Rodrigo Ruz https://github.com/RRUZ }
{ and  Mahdi Safsafi https://github.com/MahdiSafsafi    }
{*******************************************************}

unit Vcl.SysStyles;

{$R-}

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.UxTheme,
  Vcl.Themes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.ImgList,
  Vcl.GraphUtil,
  Vcl.Controls,
  Vcl.Menus,
  System.Math,
  Winapi.CommCtrl,
  Winapi.RichEdit;

const
  { The Undocumented Messages }
  MN_SETHMENU = $01E0;
  MN_GETHMENU = $01E1;
  {$EXTERNALSYM MN_GETHMENU} {winuser.h}
  MN_SIZEWINDOW = $01E2;
  MN_OPENHIERARCHY = $01E3;
  MN_CLOSEHIERARCHY = $01E4;
  MN_SELECTITEM = $01E5;
  MN_CANCELMENUS = $01E6;
  MN_SELECTFIRSTVALIDITEM = $01E7;
  MN_GETPPOPUPMENU = $01EA;
  MN_FINDMENUWINDOWFROMPOINT = $01EB;
  MN_SHOWPOPUPWINDOW = $01EC;
  MN_BUTTONDOWN = $01ED;
  MN_MOUSEMOVE = $01EE;
  MN_BUTTONUP = $01EF;
  MN_SETTIMERTOOPENHIERARCHY = $01F0;
  MN_DBLCLK = $001F1;

  { MARLETT Font Char Const }
  MARLETT_RESTORE_CHAR = Char(50);
  MARLETT_MINIMIZE_CHAR = Char(48);
  MARLETT_CLOSE_CHAR = Char(114);
  MARLETT_MAXIMIZE_CHAR = Char(49);

type
  TSysPopupStyleHook = class;
  TSysPopupItemState = set of (isHot, isDisabled, isChecked, isDefault);
  TSysPopupItemStyle = (isNormal, isSep, isDropDown);

  TSysPopupStyleHook = class(TSysStyleHook)
  private type
    TSysPopupItem = class
    private
      FIndex: Integer;
      FVCLMenuItem: TMenuItem;
      FMenu: HMENU;
      FHandle: HWND;
      FSysParent: TSysControl;
      function GetItemRect: TRect;
      function IsItemDisabled: Boolean;
      function IsItemContainsSubMenu: Boolean;
      function IsItemSeparator: Boolean;
      function isItemChecked: Boolean;
      function isItemDefault: Boolean;
      function GetItemText: String;
      function GetVCLParentMenuItem: TMenuItem;
      function GetItemBitmap: HBITMAP;
      function IsItemRadioCheck: Boolean;
    public
      constructor Create(SysParent: TSysControl; Index: Integer;
        Menu: HMENU); virtual;
      Destructor Destroy; override;
      property ItemRect: TRect read GetItemRect;
      property Disabled: Boolean read IsItemDisabled;
      property Separator: Boolean read IsItemSeparator;
      property HasSubMenu: Boolean read IsItemContainsSubMenu;
      property Checked: Boolean read isItemChecked;
      property RadioCheck: Boolean read IsItemRadioCheck;
      property DefaultItem: Boolean read isItemDefault;
      property Text: String read GetItemText;
      property VCLMenuItem: TMenuItem read FVCLMenuItem;
      property Bitmap: HBITMAP read GetItemBitmap;
    end;

  var
    FItemsPainted: Boolean;
    FParentSubItemPainted: Boolean;
    FPreviousHotItemIndex: Integer;
    FKeyIndex: Integer;
    FSysPopupItem: TSysPopupItem;
    FCount: Integer;
    FMenu: HMENU;
    function GetMenuFromHandle(AHandle: HWND): HMENU;
    function GetItemsCount: Integer;
    procedure MNSELECTITEM(var Message: TMessage); message MN_SELECTITEM;
    procedure WMPRINT(var Message: TMessage); message WM_PRINT;
    function GetSysPopupItem(Index: Integer): TSysPopupItem;
    function GetRightToLeft: Boolean;
  protected
    procedure EraseItem(Canvas: TCanvas; Index: Integer;
      ItemRect: TRect); virtual;
    procedure DoDrawItem(Canvas: TCanvas; Index: Integer);
    procedure DrawItem(Canvas: TCanvas; Index: Integer; ItemRect: TRect;
      ItemText: String; State: TSysPopupItemState;
      Style: TSysPopupItemStyle); Virtual;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    procedure UpdateColors; override;
  public
    constructor Create(AHandle: THandle); override;
    Destructor Destroy; override;
    property Menu: HMENU read FMenu;
    property Items[Index: Integer]: TSysPopupItem read GetSysPopupItem;
    property Count: Integer read FCount;
    property RightToLeft: Boolean read GetRightToLeft;
  end;

  TSysScrollingType = (skNone, skTracking, skLineUp, skLineDown, skLineLeft, skLineRight, skPageUp, skPageDown, skPageLeft, skPageRight);

  TSysScrollingStyleHook = class(TMouseTrackSysControlStyleHook)
  private
    FTimerMode: Integer;
    FVertScrollBar: Boolean;
    FHorzScrollBar: Boolean;
    FPrevPoint: TPoint;
    FPrevPos: Integer;
    FDownDis: Integer;
    FDownPoint: TPoint;
    FTrackingPos: Integer;
    FTrackingRect: TRect;
    FTracking: Boolean;
    FScrollingType: TSysScrollingType;
    FScrollKind: TScrollBarKind;
    FBtnUpDetail: TThemedScrollBar;
    FBtnDownDetail: TThemedScrollBar;
    FVertBtnSliderDetail: TThemedScrollBar;
    FBtnLeftDetail: TThemedScrollBar;
    FBtnRightDetail: TThemedScrollBar;
    FHorzBtnSliderDetail: TThemedScrollBar;
    FNCMouseDown: Boolean;
    FAllowScrolling: Boolean;
    FLstPos: Integer;
    function GetDefaultScrollBarSize: TSize;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Message: TWMNCLButtonUp); message WM_NCLBUTTONUP;
    procedure CMSCROLLTRACKING(var Message: TMessage); message CM_SCROLLTRACKING;
    function GetVertScrollRect: TRect;
    function GetVertUpRect: TRect;
    function GetVertDownRect: TRect;
    function GetVertSliderRect: TRect;
    function GetVertSliderPos: Integer;
    function GetVertThumbSize: Integer;
    function GetVertTrackRect: TRect;
    function GetVertScrollInfo: TScrollInfo;
    function GetVertThumbPosFromPos(const Pos: Integer): Integer;
    function GetVertScrollPosFromPoint(const P: TPoint): Integer;
    function GetHorzThumbPosFromPos(const Pos: Integer): Integer;
    function GetHorzScrollPosFromPoint(const P: TPoint): Integer;
    function GetHorzSliderPos: Integer;
    function GetHorzThumbSize: Integer;
    function GetHorzLeftRect: TRect;
    function GetHorzScrollInfo: TScrollInfo;
    function GetHorzSliderRect: TRect;
    function GetHorzTrackRect: TRect;
    function GetHorzRightRect: TRect;
    function GetHorzScrollRect: TRect;
    function IsLeftScrollBar: Boolean;
    function IsHorzScrollDisabled: Boolean;
    function IsVertScrollDisabled: Boolean;
  protected
    property LstPos : Integer read FLstPos write FLstPos;
    property AllowScrolling : Boolean read FAllowScrolling write FAllowScrolling;
    function NormalizePoint(const P: TPoint): TPoint;
    procedure Scroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer); virtual;
    procedure DoScroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer);
    procedure DrawHorzScroll(DC: HDC); virtual;
    procedure DrawVertScroll(DC: HDC); virtual;
    procedure DrawSmallRect(DC: HDC; const SmallRect: TRect); virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure StartSliderTrackTimer;
    procedure StopTrackTimer; virtual;
    procedure StartPageTrackTimer;
    procedure StartLineTrackTimer;
    procedure DoPageTrackTimer;
    procedure DoSliderTrackTimer;
    procedure DoLineTrackTimer;
    procedure InitScrollState;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
    Destructor Destroy; override;
    property VertScrollRect: TRect read GetVertScrollRect;
    property VertUpRect: TRect read GetVertUpRect;
    property VertDownRect: TRect read GetVertDownRect;
    property VertSliderRect: TRect read GetVertSliderRect;
    property VertTrackRect: TRect read GetVertTrackRect;
    property VertScrollInfo: TScrollInfo read GetVertScrollInfo;
    property HorzScrollRect: TRect read GetHorzScrollRect;
    property HorzLeftRect: TRect read GetHorzLeftRect;
    property HorzRightRect: TRect read GetHorzRightRect;
    property HorzSliderRect: TRect read GetHorzSliderRect;
    property HorzTrackRect: TRect read GetHorzTrackRect;
    property HorzScrollInfo: TScrollInfo read GetHorzScrollInfo;
    property BtnSize: TSize read GetDefaultScrollBarSize;
    property Tracking: Boolean read FTracking;
    property TrackingRect: TRect read FTrackingRect;
    property TrackingPos: Integer read FTrackingPos;
    property LeftScrollBar: Boolean read IsLeftScrollBar;
    property VertScrollDisabled: Boolean read IsVertScrollDisabled;
    property HorzScrollDisabled: Boolean read IsHorzScrollDisabled;
  end;

  TSysDialogStyleHook = class(TSysScrollingStyleHook)
  private
    FFrameActive: Boolean;
    FPressedButton: Integer;
    FHotButton: Integer;
    FIcon: TIcon;
    FIconHandle: HICON;
    FCaptionRect: TRect;
    FSysMenuButtonRect: TRect;
    FRegion: HRGN;
    FWidth, FHeight: Integer;
    FSysCloseButtonDisabled: Boolean;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown(var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCLButtonUp(var Message: TWMNCLButtonUp); message WM_NCLBUTTONUP;
    procedure WMNCMouseMove(var Message: TWMNCHitMessage); message WM_NCMOUSEMOVE;
    procedure WMNCACTIVATE(var Message: TWMNCActivate); message WM_NCACTIVATE;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMSIZE(var Message: TWMSize); message WM_SIZE;
    procedure WMSetText(var Message: TMessage); message WM_SETTEXT;
    function GetCaptionRect: TRect;
    function GetBorderStyle: TFormBorderStyle;
    function GetBorderIcons: TBorderIcons;
    function GetCloseButtonRect: TRect;
    function GetMaxButtonRect: TRect;
    function GetMinButtonRect: TRect;
    function GetHelpButtonRect: TRect;
    function GetSysMenuButtonRect: TRect;
    function GetWindowState: TWindowState;
    function UseSmallBorder: Boolean;
    function GetRegion: HRGN;
    function GetIcon: TIcon;
    function GetIconFast: TIcon;
    function NormalizePoint(const P: TPoint): TPoint;
    function GetHitTest(const P: TPoint): Integer;
    function IsSysCloseButtonDisabled: Boolean;
    function GetSysMenu: HMENU;
    function GetUpdateRegion: Boolean;
  protected
    procedure DrawBorder(Canvas: TCanvas); override;
    function GetBorderSize: TRect; override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    procedure MouseLeave; override;
    procedure Close; virtual;
    procedure Help; virtual;
    procedure Maximize; virtual;
    procedure Minimize; virtual;
    procedure Restore; virtual;
    property  PressedButton: Integer read FPressedButton write FPressedButton;
    property  HotButton: Integer read FHotButton write FHotButton;
  public
    constructor Create(AHandle: THandle); override;
    Destructor Destroy; override;
    property CaptionRect: TRect read GetCaptionRect;
    property UpdateRegion: Boolean read GetUpdateRegion;
    property BorderStyle: TFormBorderStyle read GetBorderStyle;
    property BorderSize: TRect read GetBorderSize;
    property BorderIcons: TBorderIcons read GetBorderIcons;
    Property WindowState: TWindowState read GetWindowState;
    Property CloseButtonRect: TRect read GetCloseButtonRect;
    Property MaxButtonRect: TRect read GetMaxButtonRect;
    Property MinButtonRect: TRect read GetMinButtonRect;
    Property HelpButtonRect: TRect read GetHelpButtonRect;
    property SysMenuButtonRect: TRect read GetSysMenuButtonRect;
    property Icon: TIcon read GetIconFast;
    property SysMenu: HMENU read GetSysMenu;
    property SysCloseButtonDisabled: Boolean read FSysCloseButtonDisabled;
  end;

  {
    Note: The development of this class is not finished yet .
    Only ScrollBar with SIZEBOX is supported !!.
  }
  TSysScrollBarStyleHook = class(TSysStyleHook)
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysCheckBoxState = (cbUnchecked, cbChecked, cbGrayed);

  TSysButtonStyleHook = class(TMouseTrackSysControlStyleHook)
  private
    function GetCaptionRect(Canvas: TCanvas): TRect;
    function GetBoxRect: TRect;
    function IsCheckBox: Boolean;
    function IsRadioButton: Boolean;
    function IsGroupBox: Boolean;
    function IsPushButton: Boolean;
    function IsSplitButton: Boolean;
    function IsCommandButton: Boolean;
    function GetShowText: Boolean;
    function GetCheckBoxState: TSysCheckBoxState;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    function IsOwnerDraw: Boolean;
  protected
    procedure DrawCheckBoxText(DC: HDC; Text: String;
      LDetails: TThemedElementDetails; R: TRect); virtual;
    procedure PaintButton(Canvas: TCanvas); virtual;
    procedure PaintCheckBox(Canvas: TCanvas); virtual;
    procedure PaintRadioButton(Canvas: TCanvas); virtual;
    procedure PaintGroupBox(Canvas: TCanvas); virtual;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    procedure UpdateColors; override;
  public
    constructor Create(AHandle: THandle); override;
    property CheckBox: Boolean read IsCheckBox;
    property CommandButton: Boolean read IsCommandButton;
    property RadioButton: Boolean read IsRadioButton;
    property GroupBox: Boolean read IsGroupBox;
    property PushButton: Boolean read IsPushButton;
    property SplitButton: Boolean read IsSplitButton;
    property CheckBoxState: TSysCheckBoxState read GetCheckBoxState;
    property ShowText: Boolean read GetShowText;
    property OwnerDraw: Boolean read IsOwnerDraw;
  end;

  TSysEditStyleHook = class(TMouseTrackSysControlStyleHook)
  private
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
  protected
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    procedure UpdateColors; override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    function GetBorderSize: TRect; override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysComboBoxStyle = (csSysDropDown, csSysSimple, csSysDropDownList, csSysOwnerDrawFixed,
    csSysOwnerDrawVariable);

  TSysComboBoxStyleHook = class(TMouseTrackSysControlStyleHook)
  strict private
    FIgnoreStyleChanged: Boolean;
    FMouseOnButton: Boolean;
    FListHandle, FEditHandle: HWnd;
    NeedsDefaultPaint: Boolean;
    function IsDroppedDown: Boolean;
    function GetButtonRect: TRect;
    function Style: TSysComboBoxStyle;
    procedure WMCommand(var Message: TWMCommand); message WM_COMMAND;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure WMDrawItem(var Message: TWMDrawItem); message WM_DRAWITEM;
    procedure WMParentNotify(var Message: TMessage); message WM_PARENTNOTIFY;
  strict protected
    procedure UpdateColors; override;
    function IsChildHandle(AHandle: HWnd): Boolean; override;
    procedure DrawItem(Canvas: TCanvas;const Index: UINT; const R: TRect;
     const Selected: Boolean); virtual;
    property ListHandle: HWnd read FListHandle;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
    procedure PaintBorder(Canvas: TCanvas); virtual;
    procedure WndProc(var Message: TMessage); override;
    property ButtonRect: TRect read GetButtonRect;
    property MouseOnButton: Boolean read FMouseOnButton write FMouseOnButton;
    property DroppedDown: Boolean read IsDroppedDown;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysListBoxStyleHook = class(TSysScrollingStyleHook)
  protected
    function GetBorderSize: TRect; override;
    procedure WndProc(var Message: TMessage); override;
    procedure UpdateColors; override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMPrint(var Message: TMessage); message WM_PRINT;
    procedure PaintNC(Canvas: TCanvas); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysStaticStyleHook = class(TSysStyleHook)
  private
    FUpdatedColor: TColor;
    function GetIsText: Boolean;
    function GetTextFormat: TTextFormat;
    function GetIsFrameOrLine: Boolean;
  protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure UpdateColors; override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
    property IsText: Boolean read GetIsText;
    property IsFrameOrLine: Boolean read GetIsFrameOrLine;
    property TextFormat: TTextFormat read GetTextFormat;
  end;

   TSysListViewStyleHook = class(TSysScrollingStyleHook)
  private type
{$REGION 'TSysHeaderStyleHook'}
    TSysHeaderStyleHook = class(TMouseTrackSysControlStyleHook)
    private type
{$REGION 'TSysSection'}
      TSysSection = class
      private
        FIndex: Integer;
        FColumnIndex: Integer;
        FImageIndex: Integer;
        FImageListHandle: THandle;
        FText: String;
        FSectionRect: TRect;
        FHeaderHandle: THandle;
        FHasSplitButton: Boolean;
        FTextFormat: TTextFormat;
        FBitmapOnRight: Boolean;
        FShowImage: Boolean;
        FDropDownRect: TRect;
      protected
        procedure DoGetSectionInfo;
      public
        constructor Create(SysParent: TSysControl; Index: Integer); virtual;
        Destructor Destroy; override;
        property Text: string read FText;
        property ImageListHandle: THandle read FImageListHandle;
        property ImageIndex: Integer read FImageIndex;
        property SectionRect: TRect read FSectionRect;
        property ColumnIndex: Integer read FColumnIndex;
        property ShowImage: Boolean read FShowImage;
        property BitmapOnRight: Boolean read FBitmapOnRight;
        property TextFormat: TTextFormat read FTextFormat;
        property HasSplitButton: Boolean read FHasSplitButton;
        property DropDownRect: TRect read FDropDownRect;
      end;
{$ENDREGION}
    private
      FPressedSection: Integer;
      FMouseDown: Boolean;
      FSysSection: TSysSection;
      FListViewStyleHook: TSysListViewStyleHook;
      function GetButtonsCount: Integer;
      function GetItem(Index: Integer): TSysSection;
    protected
      procedure MouseLeave; override;
      procedure WndProc(var Message: TMessage); override;
      procedure Paint(Canvas: TCanvas); override;
      procedure PaintBackground(Canvas: TCanvas); override;

    public
      constructor Create(AHandle: THandle); override;
      Destructor Destroy; override;
      property ButtonsCount: Integer read GetButtonsCount;
      property Items[Index: Integer]: TSysSection read GetItem;
    end;
{$ENDREGION}
  private
    FHeaderHandle: THandle;
    FHeaderStyleHook: TSysHeaderStyleHook;
  protected
    procedure Scroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer); override;
    procedure UpdateColors; override;
    procedure WndProc(var Message: TMessage); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;

  public
    procedure SetSelectedColumn(iCol: Integer);
    constructor Create(AHandle: THandle); override;
    Destructor Destroy; override;
    property HeaderHandle: THandle read FHeaderHandle write FHeaderHandle;
  end;

  TSysTreeViewStyleHook = class(TSysScrollingStyleHook)
  protected
    procedure Scroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer); override;
    procedure UpdateColors; override;
    procedure WndProc(var Message: TMessage); override;
    procedure StopTrackTimer; override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysTabPosition = (tpSysTop, tpSysBottom, tpSysLeft, tpSysRight);

  TSysTabControlStyleHook = class(TMouseTrackSysControlStyleHook)
  private
    FHotTabIndex: Integer;
    function GetDisplayRect: TRect;
    function GetTabCount: Integer;
    function GetTabIndex: Integer;
    function GetImages: TCustomImageList;
    function GetTabRect(Index: Integer): TRect;
    function GetTabPosition: TSysTabPosition;
    function GetTabs(Index: Integer): string;
    procedure AngleTextOut(Canvas: TCanvas; const Angle, X, Y: Integer; const Text: string);
  protected
    procedure DrawTab(Canvas: TCanvas; const Index: Integer);
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
    property DisplayRect: TRect read GetDisplayRect;
    property TabCount: Integer read GetTabCount;
    property TabIndex: Integer read GetTabIndex;
    property Images: TCustomImageList read GetImages;
    property TabRect[Index: Integer]: TRect read GetTabRect;
    property TabPosition: TSysTabPosition read GetTabPosition;
    property Tabs[Index: Integer]: string read GetTabs;
  end;

  TSysRichEditStyleHook = class(TSysScrollingStyleHook)
  strict private
    procedure EMSetBkgndColor(var Message: TMessage); message EM_SETBKGNDCOLOR;
    procedure EMSetCharFormat(var Message: TMessage); message EM_SETCHARFORMAT;
  strict private
    FBackColor: TColor;
  protected
    procedure UpdateColors; override;
    procedure WndProc(var Message: TMessage); override;
    function GetBorderSize: TRect; override;
  public
    property BackColor: TColor read FBackColor write FBackColor;
    constructor Create(AHandle: THandle); override;
  end;

type
  TSysToolbarButtonState = set of (bsEnabled, bsPressed, bsChecked, bsHidden);
  TSysToolbarButtonStyle = set of (bsBtn, bsSep, bsCheck, bsGroup, bsCheckGroup, bsDropDown);

  TSysReBarStyleHook = class(TSysStyleHook)
  strict private
    function GetBandText(const Index: Integer): string;
    function GetBandRect(const Index: Integer): TRect;
    function GetBandBorder(const Index: Integer): TRect;
    function GetBandCount: Integer;
  strict protected
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysStatusBarStyleHook = class(TSysStyleHook)
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysTrackBarStyleHook = class(TSysStyleHook)
  strict private
    FMouseOnThumb: Boolean;
    FThumbPressed: Boolean;
  strict protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysToolbarStyleHook = class(TMouseTrackSysControlStyleHook)
  private type
{$REGION 'TSysToolbarButton'}
    TSysToolbarButton = class
    private
      FParent: TSysControl;
      FIndex: Integer;
      FText: String;
      FImageIndex: Integer;
      FState: TSysToolbarButtonState;
      FStyle: TSysToolbarButtonStyle;
      function GetItemRect: TRect;
      procedure DoGetItemInfo;
      function GetDropDownWidth: Integer;
    public
      constructor Create(SysParent: TSysControl; Index: Integer); virtual;
      Destructor Destroy; override;
      property ItemRect: TRect read GetItemRect;
      property Parent: TSysControl read FParent;
      property Text: String Read FText;
      Property ImageIndex: Integer read FImageIndex;
      property State: TSysToolbarButtonState read FState;
      property Style: TSysToolbarButtonStyle read FStyle;
      property DropDownWidth: Integer read GetDropDownWidth;
    end;
{$ENDREGION}

  var
    FImages: TImageList;
    FDisabledImages: TImageList;
    FSysToolbarButton: TSysToolbarButton;
    FButtonsPainted: Boolean;
    function GetItem(Index: Integer): TSysToolbarButton;
    function GetCount: Integer;
    function IsToolbarTransparent: Boolean;
    function IsToolbarFlat: Boolean;
    function GetShowText: Boolean;
    function IsToolbarList: Boolean;
    function IsToolbarWrapable: Boolean;
  protected
    procedure ApplyImageList;
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintNC(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
    Destructor Destroy; override;
    property Items[index: Integer]: TSysToolbarButton read GetItem;
    property Count: Integer read GetCount;
    Property Flat: Boolean Read IsToolbarFlat;
    Property Transparent: Boolean Read IsToolbarTransparent;
    property ShowText: Boolean read GetShowText;
    property List: Boolean read IsToolbarList;
    property Wrapable: Boolean read IsToolbarWrapable;
  end;

  TSysProgressBarOrientation = (pbSysHorizontal, pbSysVertical);

  TSysProgressBarStyleHook = class(TSysStyleHook)
  strict private
    FStep: Integer;
    FOrientation: TSysProgressBarOrientation;
    FMarquee: Boolean;
    procedure TimerAction;
    function GetBarRect: TRect;
    function GetBorderWidth: Integer;
    function GetMax: Integer;
    function GetMin: Integer;
    function GetOrientation: TSysProgressBarOrientation;
    function GetPercent: Single;
    function GetPosition: Integer;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
  strict protected
    procedure PaintBackground(Canvas: TCanvas); override;
    procedure PaintBar(Canvas: TCanvas); virtual;
    procedure PaintFrame(Canvas: TCanvas); virtual;
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
    property BarRect: TRect read GetBarRect;
    property BorderWidth: Integer read GetBorderWidth;
    property Max: Integer read GetMax;
    property Min: Integer read GetMin;
    property Orientation: TSysProgressBarOrientation read GetOrientation;
    property Position: Integer read GetPosition;
  public
    constructor Create(AHandle: THandle); override;
    destructor Destroy; override;
  end;

  TSysUDOrientation = (udSysHorizontal, udSysVertical);

  TSysUpDownStyleHook = class(TMouseTrackSysControlStyleHook)
  strict private
    FLeftPressed, FRightPressed: Boolean;
    FMouseOnLeft, FMouseOnRight: Boolean;
    function GetOrientation: TSysUDOrientation;
    procedure WMLButtonDblClk(var Message: TWMMouse); message WM_LBUTTONDBLCLK;
    procedure WMLButtonDown(var Message: TWMMouse); message WM_LBUTTONDOWN;
    procedure WMLButtonUp(var Message: TWMMouse); message WM_LBUTTONUP;
    procedure WMMouseMove(var Message: TWMMouse); message WM_MOUSEMOVE;
  protected
    procedure Paint(Canvas: TCanvas); override;
    procedure MouseLeave; override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysLinkStyleHook = class(TSysStaticStyleHook)
  private
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
  protected
    procedure PaintNC(Canvas: TCanvas); override;
    procedure Paint(Canvas: TCanvas); override;
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  TSysTooltipsStyleHook = class(TSysStyleHook)
  private
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
  protected
    procedure Paint(Canvas: TCanvas); override;
    procedure PaintHint(Canvas: TCanvas; TextRect: TRect);
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AHandle: THandle); override;
  end;

  procedure RotateBitmap(Bmp: TBitmap; Rads: Single; AdjustSize: Boolean;
    BkColor: TColor = clNone);
  function RectVCenter(var R: TRect; Bounds: TRect): TRect;
  function GetBitmapHeight(hBmp: HBITMAP): Integer;
  function GetBitmapWidth(hBmp: HBITMAP): Integer;
  function GetBmpInfo(hBmp: HBITMAP): BITMAP;
  function BmpToIcon(hBmp: HBITMAP): HICON;

implementation
  uses System.UITypes;

var
  FCallFromKeyboard: Boolean = False;
  SysComCtlVersion: Integer = 0;

const
  WM_ITEMSPAINTED = WM_USER + 201;
  BS_SPLITBUTTON = $0000000C;
{$EXTERNALSYM BS_DEFSPLITBUTTON}
  BS_DEFSPLITBUTTON = $0000000D;
{$EXTERNALSYM BS_COMMANDLINK}
  BS_COMMANDLINK = $0000000E;
{$EXTERNALSYM BS_DEFCOMMANDLINK}
  BS_DEFCOMMANDLINK = $0000000F;

function GetSysComCtlVersion: Integer;
begin
  if SysComCtlVersion = 0 then
    SysComCtlVersion := GetFileVersion(comctl32);
  Result := SysComCtlVersion;
end;

procedure Frame3D(Canvas: TCanvas; var Rect: TRect; TopColor, BottomColor: TColor;
  Width: Integer);

  procedure DoRect;
  var
    TopRight, BottomLeft: TPoint;
  begin
    with Canvas, Rect do
    begin
      TopRight.X := Right;
      TopRight.Y := Top;
      BottomLeft.X := Left;
      BottomLeft.Y := Bottom;
      Pen.Color := TopColor;
      PolyLine([BottomLeft, TopLeft, TopRight]);
      Pen.Color := BottomColor;
      Dec(BottomLeft.X);
      PolyLine([TopRight, BottomRight, BottomLeft]);
    end;
  end;

begin
  Canvas.Pen.Width := 1;
  Dec(Rect.Bottom); Dec(Rect.Right);
  while Width > 0 do
  begin
    Dec(Width);
    DoRect;
    InflateRect(Rect, -1, -1);
  end;
  Inc(Rect.Bottom); Inc(Rect.Right);
end;

procedure FillDC(const DC: HDC; const R: TRect; const Color: TColor);
var
  Brush: HBRUSH;
begin
  Brush := CreateSolidBrush(Color);
  FillRect(DC, R, Brush);
  DeleteObject(Brush);
end;

function IsItemDisabled(const Menu: HMENU; const Index: Integer): Boolean;
var
  Info: TMenuItemInfo;
begin
  Result := False;
  if (Menu = 0) or (Index < 0) then
    Exit;

  FillChar(Info, sizeof(Info), Char(0));
  Info.cbSize := sizeof(TMenuItemInfo);
  Info.fMask := MIIM_STATE;
  GetMenuItemInfo(Menu, Index, True, Info);
  Result := (Info.fState and MFS_DISABLED = MFS_DISABLED) or (Info.fState and MF_DISABLED = MF_DISABLED) or (Info.fState and MF_GRAYED = MF_GRAYED);
end;

function GetMenuItemPos(const Menu: HMENU; const ID: Integer): Integer;
var
  I: Integer;
  MIInfo: MENUITEMINFO;
begin
  Result := -1;
  if Menu = 0 then
    Exit;
  for I := 0 to GetMenuItemCount(Menu) do
  begin
    FillChar(MIInfo, sizeof(MIInfo), Char(0));
    MIInfo.cbSize := sizeof(MIInfo);
    MIInfo.fMask := MIIM_ID;
    if GetMenuItemInfo(Menu, I, True, MIInfo) and
       (MIInfo.wID = Cardinal(ID)) then
      Exit(I);
  end;
end;

function IsWindowMsgBox(Handle: HWND): Boolean;
begin
  Result := ((FindWindowEx(Handle, 0, 'Edit', nil) = 0) and (GetDlgItem(Handle, $FFFF) <> 0)) and (GetWindowLongPtr(Handle, GWL_USERDATA) <> 0);
end;

function BmpToIcon(hBmp: HBITMAP): HICON;
var
  Bmp: BITMAP;
  hbmMask: HBITMAP;
  DC: HDC;
  IInfo: ICONINFO;
  Icon: HICON;
begin
  FillChar(Bmp, SizeOf(BITMAP), Char(0));
  GetObject(hBmp, SizeOf(BITMAP), @Bmp);
  DC := GetDC(0);
  hbmMask := CreateCompatibleBitmap(DC, Bmp.bmWidth, Bmp.bmHeight);
  IInfo.fIcon := True;
  IInfo.hbmColor := hBmp;
  IInfo.hbmMask := hbmMask;
  Icon := CreateIconIndirect(IInfo);
  DeleteObject(hbmMask);
  ReleaseDC(0, DC);
  Result := Icon;
end;

function GetBmpInfo(hBmp: HBITMAP): BITMAP;
begin
  ZeroMemory(@Result, SizeOf(BITMAP));
  GetObject(hBmp, SizeOf(Result), @Result);
end;

function GetBitmapHeight(hBmp: HBITMAP): Integer;
begin
  Result := GetBmpInfo(hBmp).bmHeight;
end;

function GetBitmapWidth(hBmp: HBITMAP): Integer;
begin
  Result := GetBmpInfo(hBmp).bmWidth;
end;

function RectVCenter(var R: TRect; Bounds: TRect): TRect;
begin
  OffsetRect(R, -R.Left, -R.Top);
  OffsetRect(R, 0, (Bounds.Height - R.Height) div 2);
  OffsetRect(R, Bounds.Left, Bounds.Top);
  Result := R;
end;

procedure RotateBitmap(Bmp: TBitmap; Rads: Single; AdjustSize: Boolean;
  BkColor: TColor = clNone);
var
  C: Single;
  S: Single;
  XForm: tagXFORM;
  Tmp: TBitmap;
begin
  C := Cos(Rads);
  S := Sin(Rads);
  XForm.eM11 := C;
  XForm.eM12 := S;
  XForm.eM21 := -S;
  XForm.eM22 := C;
  Tmp := TBitmap.Create;
  try
    Tmp.TransparentColor := Bmp.TransparentColor;
    Tmp.TransparentMode := Bmp.TransparentMode;
    Tmp.Transparent := Bmp.Transparent;
    Tmp.Canvas.Brush.Color := BkColor;
    if AdjustSize then
      begin
        Tmp.Width := Round(Bmp.Width * Abs(C) + Bmp.Height * Abs(S));
        Tmp.Height := Round(Bmp.Width * Abs(S) + Bmp.Height * Abs(C));
        XForm.eDx := (Tmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
        XForm.eDy := (Tmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
      end
    else
      begin
        Tmp.Width := Bmp.Width;
        Tmp.Height := Bmp.Height;
        XForm.eDx := (Bmp.Width - Bmp.Width * C + Bmp.Height * S) / 2;
        XForm.eDy := (Bmp.Height - Bmp.Width * S - Bmp.Height * C) / 2;
      end;
    SetGraphicsMode(Tmp.Canvas.Handle, GM_ADVANCED);
    SetWorldTransform(Tmp.Canvas.Handle, XForm);
    BitBlt(Tmp.Canvas.Handle, 0, 0, Tmp.Width, Tmp.Height, Bmp.Canvas.Handle, 0,
      0, SRCCOPY);
    Bmp.Assign(Tmp);
  finally
    Tmp.Free;
  end;
end;

{ TSysPopupStyleHook }

constructor TSysPopupStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seFont, seClient, seBorder];
  FPreviousHotItemIndex := -1;
  FKeyIndex := -1;
  FItemsPainted := False;
  FSysPopupItem := nil;
end;

procedure TSysPopupStyleHook.DoDrawItem(Canvas: TCanvas; Index: Integer);
var
  LItemRect, R: TRect;
  State: TSysPopupItemState;
  Style: TSysPopupItemStyle;
  LText: String;
  SaveIndex: Integer;
  Item: TSysPopupItem;
begin
  if (Index < 0) or (Index > Count - 1) then
    Exit;
  Item := Items[Index];
  LItemRect := Item.ItemRect;
  GetWindowRect(Handle, R);
  if (SysControl.BidiMode = sbmRightToLeft) and (Items[Index].FVCLMenuItem = nil) then
    OffsetRect(LItemRect, -R.Left - 6, -R.Top)
  else
    OffsetRect(LItemRect, -R.Left, -R.Top);
  if LItemRect.Left < 2 then
    LItemRect.Left := 2;
  Inc(LItemRect.Right, 4);
  if LItemRect.Top < 2 then
    Inc(LItemRect.Top, 2);
  { Item State }
  State := [];
  if (Index <> FPreviousHotItemIndex) and FItemsPainted then
    Include(State, isHot);
  if Item.Disabled then
    Include(State, isDisabled);
  if Item.Checked then
    Include(State, isChecked);
  if Item.DefaultItem then
    Include(State, isDefault);
  { Item Style }
  Style := isNormal;
  if Item.Separator then
    Style := isSep;
  if Item.HasSubMenu then
    Style := isDropDown;

  LText := '';
  if Style <> isSep then
    LText := Item.Text;

  SaveIndex := SaveDC(Canvas.Handle);
  try
    EraseItem(Canvas, Index, LItemRect);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;

  SaveIndex := SaveDC(Canvas.Handle);
  try
    DrawItem(Canvas, Index, LItemRect, LText, State, Style);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;
end;

procedure TSysPopupStyleHook.DrawItem(Canvas: TCanvas; Index: Integer;
  ItemRect: TRect; ItemText: String; State: TSysPopupItemState;
  Style: TSysPopupItemStyle);
var
  Detail: TThemedMenu;
  LDetails: TThemedElementDetails;
  LTextFormat: TTextFormat;
  DC: HDC;
  LSize: TSize;
  MI: TMenuItem;
  MIImages: TCustomImageList;
  ImageIndex: Integer;
  LImageRect, R: TRect;
  LTextRect: TRect;
  hBmp: HBITMAP;
  BmpHeight, BmpWidth: Integer;
  Icon: HICON;
  DisplayCheckedGlyph: Boolean;
  Sign: Char;
  SysItem: TSysPopupItem;
  sShortCut: String;
  Bmp: TBitmap;
  VCLItemState: TOwnerDrawState;
  Buffer: TBitmap;
  BF: TBlendFunction;
  SrcRect, DstRect: TRect;

  procedure DrawSubMenu(const ItemRect: TRect);
  var
    Bmp: TBitmap;
    LSubMenuDetails: TThemedElementDetails;
    LSubMenuDetail: TThemedMenu;
    SubMenuSize: TSize;
    LSubMenuRect: TRect;
  begin

    LSubMenuRect := Rect(0, 0, 0, 0);
    LSubMenuDetail := tmPopupSubMenuNormal;
    if isDisabled in State then
      LSubMenuDetail := tmPopupSubMenuDisabled;
    LSubMenuDetails := StyleServices.GetElementDetails(LSubMenuDetail);
    StyleServices.GetElementSize(DC, LSubMenuDetails, esActual, SubMenuSize);
    if not RightToLeft then
      LSubMenuRect := Rect(ItemRect.Right - SubMenuSize.cx, ItemRect.Top,
        ItemRect.Right, ItemRect.Top + SubMenuSize.cy)
    else
      LSubMenuRect := Rect(ItemRect.Left + 4, ItemRect.Top,
        ItemRect.Left + 4 + SubMenuSize.Width, ItemRect.Bottom);
    Bmp := TBitmap.Create;
    try
      Bmp.SetSize(SubMenuSize.Width, SubMenuSize.Height);
      Bmp.Canvas.Brush.Color := clFuchsia;
      Bmp.Canvas.FillRect(Rect(0, 0, SubMenuSize.Width, SubMenuSize.Height));
      StyleServices.DrawElement(Bmp.Canvas.Handle, LSubMenuDetails,
        Rect(0, 0, SubMenuSize.Width, SubMenuSize.Height));
      if RightToLeft or (SysControl.BidiMode = sbmRightToLeft) then
        begin
          RotateBitmap(Bmp, DegToRad(180), False, clFuchsia);
          Inc(LSubMenuRect.Top, (Bmp.Height div 2) - 2);
        end
      else
        Dec(LSubMenuRect.Left, 4);

      if TStyleManager.SystemStyle.Enabled then
      begin
        TransparentBlt(DC, LSubMenuRect.Left, LSubMenuRect.Top - 1, SubMenuSize.Width,
           SubMenuSize.Height, Bmp.Canvas.Handle, 0, 0, SubMenuSize.Width,
           SubMenuSize.Height, clFuchsia)
      end
      else
        TransparentBlt(DC, LSubMenuRect.Left, LSubMenuRect.Top - 3, SubMenuSize.Width,
           SubMenuSize.Height, Bmp.Canvas.Handle, 0, 0, SubMenuSize.Width,
           SubMenuSize.Height, clFuchsia)

    finally
      Bmp.Free;
    end;
    Dec(LTextRect.Right, LSubMenuRect.Width);
  end;

  procedure DrawVisualSysBitmap(Bmp: HBITMAP);
  var
    Theme: HTHEME;
    LRect, R: TRect;
    iPart, iState: Integer;
    LSize: TSize;
  begin
    Theme := OpenThemeData(0, 'Menu');
    iPart := MENU_SYSTEMCLOSE;
    case hBmp of
      HBMMENU_POPUP_RESTORE:
        iPart := MENU_SYSTEMRESTORE;
      HBMMENU_POPUP_MINIMIZE:
        iPart := MENU_SYSTEMMINIMIZE;
      HBMMENU_POPUP_MAXIMIZE:
        iPart := MENU_SYSTEMMAXIMIZE;
      HBMMENU_POPUP_CLOSE:
        iPart := MENU_SYSTEMCLOSE;

    end;
    iState := Integer(isDisabled in State) + 1;

    Winapi.UxTheme.GetThemePartSize(Theme, DC, iPart, iState, nil,
      TS_TRUE, LSize);
    LRect := Rect(0, 0, LSize.Width, LSize.Height);
    R := Rect(ItemRect.Left, ItemRect.Top, ItemRect.Left + 30, ItemRect.Bottom);
    RectCenter(LRect, R);
    Winapi.UxTheme.DrawThemeBackground(Theme, DC, iPart, iState, LRect, nil);
    CloseThemeData(Theme);
  end;

  procedure DrawSpecialChar(DC: HDC; Sign: Char; DestRect: TRect;
    const Bold: Boolean = False; const Disabled: Boolean = False);
  var
    LogFont: TLogFont;
    pOldFont: HGDIOBJ;
    AFont: HFONT;
    oldColor: COLORREF;
    OldMode: Integer;
    LColor: TColor;
  begin

    LogFont.lfHeight := DestRect.Height;
    LogFont.lfWidth := 0;
    LogFont.lfEscapement := 0;
    LogFont.lfOrientation := 0;
    if Bold then
      LogFont.lfWeight := FW_BOLD
    else
      LogFont.lfWeight := FW_NORMAL;
    LogFont.lfItalic := 0;
    LogFont.lfUnderline := 0;
    LogFont.lfStrikeOut := 0;
    LogFont.lfCharSet := DEFAULT_CHARSET;
    LogFont.lfOutPrecision := OUT_DEFAULT_PRECIS;
    LogFont.lfClipPrecision := CLIP_DEFAULT_PRECIS;
    LogFont.lfQuality := DEFAULT_QUALITY;
    LogFont.lfPitchAndFamily := DEFAULT_PITCH;
    LogFont.lfFaceName := 'Marlett';
    AFont := CreateFontIndirect(LogFont);

    oldColor := 0;
    if Disabled then
      oldColor := GetSysColor(COLOR_GRAYTEXT);

    oldColor := SetTextColor(DC, oldColor);
    pOldFont := SelectObject(DC, AFont);
    OldMode := SetBkMode(DC, Transparent);

    if StyleServices.GetElementColor(LDetails, ecTextColor, LColor) then
      SetTextColor(DC, LColor);

    Winapi.Windows.DrawText(DC, Sign, 1, DestRect, DT_LEFT or DT_SINGLELINE);
    SetBkMode(DC, OldMode);
    SelectObject(DC, pOldFont);
    SelectObject(DC, oldColor);
    DeleteObject(AFont);
  end;

procedure ClearAlpha(B: TBitmap);
type
  PRGBA = ^TRGBA;
  TRGBA = packed record
    case Cardinal of
      0: (Color: Cardinal);
      2: (HiWord, LoWord: Word);
      3: (B, G, R, A: Byte);
    end;
  PRGBAArray = ^TRGBAArray;
  TRGBAArray = array[0..0] of TRGBA;
var
  I: Integer;
begin
  for I := 0 to B.Width * B.Height - 1 do
    PRGBAArray(B.Scanline[B.Height - 1])[I].A := 0;
end;


begin
  DisplayCheckedGlyph := True;
  LTextRect := ItemRect;
  { Fast access . }
  SysItem := Items[Index]; // Do not destroy !!
  DC := Canvas.Handle;
  R := ItemRect;
  Detail := tmPopupItemNormal;
  if isHot in State then
    Detail := tmPopupItemHot;
  if isDisabled in State then
    Detail := tmPopupItemDisabled;
  if Style = isSep then
    begin
      Detail := tmPopupSeparator;
      Inc(R.Left, 25);
    end;

  LDetails := StyleServices.GetElementDetails(Detail);

  if (isDisabled in State) and (isHot in State) and (Detail = tmPopupItemDisabled) then
  begin
    LDetails := StyleServices.GetElementDetails(tmPopupItemHot);
    SrcRect := Rect(0, 0, R.Width, R.Height);
    Buffer := TBitmap.Create;
    Buffer.PixelFormat := pf32bit;
    Buffer.SetSize(SrcRect.Width, SrcRect.Height);
    try
      ClearAlpha(Buffer);
      Buffer.AlphaFormat := afPremultiplied;
      StyleServices.DrawElement(Buffer.Canvas.Handle, LDetails, SrcRect);
      DstRect := R;
      BF.BlendOp := AC_SRC_OVER;
      BF.BlendFlags := 0;
      BF.SourceConstantAlpha := 50;
      BF.AlphaFormat := AC_SRC_ALPHA;
      WinApi.Windows.AlphaBlend(DC,
        DstRect.Left, DstRect.Top, DstRect.Width, DstRect.Height,
        Buffer.Canvas.Handle,
        SrcRect.Left, SrcRect.Top, SrcRect.Width, SrcRect.Height, BF);
    finally
      Buffer.Free;
    end;
    LDetails := StyleServices.GetElementDetails(tmPopupItemDisabled);
  end
  else
  if (Detail <> tmPopupItemNormal) and (Detail <> tmPopupItemDisabled) then
    StyleServices.DrawElement(DC, LDetails, R);

  if Style = isDropDown then
    DrawSubMenu(ItemRect);

  MI := SysItem.VCLMenuItem;
  MIImages := nil;

  if (MI <> nil) and Assigned(MI.OnDrawItem) then
  begin
    MI.OnDrawItem(MI, Canvas, ItemRect, isHot in State);
    Exit;
  end;

  if (MI <> nil) and Assigned(MI.OnAdvancedDrawItem) then
  begin
    VCLItemState := [];
    if isDisabled in State then
      VCLItemState := VCLItemState + [odDisabled];
    if isHot in State then
      VCLItemState := VCLItemState + [odSelected];
    MI.OnAdvancedDrawItem(MI, Canvas, ItemRect, VCLItemState);
    Exit;
  end;

  if MI <> nil then
    begin
      { Draw Vcl PopupMenu Bitmap }
      ImageIndex := MI.ImageIndex;
      MIImages := MI.GetImageList;
        with MI.GetParentMenu do
          begin
            if (ImageIndex < 0) and (MI.Bitmap <> nil) then
              begin
                Bmp := MI.Bitmap;
                LImageRect := Rect(0, 0, Bmp.Width, Bmp.Height);
                RectVCenter(LImageRect, ItemRect);
                if TStyleManager.SystemStyle.Enabled then
                begin
                  if not RightToLeft then
                   OffsetRect(LImageRect, 4, 0)
                  else
                    begin
                      LImageRect.Left := ItemRect.Right - Bmp.Width - 4;
                      LImageRect.Right := ItemRect.Right;
                    end;
                end
                else
                begin
                  if not RightToLeft then
                   OffsetRect(LImageRect, 2, 0)
                  else
                    begin
                      LImageRect.Left := ItemRect.Right - Bmp.Width - 2;
                      LImageRect.Right := ItemRect.Right;
                    end;
                end;
                Canvas.Draw(LImageRect.Left, LImageRect.Top, Bmp);
              end
            else
              if (MIImages <> nil) and (ImageIndex > -1) then
              begin
                DisplayCheckedGlyph := False;
                LImageRect := Rect(0, 0, MIImages.Width, MIImages.Height);
                RectVCenter(LImageRect, ItemRect);
                if TStyleManager.SystemStyle.Enabled then
                begin
                  if not RightToLeft then
                    OffsetRect(LImageRect, 4, 0)
                  else
                    begin
                      LImageRect.Left := ItemRect.Right - Images.Width - 4;
                      LImageRect.Right := ItemRect.Right;
                    end;
                end
                else
                begin
                  if not RightToLeft then
                    OffsetRect(LImageRect, 2, 0)
                  else
                    begin
                      LImageRect.Left := ItemRect.Right - Images.Width - 2;
                      LImageRect.Right := ItemRect.Right;
                    end;
                end;
                MIImages.Draw(Canvas, LImageRect.Left, LImageRect.Top,
                  ImageIndex, MI.Enabled);
              end;
          end;
    end
  else if SysItem.Bitmap > 0 then
    begin
      hBmp := SysItem.Bitmap;
      if hBmp < HBMMENU_POPUP_MINIMIZE + 1 then
        begin
          { Draw System PopupMenu Bitmap }
          DisplayCheckedGlyph := False;
          // DrawVisualSysBitmap(hBmp);
          case hBmp of
            HBMMENU_POPUP_RESTORE:
              Sign := MARLETT_RESTORE_CHAR;
            HBMMENU_POPUP_MINIMIZE, HBMMENU_MBAR_MINIMIZE_D:
              Sign := MARLETT_MINIMIZE_CHAR;
            HBMMENU_POPUP_MAXIMIZE:
              Sign := MARLETT_MAXIMIZE_CHAR;
            HBMMENU_POPUP_CLOSE, HBMMENU_MBAR_CLOSE_D:
              Sign := MARLETT_CLOSE_CHAR;
          else
            Sign := Char(0);
          end;
          if Sign <> #0 then
            begin
              LImageRect := Rect(0, 0, 10, 10);
              if TStyleManager.SystemStyle.Enabled then
                R := Rect(ItemRect.Left, ItemRect.Top, ItemRect.Left + 30,
                  ItemRect.Bottom)
              else
                R := Rect(ItemRect.Left, ItemRect.Top, ItemRect.Left + 20,
                  ItemRect.Bottom);

              RectCenter(LImageRect, ItemRect);

              if TStyleManager.SystemStyle.Enabled then
              begin
                if not RightToLeft then
                  LImageRect.Left := ItemRect.Left + 10
                else
                  begin
                    LImageRect.Left := ItemRect.Right - 10 - 4;
                    LImageRect.Right := ItemRect.Right;
                  end;
              end
              else
              begin
                if not RightToLeft then
                  LImageRect.Left := ItemRect.Left + 5
                else
                  begin
                    LImageRect.Left := ItemRect.Right - 5 - 4;
                    LImageRect.Right := ItemRect.Right;
                  end;
              end;
              DrawSpecialChar(DC, Sign, LImageRect, False,
                (isDisabled in State));
            end;
        end
      else
        begin
          { Draw PopupMenu Bitmap }
          DisplayCheckedGlyph := False;
          BmpWidth := GetBitmapWidth(hBmp);
          BmpHeight := GetBitmapHeight(hBmp);
          LImageRect := Rect(0, 0, BmpWidth, BmpHeight);
          RectVCenter(LImageRect, ItemRect);
          if not RightToLeft then
            OffsetRect(LImageRect, 4, 0)
          else
            begin
              LImageRect.Left := ItemRect.Right - BmpWidth - 4;
              LImageRect.Right := ItemRect.Right;
            end;
          Icon := BmpToIcon(hBmp);
          DrawIconEX(DC, LImageRect.Left, LImageRect.Top, Icon, BmpWidth,
            BmpHeight, 0, 0, DI_NORMAL);
          DestroyIcon(Icon);
        end;
    end;

  if (SysItem.Checked) and (DisplayCheckedGlyph) then
    begin
      Detail := TThemedMenu(Integer(tmPopupCheckNormal) +
        Integer(SysItem.Disabled));
      if SysItem.RadioCheck then
        Detail := TThemedMenu(Integer(tmPopupBulletNormal) +
          Integer(SysItem.Disabled));
      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.GetElementSize(DC, LDetails, esActual, LSize);
      LImageRect := Rect(0, 0, LSize.Width, LSize.Height);
      RectVCenter(LImageRect, ItemRect);
      if not RightToLeft then
        OffsetRect(LImageRect, 4, 0)
      else
        begin
          LImageRect.Left := ItemRect.Right - LSize.Width - 4;
          LImageRect.Right := ItemRect.Right;
        end;
      StyleServices.DrawElement(DC, LDetails, LImageRect);
    end;

  { Draw Text }
  LTextFormat := [tfLeft, tfVerticalCenter, tfSingleLine, tfExpandTabs];

  if not RightToLeft then
  begin
    if (MIImages <> nil) and (MIImages.Width > 16) then
    begin
      if TStyleManager.SystemStyle.Enabled then
        Inc(LTextRect.Left, MIImages.Width + 10)
      else
        Inc(LTextRect.Left, MIImages.Width + 7);
    end
    else
      if TStyleManager.SystemStyle.Enabled then
        Inc(LTextRect.Left, 30)
      else
        Inc(LTextRect.Left, 20);
  end
  else
    begin
      LTextRect.Left := ItemRect.Left;
      if (MIImages <> nil) and (MIImages.Width > 16) then
      begin
        if TStyleManager.SystemStyle.Enabled then
          Dec(LTextRect.Right, MIImages.Width + 10)
        else
          Dec(LTextRect.Right, MIImages.Width + 7);
      end
      else
        if TStyleManager.SystemStyle.Enabled then
          Dec(LTextRect.Right, 30)
        else
          Dec(LTextRect.Right, 20);
      Exclude(LTextFormat, tfLeft);
      Include(LTextFormat, tfRtlReading);
      Include(LTextFormat, tfRight);
    end;

  LDetails := StyleServices.GetElementDetails(tmPopupItemNormal);
  if isHot in State then
    LDetails := StyleServices.GetElementDetails(tmPopupItemHot);
  if isDisabled in State then
    LDetails := StyleServices.GetElementDetails(tmPopupItemDisabled);

  if SysItem.DefaultItem then
    Canvas.Font.Style := [fsBold];

  DrawText(Canvas.Handle, LDetails, ItemText, LTextRect, LTextFormat);

  { Draw ShortCut Text . }
  if MI <> nil then
    begin
      if MI.ShortCut <> 0 then
        begin
          sShortCut := ShortCutToText(MI.ShortCut);
          LTextRect := ItemRect;
          if RightToLeft then
            begin
              LTextRect.Left := ItemRect.Left + 14;
              LTextRect.Right := LTextRect.Left + Canvas.TextWidth(sShortCut);
            end
          else
            begin
              LTextRect.Left := ItemRect.Right - 14 -
                Canvas.TextWidth(sShortCut);
              LTextRect.Right := ItemRect.Right;
            end;
          DrawText(Canvas.Handle, LDetails, sShortCut, LTextRect, LTextFormat);
        end;
    end;
end;

procedure TSysPopupStyleHook.EraseItem(Canvas: TCanvas; Index: Integer;
  ItemRect: TRect);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  Bmp.SetSize(SysControl.Width, SysControl.Height);
  PaintBackground(Bmp.Canvas);
  BitBlt(Canvas.Handle, ItemRect.Left, ItemRect.Top, ItemRect.Width,
    ItemRect.Height, Bmp.Canvas.Handle, ItemRect.Left, ItemRect.Top, SRCCOPY);
  Bmp.Free;
end;

function TSysPopupStyleHook.GetItemsCount: Integer;
begin
  Result := GetMenuItemCount(FMenu);
end;

function TSysPopupStyleHook.GetMenuFromHandle(AHandle: HWND): HMENU;
begin
  Result := SendMessage(AHandle, MN_GETHMENU, 0, 0);
end;

function TSysPopupStyleHook.GetRightToLeft: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_TYPE;
  GetMenuItemInfo(FMenu, 0, True, info);
  Result := ((info.fType and MFT_RIGHTORDER) = MFT_RIGHTORDER) or
    ((info.fType and MFT_RIGHTJUSTIFY) = MFT_RIGHTJUSTIFY);
end;

function TSysPopupStyleHook.GetSysPopupItem(Index: Integer): TSysPopupItem;
begin
  Result := nil;
  if (Index > -1) and (Index <= Count) then
    begin
      if Assigned(FSysPopupItem) then
        FreeAndNil(FSysPopupItem);
      FSysPopupItem := TSysPopupItem.Create(SysControl, Index, FMenu);
      Result := FSysPopupItem;
    end;
end;

procedure TSysPopupStyleHook.PaintBackground(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
begin
  LDetails := StyleServices.GetElementDetails(tmPopupBorders);
  StyleServices.DrawElement(Canvas.Handle, LDetails, SysControl.ClientRect);
end;

procedure TSysPopupStyleHook.UpdateColors;
begin
  inherited;
end;

{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

type
  TSubMenuItemInfo = record
    Menu: HMENU;
    WindowHandle: HWND;
    ItemIndex: Integer;
  end;

var
  SubMenuItemInfoArray: array of TSubMenuItemInfo;

destructor TSysPopupStyleHook.Destroy;
begin
  if Assigned(FSysPopupItem) then
    FreeAndNil(FSysPopupItem);
  SetLength(SubMenuItemInfoArray, 0);
  SubMenuItemInfoArray := nil;
  inherited;
end;

procedure TSysPopupStyleHook.MNSELECTITEM(var Message: TMessage);
var
  DC: HDC;
  Canvas: TCanvas;
  Index: Integer;
  i: Word;
  L: Integer;
  ParentItem: Integer;
  ParentPopup: HWND;
  LMenu: HMENU;
begin
  { The undocumented MN_SELECTITEM Message:
    This is the most importants message ,
    Windows sends this message every time when the user
    select an item (not clicking,only select) ...
    wParam=Current Item Index .
    lparam= may be it's unused (not sure).
  }

  Handled := False;
  Canvas := TCanvas.Create;
  ParentPopup := 0;
  ParentItem := -1;

  DC := GetDC(Handle);
  try
    Canvas.Handle := DC;
    Canvas.Font := Screen.MenuFont;
    Index := Integer(Message.WParam);

    { Out of index . }
    if (Index > FCount - 1) or (Index < 0) then
      begin
        { Make sure that wParam hold a valid Item Index .
          if not .. then mouse is not on the PopupMenu
          => Remove Item highlight .
        }
        SetRedraw(True);
        if (FPreviousHotItemIndex > -1) and (FPreviousHotItemIndex < FCount)
        then
          DoDrawItem(Canvas, FPreviousHotItemIndex);
        FPreviousHotItemIndex := -1;
        Handled := True;
        Exit;
      end;

    if not FItemsPainted then
      begin
        { Items are not painted completely . }
        FPreviousHotItemIndex := Index;
        DoDrawItem(Canvas, Index);
        if (Index = Count - 1) then
          PostMessage(Handle, WM_ITEMSPAINTED, 0, 0);
        Handled := True;
        Exit;
      end;

    L := Length(SubMenuItemInfoArray);
    if L <> 0 then
      begin
        for i := 0 to L - 1 do
          begin
            { Look for SubMenu Parent }
            LMenu := SubMenuItemInfoArray[i].Menu;
            if LMenu = FMenu then
              begin
                ParentPopup := SubMenuItemInfoArray[i].WindowHandle;
                ParentItem := SubMenuItemInfoArray[i].ItemIndex;
                Break;
              end;
          end;
      end;

    if (ParentPopup = Handle) then
    begin
      SetRedraw(True); { Allow drawing the current PopupMenu }
    end
    else if ((ParentPopup <> Handle) and (FItemsPainted) and (ParentPopup <> 0))
    then
      begin
        {
          if user jump so fast from the parent PopupMenu to the
          Child PopupMenu (SubMenu) , the hot item of parent Popup menu
          will be draw as a normal item (not hot)..
          So we need to repaint the hot item that drop the child popup menu.
        }
        if (not FParentSubItemPainted) and (ParentItem > -1) then
          begin
            SendMessage(ParentPopup, MN_SELECTITEM, ParentItem, 0);
            FParentSubItemPainted := True;
          end;
        { Don't Redraw the parent of the Current PopupMenu }
        //SetRedraw(ParentPopup, False);
      end;

    { if Item can drop a sub Popup Menu }
    if Items[Index].HasSubMenu then
      begin
        L := Length(SubMenuItemInfoArray);
        if L = 0 then
          SetLength(SubMenuItemInfoArray, 1);
        for i := 0 to L do
          { Avoid duplication }
          if SubMenuItemInfoArray[i].Menu <> GetMenuFromHandle(Handle) then
            begin
              Inc(L);
              SetLength(SubMenuItemInfoArray, L);
              SubMenuItemInfoArray[L - 1].Menu := GetSubMenu(FMenu, Index);
              SubMenuItemInfoArray[L - 1].WindowHandle := Handle;
              SubMenuItemInfoArray[L - 1].ItemIndex := Index;
              Break;
            end;
      end;

    { If all Items are painted }
    if FItemsPainted then
      begin
        { In order to show / hide SubMenu ,we need to
          process the default message handler . }
        SetRedraw(False);
        Message.Result := CallDefaultProc(Message);
        SetRedraw(True);
      end;

    if (FPreviousHotItemIndex <> Index) then
      begin
        { Draw Item normal . }
        DoDrawItem(Canvas, FPreviousHotItemIndex);
        { Draw Item hot . }
        DoDrawItem(Canvas, Index);
        FPreviousHotItemIndex := Index;
      end;

  finally
    Canvas.Free;
    ReleaseDC(Handle, DC);
  end;
  Handled := True;
end;

procedure TSysPopupStyleHook.WMPRINT(var Message: TMessage);
var
  DC: HDC;
  i: Integer;
  Canvas: TCanvas;
begin
  FMenu := GetMenuFromHandle(Handle);
  FCount := GetItemsCount;

  if Message.WParam <> 0 then
    DC := HDC(Message.WParam)
  else
    DC := GetDC(Handle);

  Canvas := TCanvas.Create;
  try
    Canvas.Handle := DC;
    PaintBackground(Canvas);
  finally
    Canvas.Free;
    if DC <> HDC(Message.WParam) then
      ReleaseDC(Handle, DC);
  end;

  if (Count > -1) and not FItemsPainted then
  begin
    for i := 0 to Count - 1 do
      PostMessage(Handle, MN_SELECTITEM, i, 0);
  end
  else
    if (Count > -1) and (FPreviousHotItemIndex > - 1) and
       (FPreviousHotItemIndex < Count - 1)
    then
      PostMessage(Handle, MN_SELECTITEM, FPreviousHotItemIndex, 0);
  Handled := True;
end;

function IsItemSeparator(Menu: HMENU; ItemIndex: Integer): Boolean;
var
  info: TMenuItemInfo;
begin
  {
    Use this function instead of Items[Index].Separator .
    ==> Fast access in WM_KEYDOWN .
  }
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_FTYPE;
  GetMenuItemInfo(Menu, ItemIndex, True, info);
  Result := (info.fType and MFT_SEPARATOR) = MFT_SEPARATOR;
end;

procedure TSysPopupStyleHook.WndProc(var Message: TMessage);
var
  i: Integer;
begin

  case Message.Msg of
    WM_ITEMSPAINTED:
      begin
        FItemsPainted := True;
      end;

    MN_SELECTITEM, WM_PRINT:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit; { Do not Dispatch . }
          end;
      end;

    WM_PAINT:
      begin
        if not OverridePaint then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;
        SetRedraw(False);
        Message.Result := CallDefaultProc(Message);
        SetRedraw(True);
        Exit; { Do not Dispatch . }
      end;

    WM_WINDOWPOSCHANGED:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;

      if FCallFromKeyboard then
          SetTimer(Handle, $93, 10, nil);
      end;

      WM_TIMER:
      begin
        if (FItemsPainted) and (Message.WParam = $93) then
        begin
          FCallFromKeyboard := False;
          PostMessage(Handle, WM_KEYDOWN, VK_DOWN, 0);
          KillTimer(Handle, $93);
        end;
      end;

    MN_BUTTONDOWN:
      begin
        SetRedraw(False);
        Message.Result := CallDefaultProc(Message);
        SetRedraw(True);
      end;

    WM_KEYDOWN:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;
        FMenu := GetMenuFromHandle(Handle);
        if FPreviousHotItemIndex <> -1 then
          FKeyIndex := FPreviousHotItemIndex;

        if (Message.WParam = VK_RETURN) or (Message.WParam = VK_LEFT) or
           (Message.WParam = VK_RIGHT)
        then
          begin
            if (FPreviousHotItemIndex <> -1) and
                Items[FPreviousHotItemIndex].HasSubMenu
            then
              FCallFromKeyboard := True;
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;

        case Message.WParam of
          VK_DOWN:
              begin
                if FKeyIndex >= GetMenuItemCount(Menu) - 1 then
                  FKeyIndex := -1;
                Inc(FKeyIndex);
                { If the Current Item is Separator then
                  find the next valid item .
                }
                if IsItemSeparator(Menu, FKeyIndex) then
                  for i := FKeyIndex to GetMenuItemCount(Menu) - 1 do
                    if (not IsItemSeparator(Menu, i)) then
                      begin
                        FKeyIndex := i;
                        Break;
                      end;
                if Count = 1 then FPreviousHotItemIndex := -1;
                SendMessage(Handle, MN_SELECTITEM, FKeyIndex, 0);
                Message.Result := 0;
              end;
          VK_UP:
            begin
              if FKeyIndex <= 0 then
                FKeyIndex := GetMenuItemCount(Menu);

              Dec(FKeyIndex);
              { If the Current Item is Separator then
                find the next valid item .
              }
              if IsItemSeparator(Menu, FKeyIndex) then
                for i := FKeyIndex downto 0 do
                  if not IsItemSeparator(Menu, i) then
                    begin
                      FKeyIndex := i;
                      Break;
                    end;
              SendMessage(Handle, MN_SELECTITEM, FKeyIndex, 0);
              Message.Result := 0;
            end;
        else
          { Calling the Default Message will cause
            the WM_PAINT Message to be Sent to the PopupMenu Window }
          Message.Result := CallDefaultProc(Message);
        end;
        Exit;
      end;

    WM_ERASEBKGND:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;
        SendMessage(Handle, WM_PRINT, Message.WParam, Message.lParam);
        Message.Result := 1;
        Exit; { Do not Dispatch  }
      end;

    WM_PRINTCLIENT:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;
        SendMessage(Handle, WM_PRINT, Message.WParam, Message.lParam);
        Exit;
      end;

    WM_NCCALCSIZE, WM_NCPAINT:
      begin
        if (not OverridePaint) or (not OverridePaintNC) then
          begin
            Message.Result := CallDefaultProc(Message);
            Exit;
          end;
        if not StyleServicesEnabled then
          begin
            Handled := False;
            Exit;
          end;
        Exit; { Do not Dispatch . }
      end;

    {WM_DESTROY:
      begin
        SetLength(SubMenuItemInfoArray, 0);
        SubMenuItemInfoArray := nil;
        Handled := False;
      end;}

  end;
  inherited;
end;

{ TSysPopupItem }

constructor TSysPopupStyleHook.TSysPopupItem.Create(SysParent: TSysControl;
  Index: Integer; Menu: HMENU);
var
  I, J: Integer;
  FParentVCLItem: TMenuItem;
begin
  FMenu := Menu;
  FHandle := SysParent.Handle;
  FSysParent := SysParent;
  FIndex := Index;
  FVCLMenuItem := nil;
  FParentVCLItem := GetVCLParentMenuItem;
  if FParentVCLItem <> nil then
  begin
    J := -1;
    for I := 0 to FParentVCLItem.Count - 1 do
    begin
      if FParentVCLItem[I].Visible then Inc(J);
      if FIndex = J then
      begin
        FVCLMenuItem := FParentVCLItem[I];
        Break;
      end;
    end;
  end;
end;

destructor TSysPopupStyleHook.TSysPopupItem.Destroy;
begin
  inherited;
end;

function TSysPopupStyleHook.TSysPopupItem.GetItemBitmap: HBITMAP;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_CHECKMARKS or MIIM_BITMAP;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  Result := info.hbmpItem;
  if Result = 0 then
    Result := info.hbmpUnchecked;
end;

function TSysPopupStyleHook.TSysPopupItem.GetItemRect: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  if (FMenu > 0) and (FIndex > -1) then
    GetMenuItemRect(0, FMenu, FIndex, Result);
end;

function TSysPopupStyleHook.TSysPopupItem.GetItemText: String;
var
  Buffer: PChar;
  StrSize: Integer;
  info: MenuItemInfo;
begin
  if VCLMenuItem <> nil then
    begin
      Result := VCLMenuItem.Caption;
      Exit;
    end;
  { Note:
    The GetMenuString function has been superseded.
    Use the GetMenuItemInfo function to retrieve the menu item text.
  }

  Result := '';

  FillChar(info, SizeOf(MenuItemInfo), Char(0));
  info.cbSize := SizeOf(MenuItemInfo);
  info.fMask := MIIM_STRING or MIIM_FTYPE;
  info.dwTypeData := nil;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  if not (info.fType and MFT_OWNERDRAW = MFT_OWNERDRAW) or (TOSVersion.Major >= 10) then
    begin
      { The Size neede for the Buffer . }
      StrSize := info.cch * 2 + 2;
      GetMem(Buffer, StrSize);
      try
        info.dwTypeData := Buffer;
        { inc cch to get the last char . }
        Inc(info.cch);
        GetMenuItemInfo(FMenu, FIndex, True, info);
        Result := String(Buffer);
      finally
        FreeMem(Buffer, StrSize);
      end;
      Exit;
    end
  else
    begin
      { if the item is owner draw then we need another way to get
        the item text since , when setting an item to ownerdraw windows
        will destroy the dwTypeData that hold the text . }
      FillChar(info, SizeOf(MenuItemInfo), Char(0));
      info.cbSize := SizeOf(MenuItemInfo);
      info.fMask := MIIM_DATA;
      GetMenuItemInfo(FMenu, FIndex, True, info);
      Result := String(PChar(info.dwItemData));
    end;
end;

function TSysPopupStyleHook.TSysPopupItem.GetVCLParentMenuItem: TMenuItem;

function GetVisibleCount(AItem: TMenuItem): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to AItem.Count - 1 do
    if AItem[I].Visible then
      Inc(Result);
end;

function FindItemInMenu(AMenuItem: TMenuItem): TMenuItem;
var
  I: Integer;
  MI: TMenuItem;
begin
  Result := nil;
  for I := 0 to AMenuItem.Count - 1 do
  begin
    MI := TMenuItem(AMenuItem.Items[I]);
    if MI.Handle = FMenu then
    begin
      if FIndex < GetVisibleCount(MI) then
        Exit(MI)
      else
        Exit(nil);
    end
    else
    begin
      Result := FindItemInMenu(MI);
      if Result <> nil then
        Exit;
    end;
  end;
end;

function FindItemInFrame(AFrame: TCustomFrame): TMenuItem;
var
  I: Integer;
  MI: TMenuItem;
  PopupMenu: TPopupMenu;
begin
  Result := nil;
  for I := 0 to AFrame.ComponentCount - 1 do
  begin
    if AFrame.Components[I] is TMenuItem then
    begin
      MI := TMenuItem(AFrame.Components[I]);
      if (MI.Handle = FMenu) then
      begin
        if FIndex < GetVisibleCount(MI) then
          Exit(MI)
        else
          Exit(nil);
      end
      else
      begin
        Result := FindItemInMenu(MI);
        if Result <> nil then
          Exit;
      end;
    end
    else
    if AFrame.Components[I] is TPopupMenu then
    begin
      PopupMenu := TPopupMenu(AFrame.Components[I]);
      if PopupMenu.Handle = FMenu then
        Exit(PopupMenu.Items)
      else
      begin
        Result := FindItemInMenu(PopupMenu.Items);
        if Result <> nil then
          Exit;
      end;
    end
    else
    if AFrame.Components[I] is TCustomFrame then
    begin
      Result := FindItemInFrame(TCustomFrame(AFrame.Components[I]));
      if Result <> nil then
        Exit;
    end;
  end;
end;

var
  I, J: Integer;
  PopupMenu: TPopupMenu;
  Form: TForm;
  MI: TMenuItem;
begin
  Result := nil;
  for I := 0 to Screen.FormCount - 1 do
  begin
    Form := Screen.Forms[I];
    for J := 0 to Form.ComponentCount - 1 do
    begin
      if Form.Components[J] is TMenuItem then
      begin
        MI := TMenuItem(Form.Components[J]);
        if (MI.Handle = FMenu) then
        begin
          if FIndex < GetVisibleCount(MI) then
            Exit(MI)
          else
            Exit(nil);
        end
        else
        begin
          Result := FindItemInMenu(MI);
          if Result <> nil then
            Exit;
        end;
      end
      else if Form.Components[J] is TPopupMenu then
      begin
        PopupMenu := TPopupMenu(Form.Components[J]);
        if PopupMenu.Handle = FMenu then
          Exit(PopupMenu.Items)
        else
        begin
          Result := FindItemInMenu(PopupMenu.Items);
          if Result <> nil then
            Exit;
        end;
      end
      else
      if Form.Components[J] is TCustomFrame then
      begin
        Result := FindItemInFrame(TCustomFrame(Form.Components[J]));
        if Result <> nil then
          Exit;
      end;
    end;
  end;
end;

function TSysPopupStyleHook.TSysPopupItem.IsItemDisabled: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_STATE;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  Result := (info.fState and MFS_DISABLED = MFS_DISABLED) or
    (info.fState and MF_DISABLED = MF_DISABLED) or
    (info.fState and MF_GRAYED = MF_GRAYED);
end;

function TSysPopupStyleHook.TSysPopupItem.IsItemRadioCheck: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_FTYPE;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  Result := (info.fType and MFT_RADIOCHECK) = MFT_RADIOCHECK;
end;

function TSysPopupStyleHook.TSysPopupItem.isItemChecked: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_STATE;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  Result := (info.fState and MFS_CHECKED) = MFS_CHECKED;
end;

function TSysPopupStyleHook.TSysPopupItem.IsItemContainsSubMenu: Boolean;
begin
  Result := (GetSubMenu(FMenu, FIndex) > 0);
end;

function TSysPopupStyleHook.TSysPopupItem.isItemDefault: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_STATE;
  GetMenuItemInfo(FMenu, FIndex, True, info);
  Result := (info.fState and MFS_DEFAULT) = MFS_DEFAULT;
end;

function TSysPopupStyleHook.TSysPopupItem.IsItemSeparator: Boolean;
var
  info: TMenuItemInfo;
begin
  FillChar(info, SizeOf(info), Char(0));
  info.cbSize := SizeOf(TMenuItemInfo);
  info.fMask := MIIM_FTYPE;
  Result := False;
  if (FIndex > -1) and (FIndex < GetMenuItemCount(FMenu) - 1) then
    begin
      GetMenuItemInfo(FMenu, FIndex, True, info);
      Result := (info.fType and MFT_SEPARATOR) = MFT_SEPARATOR;
    end;
end;


{ TSysScrollingStyleHook }
function TSysScrollingStyleHook.NormalizePoint(const P: TPoint): TPoint;
var
  WindowPos, ClientPos: TPoint;
begin
  { Convert the point from the screen to the client window . }
  WindowPos := Point(SysControl.Left, SysControl.Top);
  ClientPos := Point(0, 0);
  ClientToScreen(Handle, ClientPos);
  Result := P;
  ScreenToClient(Handle, Result);
  Inc(Result.X, ClientPos.X - WindowPos.X);
  Inc(Result.Y, ClientPos.Y - WindowPos.Y);
end;

procedure TSysScrollingStyleHook.CMSCROLLTRACKING(var Message: TMessage);
var
  P: TPoint;
  Pos, Delta: Integer;
begin
  if (not OverridePaintNC) or (not StyleServicesEnabled) then
  begin
    Handled := False;
    Exit;
  end;
  P.X := Longint(Word(Message.WParam));
  P.Y := Longint(HiWord(Message.WParam));
  GetCursorPos(P);
  if FScrollKind = sbVertical then
  begin
    if (P.Y >= 0) then
    begin
      Pos := GetVertScrollPosFromPoint(P);
      FTrackingPos := GetVertThumbPosFromPos(Pos);
      Delta := Pos - FPrevPos;
      DrawVertScroll(0); { Draw & take Tracking account . }
      { Do Scroll }
      Scroll(sbVertical, skTracking, Pos, Delta);
      FPrevPos := VertScrollInfo.nPos;
    end;
  end
  else if FScrollKind = sbHorizontal then
  begin
    if (P.X >= 0) then
    begin
      Pos := GetHorzScrollPosFromPoint(P);
      FTrackingPos := GetHorzThumbPosFromPos(Pos);
      Delta := Pos - FPrevPos;
      DrawHorzScroll(0); { Draw & take Tracking account . }
      { Do Scroll }
      Scroll(sbHorizontal, skTracking, Pos, Delta);
      FPrevPos := HorzScrollInfo.nPos;
    end;
  end;
  Handled := True;
end;

constructor TSysScrollingStyleHook.Create(AHandle: THandle);
begin
  inherited;
  FTracking := False;
  FTimerMode := 0;
  FNCMouseDown := False;
  FAllowScrolling := True;
  FTrackingPos := 0;
  FPrevPoint := Point(-1, -1);
  FPrevPos := 0;
  InitScrollState;
end;

destructor TSysScrollingStyleHook.Destroy;
begin
   if FTimerMode <> 0 then
    KillTimer(Handle, 10);
  inherited;
end;

procedure TSysScrollingStyleHook.DoLineTrackTimer;
begin
  Scroll(FScrollKind, FScrollingType, 0, 0);
end;

procedure TSysScrollingStyleHook.DoPageTrackTimer;
var
  P: TPoint;
begin
  GetCursorPos(P);
  if (not VertSliderRect.Contains(P)) and (not HorzSliderRect.Contains(P)) then
  begin
    DoScroll(FScrollKind, FScrollingType, 0, 0);
  end;
end;

procedure TSysScrollingStyleHook.DoSliderTrackTimer;
var
  P: TPoint;
begin
  GetCursorPos(P);
  if (FPrevPoint <> P) and (FDownPoint <> P) then
  begin
    SendMessage(Handle, CM_SCROLLTRACKING, MakeWParam(P.X, P.Y), 0);
    FPrevPoint := P;
    FDownPoint := Point(-1, -1);
  end;
end;

procedure TSysScrollingStyleHook.DoScroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer);
begin
  if ScrollType <> skNone then
  begin
    Scroll(Kind, ScrollType, Pos, Delta);
    FPrevPos := VertScrollInfo.nPos;
  end;
end;

procedure TSysScrollingStyleHook.DrawHorzScroll(DC: HDC);
var
  LDetails: TThemedElementDetails;
  R: TRect;
  B: TBitmap;
  BmpDC, LDC: HDC;
  cx, cy, PosX, ThumbSize: Integer;
  P: TPoint;
  Detail: TThemedScrollBar;
begin
  if not FHorzScrollBar then
    Exit;
  LDC := DC;
  R := HorzScrollRect;
  cx := BtnSize.cx;
  cy := BtnSize.cy;
  if R.Width > 0 then
  begin
    B := TBitmap.Create;
    try
      if DC = 0 then
        DC := GetWindowDC(Handle);

      if FVertScrollBar then
      begin
        if not LeftScrollBar then
        begin
          P := Point(R.Right, R.Top);
          P := NormalizePoint(P);
          DrawSmallRect(DC, Rect(P.X, P.Y, P.X + cx, P.Y + cy));
        end
        else
        begin
          P := Point(R.Left, R.Top);
          P := NormalizePoint(P);
          FillDC(DC, Rect(P.X - cx, P.Y, P.X, P.Y + cy), Color);
        end;
      end;

      B.SetSize(R.Width, R.Height);
      BmpDC := B.Canvas.Handle;

      { Draw Track face }
      Detail := tsUpperTrackHorzNormal;
      if (not SysControl.Enabled) or (HorzScrollDisabled) then
        Detail := tsUpperTrackHorzDisabled;
      R := Rect(0, 0, B.Width, B.Height);
      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);
      { Draw Left Button }
      Detail := FBtnLeftDetail;
      if (not SysControl.Enabled) or (HorzScrollDisabled) then
        Detail := tsArrowBtnLeftDisabled;
      R := Rect(0, 0, cx, cy);
      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);
      { Draw Slider Button }
      Detail := FHorzBtnSliderDetail;
      if (not SysControl.Enabled) or (HorzScrollDisabled) then
        Detail := tsThumbBtnHorzDisabled;
      PosX := GetHorzSliderPos;
      ThumbSize := GetHorzThumbSize;
      if FTracking then
        // R := Rect(cx + FTrackingPos, 0, cx + FTrackingPos + ThumbSize, cy)
        R := FTrackingRect
      else
        R := Rect(cx + PosX, 0, cy + PosX + ThumbSize, cy);
      if R.Left < cx then
        R := Rect(cx, 0, cx + ThumbSize, cy);
      if R.Right > (B.Width - cx) then
        R := Rect(B.Width - cx - ThumbSize, 0, B.Width - cx, cy);

      LDetails := StyleServices.GetElementDetails(Detail);
      if not HorzScrollDisabled then
        StyleServices.DrawElement(BmpDC, LDetails, R);

      { Draw Right Button }
      Detail := FBtnRightDetail;
      if (not SysControl.Enabled) or (HorzScrollDisabled) then
        Detail := tsArrowBtnRightDisabled;
      //R := HorzRightRect;
      R := Rect(B.Width - cx, 0, B.Width, cy);
      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);
    finally
      P.X := HorzScrollRect.Left;
      P.Y := HorzScrollRect.Top;
      P := NormalizePoint(P);
      BitBlt(DC, P.X, P.Y, HorzScrollRect.Width, HorzScrollRect.Height, B.Canvas.Handle, 0, 0, SRCCOPY);
      B.Free;
      if LDC = 0 then
        ReleaseDC(Handle, DC);
    end;
  end;

end;

procedure TSysScrollingStyleHook.DrawSmallRect(DC: HDC; const SmallRect: TRect);
var
  sColor: TColor;
begin
  sColor := StyleServices.GetStyleColor(scWindow);
  FillDC(DC, SmallRect, sColor);
end;

procedure TSysScrollingStyleHook.DrawVertScroll(DC: HDC);
var
  LDetails: TThemedElementDetails;
  R: TRect;
  B: TBitmap;
  BmpDC, LDC: HDC;
  cx, cy, PosY, ThumbSize: Integer;
  P: TPoint;
  Detail: TThemedScrollBar;
begin
  if not FVertScrollBar then
    Exit;
  LDC := DC;
  R := VertScrollRect;
  cx := BtnSize.cx;
  cy := BtnSize.cy;
  if R.Width > 0 then
  begin

    B := TBitmap.Create;
    try
      if DC = 0 then
        DC := GetWindowDC(Handle);

      B.SetSize(R.Width, R.Height);
      BmpDC := B.Canvas.Handle;

      { Draw Track face }
      R := Rect(0, 0, B.Width, B.Height);
      Detail := tsUpperTrackVertNormal;
      if (not SysControl.Enabled) or (VertScrollDisabled) then
        Detail := tsUpperTrackHorzDisabled;

      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);

      { Draw UpButton }
      R := Rect(0, 0, cx, cy);
      Detail := FBtnUpDetail;
      if (not SysControl.Enabled) or (VertScrollDisabled) then
        Detail := tsArrowBtnUpDisabled;

      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);

      { Draw SliderButton }
      PosY := GetVertSliderPos;
      ThumbSize := GetVertThumbSize;
      if FTracking then
        // R := Rect(0, FTrackingPos, BtnSize.cx, FTrackingPos + GetVertThumbSize)
        R := FTrackingRect
      else
        R := Rect(0, cy + PosY, cx, cy + PosY + ThumbSize);
      if R.Top < cy then
        R := Rect(0, cy, cx, cy + ThumbSize);
      if R.Bottom > (B.Height - cy) then
        R := Rect(0, B.Height - cy - ThumbSize, cx, B.Height - cy);

      Detail := FVertBtnSliderDetail;
      if (not SysControl.Enabled) or (VertScrollDisabled) then
        Detail := tsThumbBtnVertDisabled;

      LDetails := StyleServices.GetElementDetails(Detail);
      if not VertScrollDisabled then
        StyleServices.DrawElement(BmpDC, LDetails, R);

      { Draw DownButton }
      R := Rect(0, B.Height - cy, cx, B.Height);
      Detail := FBtnDownDetail;
      if (not SysControl.Enabled) or (VertScrollDisabled) then
        Detail := tsArrowBtnDownDisabled;

      LDetails := StyleServices.GetElementDetails(Detail);
      StyleServices.DrawElement(BmpDC, LDetails, R);
    finally
      // Canvas.Draw(VertScrollRect.Left, VertScrollRect.Top, B);
      P.X := VertScrollRect.Left;
      P.Y := VertScrollRect.Top;
      // ScreenToClient(Handle, P);
      P := NormalizePoint(P);
      BitBlt(DC, P.X, P.Y, VertScrollRect.Width, VertScrollRect.Height, B.Canvas.Handle, 0, 0, SRCCOPY);
      B.Free;
      if LDC = 0 then
        ReleaseDC(Handle, DC);
    end;
  end;
end;

function TSysScrollingStyleHook.GetDefaultScrollBarSize: TSize;
begin
  { Return the default ScrollBar button size . }
  Result.cx := GetSystemMetrics(SM_CXVSCROLL);
  Result.cy := GetSystemMetrics(SM_CYVSCROLL);
end;

function TSysScrollingStyleHook.GetHorzLeftRect: TRect;
begin
  with HorzScrollRect do
    Result := Rect(Left, Top, Left + BtnSize.cx, Bottom);
end;

function TSysScrollingStyleHook.GetHorzScrollInfo: TScrollInfo;
begin
  FillChar(Result, sizeof(TScrollInfo), Char(0));
  Result.cbSize := sizeof(TScrollInfo);
  Result.fMask := SIF_ALL;
  Winapi.Windows.GetScrollInfo(Handle, SB_HORZ, Result);
end;

function TSysScrollingStyleHook.GetHorzScrollPosFromPoint(const P: TPoint): Integer;
var
  TrackRect, WinRect: TRect;
  Pos, MaxMin: Integer;
  LInfo: TScrollInfo;
  ThumbSize: Integer;
begin
  LInfo := HorzScrollInfo;
  Pos := P.X - FDownDis;
  WinRect := SysControl.WindowRect;
  TrackRect := HorzTrackRect;
  Dec(Pos, WinRect.Left);
  ThumbSize := GetHorzThumbSize;
  OffsetRect(TrackRect, -WinRect.Left, -WinRect.Top);

  FTrackingRect := Rect(Pos, 0, Pos + ThumbSize, BtnSize.cy);

  MaxMin := LInfo.nMax - LInfo.nMin;
  if MaxMin > 0 then
    Pos := MulDiv(Pos - TrackRect.Left, MaxMin - Integer(LInfo.nPage) + 1, TrackRect.Width - ThumbSize)
  else
    Pos := Pos - TrackRect.Left;
  if Pos < 0 then
    Pos := 0;
  if Pos >= LInfo.nMax - (Integer(LInfo.nPage) - 1) then
    Pos := LInfo.nMax - (Integer(LInfo.nPage) - 1);
  Result := Pos;
end;

function TSysScrollingStyleHook.GetHorzScrollRect: TRect;
var
  WinRect: TRect;
  BorderSize: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  WinRect := SysControl.WindowRect;
  BorderSize := GetBorderSize;
  with WinRect do
  begin
    Result.Left := Left;
    Result.Right := Right;
    Result.Top := Bottom - BtnSize.cy;
    Result.Bottom := Result.Top + BtnSize.cy;
  end;
  if (BorderSize.Left > 0) or (BorderSize.Top > 0) or (BorderSize.Right > 0) or (BorderSize.Bottom > 0) then
  begin
    Result.Left := Result.Left + BorderSize.Left;
    Result.Right := Result.Right - BorderSize.Right;
    Result.Bottom := Result.Bottom - BorderSize.Bottom;
    Result.Top := Result.Bottom - BtnSize.cy;
  end;
  if FVertScrollBar then
  begin
    if not LeftScrollBar then
      Dec(Result.Right, BtnSize.cx)
    else
      Inc(Result.Left, BtnSize.cx)
  end;
end;

function TSysScrollingStyleHook.GetHorzSliderPos: Integer;
begin
  with HorzScrollInfo do
    Result := MulDiv(nPos, HorzTrackRect.Width, nMax - nMin);
end;

function TSysScrollingStyleHook.GetHorzSliderRect: TRect;
var
  ThumbSize: Integer;
  PosX: Integer;
begin
  Result := Rect(0, 0, 0, 0);
  ThumbSize := GetHorzThumbSize;
  PosX := MulDiv(HorzScrollInfo.nPos, HorzTrackRect.Width, HorzScrollInfo.nMax - HorzScrollInfo.nMin);
  with HorzTrackRect do
    Result := Rect(Left + PosX, Top, Left + PosX + ThumbSize, Bottom);
  if Result.Right > HorzTrackRect.Right then
  begin
    Result.Right := VertTrackRect.Right;
    Result.Left := Result.Right - ThumbSize;
  end;
end;

function TSysScrollingStyleHook.GetHorzThumbPosFromPos(const Pos: Integer): Integer;
var
  PosX: Integer;
begin
  with HorzScrollInfo do
  begin
    PosX := MulDiv(Pos, HorzTrackRect.Width, nMax - nMin);
    Result := PosX + BtnSize.cx;
  end;
end;

function TSysScrollingStyleHook.GetHorzThumbSize: Integer;
begin
  with HorzScrollInfo do
  begin
    Result := MulDiv(nPage, HorzScrollRect.Width - (2 * BtnSize.cx), nMax - nMin);
    if Result < BtnSize.cy then
      Result := BtnSize.cy;
  end;
end;

function TSysScrollingStyleHook.GetHorzTrackRect: TRect;
begin
  Result := HorzScrollRect;
  if Result.Width > 0 then
  begin
    Result.Left := Result.Left + GetSystemMetrics(SM_CXHTHUMB);
    Result.Right := Result.Right - GetSystemMetrics(SM_CXHTHUMB);
  end
  else
    Result := Rect(0, 0, 0, 0);
end;

function TSysScrollingStyleHook.GetVertTrackRect: TRect;
begin
  Result := VertScrollRect;
  if Result.Width > 0 then
  begin
    Result.Top := Result.Top + GetSystemMetrics(SM_CYVTHUMB);
    Result.Bottom := Result.Bottom - GetSystemMetrics(SM_CYVTHUMB);
  end
  else
    Result := Rect(0, 0, 0, 0);
end;

function TSysScrollingStyleHook.GetVertDownRect: TRect;
begin
  with VertScrollRect do
    Result := Rect(Left, Bottom - BtnSize.cy, Right, Bottom);
end;

function TSysScrollingStyleHook.GetHorzRightRect: TRect;
begin
  with HorzScrollRect do
    Result := Rect(Right - BtnSize.cx, Top, Right, Bottom);
end;

function TSysScrollingStyleHook.GetVertScrollRect: TRect;
var
  WinRect: TRect;
  BorderSize: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  WinRect := SysControl.WindowRect;
  BorderSize := GetBorderSize;
  with WinRect do
  begin
    if not LeftScrollBar then
    begin
      Result.Left := Right - BtnSize.cx;
      Result.Right := Result.Left + BtnSize.cx;
      Result.Top := Top;
      Result.Bottom := Bottom;
    end
    else
    begin
      Result.Left := Left;
      Result.Right := Left + BtnSize.cx;
      Result.Top := Top;
      Result.Bottom := Bottom;
    end;
  end;
  if (BorderSize.Left >= 0) or (BorderSize.Top >= 0) or (BorderSize.Right >= 0) or (BorderSize.Bottom >= 0) then
  begin
    if not LeftScrollBar then
    begin
      Result.Left := Result.Left - BorderSize.Right;
      Result.Right := Result.Left + BtnSize.cx;
      Result.Top := Result.Top + BorderSize.Top;
      Result.Bottom := Result.Bottom - BorderSize.Bottom;
    end
    else
    begin
      Result.Left := Result.Left + BorderSize.Left;
      Result.Right := Result.Left + BtnSize.cx;
      Result.Top := Result.Top + BorderSize.Top;
      Result.Bottom := Result.Bottom - BorderSize.Bottom;
    end;
  end;
  if FHorzScrollBar then
    Dec(Result.Bottom, BtnSize.cy);
end;

function TSysScrollingStyleHook.GetVertScrollInfo: TScrollInfo;
begin
  FillChar(Result, sizeof(TScrollInfo), Char(0));
  Result.cbSize := sizeof(TScrollInfo);
  Result.fMask := SIF_ALL;
  Winapi.Windows.GetScrollInfo(Handle, SB_VERT, Result);
end;

function TSysScrollingStyleHook.GetVertScrollPosFromPoint(const P: TPoint): Integer;
var
  TrackRect, WinRect: TRect;
  Pos, MaxMin: Integer;
  LInfo: TScrollInfo;
  ThumbSize: Integer;
begin
  LInfo := VertScrollInfo;
  Pos := P.Y - FDownDis;
  WinRect := SysControl.WindowRect;
  TrackRect := VertTrackRect;
  OffsetRect(TrackRect, -WinRect.Left, -WinRect.Top);
  Dec(Pos, WinRect.Top);
  ThumbSize := GetVertThumbSize;

  FTrackingRect := Rect(0, Pos, BtnSize.cx, Pos + ThumbSize);

  MaxMin := LInfo.nMax - LInfo.nMin;
  if MaxMin > 0 then
    Pos := MulDiv(Pos - TrackRect.Top, MaxMin - Integer(LInfo.nPage) + 2, (TrackRect.Height) - ThumbSize)
  else
    Pos := Pos - TrackRect.Top;
  if Pos < 0 then
    Pos := 0;
  if Pos >= LInfo.nMax - (Integer(LInfo.nPage) - 1) then
    Pos := LInfo.nMax - (Integer(LInfo.nPage) - 1);

  Result := Pos;
end;

function TSysScrollingStyleHook.GetVertSliderPos: Integer;
begin
  with VertScrollInfo do
    Result := MulDiv(nPos, VertTrackRect.Height, nMax - nMin);
end;

function TSysScrollingStyleHook.GetVertSliderRect: TRect;
var
  ThumbSize: Integer;
  PosY: Integer;
begin
  Result := Rect(0, 0, 0, 0);
  ThumbSize := GetVertThumbSize;
  PosY := MulDiv(VertScrollInfo.nPos, VertTrackRect.Height, VertScrollInfo.nMax - VertScrollInfo.nMin);
  with VertTrackRect do
    Result := Rect(Left, Top + PosY, Right, Top + PosY + ThumbSize);
  if Result.Bottom > VertTrackRect.Bottom then
  begin
    Result.Bottom := VertTrackRect.Bottom;
    Result.Top := Result.Bottom - ThumbSize;
  end;
end;

function TSysScrollingStyleHook.GetVertThumbPosFromPos(const Pos: Integer): Integer;
var
  PosY: Integer;
begin
  with VertScrollInfo do
  begin
    PosY := MulDiv(Pos, VertTrackRect.Height, nMax - nMin);
    Result := PosY + BtnSize.cy;
  end;
end;

function TSysScrollingStyleHook.GetVertThumbSize: Integer;
begin
  with VertScrollInfo do
  begin
    Result := MulDiv(nPage, VertTrackRect.Height, nMax - nMin);
    if Result < BtnSize.cy then
      Result := BtnSize.cy;
  end;
end;

function TSysScrollingStyleHook.GetVertUpRect: TRect;
begin
  with VertScrollRect Do
    Result := Rect(Left, Top, Right, Top + BtnSize.cy);
end;

procedure TSysScrollingStyleHook.InitScrollState;
begin
  FBtnUpDetail := tsArrowBtnUpNormal;
  FBtnDownDetail := tsArrowBtnDownNormal;
  FVertBtnSliderDetail := tsThumbBtnVertNormal;
  FBtnLeftDetail := tsArrowBtnLeftNormal;
  FBtnRightDetail := tsArrowBtnRightNormal;
  FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
end;

function TSysScrollingStyleHook.IsHorzScrollDisabled: Boolean;
begin
  if FHorzScrollBar then
  begin
    with HorzScrollInfo do
      Result := (Integer(nPage) > nMax);
  end
  else
    Result := False;
end;

function TSysScrollingStyleHook.IsLeftScrollBar: Boolean;
begin
  Result := (SysControl.ExStyle and WS_EX_LEFTSCROLLBAR = WS_EX_LEFTSCROLLBAR);
end;

function TSysScrollingStyleHook.IsVertScrollDisabled: Boolean;
begin
  if FVertScrollBar then
  begin
    with VertScrollInfo do
      Result := (Integer(nPage) > nMax);
  end
  else
    Result := False;
end;

procedure TSysScrollingStyleHook.MouseEnter;
begin
  if FVertScrollBar and (not FNCMouseDown) and (not VertScrollDisabled) then
  begin
    if (FBtnUpDetail <> tsArrowBtnUpNormal) or (FBtnDownDetail <> tsArrowBtnDownNormal) or (FVertBtnSliderDetail <> tsThumbBtnVertNormal) then
    begin
      FBtnUpDetail := tsArrowBtnUpNormal;
      FBtnDownDetail := tsArrowBtnDownNormal;
      FVertBtnSliderDetail := tsThumbBtnVertNormal;
      DrawVertScroll(0);
    end;
  end;
  if FHorzScrollBar and (not FNCMouseDown) and (not HorzScrollDisabled) then
  begin
    if (FBtnLeftDetail <> tsArrowBtnLeftNormal) or (FBtnRightDetail <> tsArrowBtnRightNormal) or (FHorzBtnSliderDetail <> tsThumbBtnHorzNormal) then
    begin
      FBtnLeftDetail := tsArrowBtnLeftNormal;
      FBtnRightDetail := tsArrowBtnRightNormal;
      FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
      DrawHorzScroll(0);
    end;
  end;
end;

procedure TSysScrollingStyleHook.MouseLeave;
begin
  if not FNCMouseDown then
  begin
    if FVertScrollBar and not VertScrollDisabled then
    begin
      if (FBtnUpDetail <> tsArrowBtnUpNormal) or (FBtnDownDetail <> tsArrowBtnDownNormal) or (FVertBtnSliderDetail <> tsThumbBtnVertNormal) then
      begin
        FBtnUpDetail := tsArrowBtnUpNormal;
        FBtnDownDetail := tsArrowBtnDownNormal;
        FVertBtnSliderDetail := tsThumbBtnVertNormal;
        DrawVertScroll(0);
      end;
    end;
    if FHorzScrollBar and not HorzScrollDisabled then
    begin
      if (FBtnLeftDetail <> tsArrowBtnLeftNormal) or (FBtnRightDetail <> tsArrowBtnRightNormal) or (FHorzBtnSliderDetail <> tsThumbBtnHorzNormal) then
      begin
        FBtnLeftDetail := tsArrowBtnLeftNormal;
        FBtnRightDetail := tsArrowBtnRightNormal;
        FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
        DrawHorzScroll(0);
      end;
    end;
  end;
end;

procedure TSysScrollingStyleHook.PaintNC(Canvas: TCanvas);
begin
  if (Canvas.HandleAllocated) and (not FTracking) then
  begin
    if FVertScrollBar then
      DrawVertScroll(Canvas.Handle);
    if FHorzScrollBar then
      DrawHorzScroll(Canvas.Handle);
  end;
end;

procedure TSysScrollingStyleHook.Scroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer);
begin
  if Kind = sbVertical then
  begin
    case ScrollType of
      skTracking:
        begin
          FLstPos := Pos;
          FAllowScrolling := True;
          SendMessage(Handle, WM_VSCROLL, MakeWParam(SB_THUMBTRACK, Pos), 0);
          FAllowScrolling := False;
        end;
      skLineUp: SendMessage(Handle, WM_VSCROLL, SB_LINEUP, 0);
      skLineDown: SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 0);
      skPageUp: SendMessage(Handle, WM_VSCROLL, SB_PAGEUP, 0);
      skPageDown: SendMessage(Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
    end;
  end
  else if Kind = sbHorizontal then
  begin
    case ScrollType of
      skTracking:
        begin
          FLstPos := Pos;
          FAllowScrolling := True;
          SendMessage(Handle, WM_HSCROLL, MakeWParam(SB_THUMBTRACK, Pos), 0);
          FAllowScrolling := False;
        end;
      skLineLeft: SendMessage(Handle, WM_HSCROLL, SB_LINELEFT, 0);
      skLineRight: SendMessage(Handle, WM_HSCROLL, SB_LINERIGHT, 0);
      skPageLeft: SendMessage(Handle, WM_HSCROLL, SB_PAGELEFT, 0);
      skPageRight: SendMessage(Handle, WM_HSCROLL, SB_PAGERIGHT, 0);
    end;
  end;
end;

procedure TSysScrollingStyleHook.StartLineTrackTimer;
begin
  if FTimerMode <> 0 then
    KillTimer(Handle, 10);
  FTimerMode := 1;
  SetTimer(Handle, 10, 100, nil);
end;

procedure TSysScrollingStyleHook.StartPageTrackTimer;
begin
  if FTimerMode <> 0 then
    KillTimer(Handle, 10);
  FTimerMode := 2;
  SetTimer(Handle, 10, 100, nil);
end;

procedure TSysScrollingStyleHook.StartSliderTrackTimer;
begin
  if FTimerMode <> 0 then
    KillTimer(Handle, 10);
  FTimerMode := 3;
  SetTimer(Handle, 10, 100, nil);
end;

procedure TSysScrollingStyleHook.StopTrackTimer;
begin
  if FTimerMode <> 0 then
  begin
    FTimerMode := 0;
    KillTimer(Handle, 10);
  end;
end;

procedure TSysScrollingStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  OrgStyle, NewStyle: NativeInt;
  BorderSize: TRect;
begin
  if (not OverridePaintNC) or (not StyleServicesEnabled) then
  begin
    Handled := False;
    Exit;
  end;
  BorderSize := GetBorderSize;
  OrgStyle := SysControl.Style;
  NewStyle := SysControl.Style;
  FVertScrollBar := False;
  FHorzScrollBar := False;
  if OrgStyle and WS_VSCROLL = WS_VSCROLL then
  begin
    { Remove the VertScrollBar  . }
    NewStyle := NewStyle and not WS_VSCROLL;
    FVertScrollBar := True;
  end;
  if OrgStyle and WS_HSCROLL = WS_HSCROLL then
  begin
    { Remove the HorzScrollBar  . }
    NewStyle := NewStyle and not WS_HSCROLL;
    FHorzScrollBar := True;
  end;
  if OrgStyle <> NewStyle then
  begin
    SysControl.Style := NewStyle;
    if not HookedDirectly then
      Message.Result := CallDefaultProc(TMessage(Message));
    SysControl.Style := OrgStyle;
  end;
  if FVertScrollBar then
  begin
    { Insert a new VertScrollBar area . }
    if not LeftScrollBar then
      Dec(Message.CalcSize_Params.rgrc[0].Right, BtnSize.cx)
    else
      Inc(Message.CalcSize_Params.rgrc[0].Left, BtnSize.cx);
  end;
  if FHorzScrollBar then
    { Insert a new HorzScrollBar area . }
    Dec(Message.CalcSize_Params.rgrc[0].Bottom, BtnSize.cx);
  if SysControl.HasBorder then
  begin
    Inc(Message.CalcSize_Params.rgrc[0].Left, BorderSize.Left);
    Inc(Message.CalcSize_Params.rgrc[0].Top, BorderSize.Top);
    Dec(Message.CalcSize_Params.rgrc[0].Bottom, BorderSize.Bottom);
    Dec(Message.CalcSize_Params.rgrc[0].Right, BorderSize.Right);
  end;
  Handled := True;
end;

procedure TSysScrollingStyleHook.WMNCHitTest(var Message: TWMNCHitTest);
var
  P: TPoint;
begin
  if (not OverridePaintNC) or (not StyleServicesEnabled) then
  begin
    Handled := False;
    Exit;
  end;
  Message.Result := CallDefaultProc(TMessage(Message));
  P.X := Message.XPos;
  P.Y := Message.YPos;
  { If Mouse on VertScrollBar . }
  if (FVertScrollBar and VertScrollRect.Contains(P)) then
  begin
    { Return HTVSCROLL allow the app to get WM_NCLBUTTONDOWN message . }
    Message.Result := HTVSCROLL;
    if (SysControl.Enabled and not VertScrollDisabled) then
    begin
      { If Mouse pressed then exit . }
      if not FNCMouseDown then
      begin
        if VertUpRect.Contains(P) then
        begin
          { VertUpButton Hot . }
          FVertBtnSliderDetail := tsThumbBtnVertNormal;
          if FBtnUpDetail <> tsArrowBtnUpHot then
          begin
            FBtnUpDetail := tsArrowBtnUpHot;
            DrawVertScroll(0);
          end;
        end
        else if VertDownRect.Contains(P) then
        begin
          { VertDownButton Hot . }
          FVertBtnSliderDetail := tsThumbBtnVertNormal;
          if FBtnDownDetail <> tsArrowBtnDownHot then
          begin
            FBtnDownDetail := tsArrowBtnDownHot;
            DrawVertScroll(0);
          end;
        end
        else if VertSliderRect.Contains(P) then
        begin
          { VertSliderButton Hot . }
          FBtnUpDetail := tsArrowBtnUpNormal;
          FBtnDownDetail := tsArrowBtnDownNormal;
          if FVertBtnSliderDetail <> tsThumbBtnVertHot then
          begin
            FVertBtnSliderDetail := tsThumbBtnVertHot;
            DrawVertScroll(0);
          end;
        end
        else
        begin
          { Update ScrollBar state . }
          if (FBtnUpDetail <> tsArrowBtnUpNormal) or (FBtnDownDetail <> tsArrowBtnDownNormal) or (FVertBtnSliderDetail <> tsThumbBtnVertNormal) then
          begin
            FBtnUpDetail := tsArrowBtnUpNormal;
            FBtnDownDetail := tsArrowBtnDownNormal;
            FVertBtnSliderDetail := tsThumbBtnVertNormal;
            DrawVertScroll(0);
          end
        end;
      end;
    end;
  end;
  { If Mouse on HorzScrollBar . }
  if (FHorzScrollBar and HorzScrollRect.Contains(P)) then
  begin
    { Return HTHSCROLL allow the app to get WM_NCLBUTTONDOWN message . }
    Message.Result := HTHSCROLL;
    if (SysControl.Enabled and not HorzScrollDisabled) then
    begin
      { If Mouse pressed then exit . }
      if not FNCMouseDown then
      begin
        if HorzLeftRect.Contains(P) then
        begin
          { HorzLeftButton Hot . }
          FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
          if FBtnLeftDetail <> tsArrowBtnLeftHot then
          begin
            FBtnLeftDetail := tsArrowBtnLeftHot;
            DrawHorzScroll(0);
          end;
        end
        else if HorzRightRect.Contains(P) then
        begin
          { HorzRightButton Hot . }
          FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
          if FBtnRightDetail <> tsArrowBtnRightHot then
          begin
            FBtnRightDetail := tsArrowBtnRightHot;
            DrawHorzScroll(0);
          end;
        end
        else if HorzSliderRect.Contains(P) then
        begin
          { HorzSliderButton Hot . }
          FBtnLeftDetail := tsArrowBtnLeftNormal;
          FBtnRightDetail := tsArrowBtnRightNormal;
          if FHorzBtnSliderDetail <> tsThumbBtnHorzHot then
          begin
            FHorzBtnSliderDetail := tsThumbBtnHorzHot;
            DrawHorzScroll(0);
          end;
        end
        else
        begin
          { Update ScrollBar state  . }
          if (FBtnLeftDetail <> tsArrowBtnLeftNormal) or (FBtnRightDetail <> tsArrowBtnRightNormal) or (FHorzBtnSliderDetail <> tsThumbBtnHorzNormal) then
          begin
            FBtnLeftDetail := tsArrowBtnLeftNormal;
            FBtnRightDetail := tsArrowBtnRightNormal;
            FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
            DrawHorzScroll(0);
          end
        end;
      end;
    end;
  end;
  Handled := True;
end;

procedure TSysScrollingStyleHook.WMNCLButtonDown(var Message: TWMNCLButtonDown);
var
  P: TPoint;
begin
  if (not OverridePaintNC) or (not StyleServicesEnabled) then
  begin
    Handled := False;
    Exit;
  end;

  if not SysControl.Enabled then
  begin
    Message.Result := CallDefaultProc(TMessage(Message));
    Exit;
  end;

  FNCMouseDown := True;
  FTracking := False;
  if (Message.HitTest = HTVSCROLL) then
  begin
    if VertScrollDisabled then
    begin
      FTracking := False;
      FNCMouseDown := False;
      Message.Result := CallDefaultProc(TMessage(Message));
      FAllowScrolling := True;
      Handled := True;
      Exit;
    end;
    { Vertical ScrollBar }
    FScrollKind := sbVertical;
    GetCursorPos(P);
    { Save the DownPoint }
    FDownPoint := P;
    { The distance between the point & the top of VertSliderButton . }
    FDownDis := P.Y - VertSliderRect.Top;
    { The old ScrollBar Position }
    FPrevPos := VertScrollInfo.nPos;

    if VertSliderRect.Contains(P) then
    begin
      { VertSliderButton pressed . }
      FVertBtnSliderDetail := tsThumbBtnVertPressed;
      StartSliderTrackTimer;
      DrawVertScroll(0); { Need Repaint ==> First painting }
      FTracking := True; { ==> Set it after first painting  . }
      FAllowScrolling := False;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      FAllowScrolling := False;
      StopTrackTimer;
      FVertBtnSliderDetail := tsThumbBtnVertNormal;
      FTracking := False; { Set it before the second painting . }
      DrawVertScroll(0); { Need Repaint ==> Second painting . }
    end
    else if (VertUpRect.Contains(P) or (VertDownRect.Contains(P))) then
    begin
      if VertUpRect.Contains(P) then
      begin
        { VertUpButton pressed . }
        FScrollingType := skLineUp;
        FBtnUpDetail := tsArrowBtnUpPressed;
      end
      else
      begin
        { VertDownButton pressed . }
        FScrollingType := skLineDown;
        FBtnDownDetail := tsArrowBtnDownPressed;
      end;
      DrawVertScroll(0); { Need Repaint . }
      StartLineTrackTimer;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      StopTrackTimer;
      FBtnDownDetail := tsArrowBtnDownNormal;
      FBtnUpDetail := tsArrowBtnUpNormal;
      DrawVertScroll(0); { Need Repaint . }
    end
    else
    begin
      FScrollingType := skNone;
      if FDownPoint.Y > VertSliderRect.Bottom then
        FScrollingType := skPageDown;
      if FDownPoint.Y < VertSliderRect.Top then
        FScrollingType := skPageUp;
      DrawVertScroll(0); { Need Repaint . }
      {
        Scrolling from the track rect .
        ==> Not from Slider or Up/Down Button .
      }

      StartPageTrackTimer;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      StopTrackTimer;
    end;
    DrawVertScroll(0); { Need Repaint . }
  end
  else if (Message.HitTest = HTHSCROLL) then
  { Horizontal ScrollBar }
  begin
    if HorzScrollDisabled then
    begin
      FTracking := False;
      FNCMouseDown := False;
      Message.Result := CallDefaultProc(TMessage(Message));
      FAllowScrolling := True;
      Handled := True;
      Exit;
    end;
    FScrollKind := sbHorizontal;
    GetCursorPos(P);
    FDownPoint := P;
    { The distance between the point & the left of HorzSliderButton . }
    FDownDis := P.X - HorzSliderRect.Left;
    FPrevPos := HorzScrollInfo.nPos;
    if HorzSliderRect.Contains(P) then
    begin
      FHorzBtnSliderDetail := tsThumbBtnHorzPressed;
      DrawHorzScroll(0); { Need Repaint ==> First painting . }
      FTracking := True; { Set it after first painting . }
      StartSliderTrackTimer;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      StopTrackTimer;
      FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
      FTracking := False; { Set it before second painting . }
      DrawHorzScroll(0); { Need Repaint ==> Second painting. }
    end
    else if (HorzLeftRect.Contains(P) or (HorzRightRect.Contains(P))) then
    begin
      if HorzLeftRect.Contains(P) then
      begin
        FBtnLeftDetail := tsArrowBtnLeftPressed;
        FBtnRightDetail := tsArrowBtnRightNormal;
        FScrollingType := skLineLeft
      end
      else
      begin
        FBtnLeftDetail := tsArrowBtnLeftNormal;
        FBtnRightDetail := tsArrowBtnRightPressed;
        FScrollingType := skLineRight;
      end;
      DrawHorzScroll(0); { Need Repaint . }
      StartLineTrackTimer;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      FBtnLeftDetail := tsArrowBtnLeftNormal;
      FBtnRightDetail := tsArrowBtnRightNormal;
      StopTrackTimer;
      DrawHorzScroll(0); { Need Repaint . }
    end
    else
    begin
      FScrollingType := skNone;
      if FDownPoint.X > HorzSliderRect.Right then
        FScrollingType := skPageRight;
      if FDownPoint.X < HorzSliderRect.Right then
        FScrollingType := skPageLeft;
      {
        Scrolling from the track rect .
        ==> Not from Slider or Left/Right Button .
      }
      StartPageTrackTimer;
      { Mouse Down }
      Message.Result := CallDefaultProc(TMessage(Message));
      { Mouse Up }
      StopTrackTimer;
    end;
    FTracking := False;
    DrawHorzScroll(0); { Need Repaint . }
  end
  else
  begin
    Message.Result := CallDefaultProc(TMessage(Message));
  end;
  FTracking := False;
  FNCMouseDown := False;
  Handled := True;
  FAllowScrolling := True;
end;

procedure TSysScrollingStyleHook.WMNCLButtonUp(var Message: TWMNCLButtonUp);
begin
  Message.Result := CallDefaultProc(TMessage(Message));
  Handled := True;
end;

procedure TSysScrollingStyleHook.WndProc(var Message: TMessage);
begin
  case Message.msg of
    WM_TIMER:
      begin
       if TWMTIMER(Message).TimerID = 10 then
         case FTimerMode of
           1: DoLineTrackTimer;
           2: DoPageTrackTimer;
           3: DoSliderTrackTimer;
         end
         else
          inherited;
      end;
    WM_MOUSEWHEEL:
      begin
        Inherited;
        if FVertScrollBar then
          DrawVertScroll(0);
      end;

    WM_VSCROLL, WM_HSCROLL:
      begin
        if Word(Message.WParam) = SB_THUMBPOSITION then
        begin
          Message.WParam := MakeWParam(SB_THUMBPOSITION, FLstPos);
          CallDefaultProc(Message);
          Exit;
        end;
        if (not OverridePaintNC) or (not StyleServicesEnabled) then
        begin
          CallDefaultProc(Message);
          Exit;
        end;
        // if not FAllowScrolling then
        // Exit;
        inherited;
      end;

    WM_NCMOUSELEAVE, WM_MOUSEMOVE:
      begin
        if (not OverridePaintNC) or (not StyleServicesEnabled) then
        begin
          CallDefaultProc(Message);
          Exit;
        end;
        { Update ScrollBar State }
        if (FVertScrollBar and SysControl.Enabled and (not FNCMouseDown) and (not VertScrollDisabled)) then
        begin
          if (FBtnUpDetail <> tsArrowBtnUpNormal) or (FBtnDownDetail <> tsArrowBtnDownNormal) or (FVertBtnSliderDetail <> tsThumbBtnVertNormal) then
          begin
            FBtnUpDetail := tsArrowBtnUpNormal;
            FBtnDownDetail := tsArrowBtnDownNormal;
            FVertBtnSliderDetail := tsThumbBtnVertNormal;
            DrawVertScroll(0);
          end;
        end;
        if (FHorzScrollBar and SysControl.Enabled and (not FNCMouseDown) and (not HorzScrollDisabled)) then
        begin
          if (FBtnLeftDetail <> tsArrowBtnLeftNormal) or (FBtnRightDetail <> tsArrowBtnRightNormal) or (FHorzBtnSliderDetail <> tsThumbBtnHorzNormal) then
          begin
            FBtnLeftDetail := tsArrowBtnLeftNormal;
            FBtnRightDetail := tsArrowBtnRightNormal;
            FHorzBtnSliderDetail := tsThumbBtnHorzNormal;
            DrawHorzScroll(0);
          end;
        end;
        inherited;
      end;

    WM_PAINT:
      begin
        if (not OverridePaintNC) or (not StyleServicesEnabled) then
        begin
          CallDefaultProc(Message);
          Exit;
        end;

        inherited WndProc(Message);
        { Do not paint while tracking . }
        if (not FTracking) and (OverridePaintNC) then
        begin
          if FVertScrollBar then
            DrawVertScroll(0);
          if FHorzScrollBar then
            DrawHorzScroll(0);
        end;
        Exit;
      end;
  else inherited;
  end;

end;

{ TSysDialogStyleHook }

procedure TSysDialogStyleHook.Close;
begin
  if (Handle <> 0) and not(FSysCloseButtonDisabled) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_CLOSE, 0);
end;

constructor TSysDialogStyleHook.Create(AHandle: THandle);
begin
  inherited;
  FRegion := 0;
  StyleElements := [seFont, seClient, seBorder];
  OverrideEraseBkgnd := True;
  FPressedButton := 0;
  FHotButton := 0;
  FIconHandle := 0;
  FIcon := nil;
  FWidth := SysControl.Width;
  FHeight := SysControl.Height;
  FSysMenuButtonRect := Rect(0, 0, 0, 0);
end;

destructor TSysDialogStyleHook.Destroy;
begin
  if FRegion <> 0 then
    DeleteObject(FRegion);
  if Assigned(FIcon) then
    FreeAndNil(FIcon);
  inherited;
end;

procedure TSysDialogStyleHook.DrawBorder(Canvas: TCanvas);
begin
  // do nothing
end;

function TSysDialogStyleHook.GetCaptionRect: TRect;
var
  LDetails: TThemedElementDetails;
  ElementSize: TSize;
  CaptionHeight: Integer;
begin
  Result := Rect(0, 0, FWidth, 0);
  if BorderStyle = bsNone then
    Exit;

  if FFrameActive then
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twCaptionActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallCaptionActive);
  end
  else
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twCaptionInActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallCaptionInActive);
  end;
  StyleServices.GetElementSize(0, LDetails, esActual, ElementSize);
  CaptionHeight := ElementSize.Height;
  Result := Rect(0, 0, FWidth, CaptionHeight);

end;

function TSysDialogStyleHook.GetCloseButtonRect: TRect;
var
  FButtonState: TThemedWindow;
  LDetails: TThemedElementDetails;
begin
  Result := Rect(0, 0, 0, 0);
  if (biSystemMenu in BorderIcons) then
  begin
    if not UseSmallBorder then
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twCloseButtonHot
      else if FFrameActive then
        FButtonState := twCloseButtonNormal
      else
        FButtonState := twCloseButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twSmallCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twSmallCloseButtonHot
      else if FFrameActive then
        FButtonState := twSmallCloseButtonNormal
      else
        FButtonState := twSmallCloseButtonDisabled;
    end;
    LDetails := StyleServices.GetElementDetails(FButtonState);
    if not StyleServices.GetElementContentRect(0, LDetails, CaptionRect, Result) then
      Result := Rect(0, 0, 0, 0);
  end;
end;

function TSysDialogStyleHook.GetHelpButtonRect: TRect;
var
  FButtonState: TThemedWindow;
  LDetails: TThemedElementDetails;
begin
  Result := Rect(0, 0, 0, 0);
  if (biHelp in BorderIcons) and (biSystemMenu in BorderIcons) and ((not(biMaximize in BorderIcons) and not(biMinimize in BorderIcons)) or (BorderStyle = bsDialog)) then
  begin
    if (FPressedButton = HTHELP) and (FHotButton = HTHELP) then
      FButtonState := twHelpButtonPushed
    else if FHotButton = HTHELP then
      FButtonState := twHelpButtonHot
    else if FFrameActive then
      FButtonState := twHelpButtonNormal
    else
      FButtonState := twHelpButtonDisabled;
    LDetails := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, LDetails, CaptionRect, Result) then
      Result := Rect(0, 0, 0, 0);
  end;
end;

function TSysDialogStyleHook.GetHitTest(const P: TPoint): Integer;
begin
  Result := HTCAPTION;
  if CloseButtonRect.Contains(P) then
    Result := HTCLOSE;
  if MaxButtonRect.Contains(P) then
    Result := HTMAXBUTTON;
  if MinButtonRect.Contains(P) then
    Result := HTMINBUTTON;
  if HelpButtonRect.Contains(P) then
    Result := HTHELP;

  if Result <> HTCAPTION then
  begin
    if FHotButton <> Result then
    begin
      FHotButton := Result;
      InvalidateNC;
    end;
    Exit;
  end
  else
  begin
    if FHotButton <> 0 then
    begin
      FHotButton := 0;
      InvalidateNC;
    end;
  end;
end;

function TSysDialogStyleHook.GetMaxButtonRect: TRect;
var
  FButtonState: TThemedWindow;
  LDetails: TThemedElementDetails;
begin
  Result := Rect(0, 0, 0, 0);
  if (biMaximize in BorderIcons) and (biSystemMenu in BorderIcons) and (BorderStyle <> bsDialog) and (BorderStyle <> bsToolWindow) and (BorderStyle <> bsSizeToolWin) then
  begin
    if WindowState = wsMaximized then
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twRestoreButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twRestoreButtonHot
      else if FFrameActive then
        FButtonState := twRestoreButtonNormal
      else
        FButtonState := twRestoreButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twMaxButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twMaxButtonHot
      else if FFrameActive then
        FButtonState := twMaxButtonNormal
      else
        FButtonState := twMaxButtonDisabled;
    end;
    LDetails := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, LDetails, CaptionRect, Result) then
      Result := Rect(0, 0, 0, 0);
  end;
end;

function TSysDialogStyleHook.GetMinButtonRect: TRect;
var
  FButtonState: TThemedWindow;
  LDetails: TThemedElementDetails;
begin
  Result := Rect(0, 0, 0, 0);
  if (biMinimize in BorderIcons) and (biSystemMenu in BorderIcons) and (BorderStyle <> bsDialog) and (BorderStyle <> bsToolWindow) and (BorderStyle <> bsSizeToolWin) then
  begin
    if (FPressedButton = HTMINBUTTON) and (FHotButton = HTMINBUTTON) then
      FButtonState := twMinButtonPushed
    else if FHotButton = HTMINBUTTON then
      FButtonState := twMinButtonHot
    else if FFrameActive then
      FButtonState := twMinButtonNormal
    else
      FButtonState := twMinButtonDisabled;

    LDetails := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, LDetails, CaptionRect, Result) then
      Result := Rect(0, 0, 0, 0);
  end;

end;

function TSysDialogStyleHook.GetWindowState: TWindowState;
begin
  Result := wsNormal;
  if IsZoomed(Handle) then
    Result := wsMaximized;
  if IsIconic(Handle) then
    Result := wsMinimized;
end;

procedure TSysDialogStyleHook.Help;
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_CONTEXTHELP, 0)
end;

function TSysDialogStyleHook.IsSysCloseButtonDisabled: Boolean;
var
  i, ID: Integer;
begin
  Result := True;
  if SysMenu > 0 then
  begin
    for i := 0 to GetMenuItemCount(SysMenu) - 1 do
    begin
      ID := GetMenuItemID(SysMenu, i);
      if ID = SC_CLOSE then
      begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;

procedure TSysDialogStyleHook.Maximize;
begin
  if Handle <> 0 then
  begin
    FPressedButton := 0;
    FHotButton := 0;

    if IsZoomed(Handle) then
      PostMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
    else
      PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  end;
end;

procedure TSysDialogStyleHook.Minimize;
begin
  if Handle <> 0 then
  begin
    FPressedButton := 0;
    FHotButton := 0;
    if IsIconic(Handle) then
      PostMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
    else
      PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
  end;
end;

procedure TSysDialogStyleHook.Paint(Canvas: TCanvas);
begin
  inherited;
  PaintBackground(Canvas);
end;

procedure TSysDialogStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited;
end;

function TSysDialogStyleHook.GetBorderIcons: TBorderIcons;
begin
  Result := [];
  with SysControl do
  begin
    if (Style and WS_SYSMENU = WS_SYSMENU) then
      Include(Result, biSystemMenu);
    if (Style and WS_MAXIMIZEBOX = WS_MAXIMIZEBOX) then
      Include(Result, biMaximize);
    if (Style and WS_MINIMIZEBOX = WS_MINIMIZEBOX) then
      Include(Result, biMinimize);
    if (ExStyle and WS_EX_CONTEXTHELP = WS_EX_CONTEXTHELP) and (not(biMaximize in Result)) and (not(biMinimize in Result)) then
      Include(Result, biHelp);
  end;
end;

function TSysDialogStyleHook.GetBorderSize: TRect;
var
  Size: TSize;
  Details: TThemedElementDetails;
  Detail: TThemedWindow;
begin
  {
    Result.Left = Left border width
    Result.Top = Caption height
    Result.Right = Right border width
    Result.Bottom = Bottom border height
  }
  Result := Rect(0, 0, 0, 0);
  if BorderStyle = bsNone then
    Exit;

  if not StyleServices.Available then
    Exit;
  { Caption height }
  if not UseSmallBorder then
    Detail := twCaptionActive
  else
    Detail := twSmallCaptionActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Top := Size.cy;
  { Left border width }
  if not UseSmallBorder then
    Detail := twFrameLeftActive
  else
    Detail := twSmallFrameLeftActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Left := Size.cx;
  { Right border width }
  if not UseSmallBorder then
    Detail := twFrameRightActive
  else
    Detail := twSmallFrameRightActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Right := Size.cx;
  { Bottom border height }
  if not UseSmallBorder then
    Detail := twFrameBottomActive
  else
    Detail := twSmallFrameBottomActive;
  Details := StyleServices.GetElementDetails(Detail);
  StyleServices.GetElementSize(0, Details, esActual, Size);
  Result.Bottom := Size.cy;
end;

function TSysDialogStyleHook.GetBorderStyle: TFormBorderStyle;
begin
  Result := bsNone;
  if not UpdateRegion then
    Exit(bsNone);
  with SysControl do
  begin
    if (Style and WS_OVERLAPPED = WS_OVERLAPPED) or (Style and WS_OVERLAPPEDWINDOW = WS_OVERLAPPEDWINDOW) or (Style and WS_CAPTION = WS_CAPTION) or
      (ExStyle and WS_EX_OVERLAPPEDWINDOW = WS_EX_OVERLAPPEDWINDOW) and (ExStyle and WS_EX_TOOLWINDOW <> WS_EX_TOOLWINDOW) then
    begin
      if (Style and WS_SIZEBOX <> WS_SIZEBOX) and ((Style and WS_MINIMIZEBOX = WS_MAXIMIZE) or (Style and WS_MINIMIZEBOX = WS_MINIMIZEBOX)) then
        Result := bsSingle;

      if (Style and WS_SIZEBOX <> WS_SIZEBOX) and (Style and WS_MINIMIZEBOX <> WS_MAXIMIZE) and (Style and WS_MINIMIZEBOX <> WS_MINIMIZEBOX) then
        Result := bsDialog;

      if (Style and WS_SIZEBOX = WS_SIZEBOX) then
        Result := bsSizeable;
    end
    else if (ExStyle and WS_EX_TOOLWINDOW = WS_EX_TOOLWINDOW) then
    begin
      if (Style and WS_SIZEBOX = WS_SIZEBOX) then
        Result := bsSizeToolWin
      else
        Result := bsToolWindow;
    end
    else
      Result := bsNone;
  end;
end;

function TSysDialogStyleHook.UseSmallBorder: Boolean;
begin
  Result := (BorderStyle = bsToolWindow) or (BorderStyle = bsSizeToolWin);
end;

function TSysDialogStyleHook.GetRegion: HRGN;
var
  R: TRect;
  LDetails: TThemedElementDetails;
  Detail: TThemedWindow;
begin
  Result := 0;
  if not StyleServices.Available then
    Exit;
  { Get Window Region }
  R := Rect(0, 0, FWidth, FHeight);
  if not UseSmallBorder then
    Detail := twCaptionActive
  else
    Detail := twSmallCaptionActive;

  DeleteObject(FRegion);
  LDetails := StyleServices.GetElementDetails(Detail);
  if not StyleServices.GetElementRegion(LDetails, R, Result) then
    FRegion := 0;
end;

function TSysDialogStyleHook.GetSysMenu: HMENU;
begin
  Result := GetSystemMenu(Handle, False);
end;

function TSysDialogStyleHook.GetSysMenuButtonRect: TRect;
var
  LBorderIcons: TBorderIcons;
  LBorderStyle: TBorderStyle;
  IconDetails: TThemedElementDetails;
  ButtonRect, R: TRect;
begin
  Result := Rect(0, 0, 0, 0);
  LBorderStyle := BorderStyle;
  LBorderIcons := BorderIcons;
  if (biSystemMenu in LBorderIcons) and (LBorderStyle <> bsDialog) and (LBorderStyle <> bsToolWindow) and (LBorderStyle <> bsSizeToolWin) then
  begin
    IconDetails := StyleServices.GetElementDetails(twSysButtonNormal);
    if not StyleServices.GetElementContentRect(0, IconDetails, CaptionRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);
    //R := ButtonRect;
    R := Rect(0, 0, GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON));
    RectVCenter(R, ButtonRect);
    Result := ButtonRect;
  end;

end;

function TSysDialogStyleHook.GetUpdateRegion: Boolean;
begin
  with SysControl do
    Result := not((Style and WS_CAPTION <> WS_CAPTION) and (Style and WS_SYSMENU <> WS_SYSMENU) and (Style and WS_SIZEBOX <> WS_SIZEBOX));
end;

function TSysDialogStyleHook.GetIconFast: TIcon;
begin
  if (FIcon = nil) or (FIconHandle = 0) then
    Result := GetIcon
  else
    Result := FIcon;
end;

function TSysDialogStyleHook.GetIcon: TIcon;
var
  IconX, IconY: Integer;
  TmpHandle: THandle;
  Info: TWndClassEx;
  Buffer: array [0 .. 255] of Char;
begin
  TmpHandle := THandle(SendMessage(Handle, WM_GETICON, ICON_SMALL, 0));
  if TmpHandle = 0 then
    TmpHandle := THandle(SendMessage(Handle, WM_GETICON, ICON_BIG, 0));

  if TmpHandle = 0 then
    TmpHandle := THandle(SendMessage(Handle, WM_GETICON, ICON_SMALL2, 0));

  if TmpHandle = 0 then
  begin
    { Get instance }
    GetClassName(Handle, @Buffer, sizeof(Buffer));
    FillChar(Info, sizeof(Info), 0);
    Info.cbSize := sizeof(Info);

    if GetClassInfoEx(GetWindowLong(Handle, GWL_HINSTANCE), @Buffer, Info) then
    begin
      TmpHandle := Info.hIconSm;
      if TmpHandle = 0 then
        TmpHandle := Info.HICON;
    end
  end;

  if FIcon = nil then
    FIcon := TIcon.Create;
  if TmpHandle <> 0 then
  begin
    IconX := GetSystemMetrics(SM_CXSMICON);
    if IconX = 0 then
      IconX := GetSystemMetrics(SM_CXSIZE);
    IconY := GetSystemMetrics(SM_CYSMICON);
    if IconY = 0 then
      IconY := GetSystemMetrics(SM_CYSIZE);
    FIcon.Handle := CopyImage(TmpHandle, IMAGE_ICON, IconX, IconY, 0);
    FIconHandle := TmpHandle;
  end;

  Result := FIcon;
end;

procedure TSysDialogStyleHook.PaintNC(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
  CaptionBmp: TBitmap;
  DC: HDC;
  FButtonState: TThemedWindow;
  LCaptionRect, LBorderSize, R: TRect;
  ButtonRect, TextRect: TRect;
  TextTopOffset: Integer;
  IconDetails: TThemedElementDetails;
  LBorderIcons: TBorderIcons;
  LBorderStyle: TFormBorderStyle;
  CaptionDetails: TThemedElementDetails;
  TextFormat: TTextFormat;
  LText: String;
  nPos: Integer;
  SysMenu: HMENU;
  ItemDisabled: Boolean;
begin
  LBorderStyle := BorderStyle;
  if (LBorderStyle = bsNone) or (WindowState = wsMinimized) then // (WindowState=wsMinimized) avoid bug in windows 8.1  and increase performance
    Exit;

  LBorderIcons := BorderIcons;
  LCaptionRect := CaptionRect;
  CaptionBmp := TBitmap.Create;
  CaptionBmp.SetSize(LCaptionRect.Width, LCaptionRect.Height);
  DC := CaptionBmp.Canvas.Handle;
  TextTopOffset := 0;
  TextRect := Rect(0, 0, 0, 0);;
  ButtonRect := Rect(0, 0, 0, 0);;
  FCaptionRect := Rect(0, 0, 0, 0);
  R := Rect(0, 0, 0, 0);

  { Caption }
  if FFrameActive then
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twCaptionActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallCaptionActive);
  end
  else
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twCaptionInActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallCaptionInActive);
  end;
  CaptionDetails := LDetails;
  StyleServices.DrawElement(DC, LDetails, LCaptionRect, nil);

  { Draw icon }

  if (biSystemMenu in LBorderIcons) and (LBorderStyle <> bsDialog) and (LBorderStyle <> bsToolWindow) and (LBorderStyle <> bsSizeToolWin) then
  begin
    IconDetails := StyleServices.GetElementDetails(twSysButtonNormal);
    if not StyleServices.GetElementContentRect(0, IconDetails, LCaptionRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);

    R := Rect(0, 0, GetSystemMetrics(SM_CXSMICON), GetSystemMetrics(SM_CYSMICON));
    RectVCenter(R, ButtonRect);

    if ButtonRect.Width > 0 then
      DrawIconEx(CaptionBmp.Canvas.Handle, R.Left, R.Top, GetIconFast.Handle, 0, 0, 0, 0, DI_NORMAL);
    Inc(TextRect.Left, ButtonRect.Width + 5);
    FSysMenuButtonRect := ButtonRect;
  end
  else
    Inc(TextRect.Left, 7);

  { Draw buttons }
  SysMenu := GetSystemMenu(Handle, False);
  nPos := GetMenuItemPos(SysMenu, SC_CLOSE);
  ItemDisabled := IsItemDisabled(SysMenu, nPos);
  if (biSystemMenu in LBorderIcons) and (not ItemDisabled) then
  begin
    if not UseSmallBorder then
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twCloseButtonHot
      else if FFrameActive then
        FButtonState := twCloseButtonNormal
      else
        FButtonState := twCloseButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTCLOSE) and (FHotButton = HTCLOSE) then
        FButtonState := twSmallCloseButtonPushed
      else if FHotButton = HTCLOSE then
        FButtonState := twSmallCloseButtonHot
      else if FFrameActive then
        FButtonState := twSmallCloseButtonNormal
      else
        FButtonState := twSmallCloseButtonDisabled;
    end;
    if FSysCloseButtonDisabled then
    begin
      if UseSmallBorder then
        LDetails := StyleServices.GetElementDetails(twSmallCloseButtonNormal)
      else
        LDetails := StyleServices.GetElementDetails(twCloseButtonNormal);
    end
    else
      LDetails := StyleServices.GetElementDetails(FButtonState);
    ButtonRect := CloseButtonRect;
    if (ButtonRect.Width > 0) then
      StyleServices.DrawElement(CaptionBmp.Canvas.Handle, LDetails, ButtonRect);

    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
  end;

  if (biMaximize in LBorderIcons) and (biSystemMenu in LBorderIcons) and (LBorderStyle <> bsDialog) and (LBorderStyle <> bsToolWindow) and (LBorderStyle <> bsSizeToolWin) then
  begin
    if WindowState = wsMaximized then
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twRestoreButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twRestoreButtonHot
      else if FFrameActive then
        FButtonState := twRestoreButtonNormal
      else
        FButtonState := twRestoreButtonDisabled;
    end
    else
    begin
      if (FPressedButton = HTMAXBUTTON) and (FHotButton = HTMAXBUTTON) then
        FButtonState := twMaxButtonPushed
      else if FHotButton = HTMAXBUTTON then
        FButtonState := twMaxButtonHot
      else if FFrameActive then
        FButtonState := twMaxButtonNormal
      else
        FButtonState := twMaxButtonDisabled;
    end;
    LDetails := StyleServices.GetElementDetails(FButtonState);
    ButtonRect := MaxButtonRect;

    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBmp.Canvas.Handle, LDetails, ButtonRect);
    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
  end;

  if (biMinimize in LBorderIcons) and (biSystemMenu in LBorderIcons) and (LBorderStyle <> bsDialog) and (LBorderStyle <> bsToolWindow) and (LBorderStyle <> bsSizeToolWin) then
  begin
    if (FPressedButton = HTMINBUTTON) and (FHotButton = HTMINBUTTON) then
      FButtonState := twMinButtonPushed
    else if FHotButton = HTMINBUTTON then
      FButtonState := twMinButtonHot
    else if FFrameActive then
      FButtonState := twMinButtonNormal
    else
      FButtonState := twMinButtonDisabled;

    LDetails := StyleServices.GetElementDetails(FButtonState);
    ButtonRect := MinButtonRect;
    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBmp.Canvas.Handle, LDetails, ButtonRect);
    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
  end;

  if (biHelp in LBorderIcons) and (biSystemMenu in LBorderIcons) and ((not(biMaximize in LBorderIcons) and not(biMinimize in LBorderIcons)) or (LBorderStyle = bsDialog)) then
  begin
    if (FPressedButton = HTHELP) and (FHotButton = HTHELP) then
      FButtonState := twHelpButtonPushed
    else if FHotButton = HTHELP then
      FButtonState := twHelpButtonHot
    else if FFrameActive then
      FButtonState := twHelpButtonNormal
    else
      FButtonState := twHelpButtonDisabled;
    LDetails := StyleServices.GetElementDetails(FButtonState);

    if not StyleServices.GetElementContentRect(0, LDetails, LCaptionRect, ButtonRect) then
      ButtonRect := Rect(0, 0, 0, 0);
    if ButtonRect.Width > 0 then
      StyleServices.DrawElement(CaptionBmp.Canvas.Handle, LDetails, ButtonRect);

    if ButtonRect.Left > 0 then
      TextRect.Right := ButtonRect.Left;
  end;

  { draw text }
  TextFormat := [tfLeft, tfSingleLine, tfVerticalCenter];
  if SysControl.BidiMode = sbmRightToLeft then
    Include(TextFormat, tfRtlReading);
  // Important: Must retrieve Text prior to calling DrawText as it causes
  // CaptionBuffer.Canvas to free its handle, making the outcome of the call
  // to DrawText dependent on parameter evaluation order.
  LText := SysControl.Text;

  if (WindowState = wsMaximized) // and (FormStyle <> fsMDIChild)
    and (TextTopOffset <> 0) and (biSystemMenu in LBorderIcons) then
  begin
    Inc(TextRect.Left, R.Left);
    MoveWindowOrg(CaptionBmp.Canvas.Handle, 0, TextTopOffset);
    StyleServices.DrawText(CaptionBmp.Canvas.Handle, CaptionDetails, LText, TextRect, TextFormat);
    MoveWindowOrg(CaptionBmp.Canvas.Handle, 0, -TextTopOffset);
  end
  else
    StyleServices.DrawText(CaptionBmp.Canvas.Handle, CaptionDetails, LText, TextRect, TextFormat);

  FCaptionRect := TextRect;

  Canvas.Draw(0, 0, CaptionBmp);
  CaptionBmp.Free;

  DC := Canvas.Handle;
  LBorderSize := BorderSize;

  { Left Border }
  if FFrameActive then
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameLeftActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameLeftActive);
  end
  else
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameLeftInActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameLeftInActive);
  end;

  R := Rect(0, LCaptionRect.Height, LBorderSize.Left, FHeight);
  if FWidth > LBorderSize.Left then
    StyleServices.DrawElement(DC, LDetails, R);

  { Right Border }
  if FFrameActive then
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameRightActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameRightActive);
  end
  else
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameRightInActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameRightInActive);
  end;
  R := Rect(FWidth - LBorderSize.Right, LCaptionRect.Height, FWidth, FHeight);
  if FWidth > LBorderSize.Right then
    StyleServices.DrawElement(DC, LDetails, R);

  { Bottom Border }
  if FFrameActive then
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameBottomActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameBottomActive);
  end
  else
  begin
    if not UseSmallBorder then
      LDetails := StyleServices.GetElementDetails(twFrameBottomInActive)
    else
      LDetails := StyleServices.GetElementDetails(twSmallFrameBottomInActive);
  end;
  R := Rect(0, FHeight - LBorderSize.Bottom, FWidth, FHeight);
  StyleServices.DrawElement(DC, LDetails, R);
end;

procedure TSysDialogStyleHook.Restore;
begin
  FPressedButton := 0;
  FHotButton := 0;
  if Handle <> 0 then
    SendMessage(Handle, WM_SYSCOMMAND, SC_RESTORE, 0);
end;

procedure TSysDialogStyleHook.MouseLeave;
begin
  FPressedButton := 0;
  if FHotButton <> 0 then
  begin
    FHotButton := 0;
    InvalidateNC;
  end;
end;

procedure TSysDialogStyleHook.WMNCACTIVATE(var Message: TWMNCActivate);
begin
  Handled := False;
  if not StyleServicesEnabled then
    Exit;

  if not OverridePaintNC then
    Exit;

  FFrameActive := Message.Active;
  InvalidateNC;
  Message.Result := 1;
  Handled := True;
end;

procedure TSysDialogStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  Handled := False;
  if (not StyleServicesEnabled) or (not OverridePaintNC) then
    Exit;
  if (BorderStyle = bsNone) or (not UpdateRegion) then
    Exit;
  inherited;
end;

function TSysDialogStyleHook.NormalizePoint(const P: TPoint): TPoint;
var
  WindowPos, ClientPos: TPoint;
begin
  { Convert the point from the screen to the client window . }
  WindowPos := Point(SysControl.Left, SysControl.Top);
  ClientPos := Point(0, 0);
  ClientToScreen(Handle, ClientPos);
  Result := P;
  ScreenToClient(Handle, Result);
  Inc(Result.X, ClientPos.X - WindowPos.X);
  Inc(Result.Y, ClientPos.Y - WindowPos.Y);
end;

procedure TSysDialogStyleHook.WMNCHitTest(var Message: TWMNCHitTest);
var
  P: TPoint;
begin
  Handled := False;
  if (not StyleServicesEnabled) or (not OverridePaintNC) then
    Exit;

  if OverridePaintNC then
  begin
    P := Point(Message.XPos, Message.YPos);
    P := NormalizePoint(P);
    Message.Result := GetHitTest(P);
    if ((Message.Result <> HTCLOSE) and (Message.Result <> HTMAXBUTTON) and (Message.Result <> HTMINBUTTON) and (Message.Result <> HTHELP)) then
    begin
      // Message.Result := CallDefaultProc(TMessage(Message));
      { Check if form can be scrolled . }
      inherited;
      { We need to correct the result after calling the default message . }
      if ((Message.Result = HTCLOSE) or (Message.Result = HTMAXBUTTON) or (Message.Result = HTMINBUTTON) or (Message.Result = HTHELP)) then
        Message.Result := HTCLIENT;
    end;
    Handled := True;
  end;
end;

procedure TSysDialogStyleHook.WMNCLButtonDown(var Message: TWMNCLButtonDown);
begin
  Handled := False;
  if (not StyleServicesEnabled) or (not OverridePaintNC) then
    Exit;

  if (Message.HitTest = HTCLOSE) or (Message.HitTest = HTMAXBUTTON) or
     (Message.HitTest = HTMINBUTTON) or (Message.HitTest = HTHELP) then
  begin
    FPressedButton := Message.HitTest;
    InvalidateNC;
    Message.Result := 0;
    Message.Msg := WM_NULL;
    Handled := True;
  end;
end;

procedure TSysDialogStyleHook.WMNCLButtonUp(var Message: TWMNCLButtonUp);
var
  FWasPressedButton: Integer;
begin
  FWasPressedButton := FPressedButton;

  if FPressedButton <> 0 then
  begin
    FPressedButton := 0;
    InvalidateNC;
  end;

  if (Message.HitTest = HTTOP) or (Message.HitTest = HTBOTTOM) or (Message.HitTest = HTLEFT) or
     (Message.HitTest = HTRIGHT) or (Message.HitTest = HTCAPTION) or (Message.HitTest = HTTOPLEFT) or
     (Message.HitTest = HTTOPRIGHT) or (Message.HitTest = HTBOTTOMRIGHT) or
     (Message.HitTest = HTBOTTOMLEFT) or (Message.HitTest = HTSYSMENU) then
  begin
    Exit;
  end;

  if FWasPressedButton = FHotButton then
    if Message.HitTest = HTCLOSE then
    begin
      Close
    end
    else if (Message.HitTest = HTMAXBUTTON) then
    begin
      if WindowState <> wsMaximized then
        Maximize
      else
        Restore;
    end
    else if (Message.HitTest = HTMINBUTTON)  then
    begin
      if WindowState <> wsMinimized then
        Minimize
      else
        Restore;
    end
    else if (Message.HitTest = HTHELP) then
      Help;

  Message.Result := 0;
  Message.Msg := WM_NULL;
  Handled := True;
end;

procedure TSysDialogStyleHook.WMNCMouseMove(var Message: TWMNCHitMessage);
begin
  { Reserved for potential updates . }
  if not MouseInControl then
  begin
    MouseInControl := True;
    StartHotTrackTimer;
    MouseEnter;
  end;
  Handled := False;
end;

procedure TSysDialogStyleHook.WMPaint(var Message: TMessage);
begin
  if IsWindowMsgBox(Handle) and OverridePaint then
  begin
    inherited;
    Exit;
  end;
  Message.Result := CallDefaultProc(Message);
  Handled := True;
end;

procedure TSysDialogStyleHook.WMSetText(var Message: TMessage);
var
  FRedraw: Boolean;
  LBorderStyle : TFormBorderStyle;
begin
  LBorderStyle := BorderStyle;
  if (LBorderStyle = bsNone) or (WindowState = wsMinimized) or (StyleServices.IsSystemStyle) then
  begin
    Handled := False;
    Exit;
  end;

  FRedraw := True;

  if  IsWindowVisible(Handle) then
  begin
    //Application.ProcessMessages;
    FRedraw := False;
    SetRedraw(False);
  end;

  CallDefaultProc(Message);

  if not FRedraw then
  begin
    SetRedraw(True);
    InvalidateNC;
  end;
  Handled := True;
end;


procedure TSysDialogStyleHook.WMSIZE(var Message: TWMSize);
begin
  Handled := False;
  if (not StyleServicesEnabled) or (not OverridePaintNC) then
    Exit;

  Message.Result := CallDefaultProc(TMessage(Message));

  FWidth := SysControl.Width;
  FHeight := SysControl.Height;

  Handled := True;
end;

procedure TSysDialogStyleHook.WndProc(var Message: TMessage);
var
  DFBW: Integer;
  Changed: Boolean;
  CXMin, CYMin: Integer;
begin
  case Message.msg of
    WM_WINDOWPOSCHANGED:
      begin
        FSysCloseButtonDisabled := IsSysCloseButtonDisabled;
        if TWMWindowPosChanged(Message).WindowPos^.flags and SWP_NOSIZE = 0 then
        begin
          FWidth :=  TWMWindowPosChanged(Message).WindowPos^.cx;
          FHeight := TWMWindowPosChanged(Message).WindowPos^.cy;
        end;
      end;

    WM_CREATE:
      begin
        Message.Result := CallDefaultProc(Message);
        { DFBW =Default Frame Border Width }
        DFBW := GetSystemMetrics(SM_CXBORDER);
        FWidth := SysControl.Width;
        FHeight := SysControl.Height;
        CXMin := GetSystemMetrics(SM_CXMIN);
        CYMin := GetSystemMetrics(SM_CYMIN);
        if (FWidth >= CXMin) and (FHeight >= CYMin) then
          SetWindowPos(Handle, 0, 0, 0, FWidth + DFBW + 5, FHeight + DFBW + 5, SWP_NOMOVE or SWP_NOZORDER or SWP_FRAMECHANGED);
        Exit;
      end;

    WM_SHOWWINDOW:
      if (Message.WParam > 0) and (FRegion = 0) and
         (SysControl.Width > 0) and (SysControl.Height > 0) then
      begin
        FWidth := SysControl.Width;
        FHeight := SysControl.Height;
        FRegion := GetRegion;
        if (FRegion <> 0) and (BorderStyle <> bsNone) and UpdateRegion then
          SetWindowRgn(Handle, FRegion, True);
      end;
  end;

  inherited;

  case Message.Msg of
    WM_WINDOWPOSCHANGING:
    begin
      Changed := False;
      if (TWMWindowPosChanging(Message).WindowPos^.flags and SWP_NOSIZE = 0) then
      begin
        Changed := ((TWMWindowPosChanging(Message).WindowPos^.cx <> FWidth) or
                    (TWMWindowPosChanging(Message).WindowPos^.cy <> FHeight)) and
                   (TWMWindowPosChanging(Message).WindowPos^.flags and SWP_NOSIZE = 0);

        FWidth :=  TWMWindowPosChanging(Message).WindowPos^.cx;
        FHeight := TWMWindowPosChanging(Message).WindowPos^.cy;
      end;

      if Changed then
      begin;
        FRegion := GetRegion;
        if (FRegion <> 0) and (BorderStyle <> bsNone) and UpdateRegion then
          SetWindowRgn(Handle, FRegion, True);
        if BorderStyle <> bsNone then
          InvalidateNC;
      end;
    end;
  end;
end;

constructor TSysScrollBarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seClient];
end;

procedure TSysScrollBarStyleHook.WndProc(var Message: TMessage);
var
  DC: HDC;
  PS: TPaintStruct;
  LDetails: TThemedElementDetails;
begin
  case Message.msg of
    WM_PAINT:
      begin
        if not OverridePaint then
        begin
          Message.Result := CallDefaultProc(Message);
          Exit;
        end;
        if ((SysControl.Style and SBS_SIZEGRIP = SBS_SIZEGRIP) or (SysControl.Style and SBS_SIZEBOX = SBS_SIZEBOX)) then
        begin
          BeginPaint(Handle, PS);
          try
            DC := GetDC(Handle);
            try
              LDetails := StyleServices.GetElementDetails(tsSizeBoxLeftAlign);
              StyleServices.DrawElement(DC, LDetails, SysControl.ClientRect);
            finally
              ReleaseDC(Handle, DC);
            end;
          finally
            EndPaint(Handle, PS);
          end;
          Exit;
        end

        else
        begin
          Message.Result := CallDefaultProc(Message);
          Exit;
        end;
        Exit;
      end;
    WM_ERASEBKGND:
      begin
        if OverridePaint then
        begin
          Message.Result := 1;
          Exit;
        end
        else
        begin
          Message.Result := CallDefaultProc(Message);
          Exit;
        end;
      end;
  end;
  inherited;
end;

{ TSysButtonStyleHook }

constructor TSysButtonStyleHook.Create(AHandle: THandle);
begin
  inherited;
  ParentColor := True;
  StyleElements := [seFont, seClient, seBorder];
  Color := StyleServices.GetStyleColor(scWindow);
end;

procedure TSysButtonStyleHook.DrawCheckBoxText(DC: HDC; Text: String;
  LDetails: TThemedElementDetails; R: TRect);
var
  TextFormat: TTextFormat;
begin
  if ShowText then
  begin
    TextFormat := [tfVerticalCenter, tfHidePrefix];
    if (SysControl.Style and BS_MULTILINE = BS_MULTILINE) then
      include(TextFormat, tfWordBreak)
    else
      include(TextFormat, tfSingleLine);
    if (SysControl.Style and BS_LEFT = BS_LEFT) then
      include(TextFormat, tfLeft)
    else if (SysControl.Style and BS_RIGHT = BS_RIGHT) then
      include(TextFormat, tfRight)
    else if (SysControl.Style and BS_CENTER = BS_CENTER) then
      include(TextFormat, tfCenter);
    DrawText(DC, LDetails, SysControl.Text, R, TextFormat);
  end;
end;

function TSysButtonStyleHook.GetCheckBoxState: TSysCheckBoxState;
var
  LState: DWORD;
begin
  LState := SendMessage(Handle, BM_GETCHECK, 0, 0);
  Result := TSysCheckBoxState(LState)
end;

function TSysButtonStyleHook.GetShowText: Boolean;
begin
  Result := (SysControl.Style and BS_TEXT = BS_TEXT);
end;

function TSysButtonStyleHook.IsCheckBox: Boolean;
begin
  with SysControl do
    Result := (Style and BS_CHECKBOX = BS_CHECKBOX) or
      (Style and BS_AUTOCHECKBOX = BS_AUTOCHECKBOX);
end;

function TSysButtonStyleHook.IsCommandButton: Boolean;
begin
  Result := (SysControl.Style and BS_COMMANDLINK = BS_COMMANDLINK) or
    (SysControl.Style and BS_DEFCOMMANDLINK = BS_DEFCOMMANDLINK);
end;

function TSysButtonStyleHook.IsGroupBox: Boolean;
begin
  Result := (SysControl.Style and BS_GROUPBOX = BS_GROUPBOX);
end;

function TSysButtonStyleHook.IsOwnerDraw: Boolean;
begin
  Result := (SysControl.Style and BS_OWNERDRAW = BS_OWNERDRAW);
end;

function TSysButtonStyleHook.IsPushButton: Boolean;
begin
  with SysControl do
    Result := (Style and BS_PUSHBUTTON = BS_PUSHBUTTON) or
      (not CheckBox and not RadioButton and not GroupBox and not CommandButton);
end;

function TSysButtonStyleHook.IsRadioButton: Boolean;
begin
  with SysControl do
    Result := (Style and BS_RADIOBUTTON = BS_RADIOBUTTON) or
      (Style and BS_AUTORADIOBUTTON = BS_AUTORADIOBUTTON);
end;

function TSysButtonStyleHook.IsSplitButton: Boolean;
begin
  Result := (SysControl.Style and BS_SPLITBUTTON = BS_SPLITBUTTON) or
    (SysControl.Style and BS_DEFSPLITBUTTON = BS_DEFSPLITBUTTON);

end;

procedure TSysButtonStyleHook.MouseEnter;
begin
  // Invalidate;
end;

procedure TSysButtonStyleHook.MouseLeave;
begin
  Invalidate;
end;

procedure TSysButtonStyleHook.Paint(Canvas: TCanvas);
begin
  //OutputDebugString(PChar('Paint '+IntToHex(SysControl.Handle, 8)));
  if not GroupBox or CommandButton then
    PaintBackground(Canvas)
  else
    Exit;

  if CommandButton then
    PaintButton(Canvas)
  else
  if CheckBox then
    PaintCheckBox(Canvas)
  else
  if RadioButton then
    PaintRadioButton(Canvas)
  else
  if PushButton then
    PaintButton(Canvas);

end;

procedure TSysButtonStyleHook.PaintBackground(Canvas: TCanvas);
begin
  if not GroupBox then
    inherited;
end;

procedure TSysButtonStyleHook.PaintButton(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
  LRect: TRect;
  Detail: TThemedButton;
  X, Y, i: Integer;
  IW, IH, IY: Integer;
  TextFormat: TTextFormat;
  IL: BUTTON_IMAGELIST;
  LText: string;
  DrawRect: TRect;
  ThemeTextColor: TColor;
  Buffer: string;
  BufferLength: Integer;
begin
  LText := SysControl.Text;
  LRect := SysControl.ClientRect;

  if SysControl.Enabled then
    Detail := tbPushButtonNormal
  else
    Detail := tbPushButtonDisabled;

  if MouseDown then
    Detail := tbPushButtonPressed
  else
  if MouseInControl then
    Detail := tbPushButtonHot
  else
  if Focused then
    Detail := tbPushButtonDefaulted;

  LDetails := StyleServices.GetElementDetails(Detail);
  DrawRect := SysControl.ClientRect;
  StyleServices.DrawElement(Canvas.Handle, LDetails, LRect);


  if Button_GetImageList(handle, IL) and (IL.himl <> 0) and
     ImageList_GetIconSize(IL.himl, IW, IH) then
  begin
    if (GetWindowLong(Handle, GWL_STYLE) and BS_COMMANDLINK) = BS_COMMANDLINK then
      IY := DrawRect.Top + 15
    else
      IY := DrawRect.Top + (DrawRect.Height - IH) div 2;
    ImageList_Draw(IL.himl, 0, Canvas.Handle, DrawRect.Left + 3, IY, ILD_NORMAL);
    Inc(DrawRect.Left, IW + 3);
  end;

  if CommandButton then
  begin
      if IL.himl = 0 then
        Inc(DrawRect.Left, 35);
      Inc(DrawRect.Top, 15);
      Inc(DrawRect.Left, 5);
      Canvas.Font := SysControl.Font;
      TextFormat := TTextFormatFlags(DT_LEFT);
      if StyleServices.GetElementColor(LDetails, ecTextColor, ThemeTextColor) then
         Canvas.Font.Color := ThemeTextColor;
      StyleServices.DrawText(Canvas.Handle, LDetails, LText, DrawRect, TextFormat, Canvas.Font.Color);
      SetLength(Buffer, Button_GetNoteLength(Handle) + 1);
      if Length(Buffer) <> 0 then
      begin
        BufferLength := Length(Buffer);
        if Button_GetNote(Handle, PChar(Buffer), BufferLength) then
        begin
          TextFormat := TTextFormatFlags(DT_LEFT or DT_WORDBREAK);
          Inc(DrawRect.Top, Canvas.TextHeight('Wq') + 2);
          Canvas.Font.Size := 8;
          StyleServices.DrawText(Canvas.Handle, LDetails, Buffer, DrawRect,
            TextFormat, Canvas.Font.Color);
        end;
      end;
      if IL.himl = 0 then
      begin
        if MouseDown then
          LDetails := StyleServices.GetElementDetails(tbCommandLinkGlyphPressed)
        else if MouseInControl then
          LDetails := StyleServices.GetElementDetails(tbCommandLinkGlyphHot)
        else if SysControl.Enabled then
          LDetails := StyleServices.GetElementDetails(tbCommandLinkGlyphNormal)
        else
          LDetails := StyleServices.GetElementDetails(tbCommandLinkGlyphDisabled);
        DrawRect.Right := 35;
        DrawRect.Left := 3;
        DrawRect.Top := 10;
        DrawRect.Bottom := DrawRect.Top + 32;
        StyleServices.DrawElement(Canvas.Handle, LDetails, DrawRect);
      end;

  end
  else
  if SplitButton then
    with Canvas, SysControl do
    begin
      { draw vertical line }
      Pen.Color := StyleServices.GetSystemColor(clBtnShadow);
      MoveTo(Width - 15, 3);
      LineTo(Width - 15, Height - 3);
      if Enabled then
        Pen.Color := StyleServices.GetSystemColor(clBtnHighLight)
      else
        Pen.Color := Font.Color;
      MoveTo(Width - 14, 3);
      LineTo(Width - 14, Height - 3);
      { Draw arrow }
      Pen.Color := Font.Color;
      X := Width - 8;
      Y := Height div 2 + 1;
      for i := 3 downto 0 do
      begin
        MoveTo(X - i, Y - i);
        LineTo(X + i + 1, Y - i);
      end;
    end;

  if ShowText and not IsCommandButton then
  begin
    TextFormat := [tfCenter, tfVerticalCenter, tfSingleLine, tfHidePrefix];
    if (SysControl.Style and BS_MULTILINE = BS_MULTILINE) then
    begin
      Exclude(TextFormat, tfSingleLine);
      include(TextFormat, tfWordBreak)
    end;


    DrawText(Canvas.Handle, LDetails, SysControl.Text, LRect, TextFormat);
  end;
end;

function TSysButtonStyleHook.GetBoxRect: TRect;
var
  DC: HDC;
  sSize: TSize;
begin
  DC := GetDC(Handle);
  with SysControl do
  begin
    GetTextExtentPoint32(DC, Text, Length(Text) - 1, sSize);
    Result := Rect(0, sSize.Height div 2 + 1, Width - 0, Height - 0);
  end;
  ReleaseDC(Handle, DC);
  DeleteDC(DC);
end;

function TSysButtonStyleHook.GetCaptionRect(Canvas: TCanvas): TRect;
const
  FCaptionMargin = 12;
begin
  with SysControl do
    if BiDiMode <> sbmRightToLeft then
      Result := Rect(FCaptionMargin, 0, FCaptionMargin + Canvas.TextWidth(Text),
        Canvas.TextHeight(Text))
    else
      Result := Rect(Width - Canvas.TextWidth(Text) - FCaptionMargin, 0,
        Width - FCaptionMargin, Canvas.TextHeight(Text));
end;

procedure TSysButtonStyleHook.PaintRadioButton(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
  DC: HDC;
  LRect: TRect;
  Detail: TThemedButton;
  TxtRect, BoxRect, FRect, R: TRect;
  LState: TSysCheckBoxState;
  Size: TSize;
begin
  DC := Canvas.Handle;
  LRect := SysControl.ClientRect;
  LState := CheckBoxState;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(LRect);
  if SysControl.Enabled then
    Detail := tbRadioButtonUncheckedNormal
  else
    Detail := tbRadioButtonUncheckedDisabled;
  if MouseDown then
    Detail := tbRadioButtonUncheckedPressed
  else if MouseInControl then
    Detail := tbRadioButtonUncheckedHot;

  if LState = cbChecked then
    Detail := TThemedButton(Integer(Detail) + 4);

  Size.cx := GetSystemMetrics(SM_CXMENUCHECK);
  Size.cy := GetSystemMetrics(SM_CYMENUCHECK);

  LDetails := StyleServices.GetElementDetails(Detail);
  BoxRect := Rect(0, 0, Size.cx, Size.cy);
  RectVCenter(BoxRect, LRect);

  if (SysControl.Style and BS_LEFTTEXT = BS_LEFTTEXT) then
  begin
    BoxRect.Left := LRect.Right - BoxRect.Width - 2;
    BoxRect.Right := LRect.Right;
    TxtRect := Rect(LRect.Left + 1, LRect.Top, BoxRect.Left, LRect.Bottom);
  end
  else
  begin
    OffsetRect(BoxRect, 1, 0);
    TxtRect := Rect(BoxRect.Right + 2, LRect.Top, LRect.Right, LRect.Bottom);
  end;

  StyleServices.DrawElement(DC, LDetails, BoxRect);

  Inc(TxtRect.Left);
  Dec(TxtRect.Right);

  if Focused then
  begin
    R := Rect(0, 0, 0, 0);
    Winapi.Windows.DrawText(DC, SysControl.Text, -1, R, DT_LEFT or DT_CALCRECT);
    FRect := TxtRect;
    FRect.Right := FRect.Left + R.Width + 2;
    Dec(FRect.Left, 2);
    FRect.Top := FRect.Top + FRect.Height div 2 - R.Height div 2 - 2;
    if FRect.Top < TxtRect.Top then
      FRect.Top := TxtRect.Top;
    FRect.Bottom := FRect.Top + R.Height + 4;
    if FRect.Bottom > TxtRect.Bottom then
      FRect.Bottom := TxtRect.Bottom;
    Canvas.DrawFocusRect(FRect);
  end;

  DrawCheckBoxText(DC, SysControl.Text, LDetails, TxtRect);

end;

procedure TSysButtonStyleHook.PaintCheckBox(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
  DC: HDC;
  LRect: TRect;
  Detail: TThemedButton;
  TxtRect, BoxRect, FRect, R: TRect;
  LState: TSysCheckBoxState;
  Size: TSize;
begin
  DC := Canvas.Handle;
  LRect := SysControl.ClientRect;
  LState := CheckBoxState;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(LRect);
  if SysControl.Enabled then
    Detail := tbCheckBoxUncheckedNormal
  else
    Detail := tbCheckBoxUncheckedDisabled;
  if MouseDown then
    Detail := tbCheckBoxUncheckedPressed
  else if MouseInControl then
    Detail := tbCheckBoxUncheckedHot;

  if LState = cbChecked then
    Detail := TThemedButton(Integer(Detail) + 4);
  if LState = cbGrayed then
    Detail := TThemedButton(Integer(Detail) + 8);

  // LDetails := StyleServices.GetElementDetails(tbCheckBoxUncheckedNormal);
  // StyleServices.GetElementSize(DC, LDetails, esActual, Size);
  Size.cx := GetSystemMetrics(SM_CXMENUCHECK);
  Size.cy := GetSystemMetrics(SM_CYMENUCHECK);

  LDetails := StyleServices.GetElementDetails(Detail);
  BoxRect := Rect(0, 0, Size.cx, Size.cy);
  BoxRect := RectVCenter(BoxRect, LRect);

  if (SysControl.Style and BS_LEFTTEXT = BS_LEFTTEXT) then
  begin
    BoxRect.Left := LRect.Right - BoxRect.Width - 2;
    BoxRect.Right := LRect.Right;
    TxtRect := Rect(LRect.Left + 1, LRect.Top, BoxRect.Left, LRect.Bottom);
  end
  else
  begin
    OffsetRect(BoxRect, 1, 0);
    TxtRect := Rect(BoxRect.Right + 2, LRect.Top, LRect.Right, LRect.Bottom);
  end;

  StyleServices.DrawElement(DC, LDetails, BoxRect);

  Inc(TxtRect.Left);
  Dec(TxtRect.Right);

  if Focused then
  begin
    R := Rect(0, 0, 0, 0);
    Winapi.Windows.DrawText(DC, SysControl.Text, -1, R, DT_LEFT or DT_CALCRECT);
    FRect := TxtRect;
    FRect.Right := FRect.Left + R.Width + 2;
    Dec(FRect.Left, 2);
    FRect.Top := FRect.Top + FRect.Height div 2 - R.Height div 2 - 2;
    if FRect.Top < TxtRect.Top then
      FRect.Top := TxtRect.Top;
    FRect.Bottom := FRect.Top + R.Height + 4;
    if FRect.Bottom > TxtRect.Bottom then
      FRect.Bottom := TxtRect.Bottom;
    Canvas.DrawFocusRect(FRect);
  end;
  DrawCheckBoxText(DC, SysControl.Text, LDetails, TxtRect);
end;

procedure TSysButtonStyleHook.PaintGroupBox(Canvas: TCanvas);
var
  R, CaptionRect: TRect;
  LDetails: TThemedElementDetails;
  SaveIndex: Integer;
  procedure DoDrawParentBackground(DC: HDC; ARect: TRect);
  begin
    if SysControl.ParentHandle > 0 then
      DrawParentBackground(DC, @ARect)
    else
    begin
      Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
      Canvas.FillRect(ARect);
    end;
  end;

begin
  CaptionRect := GetCaptionRect(Canvas);
  R := GetBoxRect;

  if SysControl.Enabled then
    LDetails := StyleServices.GetElementDetails(tbGroupBoxNormal)
  else
    LDetails := StyleServices.GetElementDetails(tbGroupBoxDisabled);

  { Clean caption area }
  DoDrawParentBackground(Canvas.Handle, CaptionRect);
  ExcludeClipRect(Canvas.Handle, R.Left + 4, CaptionRect.Height + 2,
    R.Right - 4, R.Height - 2);
  { Clean GroupBox corners area }
  DoDrawParentBackground(Canvas.Handle, R);

  SaveIndex := SaveDC(Canvas.Handle);

  try
    ExcludeClipRect(Canvas.Handle, CaptionRect.Left, CaptionRect.Top,
      CaptionRect.Right, CaptionRect.Bottom);
    StyleServices.DrawElement(Canvas.Handle, LDetails, R);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;

  Inc(CaptionRect.Top, 3);
  { Paint Text }
  StyleServices.DrawText(Canvas.Handle, LDetails, SysControl.Text, CaptionRect,
    [tfSingleLine, tfVerticalCenter, tfLeft, tfHidePrefix]);

end;

procedure TSysButtonStyleHook.PaintNC(Canvas: TCanvas);
begin
  if GroupBox then
    PaintGroupBox(Canvas);
end;

procedure TSysButtonStyleHook.UpdateColors;
begin
  inherited;
end;

procedure TSysButtonStyleHook.WMEraseBkgnd(var Message: TMessage);
begin
  if not OwnerDraw and not GroupBox and ParentBkGndPainted then
  begin
    Message.Result := 1;
    Handled := True;
  end
  else
    Handled := False;
end;

procedure TSysButtonStyleHook.WMNCPaint(var Message: TMessage);
begin
  if not OwnerDraw and ParentBkGndPainted then
  begin
    inherited;
    Handled := True;
  end
  else
    Handled := False;
end;

procedure TSysButtonStyleHook.WMPaint(var Message: TMessage);
begin
  if not OwnerDraw and ParentBkGndPainted then
  begin
    inherited;
    Handled := True;
  end
  else
    Handled := False;
end;

procedure TSysButtonStyleHook.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_ENABLE:
      begin
        { Check first if Window is visible
          if you dont check ..the InVisible window will be visible .
        }
        if SysControl.Visible then
          Invalidate;
      end;

    WM_STYLECHANGING, WM_STYLECHANGED:
      begin
        Invalidate;
      end;

    WM_SETTEXT:
      begin
        SetRedraw(False);
        CallDefaultProc(Message);
        SetRedraw(True);
        Invalidate;
      end;

    WM_SETFOCUS, WM_KILLFOCUS:
      begin
        inherited;
        Invalidate;
      end;

  else
    inherited;
  end;

end;

{ TSysEditStyleHook }

constructor TSysEditStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seBorder];
end;

function TSysEditStyleHook.GetBorderSize: TRect;
begin
  if SysControl.HasBorder then
    Result := Rect(2, 2, 2, 2);
end;

procedure TSysEditStyleHook.MouseEnter;
begin
  InvalidateNC;
end;

procedure TSysEditStyleHook.MouseLeave;
begin
  InvalidateNC;
end;

procedure TSysEditStyleHook.PaintNC(Canvas: TCanvas);
var
  Details: TThemedElementDetails;
  R: TRect;
begin
  if StyleServicesEnabled and SysControl.HasBorder then
  begin
    if Focused then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollFocused)
    else if MouseInControl then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollHot)
    else if SysControl.Enabled then
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollNormal)
    else
      Details := StyleServices.GetElementDetails(teEditBorderNoScrollDisabled);
    R := Rect(0, 0, SysControl.Width, SysControl.Height);
    InflateRect(R, -2, -2);
    ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
    StyleServices.DrawElement(Canvas.Handle, Details,
      Rect(0, 0, SysControl.Width, SysControl.Height));
  end;
end;

procedure TSysEditStyleHook.UpdateColors;
const
  ColorStates: array [Boolean] of TStyleColor = (scEditDisabled, scEdit);
  FontColorStates: array [Boolean] of TStyleFont = (sfEditBoxTextDisabled,
    sfEditBoxTextNormal);
begin
  if seFont in StyleElements then
  begin
    Color := StyleServices.GetStyleColor(ColorStates[SysControl.Enabled]);
    FontColor := StyleServices.GetStyleFontColor(FontColorStates[SysControl.Enabled]);
  end;
end;

procedure TSysEditStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  Params: PNCCalcSizeParams;
begin
  Handled := False;
  if (not StyleServicesEnabled) or (not OverridePaintNC) then
    Exit;

  Params := Message.CalcSize_Params;
  if SysControl.HasBorder then
    with Params^.rgrc[0] do
    begin
      Inc(Left, 2);
      Inc(Top, 2);
      Dec(Right, 2);
      Dec(Bottom, 2);
    end;
  Handled := True;
end;

procedure TSysEditStyleHook.WndProc(var Message: TMessage);
begin
  if (seFont in StyleElements) then
  begin
    case Message.Msg of
      CM_CTLCOLORMSGBOX .. CM_CTLCOLORSTATIC:
        begin
          { Change edit control color . }
          SetTextColor(Message.wParam, ColorToRGB(FontColor));
          SetBkColor(Message.wParam, ColorToRGB(Color));
          Message.Result := LRESULT(Brush.Handle);
        end;
    else
      inherited WndProc(Message);
    end;
  end
  else
    inherited WndProc(Message);
end;

constructor TSysComboBoxStyleHook.Create(AHandle: THandle);
begin
  inherited;
  if Style = csSysSimple then
    OverrideEraseBkgnd := True;
  FMouseOnButton := False;
  FEditHandle := 0;
  FListHandle := 0;
  FIgnoreStyleChanged := False;
  OverrideFont := False;
  NeedsDefaultPaint := False;
  UpdateColors;
end;

procedure TSysComboBoxStyleHook.CNCommand(var Message: TWMCommand);
begin
  if (Message.NotifyCode = CBN_SELENDCANCEL) or
    (Message.NotifyCode = CBN_SELENDOK) or (Message.NotifyCode = CBN_CLOSEUP) or
    (Message.NotifyCode = CBN_DROPDOWN) or (Message.NotifyCode = CBN_SELCHANGE)
  then
  begin
    FMouseOnButton := False;
    Invalidate;
  end;
end;

procedure TSysComboBoxStyleHook.CNDrawItem(var Message: TWMDrawItem);
begin
  WMDrawItem(Message);
  Handled := True;
end;

procedure TSysComboBoxStyleHook.DrawItem(Canvas: TCanvas;const Index: UINT;
  const R: TRect;const Selected: Boolean);
var
  DIS: TDrawItemStruct;
begin
  FillChar(DIS, SizeOf(DIS), 0);
  DIS.CtlType := ODT_COMBOBOX;
  DIS.CtlID := GetDlgCtrlID(Handle);
  DIS.itemAction := ODA_DRAWENTIRE;
  DIS.HDC := Canvas.Handle;
  DIS.hwndItem := Handle;
  DIS.rcItem := R;
  DIS.itemID := Index;
  DIS.itemData := SendMessage(FListHandle, LB_GETITEMDATA, 0, 0);
  if Selected then
    DIS.itemState := DIS.itemState or ODS_FOCUS or ODS_SELECTED;

  SendMessage(Handle, WM_DRAWITEM, Handle, LPARAM(@DIS));
end;

function TSysComboBoxStyleHook.IsDroppedDown: Boolean;
begin
  if Handle <> 0 then
    Result := LongBool(SendMessage(Handle, CB_GETDROPPEDSTATE, 0, 0))
  else
    Result := False;
end;

function TSysComboBoxStyleHook.GetButtonRect: TRect;
begin
  Result := SysControl.ClientRect;
  InflateRect(Result, -2, -2);
  if SysControl.BiDiMode <> sbmRightToLeft then
    Result.Left := Result.Right - GetSystemMetrics(SM_CXVSCROLL) + 1
  else
    Result.Right := Result.Left + GetSystemMetrics(SM_CXVSCROLL) - 1;
end;

function TSysComboBoxStyleHook.IsChildHandle(AHandle: HWnd): Boolean;
begin
  Result := (FEditHandle <> 0) and (FEditHandle = AHandle);

end;

procedure TSysComboBoxStyleHook.MouseEnter;
begin
  inherited;
  Invalidate;
end;

procedure TSysComboBoxStyleHook.MouseLeave;
begin
  inherited;
  if not DroppedDown and FMouseOnButton then
    FMouseOnButton := False;
  Invalidate;
end;

procedure TSysComboBoxStyleHook.PaintBorder(Canvas: TCanvas);
var
  R, ControlRect, EditRect, ListRect: TRect;
  DrawState: TThemedComboBox;
  BtnDrawState: TThemedComboBox;
  Details: TThemedElementDetails;
  Buffer: TBitmap;
  ComboInfo: TComboBoxInfo;
begin
  if not StyleServices.Available then
    Exit;

  if FListHandle = 0 then
  begin
    ComboInfo.cbSize := SizeOf(TComboBoxInfo);
    GetComboBoxInfo(Handle, ComboInfo);
    FListHandle := ComboInfo.hwndList;
  end;

  if not SysControl.Enabled then
    BtnDrawState := tcDropDownButtonDisabled
  else if DroppedDown then
    BtnDrawState := tcDropDownButtonPressed
  else if (FMouseOnButton and MouseInControl) then
    BtnDrawState := tcDropDownButtonHot
  else
    BtnDrawState := tcDropDownButtonNormal;

  if not SysControl.Enabled then
    DrawState := tcBorderDisabled
  else if Focused or ((FEditHandle <> 0) and (GetFocus = FEditHandle)) then
    DrawState := tcBorderFocused
  else if MouseInControl then
    DrawState := tcBorderHot
  else
    DrawState := tcBorderNormal;
  ListRect := Rect(0, 0, 0, 0);
  Buffer := TBitmap.Create;
  Buffer.SetSize(SysControl.Width, SysControl.Height);
  try
    R := Rect(0, 0, Buffer.Width, Buffer.Height);
    // draw border + client in buffer
    Details := StyleServices.GetElementDetails(DrawState);
    if (Style = csSysSimple) and (FListHandle <> 0) then
    begin
      GetWindowRect(FListHandle, ListRect);
      GetWindowRect(Handle, ControlRect);
      R.Bottom := ListRect.Top - ControlRect.Top;
      StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
      EditRect := R;
      InflateRect(EditRect, -2, -2);
      with Buffer.Canvas do
      begin
        Brush.Style := bsSolid;
        Brush.Color := ColorToRGB(clWindow);
        FillRect(EditRect);
      end;
      R := Rect(0, SysControl.Height - (ControlRect.Bottom - ListRect.Bottom),
        SysControl.Width, SysControl.Height);
      with Buffer.Canvas do
      begin
        Brush.Style := bsSolid;
        Brush.Color := StyleServices.GetSystemColor(clBtnFace);
        FillRect(R);
      end;
      R := Rect(0, 0, Buffer.Width, Buffer.Height);
      R.Bottom := ListRect.Top - ControlRect.Top;
    end
    else
    begin
      StyleServices.DrawElement(Buffer.Canvas.Handle, Details, R);
    end;
    if not ((OverrideFont) and (FEditHandle = 0)) and not (Style = csSysSimple)
    then
    begin
      R := SysControl.ClientRect;
      InflateRect(R, -2, -2);
      R.Right := ButtonRect.Left;
      with Buffer.Canvas do
      begin
        Brush.Color := ColorToRGB(clWindow);
        FillRect(R);
      end;
    end;
    // draw button in buffer
    if Style <> csSysSimple then
    begin
      Details := StyleServices.GetElementDetails(BtnDrawState);
      StyleServices.DrawElement(Buffer.Canvas.Handle, Details, ButtonRect);
    end;
    // calculation of exclude area for drawing buffer
    if not ((Style = csSysSimple) and (ListRect.Height > 0)) then
      if (SendMessage(Handle, CB_GETCURSEL, 0, 0) >= 0) and (FEditHandle = 0) then
      begin
        R := SysControl.ClientRect;
        InflateRect(R, -2, -2);
        if not (GetWindowLong(Handle, GWL_STYLE) and CBS_DROPDOWNLIST = CBS_SIMPLE) then
        begin
          if SysControl.BidiMode <> sbmRightToLeft then
            R.Right := ButtonRect.Left - 1
          else
            R.Left := ButtonRect.Right + 1;
        end;
        ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
      end
      else if FEditHandle <> 0 then
      begin
        GetWindowRect(Handle, R);
        GetWindowRect(FEditHandle, EditRect);
        OffsetRect(EditRect, -R.Left, -R.Top);
        with EditRect do
          ExcludeClipRect(Canvas.Handle, Left, Top, Right, Bottom);
      end;
    // draw buffer
    Canvas.Draw(0, 0, Buffer);
  finally
    Buffer.Free;
  end;
end;

function TSysComboBoxStyleHook.Style: TSysComboBoxStyle;
const
  ComboBoxStyles: array [TSysComboBoxStyle] of DWORD = (CBS_DROPDOWN, CBS_SIMPLE,
    CBS_DROPDOWNLIST, CBS_DROPDOWNLIST or CBS_OWNERDRAWFIXED,
    CBS_DROPDOWNLIST or CBS_OWNERDRAWVARIABLE);
var
  LStyle: Cardinal;
begin
  if Handle <> 0 then
  begin
    LStyle := GetWindowLong(Handle, GWL_STYLE);
    Result := csSysDropDown;
    if LStyle and ComboBoxStyles[csSysDropDown] = ComboBoxStyles[csSysDropDown] then
      Result := csSysDropDown;
    if LStyle and ComboBoxStyles[csSysSimple] = ComboBoxStyles[csSysSimple] then
      Result := csSysSimple;
    if LStyle and ComboBoxStyles[csSysDropDownList] = ComboBoxStyles[csSysDropDownList]
    then
      Result := csSysDropDownList;
    if LStyle and ComboBoxStyles[csSysOwnerDrawFixed] = ComboBoxStyles
      [csSysOwnerDrawFixed] then
      Result := csSysOwnerDrawFixed;
    if LStyle and ComboBoxStyles[csSysOwnerDrawVariable] = ComboBoxStyles
      [csSysOwnerDrawVariable] then
      Result := csSysOwnerDrawVariable;
  end
  else
    Result := csSysDropDown;
end;
{$HINTS OFF}

procedure TSysComboBoxStyleHook.UpdateColors;
const
  ColorStates: array [Boolean] of TStyleColor = (scComboBoxDisabled,
    scComboBox);
  FontColorStates: array [Boolean] of TStyleFont = (sfComboBoxItemDisabled,
    sfComboBoxItemNormal);
var
  LStyle: TCustomStyleServices;
begin
  if OverrideFont then
  begin
    LStyle := StyleServices;
    Color := StyleServices.GetStyleColor(ColorStates[SysControl.Enabled]);
    FontColor := StyleServices.GetStyleFontColor(FontColorStates[True]);
  end;
end;
{$HINTS ON}

procedure TSysComboBoxStyleHook.WMCommand(var Message: TWMCommand);
begin
  if (Message.NotifyCode = CBN_SELENDCANCEL) or
    (Message.NotifyCode = CBN_SELENDOK) or (Message.NotifyCode = CBN_CLOSEUP) or
    (Message.NotifyCode = CBN_DROPDOWN) or (Message.NotifyCode = CBN_SELCHANGE)
  then
  begin
    FMouseOnButton := False;
    Invalidate;
  end;
end;

procedure TSysComboBoxStyleHook.WMDrawItem(var Message: TWMDrawItem);
begin
  CallDefaultProc(TMessage(Message));
  Handled := True;
end;

procedure TSysComboBoxStyleHook.WMMouseMove(var Message: TWMMouse);
var
  P: TPoint;
  R: TRect;
  FOldMouseOnButton: Boolean;
begin
  CallDefaultProc(TMessage(Message));
  inherited;

  P := Point(Message.XPos, Message.YPos);
  FOldMouseOnButton := FMouseOnButton;
  R := ButtonRect;
  if R.Contains(P) then
    FMouseOnButton := True
  else
    FMouseOnButton := False;

  if FOldMouseOnButton <> FMouseOnButton then
    InvalidateRect(Handle, @R, False);

  Handled := True;
end;

procedure TSysComboBoxStyleHook.WMPaint(var Message: TMessage);
var
  R: TRect;
  Canvas: TCanvas;
  PS: TPaintStruct;
  SaveIndex: Integer;
  DC: HDC;
begin
  if NeedsDefaultPaint then
  begin
    inherited;
    Exit;
  end;
  DC := Message.wParam;
  Canvas := TCanvas.Create;
  try
    if DC = 0 then
      Canvas.Handle := BeginPaint(Handle, PS)
    else
      Canvas.Handle := DC;

    SaveIndex := SaveDC(Canvas.Handle);
    try
      PaintBorder(Canvas);
    finally
      RestoreDC(Canvas.Handle, SaveIndex);
    end;

    if (Style <> csSysSimple) and (FEditHandle = 0) then
    begin
      R := SysControl.ClientRect;
      InflateRect(R, -2, -2);
      if SysControl.BiDiMode <> sbmRightToLeft then
        R.Right := ButtonRect.Left - 1
      else
        R.Left := ButtonRect.Right + 1;
      SaveIndex := SaveDC(Canvas.Handle);
      try
        IntersectClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
        Canvas.Brush.Color := ColorToRGB(clWindow);
        Canvas.FillRect(R);
        Message.WParam := Canvas.Handle;
        NeedsDefaultPaint := True;
        try
          CallDefaultProc(Message);
        finally
          NeedsDefaultPaint := False;
        end;
      finally
        RestoreDC(Canvas.Handle, SaveIndex);
      end;
    end;
  finally
    Canvas.Handle := 0;
    Canvas.Free;
    if DC = 0 then
      EndPaint(Handle, PS);
  end;
  Handled := True;
end;

procedure TSysComboBoxStyleHook.WMParentNotify(var Message: TMessage);
begin
  if (FListHandle = 0) and (LoWord(Message.wParam) = WM_CREATE) then
    FListHandle := Message.LPARAM
  else
  if (FEditHandle = 0) and (LoWord(Message.wParam) = WM_CREATE) then
    FEditHandle := Message.LPARAM;
end;

procedure TSysComboBoxStyleHook.WndProc(var Message: TMessage);
const
  States: array [Boolean] of TStyleColor = (scEditDisabled, scComboBox);
begin
  if (Message.Msg = WM_CTLCOLORLISTBOX) and (FListHandle = 0) then
    FListHandle :=  Message.LParam;
  if (Message.Msg = WM_CTLCOLOREDIT) and (FEditHandle = 0) then
    FEditHandle := Message.LParam;

  case Message.Msg of

    CB_SETCURSEL, WM_KILLFOCUS:
      begin
        SetRedraw(False); // do not allow default drawing .
        CallDefaultProc(Message);
        SetRedraw(True); // allow vcl style drawing .
        Invalidate;
        Exit;
      end;

    WM_CTLCOLORMSGBOX .. WM_CTLCOLORSTATIC,
      CN_CTLCOLORMSGBOX .. CN_CTLCOLORSTATIC:
      begin
        if OverrideFont then
        begin
          SetTextColor(Message.wParam, ColorToRGB(FontColor));
          Brush.Color := StyleServices.GetStyleColor(States[SysControl.Enabled]);
          WinApi.Windows.SetBkColor(Message.wParam, ColorToRGB(Brush.Color));
        end;
        Message.Result := LRESULT(Brush.Handle);
      end;

    CM_ENABLEDCHANGED:
      begin
        UpdateColors;
        CallDefaultProc(Message); // Allow control to handle message
      end;
    CM_FOCUSCHANGED:
      begin
        Invalidate;
        // Handled := False; // Allow control to handle message
        CallDefaultProc(Message);
      end;
  else
    inherited WndProc(Message);
  end;
end;

{ TSysListBoxStyleHook }

constructor TSysListBoxStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seBorder];
end;

function TSysListBoxStyleHook.GetBorderSize: TRect;
begin
  Result := inherited GetBorderSize;
  if (SysControl.HasBorder) then
  begin
    Result := Rect(2, 2, 2, 2);
  end;
  if SameText(SysControl.ControlClassName, 'ComboLBox') then
  begin
    if SysControl.Parent.Style and CBS_SIMPLE = CBS_SIMPLE then
      Exit;
    Result := Rect(1, 1, 1, 1);
  end;
end;

procedure TSysListBoxStyleHook.PaintNC(Canvas: TCanvas);
var
  R: TRect;
  C: TColor;
begin
  inherited;
  if SameText(SysControl.ControlClassName, 'ComboLBox') and
     not (SysControl.Parent.Style and CBS_SIMPLE = CBS_SIMPLE)
  then
  begin
    R := Rect(0, 0, SysControl.Width, SysControl.Height);
    C :=  StyleServices.GetSystemColor(clBtnShadow);
    Frame3D(Canvas, R, C, C, 1);
  end;
end;

procedure TSysListBoxStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited;
end;

procedure TSysListBoxStyleHook.UpdateColors;
const
  ColorStates: array[Boolean] of TStyleColor = (scListBoxDisabled, scListBox);
  FontColorStates: array[Boolean] of TStyleFont = (sfListItemTextDisabled, sfListItemTextNormal);
var
  LStyle: TCustomStyleServices;
begin
  LStyle := StyleServices;
  if seFont in StyleElements then
  begin
    Brush.Color := LStyle.GetStyleColor(ColorStates[SysControl.Enabled]);
    FontColor := LStyle.GetStyleFontColor(FontColorStates[SysControl.Enabled]);
  end;
end;

procedure TSysListBoxStyleHook.WMPrint(var Message: TMessage);
var
  SaveIndex: Integer;
  Canvas: TCanvas;
begin
  Message.Result := CallDefaultProc(TMessage(Message));
  if (Message.LParam and PRF_NONCLIENT = PRF_NONCLIENT) and
     (Message.wParam > 0) and SameText(SysControl.ControlClassName, 'ComboLBox') and
     not (SysControl.Parent.Style and CBS_SIMPLE = CBS_SIMPLE)
  then
  begin
    SaveIndex := 0;
    Canvas := TCanvas.Create;
    try
      SaveIndex := SaveDC(Message.WParam);
      Canvas.Handle := Message.WParam;
      DrawVertScroll(Canvas.Handle);
      PaintNC(Canvas);
    finally
      if SaveIndex <> 0 then
        RestoreDC(Canvas.Handle, SaveIndex);
      Canvas.Handle := 0;
      Canvas.Free;
    end;
  end;
  Handled := True;
end;

procedure TSysListBoxStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
var
  OrgStyle, NewStyle: NativeInt;
  BorderSize: TRect;
  LWindowPos: PWindowPos;
  LCalcSizeParams: PNCCalcSizeParams;
begin
  if (not OverridePaintNC) or (not StyleServicesEnabled) then
  begin
    Handled := False;
    Exit;
  end;
  BorderSize := GetBorderSize;
  OrgStyle := SysControl.Style;
  NewStyle := SysControl.Style;
  FVertScrollBar := False;
  FHorzScrollBar := False;
  if OrgStyle and WS_VSCROLL = WS_VSCROLL then
  begin
    NewStyle := NewStyle and not WS_VSCROLL;
    FVertScrollBar := True;
  end;
  if OrgStyle and WS_HSCROLL = WS_HSCROLL then
  begin
    NewStyle := NewStyle and not WS_HSCROLL;
    FHorzScrollBar := True;
  end;
  if OrgStyle <> NewStyle then
  begin
    SysControl.Style := NewStyle;
    if not HookedDirectly then
      Message.Result := CallDefaultProc(TMessage(Message));
    SysControl.Style := OrgStyle;
  end;
  if SameText(SysControl.ControlClassName, 'ComboLBox') and
     not (SysControl.Parent.Style and CBS_SIMPLE = CBS_SIMPLE)
  then
  begin
    if FVertScrollBar then
    begin
     if not LeftScrollBar then
       Inc(BorderSize.Right, BtnSize.cx)
     else
       Inc(BorderSize.Left, BtnSize.cx);
    end;
    if FHorzScrollBar then
      Inc(BorderSize.Bottom, BtnSize.cx);
    if Message.CalcValidRects then
    begin
      LCalcSizeParams := Message.CalcSize_Params;
      LWindowPos := LCalcSizeParams.lppos;
      with LCalcSizeParams^.rgrc[0] do
      begin
        left := LWindowPos^.x;
        top := LWindowPos^.y;
        right := LWindowPos^.x + LWindowPos^.cx;
        bottom := LWindowPos^.y + LWindowPos^.cy;
        left := left + BorderSize.Left;
        top := top + BorderSize.Top;
        right := right - BorderSize.Right;
        bottom := bottom - BorderSize.Bottom;
      end;
      LCalcSizeParams^.rgrc[1] := LCalcSizeParams^.rgrc[0];
      Message.CalcSize_Params := LCalcSizeParams;
      Message.Result := WVR_VALIDRECTS;
    end;
  end
  else
  begin
    if FVertScrollBar then
    begin
     if not LeftScrollBar then
       Dec(Message.CalcSize_Params.rgrc[0].Right, BtnSize.cx)
     else
       Inc(Message.CalcSize_Params.rgrc[0].Left, BtnSize.cx);
    end;
    if FHorzScrollBar then
      Dec(Message.CalcSize_Params.rgrc[0].Bottom, BtnSize.cx);
    if SysControl.HasBorder then
    begin
      Inc(Message.CalcSize_Params.rgrc[0].Left, BorderSize.Left);
      Inc(Message.CalcSize_Params.rgrc[0].Top, BorderSize.Top);
      Dec(Message.CalcSize_Params.rgrc[0].Bottom, BorderSize.Bottom);
      Dec(Message.CalcSize_Params.rgrc[0].Right, BorderSize.Right);
    end;
  end;
  Handled := True;
end;

procedure TSysListBoxStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;

{ TSysStaticStyleHook }

constructor TSysStaticStyleHook.Create(AHandle: THandle);
var
  Style: DWORD;
begin
  Style := GetWindowLongPtr(AHandle, GWL_STYLE);
  if (Style and SS_ICON <> SS_ICON) and (Style and SS_BITMAP <> SS_BITMAP) then
    inherited;
  FUpdatedColor := 0;
  StyleElements := [seFont, seBorder, seClient];
  UpdateColors;
end;

function TSysStaticStyleHook.GetIsFrameOrLine: Boolean;
begin
  with SysControl do
    Result :=
      (Style and SS_ETCHEDFRAME = SS_ETCHEDFRAME) or
      (Style and SS_ETCHEDHORZ = SS_ETCHEDHORZ) or
      (Style and SS_SUNKEN = SS_SUNKEN) or
      (Style and SS_ETCHEDVERT = SS_ETCHEDVERT);
end;

function TSysStaticStyleHook.GetIsText: Boolean;
begin
  with SysControl do
    Result := (Style and SS_ICON <> SS_ICON) and
      (Style and SS_BITMAP <> SS_BITMAP) and
      (Style and SS_GRAYRECT <> SS_GRAYRECT) and
      (Style and SS_GRAYFRAME <> SS_GRAYFRAME) and
      (Style and SS_OWNERDRAW <> SS_OWNERDRAW) and
      (Style and SS_REALSIZEIMAGE <> SS_REALSIZEIMAGE) and
      (Style and SS_ICON <> SS_ICON) and (Style and SS_USERITEM <> SS_USERITEM)
      and (Style and SS_REALSIZEIMAGE <> SS_REALSIZEIMAGE) and
      (Style and SS_SIMPLE <> SS_SIMPLE);
end;

function TSysStaticStyleHook.GetTextFormat: TTextFormat;
begin
  Result := [tfHidePrefix];
  with SysControl do
  begin
    if Style and SS_LEFT = SS_LEFT then
      include(Result, tfLeft);
    if Style and SS_RIGHT = SS_RIGHT then
      include(Result, tfRight);
    if Style and SS_CENTER = SS_CENTER then
      include(Result, tfCenter);

    if tfRight in Result then
      Result := Result - [tfLeft, tfCenter];

    if Style and SS_ENDELLIPSIS = SS_ENDELLIPSIS then
      include(Result, tfEndEllipsis);

    if Style and SS_PATHELLIPSIS = SS_PATHELLIPSIS then
      include(Result, tfPathEllipsis);

    if Style and SS_WORDELLIPSIS = SS_WORDELLIPSIS then
      include(Result, tfWordEllipsis);

    if Style and SS_NOPREFIX = SS_NOPREFIX then
      include(Result, tfNoPrefix);

    if not(Style and SS_ENDELLIPSIS = SS_ENDELLIPSIS) and
      not(Style and SS_PATHELLIPSIS = SS_PATHELLIPSIS) and
      not(Style and SS_WORDELLIPSIS = SS_WORDELLIPSIS) then
      include(Result, tfWordBreak);

  end;
end;

procedure TSysStaticStyleHook.Paint(Canvas: TCanvas);
const
  States: array [Boolean] of TThemedTextLabel = (ttlTextLabelDisabled,
    ttlTextLabelNormal);
var
  LDetails: TThemedElementDetails;
  LRect: TRect;
begin
  LRect := SysControl.ClientRect;
  if GetBkMode(Canvas.Handle) = TRANSPARENT then
  begin
    LDetails := StyleServices.GetElementDetails(tbCheckBoxUncheckedNormal);
    StyleServices.DrawParentBackground(Handle, Canvas.Handle, LDetails, False);
    Canvas.Brush.Style := bsClear;
  end
  else
  begin
    Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
    Canvas.FillRect(LRect);
  end;
  LDetails := StyleServices.GetElementDetails(States[SysControl.Enabled]);
  Canvas.Font := SysControl.Font;
  DrawText(Canvas.Handle, LDetails, SysControl.Text, LRect, TextFormat);
end;

procedure TSysStaticStyleHook.PaintNC(Canvas: TCanvas);
var
  LRect: TRect;
  LBitMap: TBitmap;
begin
  if IsFrameOrLine then
  begin
    LRect := Rect(0, 0, SysControl.Width, SysControl.Height);
    LBitMap := TBitmap.Create;
    try
      LBitMap.Width := LRect.Width;
      LBitMap.Height := LRect.Height;
      Frame3D(LBitMap.Canvas, LRect, StyleServices.ColorToRGB(clBtnShadow),
        StyleServices.ColorToRGB(clBtnHighLight), 1);
      ExcludeClipRect(Canvas.Handle, 1, 1, SysControl.Width - 1,
        SysControl.Height - 1);
      Canvas.Draw(0, 0, LBitMap);
    finally
      LBitMap.Free;
    end;
  end;
end;

procedure TSysStaticStyleHook.UpdateColors;
const
  ColorStates: array [Boolean] of TStyleColor = (scEditDisabled, scEdit);
  FontColorStates: array [Boolean] of TStyleFont = (sfEditBoxTextDisabled,
    sfEditBoxTextNormal);
begin
  Color := StyleServices.GetSystemColor(clBtnFace);
  FontColor := StyleServices.GetSystemColor(clBtnText);
  //Addlog(Format('UpdateColors Handle %d Color %d FontColor %d ',[SysControl.Handle, Color, FontColor]));
end;

procedure TSysStaticStyleHook.WndProc(var Message: TMessage);
begin
   //Addlog(Format('TSysStaticStyleHook $0x%x %s', [SysControl.Handle, WM_To_String(Message.Msg)]));
  case Message.Msg of

    WM_SETTEXT:
      begin
        CallDefaultProc(Message);
        if SysControl.Visible then
          Invalidate;

      end;

    WM_ENABLE:
      if SysControl.Visible then
        Invalidate;

    WM_PAINT:
      begin
        if OverridePaint and StyleServicesEnabled then
        begin
          if (IsText and (Length(SysControl.Text) > 0)) then
            inherited
          else
            CallDefaultProc(Message);
        end
        else
          CallDefaultProc(Message);
      end;

  else
    inherited;
  end;
end;

{ TSysListViewStyleHook }

constructor TSysListViewStyleHook.Create(AHandle: THandle);
begin
  inherited;
  FHeaderStyleHook := nil;
  FHeaderHandle := 0;
  StyleElements := [seBorder];
  SendMessage(Handle, WM_NOTIFY, 0, 0);
end;

procedure TSysListViewStyleHook.Scroll(const Kind: TScrollBarKind; const ScrollType: TSysScrollingType; Pos, Delta: Integer);
var
  R: TRect;
begin
  if ScrollType = skTracking then
  begin
    if Kind = sbVertical then
    begin
      if ListView_GetView(Handle) = LVS_REPORT then
      begin
        R := Rect(0, 0, 0, 0);
        ListView_GetItemRect(Handle, 0, R, LVIR_BOUNDS);
        Delta := Delta * R.Height;
      end;
      ListView_Scroll(Handle, 0, Delta);
    end;
    if Kind = sbHorizontal then
    begin
      if ListView_GetView(Handle) = LVS_LIST then
      begin
        R := TRect.Empty;
        ListView_GetItemRect(Handle, 0, R, LVIR_BOUNDS);
        Delta := Delta * R.Width;
      end;
      ListView_Scroll(Handle, Delta, 0);
    end;
  end
  else
    inherited;
end;

procedure TSysListViewStyleHook.SetSelectedColumn(iCol: Integer);
begin
  ListView_SetSelectedColumn(Handle, iCol);
end;

destructor TSysListViewStyleHook.Destroy;
begin
  if Assigned(FHeaderStyleHook) then
    FreeAndNil(FHeaderStyleHook);
  inherited;
end;

procedure TSysListViewStyleHook.UpdateColors;
begin
  inherited;
  if seFont in StyleElements then
  begin
    Color := StyleServices.GetStyleColor(scListView);
    FontColor := StyleServices.GetSystemColor(clWindowText);
    ListView_SetBkColor(Handle, Color);
    ListView_SetTextBkColor(Handle, Color);
    ListView_SetTextColor(Handle, ColorToRGB(FontColor));
  end;
end;

procedure TSysListViewStyleHook.WndProc(var Message: TMessage);
begin
  case Message.Msg of

    WM_CREATE, LVM_UPDATE:
      begin
        Message.Result := CallDefaultProc(Message);
        UpdateColors;
        SetSelectedColumn(-1);
        Exit;
      end;

    WM_ERASEBKGND:
      begin
        UpdateColors;
        SetSelectedColumn(-1);
        Message.Result := CallDefaultProc(Message);
        Exit;
      end;

    WM_NOTIFY:
      begin
        if not Assigned(FHeaderStyleHook) then
        begin
          HeaderHandle := ListView_GetHeader(Handle);
          if (HeaderHandle <> 0) then
          begin
            FHeaderStyleHook := TSysHeaderStyleHook.Create(HeaderHandle);
            FHeaderStyleHook.FListViewStyleHook := Self;
          end;
        end;

        if (Message.WParam <> 0) or (Message.LParam <> 0) then
          Message.Result := CallDefaultProc(Message);
        Exit;
      end;
  else inherited;
  end;

end;

{ TSysListViewStyleHook.TSysHeaderStyleHook }

constructor TSysListViewStyleHook.TSysHeaderStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seClient];
  FPressedSection := -1;
  FSysSection := nil;
end;

destructor TSysListViewStyleHook.TSysHeaderStyleHook.Destroy;
begin
  if Assigned(FSysSection) then
    FreeAndNil(FSysSection);
  inherited;
end;

function TSysListViewStyleHook.TSysHeaderStyleHook.GetButtonsCount: Integer;
begin
  Result := Header_GetItemCount(Handle);
end;

function TSysListViewStyleHook.TSysHeaderStyleHook.GetItem(Index: Integer): TSysSection;
begin
  Result := nil;
  if (Index > -1) and (index < ButtonsCount) then
  begin
    if Assigned(FSysSection) then
      FreeAndNil(FSysSection);
    FSysSection := TSysSection.Create(SysControl, Index);
    Result := FSysSection;
  end;
end;

procedure TSysListViewStyleHook.TSysHeaderStyleHook.MouseLeave;
begin
  Invalidate;
end;

procedure TSysListViewStyleHook.TSysHeaderStyleHook.Paint(Canvas: TCanvas);
var
  I: Integer;
  Bmp: TBitmap;
  LImageList: TImageList;
  R, TxtRect, ImgRect: TRect;
  LSectionRect: TRect;
  LTextFormat: TTextFormat;
  LText: String;
  LSplitDetails, LDetails: TThemedElementDetails;
  DC: HDC;
  SectionHot: Boolean;
  LDropDownRect: TRect;
  P: TPoint;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.SetSize(SysControl.Width, SysControl.Height);
    Bmp.Canvas.Brush.Color := Color;
    R := Rect(0, 0, Bmp.Width, Bmp.Height);
    Bmp.Canvas.FillRect(R);
    DC := Bmp.Canvas.Handle;

    LDetails := StyleServices.GetElementDetails(thHeaderItemNormal);
    StyleServices.DrawElement(DC, LDetails, R);

    for I := 0 to ButtonsCount - 1 do
    begin
      with Items[I] do
      begin
        LSectionRect := SectionRect;
        LTextFormat := TextFormat;
        LText := Text;
        LDropDownRect := DropDownRect;
      end;
      SectionHot := False;
      if (MouseInControl) and (not FMouseDown) then
      begin
        GetCursorPos(P);
        ScreenToClient(Handle, P);
        if LSectionRect.Contains(P) then
          SectionHot := True;
      end;

      LDetails := StyleServices.GetElementDetails(thHeaderItemNormal);
      if SectionHot then
        LDetails := StyleServices.GetElementDetails(thHeaderItemHot);
      if FPressedSection = I then
        LDetails := StyleServices.GetElementDetails(thHeaderItemPressed);
      StyleServices.DrawElement(DC, LDetails, LSectionRect);

      TxtRect := LSectionRect;
      inc(TxtRect.Left, 4);

      if Items[I].HasSplitButton then
      begin
        LSplitDetails := StyleServices.GetElementDetails(ttbDropDownButtonGlyphHot);;
        R := LDropDownRect;
        if SectionHot then
        begin
          StyleServices.DrawElement(DC, LSplitDetails, R);
          with Bmp.Canvas do
          begin
            Pen.Color := StyleServices.GetSystemColor(clBtnShadow);
            MoveTo(R.Left, 3);
            LineTo(R.Left, R.Height - 3);
            Pen.Color := StyleServices.GetSystemColor(clBtnHighLight);
            MoveTo(R.Left - 1, 3);
            LineTo(R.Left - 1, R.Height - 3);
          end;
        end;
        dec(TxtRect.Right, R.Width);
      end;

      if (Items[I].ShowImage) and (Items[I].ImageListHandle > 0) then
      begin
        LImageList := TImageList.Create(nil);
        try
          LImageList.Handle := Items[I].ImageListHandle;
          LImageList.Masked := True;
          LImageList.BkColor := clNone; { Transparent bitmap }
          R := LSectionRect;
          ImgRect := Rect(0, 0, LImageList.Width, LImageList.Height);
          ImgRect := RectCenter(ImgRect, R);
          if not Items[I].BitmapOnRight then
          begin
            ImgRect.Left := R.Left + 2;
            ImgRect.Right := ImgRect.Left + 2 + LImageList.Width;
            inc(TxtRect.Left, ImgRect.Width + 2);
          end
          else
          begin
            ImgRect.Left := LSectionRect.Right - LImageList.Width - 2;
            ImgRect.Right := LSectionRect.Right;
            TxtRect.Right := TxtRect.Right - ImgRect.Width - 2;
          end;
          LImageList.Draw(Bmp.Canvas, ImgRect.Left, ImgRect.Top, Items[I].ImageIndex);
        finally
          LImageList.Free;
        end;
      end;

      include(LTextFormat, tfSingleLine);
      include(LTextFormat, tfVerticalCenter);
      StyleServices.DrawText(DC, LDetails, LText, TxtRect, LTextFormat);
    end;
    Canvas.Draw(0, 0, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TSysListViewStyleHook.TSysHeaderStyleHook.PaintBackground(Canvas: TCanvas);
begin
  // inherited;
  { Leave this block clean . }
end;

procedure TSysListViewStyleHook.Paint(Canvas: TCanvas);
begin
  { Leave this block clean . }
end;

procedure TSysListViewStyleHook.PaintBackground(Canvas: TCanvas);
begin
  { Leave this block clean . }
end;

procedure TSysListViewStyleHook.TSysHeaderStyleHook.WndProc(var Message: TMessage);
var
  Info: THDHitTestInfo;
begin
  case Message.Msg of

    WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
      begin
        FMouseDown := True;
        Info.Point.X := TWMMouse(Message).XPos;
        Info.Point.Y := TWMMouse(Message).YPos;
        SendMessage(Handle, HDM_HITTEST, 0, IntPtr(@Info));

        if (Info.Flags and HHT_ONDIVIDER = 0) and (Info.Flags and HHT_ONDIVOPEN = 0) then
          FPressedSection := Info.item
        else
          FPressedSection := -1;
      end;

    WM_LBUTTONUP, WM_RBUTTONUP:
      begin
        FMouseDown := False;
        FPressedSection := -1;
      end;

  end;
  inherited;

end;

{ TSysListViewStyleHook.TSysHeaderStyleHook.TSysSection }

constructor TSysListViewStyleHook.TSysHeaderStyleHook.TSysSection.Create(SysParent: TSysControl; Index: Integer);
begin
  FTextFormat := [];
  FIndex := Index;
  FText := '';
  FImageListHandle := 0;
  FImageIndex := -1;
  FColumnIndex := -1;
  FSectionRect := TRect.Empty;
  FDropDownRect := TRect.Empty;
  FHasSplitButton := False;
  FShowImage := False;
  FHeaderHandle := SysParent.Handle;
  DoGetSectionInfo;
end;

destructor TSysListViewStyleHook.TSysHeaderStyleHook.TSysSection.Destroy;
begin

  inherited;
end;

procedure TSysListViewStyleHook.TSysHeaderStyleHook.TSysSection.DoGetSectionInfo;
var
  SectionOrder: array of Integer;
  R: TRect;
  item: THDItem;
  Buffer: array [0 .. 255] of Char;
  LRtlReading: Boolean;
begin
  FillChar(Buffer, 255, Char(0));
  SetLength(SectionOrder, Header_GetItemCount(FHeaderHandle));
  Header_GetOrderArray(FHeaderHandle, Header_GetItemCount(FHeaderHandle), Pointer(SectionOrder));
  FColumnIndex := SectionOrder[FIndex];
  Header_GetItemRect(FHeaderHandle, ColumnIndex, @R);
  FSectionRect := R;
  FillChar(item, sizeof(item), 0);
  item.mask := HDI_TEXT or HDI_FORMAT or HDI_IMAGE;
  item.pszText := @Buffer;
  item.cchTextMax := Length(Buffer);
  if Header_GetItem(FHeaderHandle, FColumnIndex, item) then
  begin
    with item do
    begin
      FImageIndex := iImage;
      FText := String(pszText);
      FHasSplitButton := (fmt and HDF_SPLITBUTTON = HDF_SPLITBUTTON);
      LRtlReading := (fmt and HDF_RTLREADING = HDF_RTLREADING);
      FTextFormat := [];
      if (fmt and HDF_LEFT = HDF_LEFT) then
        include(FTextFormat, tfLeft)
      else if (fmt and HDF_RIGHT = HDF_RIGHT) then
        include(FTextFormat, tfRight)
      else if (fmt and HDF_CENTER = HDF_CENTER) then
        include(FTextFormat, tfCenter);

      if LRtlReading then
        include(FTextFormat, tfRtlReading);
      FBitmapOnRight := (fmt and HDF_BITMAP_ON_RIGHT = HDF_BITMAP_ON_RIGHT);

      FShowImage := (FImageIndex > -1) and (fmt and HDF_BITMAP = HDF_BITMAP);
    end;
  end;
  R := TRect.Empty;
  if Header_GetItemDropDownRect(FHeaderHandle, FIndex, R) then
    FDropDownRect := R;
  FImageListHandle := Header_GetImageList(FHeaderHandle);
end;

{ TSysTreeViewStyleHook }

constructor TSysTreeViewStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seBorder];
end;

procedure TSysTreeViewStyleHook.Scroll(const Kind: TScrollBarKind;
  const ScrollType: TSysScrollingType; Pos, Delta: Integer);
begin
  if Kind = sbVertical then
  begin
    case ScrollType of
      skTracking:
        begin
          LstPos := Pos;
          //OutputDebugString(PChar(Format('sbVertical Pos %d Delta %d AllowScrolling %s', [Pos, Delta, BooltoStr(AllowScrolling, True)])));
          AllowScrolling := True;
          SetScrollPos(Handle, SB_VERT, Pos, False);
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          AllowScrolling := False;
          //OutputDebugString(PChar(Format('sbVertical Pos %d Delta %d', [Pos, Delta])));
        end;
      skLineUp: SendMessage(Handle, WM_VSCROLL, SB_LINEUP, 0);
      skLineDown: SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 0);
      skPageUp: SendMessage(Handle, WM_VSCROLL, SB_PAGEUP, 0);
      skPageDown: SendMessage(Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
    end;
  end
  else
  if Kind = sbHorizontal then
  begin
    case ScrollType of
      skTracking:
        begin
          LstPos := Pos;
          //OutputDebugString(PChar(Format('sbHorizontal Pos %d Delta %d AllowScrolling %s', [Pos, Delta, BooltoStr(AllowScrolling, True)])));
          AllowScrolling := True;
          SendMessage(Handle, WM_HSCROLL, MakeWParam(SB_THUMBTRACK, Pos), 0);
          AllowScrolling := False;
          //OutputDebugString(PChar(Format('sbHorizontal Pos %d Delta %d', [Pos, Delta])));
        end;
      skLineLeft: SendMessage(Handle, WM_HSCROLL, SB_LINELEFT, 0);
      skLineRight: SendMessage(Handle, WM_HSCROLL, SB_LINERIGHT, 0);
      skPageLeft: SendMessage(Handle, WM_HSCROLL, SB_PAGELEFT, 0);
      skPageRight: SendMessage(Handle, WM_HSCROLL, SB_PAGERIGHT, 0);
    end;
  end;
end;

procedure TSysTreeViewStyleHook.UpdateColors;
begin
  inherited;
  if seFont in StyleElements then
  begin
    Color := StyleServices.GetStyleColor(scTreeView);
    FontColor := StyleServices.GetSystemColor(clWindowText)
  end;
end;

procedure TSysTreeViewStyleHook.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_ERASEBKGND:
      begin
        UpdateColors;
        if (TreeView_GetBkColor(Handle) <> COLORREF(Color)) and (seFont in StyleElements) then
        begin
          TreeView_SetBkColor(Handle, Color);
          TreeView_SetTextColor(Handle, FontColor);
        end;
        Message.Result := CallDefaultProc(Message);
        Exit;
      end;
  else
    inherited;
  end;
  case Message.Msg of
    WM_SIZE:
      SetWindowPos(Handle, 0,0,0,0,0, SWP_FRAMECHANGED or SWP_NOACTIVATE or
        SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
  end;
end;

procedure TSysTreeViewStyleHook.StopTrackTimer;
begin
  inherited;
  if FScrollKind = sbVertical then
  begin
    SetScrollPos(Handle, SB_VERT, LstPos, False);
    SendMessage(Handle, WM_VSCROLL, MakeWParam(SB_THUMBTRACK, LstPos), 0);
  end;
end;

{ TSysTabControlStyleHook }

procedure TSysTabControlStyleHook.AngleTextOut(Canvas: TCanvas; const Angle, X, Y: Integer; const Text: string);
var
  SaveIndex: Integer;
begin
  SaveIndex := SaveDC(Canvas.Handle);
  try
    SetBkMode(Canvas.Handle, Transparent);
    Canvas.Font.Orientation := Angle;
    Canvas.TextOut(X, Y, Text);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;

end;

constructor TSysTabControlStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seClient, seFont];
  FHotTabIndex := -1;
end;

function TSysTabControlStyleHook.GetDisplayRect: TRect;
begin
  //Result := Rect(0, 0, 0, 0);
  Result := SysControl.ClientRect;
  SendMessage(Handle, TCM_ADJUSTRECT, 0, IntPtr(@Result));
  inc(Result.Top, 2);
end;

function TSysTabControlStyleHook.GetImages: TCustomImageList;
begin
  Result := nil;
end;

function TSysTabControlStyleHook.GetTabCount: Integer;
begin
  Result := SendMessage(Handle, TCM_GETITEMCOUNT, 0, 0);
end;

function TSysTabControlStyleHook.GetTabIndex: Integer;
begin
  Result := SendMessage(Handle, TCM_GETCURSEL, 0, 0);
end;

function TSysTabControlStyleHook.GetTabPosition: TSysTabPosition;
begin
  Result := tpSysTop;
end;

function TSysTabControlStyleHook.GetTabRect(Index: Integer): TRect;
begin
  Result := Rect(0, 0, 0, 0);
  TabCtrl_GetItemRect(Handle, Index, Result);
end;

function TSysTabControlStyleHook.GetTabs(Index: Integer): string;
var
  TCItem: TTCItem;
  Buffer: array [0 .. 254] of Char;
begin
  FillChar(TCItem, sizeof(TCItem), 0);

  TCItem.mask := TCIF_TEXT;
  TCItem.pszText := @Buffer;
  TCItem.cchTextMax := sizeof(Buffer);
  if SendMessageW(Handle, TCM_GETITEMW, Index, IntPtr(@TCItem)) <> 0 then
    Result := TCItem.pszText
  else
    Result := '';

end;




procedure TSysTabControlStyleHook.Paint(Canvas: TCanvas);
var
  R: TRect;
  i, SaveIndex: Integer;
  Details: TThemedElementDetails;
begin
  SaveIndex := SaveDC(Canvas.Handle);
  try
    R := DisplayRect;

    ExcludeClipRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom);
    PaintBackground(Canvas);
  finally
    RestoreDC(Canvas.Handle, SaveIndex);
  end;
  { Draw tabs }
  for i := 0 to TabCount - 1 do
  begin
    // if I = TabIndex then
    // Continue;
    DrawTab(Canvas, i);
  end;
  case TabPosition of
    tpSysTop: InflateRect(R, SysControl.Width - R.Right, SysControl.Height - R.Bottom);
    tpSysLeft: InflateRect(R, SysControl.Width - R.Right, SysControl.Height - R.Bottom);
    tpSysBottom: InflateRect(R, R.Left, R.Top);
    tpSysRight: InflateRect(R, R.Left, R.Top);
  end;

  if StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(ttPane);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
  { Draw active tab }
  if TabIndex >= 0 then
    DrawTab(Canvas, TabIndex);

end;

procedure TSysTabControlStyleHook.DrawTab(Canvas: TCanvas; const Index: Integer);
var
  R, LayoutR, GlyphR: TRect;
  ImageWidth, ImageHeight, ImageStep, TX, TY: Integer;
  DrawState: TThemedTab;
  Details: TThemedElementDetails;
  ThemeTextColor: TColor;
  FImageIndex: Integer;
begin
  if (Images <> nil) and (Index < Images.Count) then
  begin
    ImageWidth := Images.Width;
    ImageHeight := Images.Height;
    ImageStep := 3;
  end
  else
  begin
    ImageWidth := 0;
    ImageHeight := 0;
    ImageStep := 0;
  end;

  R := TabRect[Index];
  if R.Left < 0 then
    Exit;

  if TabPosition in [tpSysTop, tpSysBottom] then
  begin
    if Index = TabIndex then
      InflateRect(R, 0, 2);
  end
  else if Index = TabIndex then
    dec(R.Left, 2)
  else
    dec(R.Right, 2);

  // Canvas.Font.Assign(TCustomTabControl(Control).Font);
  LayoutR := R;
  DrawState := ttTabDontCare;
  case TabPosition of
    tpSysTop:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemHot
        else
          DrawState := ttTabItemNormal;
      end;
    tpSysLeft:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemLeftEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemLeftEdgeHot
        else
          DrawState := ttTabItemLeftEdgeNormal;
      end;
    tpSysBottom:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemBothEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemBothEdgeHot
        else
          DrawState := ttTabItemBothEdgeNormal;
      end;
    tpSysRight:
      begin
        if Index = TabIndex then
          DrawState := ttTabItemRightEdgeSelected
        else if (Index = FHotTabIndex) and MouseInControl then
          DrawState := ttTabItemRightEdgeHot
        else
          DrawState := ttTabItemRightEdgeNormal;
      end;
  end;

  if StyleServices.Available then
  begin
    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;

  { Image }

  FImageIndex := Index;

  if (Images <> nil) and (FImageIndex >= 0) and (FImageIndex < Images.Count) then
  begin
    GlyphR := LayoutR;
    case TabPosition of
      tpSysTop, tpSysBottom:
        begin
          GlyphR.Left := GlyphR.Left + ImageStep;
          GlyphR.Right := GlyphR.Left + ImageWidth;
          LayoutR.Left := GlyphR.Right;
          GlyphR.Top := GlyphR.Top + (GlyphR.Bottom - GlyphR.Top) div 2 - ImageHeight div 2;
          if (TabPosition = tpSysTop) and (Index = TabIndex) then
            OffsetRect(GlyphR, 0, -1)
          else if (TabPosition = tpSysBottom) and (Index = TabIndex) then
            OffsetRect(GlyphR, 0, 1);
        end;
      tpSysLeft:
        begin
          GlyphR.Bottom := GlyphR.Bottom - ImageStep;
          GlyphR.Top := GlyphR.Bottom - ImageHeight;
          LayoutR.Bottom := GlyphR.Top;
          GlyphR.Left := GlyphR.Left + (GlyphR.Right - GlyphR.Left) div 2 - ImageWidth div 2;
        end;
      tpSysRight:
        begin
          GlyphR.Top := GlyphR.Top + ImageStep;
          GlyphR.Bottom := GlyphR.Top + ImageHeight;
          LayoutR.Top := GlyphR.Bottom;
          GlyphR.Left := GlyphR.Left + (GlyphR.Right - GlyphR.Left) div 2 - ImageWidth div 2;
        end;
    end;
    if StyleServices.Available then
      StyleServices.DrawIcon(Canvas.Handle, Details, GlyphR, Images.Handle, FImageIndex);
  end;

  { Text }
  if StyleServices.Available then
  begin
    if (TabPosition = tpSysTop) and (Index = TabIndex) then
      OffsetRect(LayoutR, 0, -1)
    else if (TabPosition = tpSysBottom) and (Index = TabIndex) then
      OffsetRect(LayoutR, 0, 1);

    if TabPosition = tpSysLeft then
    begin
      TX := LayoutR.Left + (LayoutR.Right - LayoutR.Left) div 2 - Canvas.TextHeight(Tabs[Index]) div 2;
      TY := LayoutR.Top + (LayoutR.Bottom - LayoutR.Top) div 2 + Canvas.TextWidth(Tabs[Index]) div 2;
      if StyleServices.GetElementColor(Details, ecTextColor, ThemeTextColor) then
        Canvas.Font.Color := ThemeTextColor;
      AngleTextOut(Canvas, 900, TX, TY, Tabs[Index]);
    end
    else if TabPosition = tpSysRight then
    begin
      TX := LayoutR.Left + (LayoutR.Right - LayoutR.Left) div 2 + Canvas.TextHeight(Tabs[Index]) div 2;
      TY := LayoutR.Top + (LayoutR.Bottom - LayoutR.Top) div 2 - Canvas.TextWidth(Tabs[Index]) div 2;
      if StyleServices.GetElementColor(Details, ecTextColor, ThemeTextColor) then
        Canvas.Font.Color := ThemeTextColor;
      AngleTextOut(Canvas, -900, TX, TY, Tabs[Index]);
    end
    else
      StyleServices.DrawText(Canvas.Handle, Details, Tabs[Index], LayoutR, [tfSingleLine, tfVerticalCenter, tfCenter, tfNoClip]);
    // DrawControlText(Canvas, Details, Tabs[Index], LayoutR,
    // DT_VCENTER or DT_CENTER or DT_SINGLELINE or DT_NOCLIP);
  end;
end;

procedure TSysTabControlStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited;
end;

procedure TSysTabControlStyleHook.PaintNC(Canvas: TCanvas);
begin
  inherited;
end;

procedure TSysTabControlStyleHook.WndProc(var Message: TMessage);
begin
  // Addlog(Format('TSysTabControlStyleHook $0x%x %s', [SysControl.Handle, WM_To_String(Message.Msg)]));

  // case Message.Msg of
  // WM_MOUSEMOVE:
  // begin
  //
  // end;
  // else
  // inherited;
  // end;
  inherited;
end;

{ TSysToolbarStyleHook }

{$REGION 'TSysToolbarStyleHook'}

constructor TSysToolbarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seClient, seFont];
  OverrideEraseBkgnd := False;
  FImages := nil;
  FDisabledImages := nil;
  FSysToolbarButton := nil;
  FButtonsPainted := False;
end;

destructor TSysToolbarStyleHook.Destroy;
begin
  if Assigned(FImages) then
    FreeAndNil(FImages);
  if Assigned(FDisabledImages) then
    FreeAndNil(FDisabledImages);
  if Assigned(FSysToolbarButton) then
    FreeAndNil(FSysToolbarButton);
  inherited;
end;

function TSysToolbarStyleHook.GetItem(Index: Integer): TSysToolbarButton;
begin
  Result := nil;
  if (Index > -1) and (index <= Count) then
  begin
    if Assigned(FSysToolbarButton) then
      FreeAndNil(FSysToolbarButton);
    FSysToolbarButton := TSysToolbarButton.Create(SysControl, Index);
    Result := FSysToolbarButton;
  end;
end;

function TSysToolbarStyleHook.GetShowText: Boolean;
begin
  Result := (SysControl.Style and BTNS_SHOWTEXT = BTNS_SHOWTEXT);
end;

function TSysToolbarStyleHook.IsToolbarFlat: Boolean;
begin
  { MSDN :
    In a flat toolbar, both the toolbar and the buttons are transparent
    and hot-tracking is enabled.
  }
  Result := (SysControl.Style and TBSTYLE_FLAT = TBSTYLE_FLAT)
end;

function TSysToolbarStyleHook.IsToolbarList: Boolean;
begin
  Result := (SysControl.Style and TBSTYLE_LIST = TBSTYLE_LIST);
end;

function TSysToolbarStyleHook.IsToolbarTransparent: Boolean;
begin
  { MSDN:
    In a transparent toolbar, the toolbar is transparent but the buttons are not.
  }
  Result := (SysControl.Style and TBSTYLE_TRANSPARENT = TBSTYLE_TRANSPARENT)
end;

function TSysToolbarStyleHook.IsToolbarWrapable: Boolean;
begin
  Result := (SysControl.Style and TBSTYLE_WRAPABLE = TBSTYLE_WRAPABLE)
end;

function TSysToolbarStyleHook.GetCount: Integer;
begin
  Result := SendMessage(Handle, TB_BUTTONCOUNT, 0, 0);
end;

procedure TSysToolbarStyleHook.ApplyImageList;
var
  H: Cardinal;
begin
  H := SendMessage(Handle, TB_GETIMAGELIST, 0, 0);
  if (H <> 0) and (FImages = nil) then
  begin
    FImages := TImageList.Create(nil);
    FImages.ShareImages := True;
    FImages.Handle := H;
  end;
  H := SendMessage(Handle, TB_GETDISABLEDIMAGELIST, 0, 0);
  if (H <> 0) and (FDisabledImages = nil) then
  begin
    FDisabledImages := TImageList.Create(nil);
    FDisabledImages.ShareImages := True;
    FDisabledImages.Handle := H;
  end;
end;

procedure TSysToolbarStyleHook.Paint(Canvas: TCanvas);
var
  i: Integer;
  ItemRect, R, R2: TRect;
  LDetails: TThemedElementDetails;
  DC: HDC;
  LButtonHot: Boolean;
  P: TPoint;
  LStyle: TSysToolbarButtonStyle;
  LState: TSysToolbarButtonState;
  Bmp: TBitmap;
  ImgRect, TxtRect: TRect;
  LText: String;
  LImageIndex, LDropDownWidth: Integer;
  TxtFlags: DWORD;
  TxtFormat: TTextFormat;
begin

  Bmp := TBitmap.Create;
  try
    ApplyImageList;
    if Assigned(FImages) then
    begin
      FImages.Masked := True;
      FImages.BkColor := clNone; { Transparent bitmap }
    end;
    ImgRect := Rect(0, 0, 0, 0);
    TxtRect := Rect(0, 0, 0, 0);
    Bmp.SetSize(SysControl.Width, SysControl.Height);
    R := Rect(0, 0, Bmp.Width, Bmp.Height);
    // Bmp.Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
    // Bmp.Canvas.FillRect(R);
    DC := Bmp.Canvas.Handle;
    DrawParentBackground(DC);

    TxtFlags := 0;
    if (SysControl.Style and TBSTYLE_NOPREFIX = TBSTYLE_NOPREFIX) then
      TxtFlags := DT_NOPREFIX;

    if Flat or Transparent then
    begin
      { Dont paint the toolbar background => the toolbar is transparent . }
    end
    else
    begin
      { Toolbar is not transparent }
      LDetails.Element := teToolBar;
      LDetails.Part := 0;
      LDetails.State := 0;
      if StyleServices.HasTransparentParts(LDetails) then
        StyleServices.DrawParentBackground(Handle, DC, LDetails, False);
      StyleServices.DrawElement(DC, LDetails, R);
    end;
  except
    Bmp.Free;
    Exit;
  end;

  try
    { Draw toolbar buttons }
    for i := 0 to Count - 1 do
    begin
      if i = Count - 1 then
        FButtonsPainted := True;

      ItemRect := Items[i].ItemRect;
      with Items[i] do
      begin
        LState := State;
        LStyle := Style;
        LText := Text;
        LImageIndex := ImageIndex;
        LDropDownWidth := DropDownWidth;
      end;

      LButtonHot := False;
      if not(bsHidden in LState) then
      begin
        if MouseInControl then
        begin
          GetCursorPos(P);
          ScreenToClient(Handle, P);
          if ItemRect.Contains(P) then
            LButtonHot := True;
        end;

        if (bsEnabled in LState) then
          LDetails := StyleServices.GetElementDetails(ttbButtonNormal)
        else
          LDetails := StyleServices.GetElementDetails(ttbButtonDisabled);
        if (LButtonHot) and (bsEnabled in LState) then
        begin
          LDetails := StyleServices.GetElementDetails(ttbButtonHot);
        end;
        if (bsPressed in LState) and (bsEnabled in LState) then
          LDetails := StyleServices.GetElementDetails(ttbButtonPressed);

        if bsChecked in LState then
          LDetails := StyleServices.GetElementDetails(ttbButtonChecked);

        if not(bsSep in LStyle) then
        begin
          if Flat then
          begin
            // Bmp.Canvas.FillRect(ItemRect);
            DrawParentBackground(DC, @ItemRect);
            if (LButtonHot or (bsPressed in LState) or (bsChecked in LState)) and (bsEnabled in LState) then
            begin
              StyleServices.DrawElement(DC, LDetails, ItemRect);
            end;
          end
          else
            StyleServices.DrawElement(DC, LDetails, ItemRect);
        end
        else
        begin
          LDetails := StyleServices.GetElementDetails(ttbSeparatorNormal);
          StyleServices.DrawElement(DC, LDetails, ItemRect);
        end;

        if not(bsSep in LStyle) then
        begin
          R := ItemRect;
          ImgRect := TRect.Empty;
          if Assigned(FImages) then
            ImgRect := Rect(0, 0, FImages.Width, FImages.Height);
          ImgRect := CenteredRect(R, ImgRect);

          if bsDropDown in LStyle then
          begin
            { If button is DropDown then draw the button glyph. }
            R := ItemRect;
            R := Rect(R.Right - LDropDownWidth, R.Top, R.Right, R.Bottom);
            if bsEnabled in LState then
              LDetails := StyleServices.GetElementDetails(ttbDropDownButtonGlyphNormal)
            else
              LDetails := StyleServices.GetElementDetails(ttbDropDownButtonGlyphDisabled);
            if (LButtonHot and (bsEnabled in LState)) then
              LDetails := StyleServices.GetElementDetails(ttbDropDownButtonGlyphHot);
            if ((bsPressed in LState) and (bsEnabled in LState)) then
              LDetails := StyleServices.GetElementDetails(ttbDropDownButtonGlyphPressed);
            StyleServices.DrawElement(DC, LDetails, R);

            { Adjust bitmap position }

            if Assigned(FImages) then
              ImgRect := Rect(0, 0, FImages.Width, FImages.Height);
            R := ItemRect;
            R.Right := R.Right - LDropDownWidth;
            ImgRect := CenteredRect(R, ImgRect);
            inc(ImgRect.Left, 2);
          end;

          { Adjust bitmap & Text positions }
          if Wrapable then
          begin
            R := Rect(0, 0, 0, 0);
            if (ShowText and not List) then
            begin
              Winapi.Windows.DrawText(DC, LText, -1, R, DT_CENTER or DT_CALCRECT);
            end;
            ImgRect.Offset(0, -R.Height);
          end
          else if List then
          begin
            R := Rect(0, 0, 0, 0);
            if ShowText then
            begin
              Winapi.Windows.DrawText(DC, LText, -1, R, DT_CENTER or DT_CALCRECT or TxtFlags);
            end;
            ImgRect := Rect(0, 0, FImages.Width, FImages.Height);
            R2 := ItemRect;
            dec(R2.Right, R.Width + 2);
            ImgRect := CenteredRect(R2, ImgRect);
          end;

          { Draw Bitmap }
          if (LImageIndex > -1) and (Assigned(FImages)) then
          begin
            if bsEnabled in LState then
              FImages.DrawingStyle := Vcl.ImgList.TDrawingStyle.dsNormal
            else
              FImages.DrawingStyle := Vcl.ImgList.TDrawingStyle.dsSelected;
            FImages.Draw(Bmp.Canvas, ImgRect.Left, ImgRect.Top, LImageIndex);
          end;

          { Draw Text }
          TxtRect := Rect(0, 0, 0, 0);
          if ShowText then
          begin
            if not List then
            begin
              { Text appear under the button bitmap }
              if (ImgRect.Width > 0) and (LImageIndex > -1) then
                TxtRect := Rect(ItemRect.Left, ImgRect.Bottom, ItemRect.Right, ItemRect.Bottom)
              else
                TxtRect := ItemRect;
                if LState = [bsEnabled] then
                  LDetails := StyleServices.GetElementDetails(tbCheckBoxUncheckedNormal)
                else
                if LState = [] then
                  LDetails := StyleServices.GetElementDetails(tbCheckBoxUncheckedDisabled);
                if LText <> '' then
                  DrawTextCentered(DC, LDetails, TxtRect, LText, TxtFlags);
            end
            else
            begin
              { List }
              { Text appear to the right of the button bitmap }
              if (ImgRect.Width > 0) and (LImageIndex > -1) then
                TxtRect := Rect(ImgRect.Right + 2, ItemRect.Top, ItemRect.Right, ItemRect.Bottom)
              else
                TxtRect := ItemRect;
              TxtFormat := [tfCenter, tfVerticalCenter, tfSingleLine, tfLeft];
              if TxtFlags <> 0 then
                include(TxtFormat, tfNoPrefix);
              if LText <> '' then
                StyleServices.DrawText(DC, LDetails, LText, TxtRect, TxtFormat);
            end;
          end;
        end;
      end;
    end;
    Canvas.Draw(0, 0, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TSysToolbarStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited;

end;

procedure TSysToolbarStyleHook.PaintNC(Canvas: TCanvas);
begin
  inherited;
end;

procedure TSysToolbarStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;
{$ENDREGION}
{$REGION 'TSysToolbarButton'}
{ TSysToolbarStyleHook.TSysToolbarButton }

constructor TSysToolbarStyleHook.TSysToolbarButton.Create(SysParent: TSysControl; Index: Integer);
begin
  FIndex := Index;
  FParent := SysParent;
  FText := '';
  FImageIndex := -1;
  FState := [];
  FStyle := [];
  DoGetItemInfo;
end;

destructor TSysToolbarStyleHook.TSysToolbarButton.Destroy;
begin
  inherited;
end;

Procedure TSysToolbarStyleHook.TSysToolbarButton.DoGetItemInfo;
const
  BufferSize = 255;
var
  TB: TTBButton;
  Buffer: array [0 .. BufferSize - 1] of Char;
  BtnInfo: TTBButtonInfo;
begin
  FillChar(Buffer, BufferSize, Char(0));
  FillChar(TB, sizeof(TB), 0);
  SendMessage(FParent.Handle, TB_GETBUTTON, FIndex, IntPtr(@TB));
  FillChar(BtnInfo, sizeof(BtnInfo), Char(0));
  BtnInfo.cbSize := sizeof(TTBButtonInfo);
  BtnInfo.dwMask := TBIF_STATE or TBIF_STYLE or TBIF_IMAGE or TBIF_TEXT;
  BtnInfo.cchText := BufferSize;
  BtnInfo.pszText := @Buffer;
  SendMessage(FParent.Handle, TB_GETBUTTONINFO, TB.idCommand, LParam(@BtnInfo));
  BtnInfo.fsStyle := TB.fsStyle;
  SendMessage(FParent.Handle, TB_GETBUTTONTEXT, TB.idCommand, LParam(BtnInfo.pszText));
  FText := String(Buffer);
  FImageIndex := BtnInfo.iImage;
  with BtnInfo do
  begin
    { Button State }
    if fsState and TBSTATE_ENABLED = TBSTATE_ENABLED then
      include(FState, bsEnabled);
    if fsState and TBSTATE_PRESSED = TBSTATE_PRESSED then
      include(FState, bsPressed);
    if fsState and TBSTATE_CHECKED = TBSTATE_CHECKED then
      include(FState, bsChecked);
    if fsState and TBSTATE_HIDDEN = TBSTATE_HIDDEN then
      include(FState, bsHidden);

    { Button Style }
    if fsStyle and TBSTYLE_BUTTON = TBSTYLE_BUTTON then
      include(FStyle, bsBtn);
    if fsStyle and TBSTYLE_SEP = TBSTYLE_SEP then
      include(FStyle, bsSep);
    if fsStyle and TBSTYLE_CHECK = TBSTYLE_CHECK then
      include(FStyle, bsCheck);
    if fsStyle and TBSTYLE_GROUP = TBSTYLE_GROUP then
      include(FStyle, bsGroup);
    if fsStyle and TBSTYLE_CHECKGROUP = TBSTYLE_CHECKGROUP then
      include(FStyle, bsCheckGroup);
    if (fsStyle and TBSTYLE_DROPDOWN = TBSTYLE_DROPDOWN) or (fsStyle and BTNS_WHOLEDROPDOWN = BTNS_WHOLEDROPDOWN) then
      include(FStyle, bsDropDown);

  end;

end;

function TSysToolbarStyleHook.TSysToolbarButton.GetItemRect: TRect;
begin
  Result := TRect.Empty;
  if not BOOL(SendMessage(FParent.Handle, TB_GETITEMRECT, FIndex, LParam(@Result))) then
    Result := TRect.Empty;
end;

function TSysToolbarStyleHook.TSysToolbarButton.GetDropDownWidth: Integer;
var
  R: TRect;
begin
  if BOOL(SendMessage(FParent.Handle, TB_GETITEMDROPDOWNRECT, FIndex, LParam(@R))) then
    Result := R.Right - R.Left
  else
    Result := 15; // default width when runtime themes are enabled
end;

{$ENDREGION}

{ TSysProgressBarStyleHook }

constructor TSysProgressBarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  if (SysControl.Style and PBS_VERTICAL) <> 0 then
    FOrientation := pbSysVertical
  else
    FOrientation := pbSysHorizontal;
  OverridePaint := True;
  FStep := 0;
  FMarquee := (SysControl.Style and PBS_MARQUEE) <> 0;
  if FMarquee then
    SetTimer(Handle, 10, 100, nil);
end;

destructor TSysProgressBarStyleHook.Destroy;
begin
  if FMarquee then
    KillTimer(Handle, 10);
  inherited;
end;

function TSysProgressBarStyleHook.GetBarRect: TRect;
begin
  Result := TRect.Create(0, 0, SysControl.Width, SysControl.Height);
  InflateRect(Result, -BorderWidth, -BorderWidth);
end;

function TSysProgressBarStyleHook.GetBorderWidth: Integer;
begin
  Result := 0;
end;

function TSysProgressBarStyleHook.GetMax: Integer;
begin
  Result := SendMessage(Handle, PBM_GetRange, 0, 0);
end;

function TSysProgressBarStyleHook.GetMin: Integer;
begin
  Result := SendMessage(Handle, PBM_GetRange, 1, 0);
end;

function TSysProgressBarStyleHook.GetOrientation: TSysProgressBarOrientation;
begin
  Result := pbSysHorizontal;
  if (Handle <> 0) and (GetWindowLong(Handle, GWL_STYLE) and PBS_VERTICAL = PBS_VERTICAL) then
    Result := pbSysVertical;
end;

function TSysProgressBarStyleHook.GetPercent: Single;
var
  LMin, LMax, LPos: Integer;
begin
  LMin := Min;
  LMax := Max;
  LPos := Position;
  if (LMin >= 0) and (LPos >= LMin) and (LMax >= LPos) and (LMax - LMin <> 0) then
    Result := (LPos - LMin) / (LMax - LMin)
  else
    Result := 0;
end;

function TSysProgressBarStyleHook.GetPosition: Integer;
begin
  Result := SendMessage(Handle, PBM_GETPOS, 0, 0);
end;

procedure TSysProgressBarStyleHook.Paint(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
begin
  if StyleServices.Available then
  begin
    LDetails.Element := teProgress;
    if StyleServices.HasTransparentParts(LDetails) then
      StyleServices.DrawParentBackground(Handle, Canvas.Handle, LDetails, False);
  end;
  PaintFrame(Canvas);
  PaintBar(Canvas);
end;

procedure TSysProgressBarStyleHook.PaintBackground(Canvas: TCanvas);
begin
  inherited;
end;

procedure TSysProgressBarStyleHook.PaintBar(Canvas: TCanvas);
var
  FillR, LRect: TRect;
  LWidth, LPos: Integer;
  LDetails: TThemedElementDetails;
begin
  LRect := BarRect;
  if FMarquee then
  begin
    InflateRect(LRect, -2, -2);
    if Orientation = pbSysHorizontal then
      LWidth := LRect.Width
    else
      LWidth := LRect.Height;

    LPos := Round(LWidth * 0.05);
    FillR := LRect;
    if Orientation = pbSysHorizontal then
    begin
      FillR.Right := FillR.Left + LPos;
      LDetails := StyleServices.GetElementDetails(tpChunk);
    end
    else
    begin
      FillR.Top := FillR.Bottom - LPos;
      LDetails := StyleServices.GetElementDetails(tpChunkVert);
    end;

    FillR.SetLocation(FStep * FillR.Width, FillR.Top);
    StyleServices.DrawElement(Canvas.Handle, LDetails, FillR);
  end
  else
  begin
    InflateRect(LRect, -2, -2);
    if Orientation = pbSysHorizontal then
      LWidth := LRect.Width
    else
      LWidth := LRect.Height;
    LPos := Round(LWidth * GetPercent);
    FillR := LRect;
    if Orientation = pbSysHorizontal then
    begin
      FillR.Right := FillR.Left + LPos;
      LDetails := StyleServices.GetElementDetails(tpChunk);
    end
    else
    begin
      FillR.Top := FillR.Bottom - LPos;
      LDetails := StyleServices.GetElementDetails(tpChunkVert);
    end;
    StyleServices.DrawElement(Canvas.Handle, LDetails, FillR);
  end;
end;

procedure TSysProgressBarStyleHook.PaintFrame(Canvas: TCanvas);
var
  R: TRect;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then
    Exit;
  R := BarRect;
  if Orientation = pbSysHorizontal then
    Details := StyleServices.GetElementDetails(tpBar)
  else
    Details := StyleServices.GetElementDetails(tpBarVert);
  StyleServices.DrawElement(Canvas.Handle, Details, R);
end;

procedure TSysProgressBarStyleHook.TimerAction;
var
  LCanvas: TCanvas;
  LHandle: THandle;
begin
  LHandle := 0;
  LCanvas := TCanvas.Create;
  try
    LHandle := GetWindowDC(Self.Handle);

    if LHandle <> 0 then
    begin
      LCanvas.Handle := LHandle;

      if SysControl.Visible then
      begin
        PaintFrame(LCanvas);
        PaintBar(LCanvas);
      end;
    end;

      inc(FStep, 1);
      if FStep mod 20 = 0 then
        FStep := 0;
  finally
   if LHandle<>0 then
    ReleaseDC(Handle, LHandle);
    LCanvas.Handle := 0;
    LCanvas.Free;
  end;
end;

procedure TSysProgressBarStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  Message.Result := 0;
  Handled := True;
end;

procedure TSysProgressBarStyleHook.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_TIMER:
      if TWMTimer(Message).TimerID = 10 then
        TimerAction;
  else
    inherited;
  end;
end;

{ TSysRichEditStyleHook }

constructor TSysRichEditStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seBorder];
end;

procedure TSysRichEditStyleHook.EMSetBkgndColor(var Message: TMessage);
begin
  Message.LParam := Color;
  Handled := False;
end;

function TSysRichEditStyleHook.GetBorderSize: TRect;
begin
  if SysControl.HasBorder then
    Result := Rect(2, 2, 2, 2);
end;

procedure TSysRichEditStyleHook.UpdateColors;
var
  cf: TCharFormat2;
const
  TextColor: array [Boolean] of TStyleFont = (sfEditBoxTextDisabled, sfEditBoxTextNormal);
  BkColor: array [Boolean] of TStyleColor = (scEditDisabled, scEdit);
begin
  Color := ColorToRGB(StyleServices.GetStyleColor(scEdit));
  FontColor := ColorToRGB(StyleServices.GetStyleFontColor(TextColor[SysControl.Enabled]));
  BackColor := ColorToRGB(StyleServices.GetStyleColor(BkColor[SysControl.Enabled]));

  ZeroMemory(@cf, sizeof(TCharFormat2));
  cf.cbSize := sizeof(TCharFormat2);
  cf.dwMask := CFM_ALL;
  { Need to send this message .. }
  SendMessage(Handle, EM_SETBKGNDCOLOR, 0, 0);
  SendMessage(Handle, EM_GETCHARFORMAT, SCF_DEFAULT, LParam(@cf));
  SendMessage(Handle, EM_SETCHARFORMAT, SCF_DEFAULT, LParam(@cf));
end;

procedure TSysRichEditStyleHook.EMSetCharFormat(var Message: TMessage);
type
  PCharFormat2 = ^TCharFormat2;
var
  Format: PCharFormat2;
begin
  Format := PCharFormat2(Message.LParam);
  Format.crTextColor := FontColor;
  Format.crBackColor := BackColor;
  Format.dwEffects := Format.dwEffects and not CFE_AUTOCOLOR;
  Handled := False;
end;

procedure TSysRichEditStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;

{ TSysReBarStyleHook }

constructor TSysReBarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  OverrideEraseBkgnd := True;
  OverridePaint := True;
  OverridePaintNC := True;
end;

function TSysReBarStyleHook.GetBandBorder(const Index: Integer): TRect;
begin
  SendMessage(Handle, RB_GETBANDBORDERS, Index, IntPtr(@Result));
end;

function TSysReBarStyleHook.GetBandCount: Integer;
begin
  Result := SendMessage(Handle, RB_GETBANDCOUNT, 0, 0);
end;

function TSysReBarStyleHook.GetBandRect(const Index: Integer): TRect;
begin
  Result := Rect(0, 0, 0, 0);
  SendMessage(Handle, RB_GETRECT, Index, IntPtr(@Result));
end;

function SizeOfReBarBandInfo: Integer;
var
  ReBarBandInfo: TReBarBandInfo;
begin
  ZeroMemory(@ReBarBandInfo, sizeof(ReBarBandInfo));
  if GetSysComCtlVersion >= $60001 then
    Result := sizeof(TReBarBandInfo)
  else
    // Platforms prior to Vista do not support the fields rcChevronLocation & uChevronState
    Result := sizeof(ReBarBandInfo) - sizeof(ReBarBandInfo.rcChevronLocation) - sizeof(ReBarBandInfo.uChevronState);
end;

function TSysReBarStyleHook.GetBandText(const Index: Integer): string;
const
  BufSize = 255;
var
  Info: TReBarBandInfo;
  Buffer: array [0 .. BufSize - 1] of Char;
begin
  FillChar(Info, sizeof(Info), 0);
  Info.cbSize := SizeOfReBarBandInfo;
  // Size differs depending on OS and ComCtl32.dll version
  Info.fMask := RBBIM_TEXT;
  Info.lpText := @Buffer;
  Info.cch := BufSize;
  if BOOL(SendMessage(Handle, RB_GETBANDINFO, Index, IntPtr(@Info))) then
    Result := Info.lpText
  else
    Result := '';
end;

procedure TSysReBarStyleHook.Paint(Canvas: TCanvas);
var
  i: Integer;
  R, Margin, LTextRect: TRect;
  S: string;
  Details: TThemedElementDetails;
begin
  for i := 0 to GetBandCount - 1 do
  begin
    R := GetBandRect(i);
    Margin := GetBandBorder(i);
    InflateRect(R, 1, 1);
    if R.Top < 0 then
      R.Top := 0;
    if R.Left < 0 then
      R.Left := 0;
    if R.Right > SysControl.ClientRect.Right then
      R.Right := SysControl.ClientRect.Right;
    if R.Bottom > SysControl.ClientRect.Bottom then
      R.Bottom := SysControl.ClientRect.Bottom;
    { band }
    Details := StyleServices.GetElementDetails(trBand);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
    { text }
    LTextRect := Rect(R.Left + 10, R.Top, R.Left + Margin.Left, R.Bottom);

    S := GetBandText(i);
    if S <> '' then
      DrawControlText(Canvas, Details, S, LTextRect, DT_CENTER or DT_VCENTER or DT_SINGLELINE);

    { gripper }
    R := Rect(R.Left + 2, R.Top + 2, R.Left + 6, R.Bottom - 2);
    Details := StyleServices.GetElementDetails(trGripper);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
end;

procedure TSysReBarStyleHook.PaintBackground(Canvas: TCanvas);
var
  LRect: TRect;
  LDetails: TThemedElementDetails;
begin
  LRect := Rect(0, 0, SysControl.ClientWidth, SysControl.ClientHeight);
  InflateRect(LRect, 2, 2);
  LDetails.Element := teToolBar;
  LDetails.Part := 0;
  if StyleServices.HasTransparentParts(LDetails) then
    StyleServices.DrawParentBackground(Handle, Canvas.Handle, LDetails, False);
  StyleServices.DrawElement(Canvas.Handle, LDetails, LRect);
end;

procedure TSysReBarStyleHook.PaintNC(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
begin
  ExcludeClipRect(Canvas.Handle, 2, 2, SysControl.Width - 2, SysControl.Height - 2);
  Canvas.Brush.Color := StyleServices.ColorToRGB(clBtnFace);
  Canvas.FillRect(Rect(0, 0, SysControl.Width, SysControl.Height));
  LDetails.Element := teToolBar;
  LDetails.Part := 0;
  StyleServices.DrawElement(Canvas.Handle, LDetails, Rect(0, 0, SysControl.Width, SysControl.Height));
end;

procedure TSysReBarStyleHook.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_SIZE:
      begin
        CallDefaultProc(Message);
        Invalidate;
        Handled := True;
      end;
  else inherited;
  end;
end;

{ TSysStatusBarStyleHook }

constructor TSysStatusBarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  OverridePaint := True;
  // DoubleBuffered := True;
end;

procedure TSysStatusBarStyleHook.Paint(Canvas: TCanvas);
const
  AlignStyles: array [TAlignment] of Integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  R, R1: TRect;
  Res, Count, i: Integer;
  Idx, Flags: Cardinal;
  Details: TThemedElementDetails;
  LText: string;
  Borders: array [0 .. 2] of Integer;
begin
  Details := StyleServices.GetElementDetails(tsStatusRoot);
  StyleServices.DrawElement(Canvas.Handle, Details, Rect(0, 0, SysControl.Width, SysControl.Height));

  if SendMessage(Handle, SB_ISSIMPLE, 0, 0) > 0 then
  begin
    R := SysControl.ClientRect;
    FillChar(Borders, sizeof(Borders), 0);
    SendMessage(Handle, SB_GETBORDERS, 0, IntPtr(@Borders));
    R.Left := Borders[0] + Borders[2];
    R.Top := Borders[1];
    R.Bottom := R.Bottom - Borders[1];
    R.Right := R.Right - Borders[2];

    Details := StyleServices.GetElementDetails(tsPane);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R1 := SysControl.ClientRect;
    R1.Left := R1.Right - R.Height;
    Details := StyleServices.GetElementDetails(tsGripper);
    StyleServices.DrawElement(Canvas.Handle, Details, R1);
    Details := StyleServices.GetElementDetails(tsPane);
    SetLength(LText, Word(SendMessage(Handle, SB_GETTEXTLENGTH, 0, 0)));
    if Length(LText) > 0 then
    begin
      SendMessage(Handle, SB_GETTEXT, 0, IntPtr(@LText[1]));
      Flags := SysControl.DrawTextBiDiModeFlags(DT_LEFT);
      DrawControlText(Canvas, Details, LText, R, Flags);
    end;
  end
  else
  begin
    Count := SendMessage(Handle, SB_GETPARTS, 0, 0);
    for i := 0 to Count - 1 do
    begin
      R := Rect(0, 0, 0, 0);
      SendMessage(Handle, SB_GETRECT, i, IntPtr(@R));
      if IsRectEmpty(R) then
        Exit;
      Details := StyleServices.GetElementDetails(tsPane);
      StyleServices.DrawElement(Canvas.Handle, Details, R);
      if i = Count - 1 then
      begin
        R1 := SysControl.ClientRect;
        R1.Left := R1.Right - R.Height;
        Details := StyleServices.GetElementDetails(tsGripper);
        StyleServices.DrawElement(Canvas.Handle, Details, R1);
      end;
      Details := StyleServices.GetElementDetails(tsPane);
      InflateRect(R, -1, -1);

      Flags := SysControl.DrawTextBiDiModeFlags(DT_LEFT);
      Idx := i;
      SetLength(LText, Word(SendMessage(Handle, SB_GETTEXTLENGTH, Idx, 0)));
      if Length(LText) > 0 then
      begin
        Res := SendMessage(Handle, SB_GETTEXT, Idx, IntPtr(@LText[1]));
        if (Res and SBT_OWNERDRAW = 0) then
          DrawControlText(Canvas, Details, LText, R, Flags);
      end;
    end;
  end;
end;

procedure TSysStatusBarStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;

{ TSysTrackBarStyleHook }

constructor TSysTrackBarStyleHook.Create(AHandle: THandle);
begin
  inherited;
  OverridePaint := True;
  // OverrideEraseBkgnd :=True;
  DoubleBuffered := True;
  FThumbPressed := False;
end;

procedure TSysTrackBarStyleHook.Paint(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
  TrackBarStyle: Cardinal;
  LThemedTrackBar: TThemedTrackBar;
  i, TickCount, TickStart, TickEnd, TickPos: Integer;
  LRect: TRect;
  LRect2: TRect;
  LThumbRect: TRect;
begin
  if not StyleServices.Available then
    Exit;

  LThemedTrackBar := ttbTrackBarDontCare;
  { Track }
  TrackBarStyle := GetWindowLong(Handle, GWL_STYLE);
  SendMessage(Handle, TBM_GETCHANNELRECT, 0, IntPtr(@LRect));
  if TrackBarStyle and TBS_VERT = 0 then
  begin
    LDetails := StyleServices.GetElementDetails(ttbTrack);
    StyleServices.DrawElement(Canvas.Handle, LDetails, LRect);
  end
  else
  begin
    LRect2 := LRect;
    LRect.Left := LRect2.Top;
    LRect.Top := LRect2.Left;
    LRect.Right := LRect2.Bottom;
    LRect.Bottom := LRect2.Right;
    LDetails := StyleServices.GetElementDetails(ttbTrackVert);
    StyleServices.DrawElement(Canvas.Handle, LDetails, LRect);
  end;

  SendMessage(Handle, TBM_GETCHANNELRECT, 0, IntPtr(@LRect));
  SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@LThumbRect));

  // Ticks
  if TrackBarStyle and TBS_NOTICKS = 0 then
  begin
    TickCount := SendMessage(Handle, TBM_GETNUMTICS, 0, 0);

    Canvas.Pen.Color := StyleServices.ColorToRGB(clBtnText);

    // First
    if TrackBarStyle and TBS_VERT = 0 then
    begin
      TickPos := LRect.Left + LThumbRect.Width div 2;
      if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, LRect.Top - 7);
        Canvas.LineTo(TickPos, LRect.Top - 3);
      end;
      if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, LRect.Bottom + 3);
        Canvas.LineTo(TickPos, LRect.Bottom + 7);
      end;
      TickStart := TickPos;
    end
    else
    begin
      TickPos := LRect.Left + LThumbRect.Height div 2;
      if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(LRect.Top - 7, TickPos);
        Canvas.LineTo(LRect.Top - 3, TickPos);
      end;
      if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(LRect.Bottom + 3, TickPos);
        Canvas.LineTo(LRect.Bottom + 7, TickPos);
      end;
      TickStart := TickPos;
    end;
    // last
    if TrackBarStyle and TBS_VERT = 0 then
    begin
      TickPos := LRect.Right - LThumbRect.Width div 2;
      if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, LRect.Top - 7);
        Canvas.LineTo(TickPos, LRect.Top - 3);
      end;
      if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(TickPos, LRect.Bottom + 3);
        Canvas.LineTo(TickPos, LRect.Bottom + 7);
      end;
      TickEnd := TickPos;
    end
    else
    begin
      TickPos := LRect.Right - LThumbRect.Height div 2;
      if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(LRect.Top - 7, TickPos);
        Canvas.LineTo(LRect.Top - 3, TickPos);
      end;
      if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
      begin
        Canvas.MoveTo(LRect.Bottom + 3, TickPos);
        Canvas.LineTo(LRect.Bottom + 7, TickPos);
      end;
      TickEnd := TickPos;
    end;
    // ticks
    for i := 1 to TickCount - 1 do
    begin
      TickPos := TickStart + Round((TickEnd - TickStart) * (i / (TickCount - 1)));
      if TrackBarStyle and TBS_VERT = 0 then
      begin
        if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(TickPos, LRect.Top - 6);
          Canvas.LineTo(TickPos, LRect.Top - 3);
        end;
        if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(TickPos, LRect.Bottom + 3);
          Canvas.LineTo(TickPos, LRect.Bottom + 6);
        end;
      end
      else
      begin
        if (TrackBarStyle and TBS_TOP = TBS_TOP) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(LRect.Top - 6, TickPos);
          Canvas.LineTo(LRect.Top - 3, TickPos);
        end;
        if (TrackBarStyle and TBS_TOP = 0) or (TrackBarStyle and TBS_BOTH = TBS_BOTH) then
        begin
          Canvas.MoveTo(LRect.Bottom + 3, TickPos);
          Canvas.LineTo(LRect.Bottom + 6, TickPos);
        end;
      end;
    end;
  end;

  // Thumb
  if TrackBarStyle and TBS_NOTHUMB = 0 then
  begin
    SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@LRect));
    if not SysControl.Enabled then
    begin
      if TrackBarStyle and TBS_VERT = 0 then
      begin
        if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbDisabled
        else if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbTopDisabled
        else if TrackBarStyle and TBS_BOTTOM = TBS_BOTTOM then
          LThemedTrackBar := ttbThumbBottomDisabled;
      end
      else
      begin
        LThemedTrackBar := ttbThumbRightDisabled;
        if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbLeftDisabled
        else if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbVertDisabled;
      end;
    end
    else if FThumbPressed then
    begin
      if TrackBarStyle and TBS_VERT = 0 then
      begin
        if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbPressed
        else if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbTopPressed
        else if TrackBarStyle and TBS_BOTTOM = TBS_BOTTOM then
          LThemedTrackBar := ttbThumbBottomPressed;
      end
      else
      begin
        LThemedTrackBar := ttbThumbRightPressed;
        if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbLeftPressed
        else if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbVertPressed;
      end;
    end
    else if FMouseOnThumb then
    begin
      if TrackBarStyle and TBS_VERT = 0 then
      begin
        if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbHot
        else if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbTopHot
        else if TrackBarStyle and TBS_BOTTOM = TBS_BOTTOM then
          LThemedTrackBar := ttbThumbBottomHot;
      end
      else
      begin
        LThemedTrackBar := ttbThumbRightHot;
        if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbLeftHot
        else if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbVertHot;
      end;
    end
    else
    begin
      if TrackBarStyle and TBS_VERT = 0 then
      begin
        if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbNormal
        else if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbTopNormal
        else if TrackBarStyle and TBS_BOTTOM = TBS_BOTTOM then
          LThemedTrackBar := ttbThumbBottomNormal;
      end
      else
      begin
        LThemedTrackBar := ttbThumbRightNormal;
        if TrackBarStyle and TBS_TOP = TBS_TOP then
          LThemedTrackBar := ttbThumbLeftNormal
        else if TrackBarStyle and TBS_BOTH = TBS_BOTH then
          LThemedTrackBar := ttbThumbVertNormal;
      end;
    end;

    LDetails := StyleServices.GetElementDetails(LThemedTrackBar);
    StyleServices.DrawElement(Canvas.Handle, LDetails, LRect);
  end;

  if Focused then
    Canvas.DrawFocusRect(Rect(0, 0, SysControl.Width, SysControl.Height));
end;

procedure TSysTrackBarStyleHook.PaintBackground(Canvas: TCanvas);
var
  LDetails: TThemedElementDetails;
begin
  LDetails.Element := teTrackBar;
  StyleServices.DrawParentBackground(Handle, Canvas.Handle, LDetails, False);
end;

procedure TSysTrackBarStyleHook.WndProc(var Message: TMessage);
var
  LRect: TRect;
  NewValue: Boolean;
begin
  // Addlog(Format('TSysTrackBarStyleHook $0x%x %s', [SysControl.Handle, WM_To_String(Message.Msg)]));

  case Message.Msg of
    // WM_KEYUP,
    WM_VSCROLL, WM_HSCROLL, TBM_SETPOS:
      begin
        Invalidate;
        // CallDefaultProc(Message);
      end;

    WM_MOUSEMOVE:
      if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
      begin
        SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@LRect));
        NewValue := PtInRect(LRect, Point(TWMMouse(Message).XPos, TWMMouse(Message).YPos));
        if NewValue <> FMouseOnThumb then
        begin
          FMouseOnThumb := NewValue;
          Invalidate;
        end;
      end;
    WM_LBUTTONUP:
      if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
      begin
        FThumbPressed := False;
        Invalidate;
      end;
    WM_LBUTTONDOWN:
      if GetWindowLong(Handle, GWL_STYLE) and TBS_NOTHUMB = 0 then
      begin
        SendMessage(Handle, TBM_GETTHUMBRECT, 0, IntPtr(@LRect));
        if PtInRect(LRect, Point(TWMMouse(Message).XPos, TWMMouse(Message).YPos)) then
          FThumbPressed := True;
        Invalidate;
      end;

  else inherited;
  end;
end;

{ TSysUpDownStyleHook }

constructor TSysUpDownStyleHook.Create(AHandle: THandle);
begin
  inherited;
  OverridePaint := True;
  DoubleBuffered := True;
end;

function TSysUpDownStyleHook.GetOrientation: TSysUDOrientation;
begin
  if SysControl.Style and UDS_HORZ = UDS_HORZ then
    Result := udSysHorizontal
  else
    Result := udSysVertical;
end;

procedure TSysUpDownStyleHook.MouseLeave;
begin
  FMouseOnLeft := False;
  FMouseOnRight := False;
  Invalidate;
end;

procedure TSysUpDownStyleHook.Paint(Canvas: TCanvas);
var
  R: TRect;
  DrawState: TThemedScrollBar;
  Details: TThemedElementDetails;
begin
  if not StyleServices.Available then
    Exit;

  StyleServices.DrawParentBackground(Handle, Canvas.Handle, Details, False);

  if GetOrientation = udSysHorizontal then
  begin
    R := SysControl.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if FLeftPressed then
      DrawState := tsArrowBtnLeftPressed
    else if FMouseOnLeft and MouseInControl then
      DrawState := tsArrowBtnLeftHot
    else
      DrawState := tsArrowBtnLeftNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R := SysControl.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if FRightPressed then
      DrawState := tsArrowBtnRightPressed
    else if FMouseOnRight and MouseInControl then
      DrawState := tsArrowBtnRightHot
    else
      DrawState := tsArrowBtnRightNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end
  else
  begin
    R := SysControl.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if FLeftPressed then
      DrawState := tsArrowBtnUpPressed
    else if FMouseOnLeft and MouseInControl then
      DrawState := tsArrowBtnUpHot
    else
      DrawState := tsArrowBtnUpNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);

    R := SysControl.ClientRect;
    R.Top := R.Bottom - R.Height div 2;

    if FRightPressed then
      DrawState := tsArrowBtnDownPressed
    else if FMouseOnRight and MouseInControl then
      DrawState := tsArrowBtnDownHot
    else
      DrawState := tsArrowBtnDownNormal;

    Details := StyleServices.GetElementDetails(DrawState);
    StyleServices.DrawElement(Canvas.Handle, Details, R);
  end;
end;

procedure TSysUpDownStyleHook.WMLButtonDblClk(var Message: TWMMouse);
var
  R: TRect;
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);
  if GetOrientation = udSysHorizontal then
  begin
    R := SysControl.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := SysControl.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end
  else
  begin
    R := SysControl.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := SysControl.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end;
  Invalidate;
  Handled := True;
end;

procedure TSysUpDownStyleHook.WMLButtonDown(var Message: TWMMouse);
var
  R: TRect;
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);

  if GetOrientation = udSysHorizontal then
  begin
    R := SysControl.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := SysControl.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end
  else
  begin
    R := SysControl.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FLeftPressed := True
    else
      FLeftPressed := False;

    R := SysControl.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FRightPressed := True
    else
      FRightPressed := False;
  end;

  Invalidate;
  Handled := True;
end;

procedure TSysUpDownStyleHook.WMLButtonUp(var Message: TWMMouse);
begin
  SetRedraw(False);
  CallDefaultProc(TMessage(Message));
  SetRedraw(True);
  FLeftPressed := False;
  FRightPressed := False;
  Invalidate;
  Handled := True;
end;

procedure TSysUpDownStyleHook.WMMouseMove(var Message: TWMMouse);
var
  R: TRect;
  FOldMouseOnLeft, FOldMouseOnRight: Boolean;
begin
  inherited;
  CallDefaultProc(TMessage(Message));

  FOldMouseOnLeft := FMouseOnLeft;
  FOldMouseOnRight := FMouseOnRight;

  if GetOrientation = udSysHorizontal
   then
  begin
    R := SysControl.ClientRect;
    R.Right := R.Left + R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnLeft := True
    else
      FMouseOnLeft := False;

    R := SysControl.ClientRect;
    R.Left := R.Right - R.Width div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnRight := True
    else
      FMouseOnRight := False;
  end
  else
  begin
    R := SysControl.ClientRect;
    R.Bottom := R.Top + R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnLeft := True
    else
      FMouseOnLeft := False;

    R := SysControl.ClientRect;
    R.Top := R.Bottom - R.Height div 2;
    if R.Contains(Point(Message.XPos, Message.YPos)) then
      FMouseOnRight := True
    else
      FMouseOnRight := False;
  end;

  if (FOldMouseOnLeft <> FMouseOnLeft) and (FOldMouseOnRight <> FMouseOnRight) then
    Invalidate;

  Handled := True;
end;

procedure TSysUpDownStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;



{ TSysLinkStyleHook }
{
Debug Output: TSysLinkStyleHook WM_WINDOWPOSCHANGING Process ThemedSysControls.exe (1800)
Debug Output: TSysLinkStyleHook WM_NCCALCSIZE Process ThemedSysControls.exe (1800)
Debug Output: TSysLinkStyleHook WM_CHILDACTIVATE Process ThemedSysControls.exe (1800)
Debug Output: TSysLinkStyleHook WM_WINDOWPOSCHANGED Process ThemedSysControls.exe (1800)
Debug Output: TSysLinkStyleHook Unknown(067C) Process ThemedSysControls.exe (1800)
}
constructor TSysLinkStyleHook.Create(AHandle: THandle);
var
  Style: DWORD;
begin
  Style := GetWindowLongPtr(AHandle, GWL_STYLE);
  if (Style and SS_ICON <> SS_ICON) and (Style and SS_BITMAP <> SS_BITMAP) then
  inherited;
  StyleElements := [seFont, seBorder, seClient];
  UpdateColors;
end;

procedure TSysLinkStyleHook.Paint(Canvas: TCanvas);
const
  States: array [Boolean] of TThemedTextLabel = (ttlTextLabelDisabled,
    ttlTextLabelNormal);
var
  LDetails: TThemedElementDetails;
  LRect: TRect;
  s : string;
begin
  LRect := SysControl.ClientRect;
  if GetBkMode(Canvas.Handle) = TRANSPARENT then
  begin
    LDetails := StyleServices.GetElementDetails(tbCheckBoxUncheckedNormal);
    StyleServices.DrawParentBackground(Handle, Canvas.Handle, LDetails, False);
    Canvas.Brush.Style := bsClear;
  end
  else
  begin
    Canvas.Brush.Color := StyleServices.GetStyleColor(scWindow);
    Canvas.FillRect(LRect);
  end;

  LDetails := StyleServices.GetElementDetails(States[SysControl.Enabled]);
  Canvas.Font := SysControl.Font;
  s:=SysControl.Text;
  //OutputDebugString(PChar('Text  '+s));
  DrawText(Canvas.Handle, LDetails, s, LRect, TextFormat);
end;


procedure TSysLinkStyleHook.PaintNC(Canvas: TCanvas);
var
  LRect: TRect;
  LBitMap: TBitmap;
begin
  if IsFrameOrLine then
  begin
    LRect := Rect(0, 0, SysControl.Width, SysControl.Height);
    LBitMap := TBitmap.Create;
    try
      LBitMap.Width := LRect.Width;
      LBitMap.Height := LRect.Height;
      Frame3D(LBitMap.Canvas, LRect, StyleServices.ColorToRGB(clBtnShadow),
        StyleServices.ColorToRGB(clBtnHighLight), 1);
      ExcludeClipRect(Canvas.Handle, 1, 1, SysControl.Width - 1,
        SysControl.Height - 1);
      Canvas.Draw(0, 0, LBitMap);
    finally
      LBitMap.Free;
    end;
  end;
end;

procedure TSysLinkStyleHook.WMNCCalcSize(var Message: TWMNCCalcSize);
begin

end;

procedure TSysLinkStyleHook.WndProc(var Message: TMessage);
begin
  //OutputDebugString(PChar('TSysLinkStyleHook '+WM_To_String(Message.Msg)+' Handle '+IntToHex(SysControl.Handle, 8)));

  case Message.Msg of

//   $067C :
//      begin
//        CallDefaultProc(Message);
//        if SysControl.Visible then
//          Invalidate;
//      end;

    WM_SETTEXT:
      begin
        CallDefaultProc(Message);
        if SysControl.Visible then
          Invalidate;
      end;

    WM_ENABLE:
      if SysControl.Visible then
        Invalidate;

    WM_PAINT:
      begin
        if OverridePaint and StyleServicesEnabled then
        begin
          if (IsText and (Length(SysControl.Text) > 0)) then
            inherited
          else
            CallDefaultProc(Message);
        end
        else
          CallDefaultProc(Message);
      end;

  else
    inherited;
  end;
end;

const
  TTM_ADJUSTRECT = WM_USER + 31;

procedure TSysTooltipsStyleHook.PaintHint(Canvas: TCanvas; TextRect: TRect);

procedure DrawToolTipText(ADC: HDC; AText: String; ARect: TRect);
var
  I: Integer;
  S1, S2: String;
  R: TRect;
  FModify: Boolean;
begin
  if AText = '' then Exit;
  S1 := '';
  S2 := '';
  FModify := False;
  for I := 1 to Length(AText) do
  begin
    S1 := S1 + AText[I];
    R := Rect(0, 0, 0, 0);
    WinApi.Windows.DrawText(ADC, PChar(S1), Length(S1), R, DT_LEFT or DT_CALCRECT or DT_NOPREFIX);
    if (R.Width > ARect.Width) and (AText[I] <> ' ') then
    begin
      FModify := True;
      S2 := S2 + ' ' + AText[I];
      S1 := AText[I];
    end
    else
    begin
      S2 := S2 + AText[I];
      if AText[I] = ' ' then S1 := '';
    end;
  end;
  if FModify then
    WinApi.Windows.DrawText(ADC, PChar(S2), Length(S2), ARect, DT_WORDBREAK or DT_CENTER or DT_NOPREFIX)
  else
    WinApi.Windows.DrawText(ADC, PChar(AText), Length(AText), ARect, DT_LEFT or DT_NOPREFIX);
end;

var
  DC: HDC;
  LDetails: TThemedElementDetails;
  BkColor, GradientStartColor, GradientEndColor, TextColor, LColor: TColor;
  Brush: HBRUSH;
  AText: PChar;
begin
  Canvas.Font := SysControl.Font;
  DC := Canvas.Handle;
  BkColor := $00767676;
  GradientStartColor := clWhite;
  GradientEndColor := $EFE4E3;
  TextColor := $00575757;
  if StyleServices.Enabled then
  begin
    LDetails := StyleServices.GetElementDetails(thHintBalloon);
    if StyleServices.GetElementColor(LDetails, ecBorderColor, LColor) and (LColor <> clNone) then
      BkColor := LColor;
    if StyleServices.GetElementColor(LDetails, ecGradientColor1, LColor) and (LColor <> clNone) then
      GradientStartColor := LColor;
    if StyleServices.GetElementColor(LDetails, ecGradientColor2, LColor) and (LColor <> clNone) then
      GradientEndColor := LColor;
    if StyleServices.GetElementColor(LDetails, ecTextColor, LColor) and (LColor <> clNone) then
      TextColor := LColor;
  end;
  { Draw Tooltips Face }
  GradientFillCanvas(Canvas, GradientStartColor, GradientEndColor, SysControl.ClientRect, gdVertical);
  { Draw Tooltips Border }
  Brush := CreateSolidBrush(BkColor);
  FrameRect(DC, SysControl.ClientRect, Brush);
  DeleteObject(Brush);
  { Draw Tooltips Text }
  SetBkMode(DC, TRANSPARENT);
  SetTextColor(DC, TextColor);
  AText := PChar(SysControl.Text);
  DrawToolTipText(DC, AText, TextRect);
end;

procedure TSysTooltipsStyleHook.WMPaint(var Message: TMessage);
begin
  CallDefaultProc(Message);
  if (GetWindowLong(Handle, GWL_STYLE) and TTS_BALLOON) = TTS_BALLOON then
    Handled := True
  else
    inherited;
end;

procedure TSysTooltipsStyleHook.WndProc(var Message: TMessage);
begin
  inherited;
end;

constructor TSysTooltipsStyleHook.Create(AHandle: THandle);
begin
  inherited;
  StyleElements := [seClient];
end;

procedure TSysTooltipsStyleHook.Paint(Canvas: TCanvas);
Var
  TextRect: TRect;
begin
  { Adjust text rectangle }
  TextRect := SysControl.ClientRect;
  SendMessage(Handle, TTM_ADJUSTRECT, 0, UINT_PTR(@TextRect));
  PaintHint(Canvas, TextRect);
end;

initialization

SubMenuItemInfoArray := nil;

if StyleServices.Available then
begin
  TCustomStyleEngine.RegisterSysStyleHook('#32768', TSysPopupStyleHook);

  TCustomStyleEngine.RegisterSysStyleHook('#32770', TSysDialogStyleHook);

  TCustomStyleEngine.RegisterSysStyleHook('ScrollBar', TSysScrollBarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('Button', TSysButtonStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('Edit', TSysEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('ComboBox', TSysComboBoxStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('ListBox', TSysListBoxStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('ComboLBox', TSysListBoxStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('Static', TSysStaticStyleHook);

  TCustomStyleEngine.RegisterSysStyleHook('ToolbarWindow32', TSysToolbarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('SysListView32', TSysListViewStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('SysTabControl32', TSysTabControlStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('SysTreeView32', TSysTreeViewStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('msctls_progress32', TSysProgressBarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit20A', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit20W', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit30A', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit30W', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit41A', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit41W', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit50A', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RichEdit50W', TSysRichEditStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('RebarWindow32', TSysReBarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('msctls_statusbar32', TSysStatusBarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('msctls_trackbar32', TSysTrackBarStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('msctls_updown32', TSysUpDownStyleHook);
  TCustomStyleEngine.RegisterSysStyleHook('tooltips_class32', TSysTooltipsStyleHook);

end;

finalization

  TCustomStyleEngine.UnRegisterSysStyleHook('#32768', TSysPopupStyleHook);

  TCustomStyleEngine.UnRegisterSysStyleHook('#32770', TSysDialogStyleHook);

  TCustomStyleEngine.UnRegisterSysStyleHook('ScrollBar', TSysScrollBarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('Button', TSysButtonStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('Edit', TSysEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('ComboBox', TSysComboBoxStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('ListBox', TSysListBoxStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('ComboLBox', TSysListBoxStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('Static', TSysStaticStyleHook);

  TCustomStyleEngine.UnRegisterSysStyleHook('ToolbarWindow32', TSysToolbarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('SysListView32', TSysListViewStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('SysTabControl32', TSysTabControlStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('SysTreeView32', TSysTreeViewStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('msctls_progress32', TSysProgressBarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit20A', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit20W', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit30A', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit30W', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit41A', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit41W', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit50A', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RichEdit50W', TSysRichEditStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('RebarWindow32', TSysReBarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('msctls_statusbar32', TSysStatusBarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('msctls_trackbar32', TSysTrackBarStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('msctls_updown32', TSysUpDownStyleHook);
  TCustomStyleEngine.UnRegisterSysStyleHook('tooltips_class32', TSysTooltipsStyleHook);

end.
