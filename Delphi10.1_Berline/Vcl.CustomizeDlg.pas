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
{ Copyright(c) 1995-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Vcl.CustomizeDlg;

interface

//(*$HPPEMIT '#pragma link "dclact.lib"'*)

uses
{$IF DEFINED(CLR)}
  System.ComponentModel.Design.Serialization,
{$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Actions, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ActnList, Vcl.CheckLst, Vcl.ComCtrls, Vcl.Menus, Vcl.ExtCtrls, Vcl.ImgList,
  Vcl.Buttons, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, System.ImageList;

type
  TCustomizeFrm = class(TForm)
    CloseBtn: TButton;
    Tabs: TPageControl;
    ToolbarsTab: TTabSheet;
    ActionsTab: TTabSheet;
    OptionsTab: TTabSheet;
    ToolbarsLbl: TLabel;
    ActionBarList: TCheckListBox;
    ResetBtn: TButton;
    CloseMenu: TPopupMenu;
    CloseItem: TMenuItem;
    PersonalizeLbl: TLabel;
    OptionsBevel2: TBevel;
    RecentlyUsedChk: TCheckBox;
    ResetUsageBtn: TButton;
    LargeIconsChk: TCheckBox;
    ShowTipsChk: TCheckBox;
    ShortCutTipsChk: TCheckBox;
    OptionsBevel1: TBevel;
    ActionImages: TImageList;
    Label1: TLabel;
    MenuAnimationStyles: TComboBox;
    InfoLbl: TLabel;
    DescGroupBox: TGroupBox;
    HintLbl: TLabel;
    ActionsCatLbl: TLabel;
    CatList: TListBox;
    ActionsList: TListBox;
    ActionsActionsLbl: TLabel;
    ActionList1: TActionList;
    ResetActn: TAction;
    CloseActn: TAction;
    ResetUsageDataActn: TAction;
    RecentlyUsedActn: TAction;
    FullMenusActn: TAction;
    ShowHintsActn: TAction;
    ShowShortCutsInTipsActn: TAction;
    ListPanel: TPanel;
    ComboPanel: TPanel;
    ListCombo: TComboBox;
    ApplyToAllActn: TAction;
    CaptionOptionsGrp: TGroupBox;
    ApplyToAllChk: TCheckBox;
    LargeIconsActn: TAction;
    CaptionOptionsCombo: TComboBox;
    Label2: TLabel;
    SeparatorBtn: TButton;
    procedure CatListClick(Sender: TObject);
    procedure ActionsListStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ActionsListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseBtnClick(Sender: TObject);
    procedure CatListStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ActionBarListClickCheck(Sender: TObject);
    procedure ActionsListMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ActionsListClick(Sender: TObject);
    procedure MenuAnimationStylesChange(Sender: TObject);
    procedure ResetActnUpdate(Sender: TObject);
    procedure ResetActnExecute(Sender: TObject);
    procedure ResetUsageDataActnExecute(Sender: TObject);
    procedure RecentlyUsedActnExecute(Sender: TObject);
    procedure ShowHintsActnExecute(Sender: TObject);
    procedure ShowHintsActnUpdate(Sender: TObject);
    procedure ShowShortCutsInTipsActnExecute(Sender: TObject);
    procedure RecentlyUsedActnUpdate(Sender: TObject);
    procedure ActionBarListClick(Sender: TObject);
    procedure ActionsListData(Control: TWinControl; Index: Integer;
      var Data: string);
    procedure LargeIconsActnExecute(Sender: TObject);
    procedure ListComboSelect(Sender: TObject);
    procedure CaptionOptionsComboChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure LargeIconsActnUpdate(Sender: TObject);
    procedure SeparatorBtnStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ApplyToAllActnUpdate(Sender: TObject);
  private
    FScratchBar: TActionBarItem;
    FActionManager: TCustomActionManager;
    FActiveActionList: TCustomActionList;
    procedure SetActionManager(const Value: TCustomActionManager);
    procedure SetupListCombo;
  protected
    function AddAction(AnAction: TContainedAction): string;
    function IsDupShortCut(AShortCut: TShortCut;
      var Action: TContainedAction): Boolean;
    procedure ClearCatList; virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation);
      override;
    procedure FindActionBars;
    procedure SetActiveActionList(const Value: TCustomActionList);
    procedure UpdateDialog; virtual;
    procedure CMVisiblechanged(var Message: TMessage);
      message CM_VISIBLECHANGED;
  public
    property ActionManager: TCustomActionManager read FActionManager
      write SetActionManager;
    property ActiveActionList: TCustomActionList read FActiveActionList
      write SetActiveActionList;
  end;

  [RootDesignerSerializerAttribute('', '', False)]
  TCustomizeDlg = class(TComponent)
  private
    FCustomizeFrm: TCustomizeFrm;
    FStayOnTop: Boolean;
    FOnClose: TNotifyEvent;
    FOnShow: TNotifyEvent;
    FActionManager: TCustomActionManager;
    procedure SetStayOnTop(const Value: Boolean);
    procedure SetActionManager(const Value: TCustomActionManager);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetupDlg; virtual;
  public
    procedure Show;
    property CustomizeForm: TCustomizeFrm read FCustomizeFrm;
  published
    property ActionManager: TCustomActionManager read FActionManager
      write SetActionManager;
    property StayOnTop: Boolean read FStayOnTop write SetStayOnTop;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;

implementation

{$R *.DFM}

uses System.TypInfo, Winapi.CommCtrl, Vcl.Consts, System.Types, System.UITypes;

var
  CustomizeFrm: TCustomizeFrm;

{ TCustomizeFrm }

function TCustomizeFrm.AddAction(AnAction: TContainedAction): string;
var
  I: Integer;
begin
  if AnAction = nil then Exit;
  AnAction.FreeNotification(Self);
  if (AnAction.Category = '') then
    Result := SNoCategory
  else
    Result := AnAction.Category;
  with CatList.Items do
  begin
    I := CatList.Items.IndexOf(Result);
    if I = -1 then
      I := CatList.Items.AddObject(Result, TStringList.Create);
    TStringList(Objects[I]).AddObject('', AnAction);
    I := IndexOf(SAllActions);
    if I = -1 then
      I := AddObject(SAllActions, TStringList.Create);
    TStringList(Objects[I]).AddObject('', AnAction);
    Move(I, Count - 1);
  end;
end;

procedure TCustomizeFrm.SetActionManager(const Value: TCustomActionManager);
begin
  if FActionManager <> Value then
  begin
    ClearCatList;
    if Assigned(FActionManager) then
      FActionManager.RemoveFreeNotification(Self);
    FActionManager := Value;
    if Assigned(FActionManager) then
    begin
      if not (csDesigning in FActionManager.ComponentState) then
        FActionManager.State := asSuspendedEnabled;
      FActionManager.FreeNotification(Self);
      LargeIconsChk.Enabled := Assigned(FActionManager.Images);
      SetupListCombo;
    end;
  end;
end;

procedure TCustomizeFrm.CatListClick(Sender: TObject);
begin
  if (CatList.Items.Count = 0) or (CatList.ItemIndex = -1) then Exit;
    if Assigned(CatList.Items.Objects[CatList.ItemIndex]) then
      ActionsList.Items.Assign(TStringList(CatList.Items.Objects[CatList.ItemIndex]));
  HintLbl.Caption := '';
  if ActionsList.Items.Count > 0 then
  begin
    ActionsList.ItemIndex := 0;
    ActionsList.Selected[0] := True;
    ActionsListClick(Sender);
  end;
end;

procedure TCustomizeFrm.ActionsListStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  I: Integer;
begin
  if (ActionsList.Items.Count = 0) or (ActionsList.ItemIndex = -1) then Exit;
  DragObject := TActionDragObject.Create;
  TActionDragObject(DragObject).ActionManager := ActionManager;
  for I := 0 to ActionsList.Items.Count - 1 do
    if ActionsList.Selected[I] then
      with ActionsList do
        TActionDragObject(DragObject).AddAction(
          TCustomAction(ActionsList.Items.Objects[I]));
end;

const
  TextColor: array[Boolean] of TColor = (clWindowText, clHighlight);

procedure TCustomizeFrm.ActionsListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  AnAction: TCustomAction;
  ImgRect: TRect;
  OldColor: TColor;
  ARect: TRect;
  ACaption: string;
  ShortCutText: string;
begin
  if (ActionManager = nil) or (ActionsList.Items.Count = 0) then Exit;
  Canvas.Font.Color := TextColor[odSelected in State];
  if odSelected in State then
    ActionsList.Canvas.Brush.Color := clHighlight
  else
    ActionsList.Canvas.Brush.Color := ActionsList.Color;
  ActionsList.Canvas.FillRect(Rect);
  AnAction := nil;
  if ActionsList.Items.Objects[Index] is TCustomAction then
    AnAction := TCustomAction(ActionsList.Items.Objects[Index]);
  if AnAction = nil then Exit;
  ARect := Rect;
  if Assigned(AnAction.ActionList.Images) then
  begin
    if TCustomAction(ActionsList.Items.Objects[Index]) is TCustomAction then
    begin
      if (AnAction.ImageIndex > -1) and
         (AnAction.ImageIndex < AnAction.ActionList.Images.Count) then
      begin
        if odSelected in State then
        begin
          OldColor := ActionsList.Canvas.Brush.Color;
          ActionsList.Canvas.Brush.Color := ActionsList.Color;
          ImgRect := System.Types.Rect(1, Rect.Top + 1,
            AnAction.ActionList.Images.Width + 4,
            Rect.Top + AnAction.ActionList.Images.Height + 3);
          ActionsList.Canvas.FillRect(ImgRect);
          DrawEdge(ActionsList.Canvas.Handle, ImgRect, BDR_RAISEDINNER,
            BF_RECT or BF_MIDDLE);
          ActionsList.Canvas.Brush.Color := OldColor;
        end;
        with AnAction.ActionList.Images do
          ImageList_DrawEx(Handle, AnAction.ImageIndex, ActionsList.Canvas.Handle,
            2, Rect.Top + 2, AnAction.ActionList.Images.Width,
            AnAction.ActionList.Images.Height, ColorToRGB(ActionsList.Color),
            clNone, ILD_Normal);
      end;
    end;
    ARect.Left := AnAction.ActionList.Images.Width + 6;
  end
  else
    ARect.Left := 6;
  if AnAction.Caption <> '' then
    ACaption := AnAction.Caption
  else
    ACaption := AnAction.Name;
  DrawText(ActionsList.Canvas.Handle, ACaption, Length(ACaption), ARect,
    DT_LEFT or DT_VCENTER or DT_SINGLELINE);
  if AnAction.ShortCut <> 0 then
  begin
    Dec(ARect.Right, 10);
    ShortCutText := ShortCutToText(AnAction.ShortCut);
    DrawText(ActionsList.Canvas.Handle, ShortCutText,
      Length(ShortCutText), ARect, DT_RIGHT or DT_VCENTER or DT_SINGLELINE);
  end;

  if (Tabs.ActivePage = ActionsTab) and (odSelected in State) then
  begin
    ActionsList.Canvas.Brush.Color := clHighlight;
    PatBlt(ActionsList.Canvas.Handle, Rect.Left + 4, Rect.Top + 2,
      Rect.Right - Rect.Left - 8, 1, DSTINVERT);
    PatBlt(ActionsList.Canvas.Handle, Rect.Left + 4, Rect.Bottom - 3,
      Rect.Right - Rect.Left - 8, 1, DSTINVERT);
    PatBlt(ActionsList.Canvas.Handle, Rect.Left + 3, Rect.Top + 2,
      1, Rect.Bottom - Rect.Top - 4, DSTINVERT);
    PatBlt(ActionsList.Canvas.Handle, Rect.Right - Rect.Left - 4, Rect.Top + 2,
      1, Rect.Bottom - Rect.Top - 4, DSTINVERT);
  end;
end;

procedure TCustomizeFrm.FindActionBars;
var
  I: Integer;
  Idx: Integer;
begin
  if ActionManager = nil then Exit;
  ActionBarList.Items.BeginUpdate;
  Idx := ActionBarList.ItemIndex;
  try
    ActionBarList.Clear;
    for I := 0 to ActionManager.ActionBars.Count - 1 do
      if Assigned(ActionManager.ActionBars[I].ActionBar) then
        with ActionManager.ActionBars[I] do
        begin
          ActionBar.FreeNotification(Self);
          ActionBar.DesignMode := True;
          if not (ActionBar is TCustomActionMainMenuBar) then
          begin
            ActionBarList.Items.AddObject(ActionBar.Caption, ActionBar);
            ActionBarList.Checked[ActionBarList.Items.Count - 1] := ActionBar.Visible;
            ActionBarList.ItemEnabled[ActionBarList.Items.Count - 1] := ActionBar.AllowHiding;
          end;
          if (ActionBar is TCustomActionMainMenuBar) and
             Assigned(TCustomActionBar(ActionBar).ActionClient) then
          begin
            RecentlyUsedActn.Checked := ActionBar.ActionClient.Items.HideUnused;
            MenuAnimationStyles.ItemIndex := Ord(TCustomActionMenuBar(ActionBar).AnimationStyle);
          end;
        end;
  finally
    ActionBarList.Items.EndUpdate;
    if (Idx = -1) and (ActionBarList.Items.Count > 0) then
      ActionBarList.ItemIndex := 0
    else
      ActionBarList.ItemIndex := Idx;
    ActionBarListClick(nil);
  end;
end;

procedure TCustomizeFrm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  FScratchBar.Free;
  if Assigned(FActionManager) then
  begin
    if not (csDesigning in FActionManager.ComponentState) then
    begin
      FActionManager.State := asNormal;
      for I := 0 to ActionBarList.Items.Count - 1 do
        TCustomActionBar(ActionBarList.Items.Objects[I]).DesignMode := False;
    end;
    for I := 0 to ActionManager.ActionBars.Count - 1 do
      if Assigned(ActionManager.ActionBars[I].ActionBar) then
        with ActionManager.ActionBars[I] do
        begin
          ActionBar.DesignMode := False;
          ActionBar.RemoveFreeNotification(Self);
        end;
  end;
  ActionManager := nil;
  Action := caFree;
  CustomizeFrm := nil;
end;

procedure TCustomizeFrm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomizeFrm.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  I, X: Integer;
  UpdateList: Boolean;
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if AComponent = FActionManager then
    begin
      FActionManager := nil;
      Close;
    end
    else if AComponent is TBasicAction and not (csDestroying in ComponentState) then
    begin
      UpdateList := False;
      with CatList.Items do
        for I := Count - 1 downto 0 do
        begin
          X := TStringList(Objects[I]).IndexOfObject(AComponent);
          if X <> - 1 then
          begin
            TStringList(Objects[I]).Delete(X);
            UpdateList := True;
          end;
          if TStringList(Objects[I]).Count = 0 then
          begin
            CatList.Items.Delete(I);
            ActionsList.Items.BeginUpdate;
            try
              ActionsList.Items.Clear;
            finally
              ActionsList.Items.EndUpdate;
            end;
          end;
        end;
      if UpdateList then
        CatListClick(nil);
    end
    else if AComponent is TCustomActionBar then
      for I := 0 to ActionBarList.Items.Count - 1 do
        if AComponent = ActionBarList.Items.Objects[I] then
        begin
          ActionBarList.Items.Delete(I);
          break;
        end;
end;

procedure TCustomizeFrm.CatListStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  I: Integer;
begin
  if (CatList.Items.Count = 0) or (ActionsList.Items.Count = 0) or (CatList.ItemIndex = -1) or
     (AnsiCompareText(CatList.Items[CatList.ItemIndex], SNoCategory) = 0) or
     (AnsiCompareText(CatList.Items[CatList.ItemIndex], SAllActions) = 0) then
  begin
    CancelDrag;
    Exit;
  end;
  DragObject := TCategoryDragObject.Create(CatList.Items[CatList.ItemIndex]);
  TCategoryDragObject(DragObject).ActionManager := ActionManager;
  for I := 0 to ActionsList.Items.Count - 1 do
    with ActionsList, ActionsList.Items do
      TActionDragObject(DragObject).AddAction(TContainedAction(Objects[I]));
end;

procedure TCustomizeFrm.ActionBarListClickCheck(Sender: TObject);
begin
  with ActionBarList do
  begin
    if (Items.Count = 0) or (ItemIndex < 0) or
       not TCustomActionBar(Items.Objects[ItemIndex]).AllowHiding then Exit;
      if Assigned(TCustomActionBar(Items.Objects[ItemIndex]).ActionClient) then
        TCustomActionBar(Items.Objects[ItemIndex]).ActionClient.Visible := Checked[ItemIndex]
      else
        TCustomActionBar(Items.Objects[ItemIndex]).Visible := Checked[ItemIndex];
  end;
  Application.ProcessMessages;
end;

procedure TCustomizeFrm.ActionsListMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
var
  LObject: TObject;
  LAction: TCustomAction;
begin
  if not (csDesigning in ActionManager.ComponentState) and (CatList.ItemIndex > -1) then
  begin
    LObject := CatList.Items.Objects[CatList.ItemIndex];
    if TStringList(LObject).Count > Index then
    begin
      LObject := TStringList(LObject).Objects[Index];
      if (LObject <> nil) and (LObject is TCustomAction) then
      begin
        LAction := TCustomAction(LObject);
        if LAction.ActionList.Images <> nil then
        begin
          Height := LAction.ActionList.Images.Height + 4;
          Exit;
        end;
      end;
    end;
  end;
  if Assigned(ActionManager) and Assigned(ActionManager.Images) then
    Height := ActionManager.Images.Height + 4
  else
    Height := Abs(ActionsList.Font.Height) + 8;
end;

procedure TCustomizeFrm.UpdateDialog;

  function AddActions(ActionList: TCustomActionList): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 0 to ActionList.ActionCount - 1 do
      Result := AddAction(ActionList.Actions[I]);
  end;

  procedure SelectCategory(ACategory: string);
  begin
    if CatList.HandleAllocated and (CatList.Items.IndexOf(ACategory) <> -1) then
    begin
      CatList.ItemIndex := CatList.Items.IndexOf(ACategory);
      CatListClick(nil);
    end
  end;

var
  Category: string;
  OriginalCat: string;
  I: Integer;
begin
  CatList.Items.BeginUpdate;
  try
    if CatList.ItemIndex <> -1 then
      OriginalCat := CatList.Items[CatList.ItemIndex];
    ClearCatList;
    if Assigned(FActionManager) then
    begin
      if ActionManager.ActionBars.Count > 0 then
      ShowHintsActn.Checked := ActionManager.ActionBars.ShowHints;
      ShowShortCutsInTipsActn.Checked := ActionManager.ActionBars.HintShortCuts;
      FindActionBars;
      if FActiveActionList = nil then
      begin
        if FActionManager.ActionCount > 0 then
          Category := AddActions(FActionManager);
        for I := 0 to FActionManager.LinkedActionLists.Count - 1 do
          Category := AddActions(FActionManager.LinkedActionLists[I].ActionList);
      end
      else
        if FActiveActionList.ActionCount > 0 then
          Category := AddActions(FActiveActionList);
    end;
  finally
    CatList.Items.EndUpdate;
    ActionsList.Items.Clear;
    if (OriginalCat <> '') then
      SelectCategory(OriginalCat)
    else
      SelectCategory(Category);
  end;
end;

procedure TCustomizeFrm.ClearCatList;
var
  I, Y: Integer;
begin
  CatList.Items.BeginUpdate;
  try
    for I := 0 to CatList.Items.Count - 1 do
      if Assigned(CatList.Items.Objects[I]) then
      begin
        with CatList.Items.Objects[I] as TStringList do
          for Y := 0 to Count - 1 do
            TComponent(Objects[Y]).RemoveFreeNotification(Self);
        CatList.Items.Objects[I].Free;
      end;
    CatList.Clear;
  finally
    CatList.Items.EndUpdate;
  end;
end;

procedure TCustomizeFrm.CMVisiblechanged(var Message: TMessage);
begin
  inherited;
  if Visible then
    UpdateDialog;
end;

function TCustomizeFrm.IsDupShortCut(AShortCut: TShortCut;
  var Action: TContainedAction): Boolean;

  function CheckAction(AnAction: TContainedAction): Boolean;
  begin
    Result := (AnAction is TCustomAction) and
              ((TCustomAction(AnAction).ShortCut = AShortCut) or
               (Assigned(TCustomAction(AnAction).SecondaryShortCuts) and 
               (TCustomAction(AnAction).SecondaryShortCuts.IndexOfShortCut(AShortCut) >= 0)))
  end;

var
  I: Integer;
begin
  Action := nil;
  Result := False;
  if ActionsList.ItemIndex = -1 then Exit;
  Action := TContainedAction(ActionsList.Items.Objects[ActionsList.ItemIndex]);
  Result := CheckAction(TContainedAction(ActionsList.Items.Objects[ActionsList.ItemIndex]));
  if Result then Exit;
  for I := 0 to ActionManager.ActionCount - 1 do
    if (ActionManager.Actions[I].Index <> IntPtr(ActionsList.Items.Objects[ActionsList.ItemIndex])) and
       (ActionManager.Actions[I] is TCustomAction) then
    begin
      Result := CheckAction(ActionManager.Actions[I]);
      if not Result then continue;
      Action := ActionManager.Actions[I];
      Break;
    end;
end;

procedure TCustomizeFrm.SetActiveActionList(
  const Value: TCustomActionList);
begin
  if FActiveActionList <> Value then
  begin
    FActiveActionList := Value;
    UpdateDialog;
  end;
end;

procedure TCustomizeFrm.SetupListCombo;
var
  I: Integer;
begin
  if not Assigned(FActionManager) then Exit;
  if not (csDesigning in FActionManager.ComponentState) and
     (FActionManager.LinkedActionLists.Count = 0) then
  begin
    ComboPanel.Visible := False;
    ListPanel.Height := DescGroupBox.Top - 5;
    Exit;
  end;
  ListCombo.Items.AddObject(SAllActions, nil);
  ListCombo.Items.AddObject(FActionManager.Name, FActionManager);
  for I := 0 to FActionManager.LinkedActionLists.Count - 1 do
    if Assigned(FActionManager.LinkedActionLists[I].ActionList) then
      ListCombo.Items.AddObject(FActionManager.LinkedActionLists.ListItems[I].Caption,
        FActionManager.LinkedActionLists[I].ActionList);
  ListCombo.ItemIndex := 0;
  if ListCombo.Items.Count = 2 then
    ActiveActionList := FActionManager;
end;

procedure TCustomizeFrm.FormCreate(Sender: TObject);
begin
  Tabs.ActivePage := ActionsTab;
  ActiveControl := CatList;
  HintLbl.Caption := '';
end;

procedure TCustomizeFrm.ActionsListClick(Sender: TObject);
begin
  if (ActionsList.Items.Count = 0) or (ActionsList.ItemIndex = -1) then Exit;
  if ActionsList.Items.Objects[ActionsList.ItemIndex] is TCustomAction then
    with TCustomAction(ActionsList.Items.Objects[ActionsList.ItemIndex]) do
      HintLbl.Caption := GetLongHint(Hint);
end;

procedure TCustomizeFrm.MenuAnimationStylesChange(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ActionBarList.Items.Count - 1 do
    if ActionBarList.Items.Objects[I] is TCustomActionMenuBar then
      with TCustomActionMenuBar(ActionBarList.Items.Objects[I]) do
        AnimationStyle := TAnimationStyle(MenuAnimationStyles.ItemIndex);
end;

procedure TCustomizeFrm.ResetActnUpdate(Sender: TObject);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
      Enabled := Assigned(ActionManager) and
        Assigned(ActionManager.DefaultActionBars) and
        (ActionBarList.ItemIndex <> -1);
end;

procedure TCustomizeFrm.ResetActnExecute(Sender: TObject);
begin
  ActionManager.ResetActionBar(ActionBarList.ItemIndex);
end;

procedure TCustomizeFrm.ResetUsageDataActnExecute(Sender: TObject);
begin
  if MessageDlg(SResetUsageData, mtConfirmation, [mbOK, mbCancel], 0) = mrOK then
    if Assigned(FActionManager) then
      ActionManager.ResetUsageData;
end;

procedure TCustomizeFrm.RecentlyUsedActnExecute(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ActionBarList.Items.Count - 1 do
    with ActionBarList, ActionBarList.Items do
      if (TCustomActionBar(Objects[I]) is TCustomActionMenuBar) and
         Assigned(TCustomActionBar(Objects[I]).ActionClient) then
        TCustomActionBar(Objects[I]).ActionClient.Items.HideUnused := RecentlyUsedChk.Checked;
end;

procedure TCustomizeFrm.ShowHintsActnExecute(Sender: TObject);
begin
  ActionManager.ActionBars.ShowHints := ShowHintsActn.Checked;
end;

procedure TCustomizeFrm.ShowHintsActnUpdate(Sender: TObject);
begin
  ShowHintsActn.Enabled := ActionManager.ActionBars.Count > 0;
  ShowShortCutsInTipsActn.Enabled := ShowHintsActn.Enabled and ShowHintsActn.Checked;
end;

procedure TCustomizeFrm.ShowShortCutsInTipsActnExecute(Sender: TObject);
begin
  ActionManager.ActionBars.HintShortCuts := ShowShortCutsInTipsActn.Checked;
end;

procedure TCustomizeFrm.RecentlyUsedActnUpdate(Sender: TObject);
var
  I: Integer;
begin
  if ActionBarList.Items.Count = 0 then
  begin
    RecentlyUsedActn.Enabled := False;
    Exit;
  end;
  for I := 0 to ActionBarList.Items.Count - 1 do
    with ActionBarList, ActionBarList.Items do
      if (TCustomActionBar(Objects[I]) is TCustomActionMenuBar) and
         Assigned(TCustomActionBar(Objects[I]).ActionClient) then
      begin
        RecentlyUsedActn.Enabled := True;
        break;
      end
      else
        RecentlyUsedActn.Enabled := False;
end;

procedure TCustomizeFrm.ActionBarListClick(Sender: TObject);
begin
  if (ActionBarList.Items.Count = 0) or (ActionBarList.ItemIndex = -1) then Exit;
  with TCustomActionBar(ActionBarList.Items.Objects[ActionBarList.ItemIndex]) do
    CaptionOptionsCombo.ItemIndex := Ord(ActionClient.Items.CaptionOptions);
end;

procedure TCustomizeFrm.ActionsListData(Control: TWinControl;
  Index: Integer; var Data: string);
begin
  Data := TStringList(CatList.Items.Objects[CatList.ItemIndex]).Strings[Index];
end;

procedure TCustomizeFrm.LargeIconsActnExecute(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ActionBarList.Items.Count - 1 do
    if ActionBarList.Items.Objects[I] is TCustomActionToolBar then
      with TCustomActionBar(ActionBarList.Items.Objects[I]) do
        ActionClient.Items.SmallIcons := not LargeIconsActn.Checked;
end;

procedure TCustomizeFrm.LargeIconsActnUpdate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ActionBarList.Items.Count - 1 do
    if ActionBarList.Items.Objects[I] is TCustomActionToolBar then
    begin
      with TCustomActionBar(ActionBarList.Items.Objects[I]) do
        LargeIconsActn.Checked := not ActionClient.Items.SmallIcons;
      Exit;
    end;
  LargeIconsActn.Checked := False;
end;

procedure TCustomizeFrm.ListComboSelect(Sender: TObject);
begin
  ActiveActionList := TCustomActionList(ListCombo.Items.Objects[ListCombo.ItemIndex]);
end;

procedure TCustomizeFrm.CaptionOptionsComboChange(Sender: TObject);
var
  I: Integer;
begin
  if ApplyToAllActn.Checked then
  begin
    for I := 0 to ActionBarList.Items.Count - 1 do
      if ActionBarList.Items.Objects[ActionBarList.ItemIndex] is TCustomActionToolBar then
        with TCustomActionBar(ActionBarList.Items.Objects[I]) do
          ActionClient.Items.CaptionOptions := TCaptionOptions(CaptionOptionsCombo.ItemIndex);
  end
  else
    with TCustomActionBar(ActionBarList.Items.Objects[ActionBarList.ItemIndex]) do
      ActionClient.Items.CaptionOptions := TCaptionOptions(CaptionOptionsCombo.ItemIndex);
end;

procedure TCustomizeFrm.FormResize(Sender: TObject);
begin
  ActionsList.Invalidate;
end;

{ TCustomizeDlg }

procedure TCustomizeDlg.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
  begin
    if AComponent = FActionManager then
    begin
      if Assigned(FCustomizeFrm) then
        FCustomizeFrm.Close;
      FActionManager := nil;
    end;
    if AComponent = FCustomizeFrm then
    begin
      FCustomizeFrm := nil;
      if Assigned(FOnClose) then
        FOnClose(Self);
    end;
  end;
end;

procedure TCustomizeDlg.SetActionManager(const Value: TCustomActionManager);
begin
  if FActionManager <> Value then
  begin
    if Assigned(FActionManager) then
      FActionManager.RemoveFreeNotification(Self);
    FActionManager := Value;
    if Assigned(FActionManager) then
      FActionManager.FreeNotification(Self);
  end;
end;

procedure TCustomizeDlg.SetStayOnTop(const Value: Boolean);
begin
  FStayOnTop := Value;
  if Assigned(FCustomizeFrm) then
    if Value then
      FCustomizeFrm.FormStyle := fsStayOnTop
    else
      FCustomizeFrm.FormStyle := fsNormal;    
end;

procedure TCustomizeDlg.SetupDlg;
begin
  if FActionManager = nil then
    raise Exception.Create(SErrorActionManagerNotAssigned);
  if FCustomizeFrm = nil then
    FCustomizeFrm := TCustomizeFrm.Create(Self);
  with FCustomizeFrm do
  begin
    FCustomizeFrm.ActionManager := Self.ActionManager;
    if FCustomizeFrm.CatList.Items.Count > 0 then
      FCustomizeFrm.CatList.ItemIndex := 0;
    OnShow := FOnShow;
    if FStayOnTop then
      FormStyle := fsStayOnTop
    else
      FormStyle := fsNormal;
  end;
end;

procedure TCustomizeDlg.Show;
begin
  SetupDlg;
  FCustomizeFrm.Show;
end;

type
{$IF NOT DEFINED(CLR)}
  TCustomActionControlClass = class(TCustomActionControl);
  TControlClass = class(TControl);
{$ENDIF}

{ TActionSeparatorDragObject }

  TActionSeparatorDragObject = class(TActionItemDragObject)
  private
    FCustomizeFrm: TCustomizeFrm;
  protected
    procedure Finished(Target: TObject; X: Integer; Y: Integer;
      Accepted: Boolean); override;
  public
    constructor Create(CustomizeFrm: TCustomizeFrm; Client: TActionClientItem);
  end;

procedure TCustomizeFrm.SeparatorBtnStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  C: TCustomActionControl;
begin
  // Create a scratch ActionBand for us to drop separators from
  if not Assigned(FScratchBar) then
    FScratchBar := FActionManager.ActionBars.Add;
  C := TCustomActionControl.Create(nil);
  try
{$IF DEFINED(CLR)}
    (C as IControl).DragMode := dmAutomatic;
{$ELSE}
    TControlClass(C).DragMode := dmAutomatic;
{$ENDIF}
    C.ActionClient := FScratchBar.Items.Add;
    C.Visible := False;
    C.Parent := Self;
    C.Align := alCustom;
    C.ActionClient.Caption := '-';
{$IF DEFINED(CLR)}
    (C as IControl).DragMode := dmAutomatic;
{$ELSE}
    TCustomActionControlClass(C).DragMode := dmAutomatic;
{$ENDIF}
    DragObject := TActionSeparatorDragObject.Create(Self, C.ActionClient);
    TActionSeparatorDragObject(DragObject).ActionManager := ActionManager;
  finally
    C.Free;
  end;
end;

{ TActionSeparatorDragObject }

constructor TActionSeparatorDragObject.Create(CustomizeFrm: TCustomizeFrm;
  Client: TActionClientItem);
begin
  inherited Create;
  FCustomizeFrm := CustomizeFrm;
  ClientItem := Client;
end;

procedure TActionSeparatorDragObject.Finished(Target: TObject; X,
  Y: Integer; Accepted: Boolean);
begin
  inherited;
  FreeAndNil(FCustomizeFrm.FScratchBar);
end;

procedure TCustomizeFrm.ApplyToAllActnUpdate(Sender: TObject);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      Enabled := (ActionBarList.ItemIndex <> -1);
      CaptionOptionsGrp.Enabled := Enabled;
    end;
end;

initialization
  GroupDescendentsWith(TCustomizeDlg, Vcl.Controls.TControl);

end.


