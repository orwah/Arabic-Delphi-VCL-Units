{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.ActnCtrls;

interface

uses Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Controls, Vcl.Graphics, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls, System.Contnrs, Vcl.GraphUtil, Vcl.ExtCtrls;

type

 { TMenuResizeActionControl }

  TMenuResizeActionControl = class(TCustomActionControl)
  end;

{ TCustomButtonControl }

  TCustomButtonControl = class(TCustomActionControl)
  private
    FAllowAllUp: Boolean;
    FDown: Boolean;
    FDragging: Boolean;
    FMouseInControl: Boolean;
    FTrackButton: TMouseButton;
    procedure SetDown(Value: Boolean);
    procedure SetAllowAllUp(Value: Boolean);
    procedure UpdateTracking;
    procedure SetFlat(const Value: Boolean);
    procedure SetState(const Value: TButtonState);
  protected
    FFlat: Boolean;
    FState: TButtonState;
    procedure DrawBackground(var PaintRect: TRect); override;
    procedure DrawFrame(ARect: TRect; Down: Boolean); virtual;
    function GetShowShortCut: Boolean; override;
    procedure Loaded; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure Paint; override;
    procedure SetActionClient(Value: TActionClientItem); override;
    procedure SetGlyphLayout(const Value: TButtonLayout); override;
    procedure SetSelected(Value: Boolean); override;
    procedure WMLButtonDblClk(var Message: TWMLButtonDblClk); message WM_LBUTTONDBLCLK;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure DrawLargeGlyph(Location: TPoint); override;
    property MouseInControl: Boolean read FMouseInControl;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CalcBounds; override;
    procedure Click; override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer;
      AHeight: Integer); override;
    property AllowAllUp: Boolean read FAllowAllUp write SetAllowAllUp;
    property Caption;
    property Down: Boolean read FDown write SetDown;
    property Flat: Boolean read FFlat write SetFlat;
    property ShowCaption;
    property ShowShortCut;
    property State: TButtonState read FState write SetState;
    property TrackButton: TMouseButton read FTrackButton write FTrackButton;
  end;

{ TCustomUtilityButton }

  TCustomUtilityButton = class(TCustomButtonControl)
  private
    FArrowSize: Integer;
    FDirection: TScrollDirection;
    FScrollTimer: TTimer;
    FOnClick: TNotifyEvent;
    FRepeatRate: Integer;
    FAutoScroll: Boolean;
    FArrowType: TArrowType;
    procedure SetArrowSize(const Value: Integer);
    procedure SetArrowType(const Value: TArrowType);
    procedure SetDirection(const Value: TScrollDirection);
  protected
    procedure DrawArrows; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X: Integer; Y: Integer); override;
    procedure OnDelay(Sender: TObject);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    property AutoScroll: Boolean read FAutoScroll write FAutoScroll;
    property ArrowSize: Integer read FArrowSize write SetArrowSize;
    property ArrowType: TArrowType read FArrowType write SetArrowType;
    property Color;
    property Direction: TScrollDirection read FDirection write SetDirection;
    property RepeatRate: Integer read FRepeatRate write FRepeatRate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
  end;

{ TCustomToolScrollBtn }

  TCustomToolScrollBtn = class(TCustomUtilityButton)
  protected
    procedure DrawArrows; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure CalcBounds; override;
  end;

{ TCustomDropDownButton }

  TCustomDropDownButton = class(TCustomButtonControl)
  private
    FDroppedDown: Boolean;
    procedure CMMouseleave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure DrawDropDownArrow; virtual;
    procedure DrawFrame(ARect: TRect; Down: Boolean); override;
    function GetDropDownButtonWidth: Integer; virtual;
    function GetPopupClass: TCustomActionBarClass; virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    function MouseOverDropDown: Boolean; virtual;
    procedure Paint; override;
    property DroppedDown: Boolean read FDroppedDown;
  public
    procedure CalcBounds; override;
    procedure Click; override;
    procedure DropDownClick; virtual;
  end;

  TCustomComboControl = class;

  TCustomActionCombo = class(TCustomComboBoxEx)
  private
    FComboControl: TCustomComboControl;
  protected
    procedure BeginAutoDrag; override;
    procedure DragOver(Source: TObject; X: Integer; Y: Integer;
      State: TDragState; var Accept: Boolean); override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWND;
      ComboProc: TWindowProcPtr); override;
    property DragMode;
    property OnClick;
  public
    function DesignWndProc(var Message: TMessage): Boolean; override;
    procedure DragDrop(Source: TObject; X: Integer; Y: Integer); override;
  end;

  TCustomComboControl = class(TCustomActionControl)
  private
    FComboBox: TCustomActionCombo;
  protected
    procedure ComboClick(Sender: TObject);
    procedure SetParent(AParent: TWinControl); override;
    procedure SetActionClient(Value: TActionClientItem); override;
    procedure SetDragMode(Value: TDragMode); override;
    procedure VisibleChanging; override;
    procedure CMVisiblechanged(var Message: TMessage); message CM_VISIBLECHANGED;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CalcBounds; override;
    procedure Click; override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer;
      AHeight: Integer); override;
    property ComboBox: TCustomActionCombo read FComboBox;
  end;

{ TCustomActionDockBar }

  TCustomActionDockBar = class(TCustomActionBar)
  private
    FAllowScrolling: Boolean;
    FDragObject: TDragDockObject;
    FLastItemVisible: Boolean;
    FScrollingRate: Integer;
    FVisibleIndex: Integer;
    function ScrollButtonsVisible: Boolean; inline;
    procedure ScrollDownClickHandler(Sender: TObject);
    procedure ScrollUpClickHandler(Sender: TObject);
    procedure SetAllowScrolling(const Value: Boolean);
    procedure SetVisibleIndex(const Value: Integer);
  protected
    FControlHeightIndexes: array of Integer;
    FScrollDown: TCustomToolScrollBtn;
    FScrollUp: TCustomToolScrollBtn;
    procedure CustomAlignPosition(Control: TControl;
      var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
      AlignInfo: TAlignInfo); override;
    procedure CreateControls; override;
    procedure CreateScrollButtons; virtual;
    procedure DoEndDock(Target: TObject; X: Integer; Y: Integer); override;
    procedure DoStartDock(var DragObject: TDragObject); override;
    procedure DoScrollDown; virtual;
    procedure DoScrollUp; virtual;
    procedure GenerateControlHeightLookup; virtual;
    function GetFloatingDockSiteClass: TWinControlClass; override;
    procedure GetSiteInfo(Client: TControl; var InfluenceRect: TRect;
      MousePos: TPoint; var CanDock: Boolean); override;
    procedure Loaded; override;
    procedure MakeLastItemVisible;
    procedure Resize; override;
    procedure SetOrientation(const Value: TBarOrientation); override;
    procedure SetupScrolling(const Allowed: Boolean); virtual;
    procedure ShowScrollButtons; virtual;
    // Controls the ability to scroll Action Bars that do not fit there
    // client rect. For scrolling to be allowed, Orientation must be set to boTopToBottom
    property AllowScrolling: Boolean read FAllowScrolling write SetAllowScrolling default False;
    // The updating frequency of the Scroll Buttons in milliseconds when the
    // mouse is hovering over them.
    property ScrollingRate: Integer read FScrollingRate write FScrollingRate default 125;
    // The index of the first item that is visible in the Action Bar.
    // When VisibleIndex is 0 then the Scroll Up button is not visible. For any
    // other value, the Scroll Up button is visible.
    property VisibleIndex: Integer read FVisibleIndex write SetVisibleIndex;
  public
    constructor Create(AOwner: TComponent); override;
    function CalcDockedWidth: Integer; virtual;
    procedure Dock(NewDockSite: TWinControl; ARect: TRect); override;
  end;

{ TCustomActionToolBar }

  TCustomToolScrollBtnClass = class of TCustomToolScrollBtn;

  TCustomActionToolBar = class(TCustomActionDockBar)
  private
    FHideLevel: Integer;
    FShadowClr: TColor;
    FHighlightClr: TColor;
    function GetHiddenCount: Integer;
    procedure ScrollBtnClick(Sender: TObject);
  protected
    FHiddenItems: TStack;
    FPopupBar: TCustomActionBar;
    FScrollBtn: TCustomToolScrollBtn;
    procedure AutoSizingChanged; override;
    function CalcButtonWidth: Integer;
    procedure CreateControls; override;
    procedure DisableHiding;
    procedure DrawBackground; override;
    procedure DrawSeparator(const Pos, Offset: Integer); virtual;
    procedure EnableHiding;
    function GetControlClass(AnItem: TActionClientItem): TCustomActionControlClass; override;
    function GetScrollBtnClass: TCustomToolScrollBtnClass; virtual;
    function GetPopupClass: TCustomActionBarClass; virtual;
    procedure HideUnusedItems;
    procedure Reset; override;
    procedure DoScrollBtnClick; virtual;
    procedure SetOrientation(const Value: TBarOrientation); override;
    procedure SetupDropDownBtn; virtual;
    procedure CMColorchanged(var Message: TMessage); message CM_COLORCHANGED;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CalcDockedWidth: Integer; override;
    function CreateControl(AnItem: TActionClientItem): TCustomActionControl; override;
    procedure DoDropCategory(Source: TCategoryDragObject; const X, Y: Integer); override;
    procedure DragDrop(Source: TObject; X: Integer; Y: Integer); override;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer;
      AHeight: Integer); override;
    property HiddenCount: Integer read GetHiddenCount;
  end;

{ TActionToolBar }

  TActionToolBar = class(TCustomActionToolBar)
  public
    property Canvas;
  published
    property ActionManager;
    property Align default alTop;
    property AllowHiding default True;
    property Anchors;
    property BiDiMode;
    property Caption;
    property Color default clBtnFace;
    property ColorMap;
    property Constraints;
    property Cursor;
    property DragCursor;
    property DragKind default dkDock;
    property DragMode;
    property EdgeBorders default [];
    property EdgeInner;
    property EdgeOuter default esNone;
    property Enabled;
    property Font;
    property HorzMargin;
    property HorzSeparator default True;
    property Orientation default boLeftToRight;
    property ParentBiDiMode;
    property ParentBackground default False;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PersistentHotKeys default False;
    property PopupMenu;
    property ShowHint;
    property Spacing;
    property Touch;
    property VertMargin;
    property Visible;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnControlCreated;
    property OnCanResize;
    property OnClick;
    property OnConstrainedResize;
    property OnContextPopup;
    property OnDockDrop;
    property OnDockOver;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetControlClass;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPaint;
    property OnResize;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

const
  // Value used to effectively hide a control from being visible but needs to
  // still participate in control alignment.
  cAlignOffScreen = -99999;

implementation

uses
{$IF DEFINED(CLR)}
  System.Security.Permissions,
{$ENDIF}
  System.SysUtils, Vcl.Forms, Vcl.Consts, Vcl.ActnList, Vcl.ExtActns, Vcl.ActnMenus,
  System.Types, System.UITypes, Vcl.ListActns, Vcl.ActnColorMaps, Vcl.Themes;

{ TCustomButtonControl }

constructor TCustomButtonControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csDoubleClicks, csParentBackground];
  FFlat := True;
  FState := bsUp;
end;

procedure TCustomButtonControl.CalcBounds;
begin
  inherited CalcBounds;
  Width := Width + 1;
end;

procedure TCustomButtonControl.Click;
begin
  SetSelected(True);
  inherited Click;
end;

procedure TCustomButtonControl.CMEnabledChanged(var Message: TMessage);
begin
  UpdateTracking;
  Repaint;
end;

procedure TCustomButtonControl.CMTextChanged(var Message: TMessage);
begin
  if Separator then
  begin
    if Assigned(ActionBar) and
       (ActionBar.Orientation in [boLeftToRight, boRightToLeft]) then
      Width := 8
    else
      Height := 6;
  end
  else
    inherited;
end;

procedure TCustomButtonControl.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if FFlat and not FMouseInControl and Enabled and (GetCapture = 0) then
  begin
    FMouseInControl := True;
    Repaint;
  end;
end;

procedure TCustomButtonControl.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  if FFlat and Enabled then
  begin
    FMouseInControl := False;
    if not IsChecked then
      FState := bsUp;
    FDragging := False;
    Repaint;
  end;
end;

[SecurityPermission(SecurityAction.Assert, UnmanagedCode=True)]
procedure TCustomButtonControl.DrawBackground(var PaintRect: TRect);
const
  BrushStyle: array[Boolean] of TBrushStyle = (bsSolid, bsClear);
begin
  if IsChecked and not MouseInControl then
    Canvas.Brush.Bitmap := AllocPatternBitmap(Canvas.Brush.Color,
      GetHighLightColor(Canvas.Brush.Color));
  inherited;
end;

procedure TCustomButtonControl.DrawFrame(ARect: TRect; Down: Boolean);
begin
end;

function TCustomButtonControl.GetShowShortCut: Boolean;
begin
  Result := False;
end;

procedure TCustomButtonControl.Loaded;
begin
  inherited Loaded;
  if Action <> nil then ActionChange(Action, True);
end;

procedure TCustomButtonControl.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) and Enabled then
  begin
    if not FDown then
    begin
      State := bsDown;
      Invalidate;
    end;
    FDragging := True;
  end;
end;

procedure TCustomButtonControl.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewState: TButtonState;
begin
  inherited MouseMove(Shift, X, Y);
  if FDragging then
  begin
    if not FDown then NewState := bsUp
    else NewState := bsExclusive;
    if (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight) then
      if FDown then
        NewState := bsExclusive
      else
        NewState := bsDown;
    if NewState <> FState then
    begin
      FState := NewState;
      Invalidate;
    end;
  end
  else if not MouseInControl then
    UpdateTracking;
end;

procedure TCustomButtonControl.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  DoClick: Boolean;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FDragging then
  begin
    FDragging := False;
    DoClick := (X >= 0) and (X < ClientWidth) and (Y >= 0) and (Y <= ClientHeight);
    if Assigned(ActionClient) and (ActionClient.Action is TCustomAction) and
       ((TCustomAction(ActionClient.Action).GroupIndex = 0) or
       (TCustomAction(ActionClient.Action).AutoCheck and
       TCustomAction(ActionClient.Action).Checked)) then
    begin
      { Redraw face in-case mouse is captured }
      FState := bsUp;
      FMouseInControl := False;
      if DoClick and not (FState in [bsExclusive, bsDown]) then
        Invalidate;
    end
    else
      if DoClick then
      begin
        SetDown(not FDown);
        if FDown then Repaint;
      end
      else
      begin
        if FDown then FState := bsExclusive;
        Repaint;
      end;
    if DoClick then Click;
    UpdateTracking;
  end;
end;

procedure TCustomButtonControl.Paint;
begin
  inherited Paint;
  if not Separator then
  begin
    Canvas.Pen.Width := 1;
    DrawFrame(ClientRect, IsChecked or (FState = bsDown))
  end;
end;

procedure TCustomButtonControl.SetActionClient(Value: TActionClientItem);
begin
  inherited SetActionClient(Value);
  Enabled := Enabled and Assigned(Value) and not Separator;
end;

procedure TCustomButtonControl.SetAllowAllUp(Value: Boolean);
begin
  if FAllowAllUp <> Value then
    FAllowAllUp := Value;
end;

procedure TCustomButtonControl.SetDown(Value: Boolean);
begin
  if not IsGrouped then Value := False;
  if Value <> FDown then
  begin
    if FDown and (not FAllowAllUp) then Exit;
    FDown := Value;
    if Value then
    begin
      if FState = bsUp then Invalidate;
      FState := bsExclusive
    end
    else
    begin
      FState := bsUp;
      Repaint;
    end;
  end;
end;

procedure TCustomButtonControl.SetFlat(const Value: Boolean);
begin
  if FFlat <> Value then
  begin
    FFlat := Value;
    Invalidate;
  end;
end;

procedure TCustomButtonControl.SetSelected(Value: Boolean);
const
  StateFlag: array[Boolean] of TButtonState = (bsUp, bsDown);
begin
  inherited SetSelected(Value);
//  State := StateFlag[Value];
  FMouseInControl := False;
end;

procedure TCustomButtonControl.SetState(const Value: TButtonState);
begin
  if FState <> Value then
  begin
    FState := Value;
    Invalidate;
  end;
end;

procedure TCustomButtonControl.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  CalcLayout;
end;

procedure TCustomButtonControl.UpdateTracking;
var
  P: TPoint;
begin
  if not (csDestroying in ComponentState) and FFlat and Enabled then
  begin
    GetCursorPos(P);
    FMouseInControl := not (FindDragTarget(P, True) = Self);
    if MouseInControl then
      Perform(CM_MOUSELEAVE, 0, 0)
    else
      Perform(CM_MOUSEENTER, 0, 0);
  end;
end;

procedure TCustomButtonControl.WMLButtonDblClk(var Message: TWMLButtonDblClk);
begin
  inherited;
  if FDown then DblClick;
end;

procedure TCustomButtonControl.SetGlyphLayout(const Value: TButtonLayout);
begin
  inherited;
  Spacing := 4;
end;

procedure TCustomButtonControl.DrawLargeGlyph(Location: TPoint);
var
  NewLocation: TPoint;
begin
  NewLocation := Location;
  if not (csDesigning in ComponentState) and ((FState = bsDown) or IsChecked) then
  begin
    Inc(NewLocation.X);
    Inc(NewLocation.Y);
  end;
  inherited DrawLargeGlyph(NewLocation);
end;

procedure TCustomButtonControl.CMDialogChar(var Message: TCMDialogChar);
begin
{  with Message do
    if IsAccel(CharCode, Caption) and Enabled and Visible and
      (Parent <> nil) and Parent.Showing then
    begin
      Click;
      Result := 1;
    end else}
      inherited;
end;

{ TCustomUtilityButton }

const
  Offset: array[Boolean] of Integer = (0, 1);

constructor TCustomUtilityButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAutoScroll := False;
  FArrowSize := 2;
  FArrowType := atArrows;
  FScrollTimer := TTimer.Create(Self);
  with FScrollTimer do
  begin
    Enabled := False;
    OnTimer := OnDelay;
    Interval := 750;
  end;
end;

destructor TCustomUtilityButton.Destroy;
begin
  FScrollTimer.Free;
  inherited Destroy;
end;

procedure TCustomUtilityButton.Click;
begin
  if Assigned(FOnClick) then
    FOnClick(Self);
end;

procedure TCustomUtilityButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if FAutoScroll then
    FScrollTimer.Enabled := True;
end;

procedure TCustomUtilityButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FScrollTimer.Enabled := False;
end;

procedure TCustomUtilityButton.DrawArrows;
var
  P: TPoint;
  FDown: Boolean;
  FState: TButtonState;
begin
  FState := bsUp;
  FDown := False;
  case FDirection of
    sdUp,
    sdDown : P := Point(Width div 2 - FArrowSize + Offset[FDown],
                        Height div 2 - (FArrowSize div 2) + Offset[FState = bsDown]);
    sdRight,
    sdLeft : P := Point(Width div 2 - FArrowSize div 2 + Offset[FState = bsDown],
                        Height div 2 - FArrowSize + Offset[FState = bsDown]);
  end;
  case FArrowType of
    atSolid : DrawArrow(Canvas, FDirection, P, FArrowSize);
    atArrows: DrawChevron(Canvas, FDirection, P, FArrowSize);
  end;
end;

procedure TCustomUtilityButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    FScrollTimer.Enabled := False;
  inherited MouseDown(Button, Shift, X, Y);
end;

procedure TCustomUtilityButton.OnDelay(Sender: TObject);
begin
  FScrollTimer.Enabled := FAutoScroll;
  if FAutoScroll then
    FScrollTimer.Interval := RepeatRate;
  Click;
end;

procedure TCustomUtilityButton.SetArrowSize(const Value: Integer);
begin
  if FArrowSize <> Value then
  begin
    FArrowSize := Value;
    Invalidate;
  end;
end;

procedure TCustomUtilityButton.SetArrowType(const Value: TArrowType);
begin
  if FArrowType <> Value then
  begin
    FArrowType := Value;
    Invalidate;
  end;
end;

procedure TCustomUtilityButton.SetDirection(const Value: TScrollDirection);
begin
  if FDirection <> Value then
  begin
    FDirection := Value;
    Invalidate;
  end;
end;

procedure TCustomUtilityButton.Paint;
begin
  inherited Paint;
  Canvas.Pen.Color := ActionBar.ColorMap.FontColor;
  DrawArrows;
end;

{ TCustomToolScrollBtn }

procedure TCustomToolScrollBtn.CalcBounds;
begin
 if ActionBar <> nil then
  begin
    if ActionBar.Align in [alTop, alBottom] then
      Height := 13
    else
      Width := 11;
  end
  else
    inherited;
end;

constructor TCustomToolScrollBtn.Create(AOwner: TComponent);
begin
  inherited;
  Hint := SMoreButtons;
end;

procedure TCustomToolScrollBtn.DrawArrows;
const
  ArrowDirection: array[TAlign] of TScrollDirection = (sdDown, sdUp,
    sdDown, sdDown, sdDown, sdDown, sdDown);
var
  P: TPoint;
  TempCanvas: TCanvas;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  case FDirection of
    sdUp,
    sdDown : P := Point(Width div 2 - FArrowSize, 3);
    sdRight,
    sdLeft : P := Point(Width div 2 - FArrowSize div 2, 3);
  end;
  TempCanvas := TCanvas.Create;
  TempCanvas.Handle := Canvas.Handle;
  try
   if TStyleManager.IsCustomStyleActive then
    begin
      if not Enabled then
        LDetails := StyleServices.GetElementDetails(ttbButtonDisabled)
      else
      if Self.FDown then
        LDetails := StyleServices.GetElementDetails(ttbButtonPressed)
      else
      if FMouseInControl then
        LDetails := StyleServices.GetElementDetails(ttbButtonHot)
      else
        LDetails := StyleServices.GetElementDetails(ttbButtonNormal);
      if not StyleServices.GetElementColor(LDetails, ecTextColor, LColor) then
        if Enabled then
          LColor := StyleServices.GetSystemColor(clBtnText)
        else
          LColor := StyleServices.GetSystemColor(clGrayText);
      TempCanvas.Pen.Color := LColor;
    end
    else
    if Enabled then
      TempCanvas.Pen.Color := ActionBar.ColorMap.FontColor
    else
      TempCanvas.Pen.Color := ActionBar.ColorMap.DisabledFontColor;
    if Parent is TCustomActionToolBar then
      if TCustomActionToolBar(Parent).HiddenCount > 0 then
       DrawChevron(TempCanvas, Direction, P, FArrowSize);
    DrawArrow(TempCanvas, ArrowDirection[Align], Point(Width div 2 - FArrowSize, Height - 8), 2);
  finally
    TempCanvas.Handle := 0;
    TempCanvas.Free;
  end;
end;

{ TCustomDropDownButton }

procedure TCustomDropDownButton.CalcBounds;
begin
  inherited CalcBounds;
  Width := Width + GetDropDownButtonWidth;
end;

procedure TCustomDropDownButton.Click;
begin
  if MouseOverDropDown then
    DropDownClick
  else
    inherited Click;
end;

procedure TCustomDropDownButton.CMMouseleave(var Message: TMessage);
begin
  inherited;
  FDroppedDown := False;
end;

procedure TCustomDropDownButton.DrawDropDownArrow;
var
  TempCanvas: TCanvas;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  TempCanvas := TCanvas.Create;
  TempCanvas.Handle := Canvas.Handle;
  try
    if TStyleManager.IsCustomStyleActive then
    begin
      if not Enabled then
        LDetails := StyleServices.GetElementDetails(ttbButtonDisabled)
      else
      if FDroppedDown then
        LDetails := StyleServices.GetElementDetails(ttbButtonPressed)
      else
      if FMouseInControl then
        LDetails := StyleServices.GetElementDetails(ttbButtonHot)
      else
        LDetails := StyleServices.GetElementDetails(ttbButtonNormal);

      if not StyleServices.GetElementColor(LDetails, ecTextColor, LColor) then
        if Enabled then
          LColor := StyleServices.GetSystemColor(clBtnText)
        else
          LColor := StyleServices.GetSystemColor(clGrayText);
      TempCanvas.Pen.Color := LColor;
    end
    else
    if Enabled then
      TempCanvas.Pen.Color := ActionBar.ColorMap.FontColor
    else
      TempCanvas.Pen.Color := ActionBar.ColorMap.DisabledFontColor;

  //orwah
//  if bidimode=bdrighttoleft then
//  begin
//      DrawArrow(TempCanvas, sdDown,
//      Point((3+ GetDropDownButtonWidth div 2) ,
//            ClientHeight div 2 - 1), 2);
//  end
//  else
  begin
    DrawArrow(TempCanvas, sdDown,
      Point((ClientWidth - GetDropDownButtonWidth div 2) - 3,
            ClientHeight div 2 - 1), 2);
  end;
  finally
    TempCanvas.Handle := 0;
    TempCanvas.Free;
  end;
end;

procedure TCustomDropDownButton.DrawFrame(ARect: TRect; Down: Boolean);
begin
  Dec(ARect.Right, 9);
  inherited DrawFrame(ARect, Down and not MouseOverDropDown);
  ARect.Left := ARect.Right;
  Inc(ARect.Right, 9);
  inherited DrawFrame(ARect, Down or FDroppedDown);
end;

procedure TCustomDropDownButton.DropDownClick;
var
  Popup: TCustomActionPopupMenu;
  P: TPoint;
begin
  Popup := GetPopupClass.Create(nil) as TCustomActionPopupMenu;
  try
    Popup.ActionClient := ActionClient;
    P := ClientToScreen(Point(Left, Height + 1));
    Popup.ParentControl := Self;
    FDroppedDown := True;
    try
      Flat := False;
      Popup.ColorMap := ActionBar.ColorMap;

   //orwah
   if bidimode = bdrighttoleft  then
    begin
     Popup.Popup(P.X - Left - Popup.width+width, P.Y);
    end
    else
    begin
      Popup.Popup(P.X - Left , P.Y);
      end;
    finally
      FDroppedDown := False;
      Flat := True;
    end;
  finally
    Popup.Free;
  end;
end;

function TCustomDropDownButton.GetDropDownButtonWidth: Integer;
begin
  Result := 9; // default drop down button width
end;

function TCustomDropDownButton.GetPopupClass: TCustomActionBarClass;
begin
  with ActionBar.Style as TActionBarStyleEx do
    Result := GetPopupClass(ActionBar);
end;

procedure TCustomDropDownButton.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if MouseOverDropDown then
    FState := bsUp;
  FDroppedDown := MouseOverDropDown and (Button = mbLeft);
end;

function TCustomDropDownButton.MouseOverDropDown: Boolean;
begin
  Result := System.Types.Rect(ClientWidth - GetDropDownButtonWidth,
    0, ClientWidth, ClientHeight).Contains(ScreenToClient(Mouse.CursorPos));
end;

procedure TCustomDropDownButton.Paint;
begin
  inherited Paint;
  DrawDropDownArrow;
end;

{ TCustomActionBarCombo }

procedure TCustomActionCombo.BeginAutoDrag;
begin
  FComboControl.BeginAutoDrag;
end;

function TCustomActionCombo.DesignWndProc(var Message: TMessage): Boolean;
begin
  Result := inherited DesignWndProc(Message);
  case Message.Msg of
    WM_LBUTTONDOWN:
        Result := True;
  end;
end;

procedure TCustomActionCombo.DragDrop(Source: TObject; X, Y: Integer);
begin
  FComboControl.DoDragDrop(Source, X, Y);
end;

procedure TCustomActionCombo.DragOver(Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Assigned(FComboControl.ActionClient) and (Source is TActionDragObject) or
    (Source is TActionItemDragObject) or (Source is TCategoryDragObject);
end;

{ TCustomComboControl }

constructor TCustomComboControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FComboBox := TCustomActionCombo.Create(Self);
  ComboBox.TabStop := False;
  ComboBox.Width := 100;
  ComboBox.OnClick := ComboClick;
  ComboBox.FComboControl := Self;
  if csDesigning in FComboBox.ComponentState then
    ComboBox.DragMode := dmAutomatic;
end;

destructor TCustomComboControl.Destroy;
begin
  FreeAndNil(FComboBox);
  inherited Destroy;
end;

procedure TCustomComboControl.CalcBounds;
begin
  inherited CalcBounds;
  if ComboBox.HandleAllocated then
    if ShowCaption then
      Width := Width + ComboBox.Width
    else
      Width := ComboBox.Width;
end;

procedure TCustomComboControl.Click;
begin
  if csDesigning in ComponentState then
    SetSelected(True);
  inherited Click;
end;

procedure TCustomComboControl.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  ComboBox.Visible := Visible;
end;

procedure TCustomComboControl.ComboClick(Sender: TObject);
begin
  if Assigned(ActionBar) and not ActionBar.DesignMode then
    Click;
end;

procedure TCustomActionCombo.ComboWndProc(var Message: TMessage;
  ComboWnd: HWND; ComboProc: TWindowProcPtr);
begin
  if DragMode = dmAutomatic then
    case Message.Msg of
      WM_KEYFIRST..WM_KEYLAST: Exit;
    end;
  inherited ComboWndProc(Message, ComboWnd, ComboProc);
end;

procedure TCustomComboControl.Paint;
begin
  inherited Paint;
  if Assigned(ComboBox) and ComboBox.HandleAllocated then
    ComboBox.Invalidate;
end;

procedure TCustomComboControl.SetActionClient(Value: TActionClientItem);
begin
  inherited SetActionClient(Value);
  if Assigned(Value) and (Value.Action <> ComboBox.Action) then
    ComboBox.Action := Value.Action;
end;

procedure TCustomComboControl.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
var
  T: Integer;
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if Assigned(FComboBox) then
  begin
    T := Top + (Height div 2) - (ComboBox.Height div 2);
    if ShowCaption then
      ComboBox.SetBounds(ALeft + TextBounds.Right + 5, T, ComboBox.Width,
        ComboBox.Height)
    else
      ComboBox.SetBounds(ALeft, T, Width, ComboBox.Height);
  end;
  CalcLayout;
end;

procedure TCustomComboControl.SetDragMode(Value: TDragMode);
begin
  inherited SetDragMode(Value);
  ComboBox.DragMode := Value;
end;

procedure TCustomComboControl.SetParent(AParent: TWinControl);
begin
  if Assigned(ComboBox) then
    ComboBox.Parent := AParent;
  inherited SetParent(AParent);
end;

procedure TCustomComboControl.VisibleChanging;
begin
  inherited VisibleChanging;
end;

{ TCustomActionDockBar }

constructor TCustomActionDockBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alNone;
  DragKind := dkDock;
  FLastItemVisible := False;
  FVisibleIndex := 0;
  FAllowScrolling := False;
  FScrollingRate := 125;
  FScrollDown := nil;
  FScrollUp := nil;
end;

function TCustomActionDockBar.CalcDockedWidth: Integer;
var
  Item: TActionClientItem;
begin
  Result := HorzMargin * 2;
  Item := FindFirstVisibleItem;
  while Assigned(Item) do
  begin
    Inc(Result, Item.Control.Width);
    Inc(Result, Spacing);
    Item := FindNextVisibleItem(Item);
  end;
end;


procedure TCustomActionDockBar.CustomAlignPosition(Control: TControl;
  var NewLeft, NewTop, NewWidth, NewHeight: Integer; var AlignRect: TRect;
  AlignInfo: TAlignInfo);
var
  LControl: TCustomActionControl;
begin
  if not ScrollButtonsVisible then
    inherited
  else
  begin
    if not (Control is TCustomActionControl) then
      Exit;
    if AlignInfo.ControlIndex = 0 then
    begin
      AlignRect := Rect(HorzMargin + GetBannerWidth(Vcl.ActnMan.beLeft),
        VertMargin, ClientWidth - VertMargin - GetBannerWidth(Vcl.ActnMan.beRight),
        ClientHeight - VertMargin);
      if VisibleIndex > 0 then
        Inc(AlignRect.Top, FScrollUp.Height + Spacing);
    end;
    LControl := TCustomActionControl(Control);
    if AlignInfo.ControlIndex >= VisibleIndex then
    begin
      NewTop := AlignRect.Top;
      if (NewTop + LControl.Height > ClientHeight - VertMargin) or
        ((AlignInfo.ControlIndex <> Items.Count - 1) and
        (NewTop + LControl.Height > ClientHeight - VertMargin - FScrollDown.Height)) then
      begin
        NewTop := cAlignOffScreen; // Make the control not appear in the client area
      end
      else
        FLastItemVisible := AlignInfo.ControlIndex = Items.Count - 1;
      NewLeft := AlignRect.Left;
      NewWidth := AlignRect.Right;
      Inc(AlignRect.Top, LControl.Height + Spacing);
    end
    else
      NewTop := cAlignOffScreen; // Make the control not appear in the client area
  end;
end;

procedure TCustomActionDockBar.Dock(NewDockSite: TWinControl; ARect: TRect);
var
  NewWidth: Integer;
begin
  inherited Dock(NewDockSite, ARect);
  if Floating then
  begin
    if Assigned(ActionClient) then
      TActionBarItem(ActionClient).AutoSize := True;
    DragMode := dmManual;
  end
  else
  begin
    DragMode := dmManual;
    if Assigned(ActionClient) then
      TActionBarItem(ActionClient).AutoSize := False;
    NewWidth := CalcDockedWidth;
    if NewWidth <> HorzMargin * 2 then
      Width := NewWidth;
    Height := 0;
  end;
end;

// Make sure that SetupScrolling is called once all controls have have been
// created
procedure TCustomActionDockBar.CreateControls;
begin
  inherited;
  SetupScrolling(AllowScrolling and (Orientation = boTopToBottom));
end;

// Create the buttons that become visible when the available action bar
// is not capable of displaying all items within its Height.
// The following properties values must be set for scrolling
//
//   AutoSize = False
//   AllowScrolling = False (Default value)
//   Orientation = boTopToBottom
procedure TCustomActionDockBar.CreateScrollButtons;
var
  LClass: TCustomToolScrollBtnClass;
begin
  // Free any previous instances of the Scroll up and down buttons. This is
  // to make sure that a Style change from the ActionManager is reflected in
  // the scroll button class used.
  FreeAndNil(FScrollDown);
  FreeAndNil(FScrollUp);
  LClass := (Style as TActionBarStyleEx).GetScrollBtnClass;
  FScrollDown := LClass.Create(Self);
  FScrollDown.Parent := Self;
  FScrollDown.Align := alBottom;
  FScrollDown.Height := 13;
  FScrollDown.AutoScroll := FScrollingRate > 0;
  FScrollDown.Direction := sdDown;
  FScrollDown.RepeatRate := FScrollingRate;
  FScrollDown.Visible := False;
  FScrollDown.OnClick := ScrollDownClickHandler;
  FScrollUp := LClass.Create(Self);
  FScrollUp.Parent := Self;
  FScrollUp.Align := alTop;
  FScrollUp.Height := 13;
  FScrollUp.AutoScroll := FScrollingRate > 0;
  FScrollUp.Direction := sdUp;
  FScrollUp.RepeatRate := FScrollingRate;
  FScrollUp.Visible := False;
  FScrollUp.OnClick := ScrollUpClickHandler;
end;

procedure TCustomActionDockBar.DoEndDock(Target: TObject; X, Y: Integer);
begin
  inherited;
  FDragObject.Free;
  FDragObject := nil;
end;

procedure TCustomActionDockBar.DoStartDock(var DragObject: TDragObject);
begin
  inherited;
  FDragObject := TToolDockObject.Create(Self);
  DragObject := FDragObject;
end;

procedure TCustomActionDockBar.DoScrollDown;
begin
  // Sanity test to make sure there is no further scrolling of the action
  // bar once the last control is visible
  if not FLastItemVisible then
    VisibleIndex := VisibleIndex + 1;
end;

procedure TCustomActionDockBar.DoScrollUp;
begin
  VisibleIndex := VisibleIndex - 1;
end;

procedure TCustomActionDockBar.GetSiteInfo(Client: TControl;
  var InfluenceRect: TRect; MousePos: TPoint; var CanDock: Boolean);
begin
  inherited GetSiteInfo(Client, InfluenceRect, MousePos, CanDock);
  CanDock := CanDock and
    ((Client is TCustomActionControl) or (Client is TSpeedButton));
end;

procedure TCustomActionDockBar.Loaded;
var
  I: Integer;
begin
  { Make sure we dock controls after streaming }
  for I := 0 to ControlCount - 1 do
    Controls[I].HostDockSite := Self;
  inherited Loaded;
end;

// Scrolls the menu so that the last item in the action bar is shown.
// Only valid when AllowScrolling is True
procedure TCustomActionDockBar.MakeLastItemVisible;
var
  LIdx: Integer;
  LBarHeight: Integer;
begin
  LIdx := high(FControlHeightIndexes);
  // Store the height required to show the entire action bar
  LBarHeight := FControlHeightIndexes[LIdx] + Items[LIdx].Control.Height;
  // Loop through the control heights until we find the index of the control
  // that will overflow the available client area. Once this index is known
  // increment the index by one, since the previous control index would
  // overflow the client area
  while LBarHeight - FControlHeightIndexes[LIdx] < ClientHeight do
    Dec(LIdx);
  VisibleIndex := LIdx + 1;
end;

procedure TCustomActionDockBar.GenerateControlHeightLookup;
var
  I: Integer;
  LHeight: Integer;
  LCtrlHeight: Integer;
begin
  if HasItems then
  begin
    SetLength(FControlHeightIndexes, Items.Count);
    LHeight := 0;
    for I := 0 to Items.Count - 1 do
    begin
      if Items[I].Control <> nil then
      begin
        LCtrlHeight := Items[I].Control.Height;
        FControlHeightIndexes[I] := LHeight;
        Inc(LHeight, LCtrlHeight + Spacing);
      end;
    end;
    FControlHeightIndexes[Items.Count-1] := LHeight;
  end;
end;

function TCustomActionDockBar.GetFloatingDockSiteClass: TWinControlClass;
begin
  Result := TXToolDockForm;
end;

procedure TCustomActionDockBar.Resize;
begin
  inherited;
  Realign;
  ShowScrollButtons;
end;

function TCustomActionDockBar.ScrollButtonsVisible: Boolean;
begin
  Result := (FScrollDown <> nil) and (FScrollUp <> nil) and
    (FScrollDown.Visible or FScrollUp.Visible);
end;

procedure TCustomActionDockBar.ScrollDownClickHandler(Sender: TObject);
begin
  DoScrollDown;
end;

procedure TCustomActionDockBar.ScrollUpClickHandler(Sender: TObject);
begin
  DoScrollUp;
end;

procedure TCustomActionDockBar.SetAllowScrolling(const Value: Boolean);
begin
  if FAllowScrolling <> Value then
  begin
    FAllowScrolling := Value;
    SetupScrolling(FAllowScrolling and (Orientation = boTopToBottom));
  end;
end;

// Make sure SetupScrolling is called when the orientation of the Action Bar
// is changed
procedure TCustomActionDockBar.SetOrientation(const Value: TBarOrientation);
begin
  inherited;
  SetupScrolling(FAllowScrolling and (Orientation = boTopToBottom));
end;

// If the Allowed paramter is True
//
// Creates the buttons required for doing the scrolling and initializes them
// by calling the CreateScrollButtons method.
// Also generates the internal lookup required for doing the scrolling and also
// makes sure that the correct scroll buttons are visible.
//
// When the Allowed parameter is False, the scroll buttons and
// the internal lookup list are destroyed
procedure TCustomActionDockBar.SetupScrolling(const Allowed: Boolean);
begin
  if Allowed then
  begin
    CreateScrollButtons;
    GenerateControlHeightLookup;
    ShowScrollButtons;
  end
  else
  begin
    SetLength(FControlHeightIndexes, 0);
    FreeAndNil(FScrollUp);
    FreeAndNil(FScrollDown);
  end;
end;

// Sets the control that appears at the VisibleIndex value to the top of
// the action bar
procedure TCustomActionDockBar.SetVisibleIndex(const Value: Integer);
begin
  if FVisibleIndex <> Value then
  begin
    FVisibleIndex := Value;
    Realign;
    ShowScrollButtons;
  end;
end;

// Makes the necessary scroll buttons visible
//
// The scroll up button is visible if the first item visible is not the first
// item in the list
//
// The scroll down button is visible if the last item in the list is not
// visible  
procedure TCustomActionDockBar.ShowScrollButtons;
var
  LIdealHeight: Integer;
begin
  if (Items <> nil) and (High(FControlHeightIndexes) > -1) and
    (High(FControlHeightIndexes) = Items.Count - 1) then
  begin
    LIdealHeight := FControlHeightIndexes[Items.Count-1];
    // Need to also test if scroll down is last item is visible
    FScrollDown.Visible := (Height - (2 * VertMargin) < LIdealHeight) and not FLastItemVisible;
    FScrollUp.Visible := (VisibleIndex > 0);
  end;
end;

{ TCustomActionToolBar }

constructor TCustomActionToolBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alTop;
  Height := 29;
  HorzMargin := 1;
  EdgeBorders := [];
  EdgeInner := esRaised;
  EdgeOuter := esNone;
  HorzSeparator := True;
  VertSeparator := True;
end;

destructor TCustomActionToolBar.Destroy;
begin
  FHiddenItems.Free;
  if Assigned(FScrollBtn) then
    FreeAndNil(FScrollBtn);
  inherited Destroy;
end;

procedure TCustomActionToolBar.AutoSizingChanged;
begin
  inherited;
  if not AutoSizing then
    SetupDropDownBtn
  else
  begin
    while Assigned(FHiddenItems) and (FHiddenItems.Count > 0) do
      TCustomActionControl(FHiddenItems.Pop).Visible := True;
    FreeAndNil(FHiddenItems);
    if not DesignMode then
      FreeAndNil(FScrollBtn)
    else
      if Assigned(FScrollBtn) then
        FScrollBtn.Enabled := False;
    Resize;
  end;
end;

function TCustomActionToolBar.CalcButtonWidth: Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to ItemCount - 1 do
    if ActionControls[I].Width > Result then
      Result := ActionControls[I].Width;
end;

function TCustomActionToolBar.CalcDockedWidth: Integer;
begin
  Result := inherited CalcDockedWidth;
  if Assigned(FScrollBtn) then
    Inc(Result, FScrollBtn.Width);
end;

function TCustomActionToolBar.CreateControl(
  AnItem: TActionClientItem): TCustomActionControl;
begin
  Result := inherited CreateControl(AnItem);
  if Result <> nil then
    with Result do
    begin
      Spacing := 3;
      Margins := System.Types.Rect(4, 4, 4, 4);
      if Assigned(Self.ActionClient) then
      begin
        GlyphLayout := TActionBarItem(Self.ActionClient).GlyphLayout;
        SmallIcon := Self.ActionClient.Items.SmallIcons;
      end;
    end;
end;

procedure TCustomActionToolBar.CreateControls;
begin
  FreeAndNil(FScrollBtn);
  SetupDropDownBtn;
  inherited;
end;

procedure TCustomActionToolBar.DisableHiding;
begin
  Inc(FHideLevel);
end;

function TCustomActionToolBar.GetControlClass(
  AnItem: TActionClientItem): TCustomActionControlClass;
begin
  Result := Style.GetControlClass(Self, AnItem)
end;

procedure TCustomActionToolBar.DoDropCategory(Source: TCategoryDragObject;
  const X, Y: Integer);
var
  I: Integer;
  Idx: Integer;
  Ctrl: TCustomActionControl;
begin
  Idx := 0;
  Ctrl := FindNearestControl(Point(X, Y));
  if Assigned(Ctrl) and Assigned(Ctrl.ActionClient) then
    Idx := Ctrl.ActionClient.Index;
  for I := 0 to Source.ActionCount - 1 do
    TActionClientItem(ActionClient.Items.Insert(Idx)).Action := Source.Actions[I];
end;

type
  TItemsStack = class(TStack)
  public
    property List;
  end;

procedure TCustomActionToolBar.DoScrollBtnClick;
var
  AC: TCustomizeActionClientItem;
  I: Integer;
  Pt: TPoint;
begin
  AC := TCustomizeActionClientItem.Create(ActionClient.Items);
  AC.Visible := False;
  for I := 0 to ActionClient.Items.Count - 1 do
  begin
    if Assigned(FHiddenItems) and
       (TItemsStack(FHiddenItems).List.IndexOf(ActionClient.Items[I].Control) <> -1) then
    begin

      with AC.Items.Add do
      begin
        ChangesAllowed := caAllChanges;
        Assign(ActionClient.Items[I]);
        UsageCount := -1;
      end;
    end;
  end;
  FPopupBar := GetPopupClass.Create(Self);
  try
    with FPopupBar as TCustomizeActionToolBar do
    begin
      ColorMap := Self.ColorMap;
      RootMenu := TCustomizeActionToolBar(FPopupBar);
      ParentControl := Self.FScrollBtn;
      Parent := Self;
      ActionClient := AC;
      Expand(True);
      ReAlign;
      case Self.Orientation of
        boBottomToTop: Pt := Self.ClientToScreen(Point(FScrollBtn.Left,
          FScrollBtn.Top - FPopupBar.Height));
        boTopToBottom: Pt := Self.ClientToScreen(Point(FScrollBtn.Left,
          FScrollBtn.Top + FScrollBtn.Height));
        boLeftToRight,
        boRightToLeft: Pt := Self.ClientToScreen(Point(FScrollBtn.Left -
         FPopupBar.Width + FScrollBtn.Width, FScrollBtn.Top + FScrollBtn.Height));
      end;
      Popup(Pt.X, Pt.Y);
    end;
  finally
    FPopupBar.Free;
    FPopupBar := nil;
    AC.Control.Free;
    AC.Free;
    Resize;
  end;
end;

procedure TCustomActionToolBar.DrawBackground;
var
  FirstItem,
  LastItem: TActionClientItem;
  I: Integer;
begin
  if StyleServices.Enabled and not StyleServices.IsSystemStyle then
  begin
    Canvas.Brush.Color := StyleServices.GetSystemColor(clBtnFace);
    Canvas.FillRect(ClientRect);
  end;

  inherited DrawBackground;
  if (ItemCount = 0) or not AutoSizing then Exit;
  FirstItem := FindFirst;
  LastItem := FindLast;
  if not Assigned(FirstItem) or not Assigned(LastItem) or
    not Assigned(FirstItem.Control) or not Assigned(LastItem.Control) or
    (FirstItem.Control.Top = LastItem.Control.Top) then Exit;
  if HorzSeparator and (Orientation in [boLeftToRight, boRightToLeft]) then
    for I := 1 to VRowCount - 1 do
      DrawSeparator(((VertMargin * 2 + LastItem.Control.Height) +
        (I - 1) * (VertMargin * 2 + 2 + LastItem.Control.Height)) + 1, 2);
  if VertSeparator and (Orientation in [boTopToBottom, boBottomToTop]) then
    for I := 1 to HRowCount - 1 do
      DrawSeparator(((HorzMargin * 2 + LastItem.Control.Width) +
        (I - 1) * (HorzMargin * 2 + 2 + LastItem.Control.Width)) + 1, 2);
end;

procedure TCustomActionToolBar.DrawSeparator(const Pos, Offset: Integer);
var
  StartPos: TPoint;
  EndPos: TPoint;
begin
  if Orientation in [boTopToBottom, boBottomToTop] then
  begin     // Vertical bar
    StartPos := Point(Pos - 1, Offset - 1);
    EndPos := Point(Pos - 1, ClientHeight - Offset + 1);
  end
  else
  begin     // Horizontal bar
    StartPos := Point(Offset + GetBannerWidth(beLeft), Pos - 1);
    EndPos := Point(ClientWidth - Offset - GetBannerWidth(beRight), Pos - 1);
  end;
  with Canvas do
  begin
    Pen.Width := 1;
    if StyleServices.Enabled and not StyleServices.IsSystemStyle then
      Pen.Color := StyleServices.GetSystemColor(clBtnShadow)
    else
      Pen.Color := ColorMap.ShadowColor;
    MoveTo(StartPos.X, StartPos.Y);
    LineTo(EndPos.X, EndPos.Y);
    if StyleServices.Enabled and not StyleServices.IsSystemStyle then
      Pen.Color := StyleServices.GetSystemColor(clBtnHighLight)
    else
      Pen.Color := ColorMap.UnusedColor;
    if StartPos.X = EndPos.X then
    begin
      MoveTo(StartPos.X + 1, StartPos.Y);
      LineTo(StartPos.X + 1, EndPos.Y);
    end
    else
    begin
      MoveTo(StartPos.X, StartPos.Y + 1);
      LineTo(EndPos.X, EndPos.Y + 1);
    end;
  end;
end;

procedure TCustomActionToolBar.EnableHiding;
begin
  if FHideLevel > 0 then
  begin
    Dec(FHideLevel);
    if FHideLevel = 0 then
      HideUnusedItems;
  end;
end;

function TCustomActionToolBar.GetHiddenCount: Integer;
begin
  Result := 0;
  if Assigned(FHiddenItems) then
    Result := FHiddenItems.Count;
end;

procedure TCustomActionToolBar.HideUnusedItems;
var
  ScrollBtnBounds: TRect;
  LastItem: TActionClientItem;

  function HideItem(AnItem: TCustomActionControl): Boolean;
  begin
    Result := False;
    if Assigned(AnItem) then
      if LastItem = AnItem.ActionClient then
      begin
        case Orientation of
          boLeftToRight:
            Result := AnItem.BoundsRect.Right >= ScrollBtnBounds.Left;
          boRightToLeft:
            Result := AnItem.Left <= ScrollBtnBounds.Left +
              (ScrollBtnBounds.Right - ScrollBtnBounds.Left);
          boBottomToTop:
            Result := AnItem.Top <= ScrollBtnBounds.Top +
              (ScrollBtnBounds.Bottom - ScrollBtnBounds.Top);
          boTopToBottom:
            Result := AnItem.BoundsRect.Bottom >= ScrollBtnBounds.Top;
        end;
        Result := Result and AnItem.ActionClient.Visible;
      end
      else
        case Orientation of
          boLeftToRight:
            Result := LastItem.Control.BoundsRect.Right + Spacing + AnItem.Width >
              ClientWidth - HorzMargin - GetBannerWidth(beRight) -
                (ScrollBtnBounds.Right - ScrollBtnBounds.Left);
          boRightToLeft:
            Result := AnItem.Width > LastItem.Control.Left - Spacing -
              (ScrollBtnBounds.Left + (ScrollBtnBounds.Right - ScrollBtnBounds.Left));
          boBottomToTop:
            Result := AnItem.Height > LastItem.Control.Top - Spacing -
              (ScrollBtnBounds.Top + (ScrollBtnBounds.Bottom - ScrollBtnBounds.Top));
          boTopToBottom:
            Result := LastItem.Control.BoundsRect.Bottom + AnItem.Height >
              ClientHeight - Spacing - VertMargin - (ScrollBtnBounds.Bottom - ScrollBtnBounds.Top);
        end;
  end;

var
  AnItem: TActionClientItem;
begin
  if AutoSizing or (FHideLevel > 0) then Exit;
  if Assigned(FScrollBtn) then
    ScrollBtnBounds := FScrollBtn.BoundsRect
  else
    ScrollBtnBounds := System.Types.Rect(0, 0, 0, 0);
  LastItem := FindLastVisibleItem;
  if LastItem <> nil then
  begin
    if HideItem(LastItem.Control) then
    begin
      if ActionClient.Items.HideUnused then
        AnItem := FindLeastUsedItem(True)
      else
        AnItem := LastItem;
      if Assigned(AnItem) and AnItem.Visible and (LastItem <> FindFirstVisibleItem) then
      begin
        if FHiddenItems = nil then
        begin
          FHiddenItems := TItemsStack.Create;
          SetupDropDownBtn;
        end;
        if csDesigning in ComponentState then
          AnItem.Control.ControlStyle := AnItem.Control.ControlStyle + [csNoDesignVisible];
        FHiddenItems.Push(AnItem.Control);
        AnItem.Control.Visible := False;
      end;
    end
    else
      if Assigned(FHiddenItems) and (FHiddenItems.Count > 0) then
        if not HideItem(TCustomActionControl(FHiddenItems.Peek)) then
        begin
          if csDesigning in ComponentState then
            with TControl(FHiddenItems.Peek) do
              ControlStyle := ControlStyle + [csNoDesignVisible];
          if TCustomActionControl(FHiddenItems.Peek).ActionClient.Visible then
            TCustomActionControl(FHiddenItems.Pop).Visible := True;
          if Assigned(FHiddenItems) and (FHiddenItems.Count = 0) then
            FreeAndNil(FHiddenItems);
        end;
  end;
  if Assigned(FScrollBtn) then
    FScrollBtn.Enabled := not (csDesigning in ComponentState) and
      ((HiddenCount > 0) or Assigned(ActionManager.DefaultActionBars));
end;

procedure TCustomActionToolBar.ScrollBtnClick(Sender: TObject);
begin
  if Assigned(FPopupBar) or not Assigned(ActionClient) then
    Exit;
  DoScrollBtnClick;
end;

const
  BtnAlignment: array[TBarOrientation] of TAlign =
    (alRight, alLeft, alBottom, alTop);
  ArrowDirection: array[TBarOrientation] of TScrollDirection =
    (sdRight, sdLeft, sdDown, sdUp);

procedure TCustomActionToolBar.SetOrientation(const Value: TBarOrientation);
begin
  DisableHiding;
  try
    if Assigned(FHiddenItems) then
      while FHiddenItems.Count > 0 do
        TCustomActionControl(FHiddenItems.Pop).Visible := True;
    FreeAndNil(FHiddenItems);
    inherited SetOrientation(Value);
    if Assigned(FScrollBtn) then
    begin
      FScrollBtn.Direction := ArrowDirection[Orientation];
      FScrollBtn.Align := BtnAlignment[Orientation];
    end;
  finally
    EnableHiding;
  end;
end;

procedure TCustomActionToolBar.SetupDropDownBtn;
begin
  if AutoSizing then Exit;
  if Assigned(FScrollBtn) or not Assigned(ActionClient) then Exit;
  FScrollBtn := GetScrollBtnClass.Create(Self);
  with FScrollBtn do
  begin
    Hint := SMoreButtons;
    Direction := ArrowDirection[Orientation];
    Align := BtnAlignment[Orientation];
    Enabled := not (csDesigning in ComponentState) and
      ((HiddenCount > 0) or Assigned(ActionManager.DefaultActionBars));
    Parent := Self;
    ParentColor := True;
    Transparent := Self.ActionClient.HasBackground;
    FScrollBtn.CalcBounds;
    OnClick := ScrollBtnClick;
  end;
end;

procedure TCustomActionToolBar.Reset;
begin
  DisableHiding;
  try
    if Assigned(FHiddenItems) then
    begin
      while FHiddenItems.Count > 0 do
        TCustomActionControl(FHiddenItems.Pop).Visible := True;
      FreeAndNil(FHiddenItems);
    end;
    inherited Reset;
  finally
    EnableHiding;
  end;
end;

procedure TCustomActionToolBar.CMColorchanged(var Message: TMessage);
begin
  inherited;
  FShadowClr := ColorAdjustLuma(Self.Color, -85, False);
  FHighLightClr := ColorAdjustLuma(Self.Color, +85, False);
end;

procedure TCustomActionToolBar.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if not AutoSizing then
    HideUnusedItems;
end;

procedure TCustomActionToolBar.DragDrop(Source: TObject; X, Y: Integer);
begin
  inherited;
  SetBounds(Left, Top, Width, Height);
  if not AutoSizing then
    HideUnusedItems;
end;

function TCustomActionToolBar.GetPopupClass: TCustomActionBarClass;
begin
  with Style as TActionBarStyleEx do
    Result := GetPopupClass(Self);
end;

function TCustomActionToolBar.GetScrollBtnClass: TCustomToolScrollBtnClass;
begin
  with Style as TActionBarStyleEx do
    Result := GetScrollBtnClass;
end;

end.
