{*******************************************************}
{                                                       }
{            Arabic Delphi VCL Units                    }
{                                                       }
{ Modified by : Orwah Ali Issa (www.sy-it.com)          }
{                                                       }
{ Delphi 10.1 Berline ..  File Version 0.1  1/10/2016   }
{                                                       }
{*******************************************************}


{*******************************************************}
{                                                       }
{            Delphi Visual Component Library            }
{                                                       }
{ Copyright(c) 2016 Embarcadero Technologies, Inc.      }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.ActnPopup;

interface

uses
{$IF DEFINED(CLR)}
  Variants,
{$ENDIF}
  System.Classes, System.Actions, Vcl.Controls, Vcl.Menus, Vcl.ActnList, Vcl.ActnMan, Vcl.XPActnCtrls, Vcl.ActnMenus;

type

{ TCustomActionPopupMenuEx }

  TPopupActionBar = class;

  TCustomActionPopupMenuEx = class(TXPStylePopupMenu)
  private
    FPopupActionBar: TPopupActionBar;
  protected
    procedure DoPopup(Item: TCustomActionControl); override;
    function GetPopupClass: TCustomPopupClass; override;
    procedure ExecAction(Action: TContainedAction); override;
    property AutoSize;
  public
    procedure LoadMenu(Clients: TActionClients; AMenu: TMenuItem);
  end;

{ TPopupActionBar }

  TPopupActionBar = class(TPopupMenu)
  private
    FActionManager: TCustomActionManager;
    FPopupMenu: TCustomActionPopupMenuEx;
    FOnGetControlClass: TGetControlClassEvent;
    function GetMenuActive: Boolean;
    function GetStyle: TActionBarStyle;
    procedure ReadStyleProp(Reader: TReader);
    procedure SetStyle(const Value: TActionBarStyle);
    procedure WriteStyleProp(Writer: TWriter);
  protected
    procedure DefineProperties(Filer: TFiler); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Popup(X: Integer; Y: Integer); override;
    property MenuActive: Boolean read GetMenuActive;
  published
    property PopupMenu: TCustomActionPopupMenuEx read FPopupMenu write FPopupMenu;
    property Style: TActionBarStyle read GetStyle write SetStyle;
    property OnGetControlClass: TGetControlClassEvent read FOnGetControlClass
      write FOnGetControlClass;
  end;

function NewPopupMenu(Owner: TComponent; const AName: string;
  Alignment: TPopupAlignment; AutoPopup: Boolean; const Items: array of TMenuItem): TPopupMenu;

implementation

uses 
  System.SysUtils, Winapi.Windows, Winapi.Messages, Vcl.Consts, Vcl.Forms, Vcl.PlatformDefaultStyleActnCtrls, System.Types;

type
  TMenuAction = class(TCustomAction)
  private
    FMenuItem: TMenuItem;
  public
    function Execute: Boolean; override;
    constructor Create(AOwner: TComponent; AMenuItem: TMenuItem); reintroduce;
  end;

procedure InitMenuItems(AMenu: TMenu; const Items: array of TMenuItem);
var
  I: Integer;

  procedure SetOwner(Item: TMenuItem);
  var
    I: Integer;
  begin
    if Item.Owner = nil then AMenu.Owner.InsertComponent(Item);
    for I := 0 to Item.Count - 1 do
      SetOwner(Item[I]);
  end;

begin
  for I := Low(Items) to High(Items) do
  begin
    SetOwner(Items[I]);
    AMenu.Items.Add(Items[I]);
  end;
end;

function NewPopupMenu(Owner: TComponent; const AName: string;
  Alignment: TPopupAlignment; AutoPopup: Boolean; const Items: array of TMenuItem): TPopupMenu;
begin
  Result := TPopupActionBar.Create(Owner);
  Result.Name := AName;
  Result.AutoPopup := AutoPopup;
  Result.Alignment := Alignment;
  InitMenuItems(Result, Items);
end;

{ TPopupActionBar }

constructor TPopupActionBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FActionManager := TActionManager.Create(Self);
  if not (csDesigning in ComponentState) and not (csLoading in ComponentState) and
     Assigned(ActionBarStyles) then
    FActionManager.Style := ActionBarStyles.Style[ActionBarStyles.IndexOf(DefaultActnBarStyle)];
end;

procedure TPopupActionBar.DefineProperties(Filer: TFiler);

  function StyleNameStored: Boolean;
  begin
    if Assigned(Filer.Ancestor) then
      Result := Style <> TPopupActionBar(Filer.Ancestor).Style
    else
      if Assigned(ActionBarStyles) then
        Result := Style <> ActionBarStyles.Style[ActionBarStyles.IndexOf(DefaultActnBarStyle)]
      else
        Result := Style <> nil;
  end;

begin
  inherited;
  Filer.DefineProperty('StyleName', ReadStyleProp, { Do not localize }
    WriteStyleProp, StyleNameStored);
end;

function TPopupActionBar.GetMenuActive: Boolean;
begin
  Result := Assigned(FPopupMenu);
end;

function TPopupActionBar.GetStyle: TActionBarStyle;
begin
  Result := FActionManager.Style;
end;

procedure TPopupActionBar.Popup(X, Y: Integer);
var
  I: Integer;
  LColorMap: TCustomActionBarColorMap;
begin
  if Assigned(FPopupMenu) then exit;
  SetPopupPoint(Point(X, Y));
  DoPopup(Self);
  // Update actions before Rethink in case menu items
  // get hidden during update.
  if not (csDesigning in Items.ComponentState) then
    for I := 0 to Items.Count - 1 do
      Items[I].InitiateAction;

 //orwah
 if AutoHotkeys=maAutomatic then
  Items.RethinkHotkeys;

  Items.RethinkLines;
  FPopupMenu := TCustomActionPopupMenuEx.Create(nil);
  try
    FActionManager.ActionBars.Clear;
    FPopupMenu.Designable := False;
    FPopupMenu.AnimationStyle := asNone;
    FPopupMenu.FPopupActionBar := Self;
    FPopupMenu.OnGetControlClass := FOnGetControlClass;
//    FPopupMenu.Name := 'InternalPopup';
    FActionManager.Images := Images;
    with FActionManager.ActionBars.Add do
    begin
       ActionBar := FPopupMenu;
       ActionBar.Orientation := boTopToBottom;
       AutoSize := False;
    end;
    FPopupMenu.AutoSize := True;
    if not Assigned(FPopupMenu.ActionClient) then
      raise Exception.CreateFmt(SActionManagerNotAssigned, [Name]);

    LColorMap := Style.GetColorMapClass(FPopupMenu).Create(nil);
    try
      FPopupMenu.ColorMap := LColorMap;
      FPopupMenu.ActionClient.Items.Clear;
      FPopupMenu.LoadMenu(FPopupMenu.ActionClient.Items, Self.Items);
      FPopupMenu.RecreateControls;
      FPopupMenu.Popup(X, Y);
    finally
      LColorMap.Free;
    end;
  finally
    FreeAndNil(FPopupMenu);
  end;
end;

procedure TPopupActionBar.ReadStyleProp(Reader: TReader);
var
  StyleName: string;
  StyleIndex: Integer;
begin
  StyleName := Reader.ReadString;
  if StyleName <> '' then
  try
    StyleIndex := ActionBarStyles.IndexOf(StyleName);
    if StyleIndex > -1 then
      Style := ActionBarStyles.Style[StyleIndex]
    else
      raise Exception.CreateFmt(SMissingActionBarStyleName, [StyleName]);
  except
    if csDesigning in ComponentState then
      if Assigned(System.Classes.ApplicationHandleException) then
        System.Classes.ApplicationHandleException(ExceptObject)
      else
        ShowException(ExceptObject, ExceptAddr)
    else
      raise;
  end;
end;

procedure TPopupActionBar.SetStyle(const Value: TActionBarStyle);
begin
  FActionManager.Style := Value;
end;

procedure TPopupActionBar.WriteStyleProp(Writer: TWriter);
var
  AStyle: TActionBarStyle;
begin
  if Assigned(Style) then
    AStyle := Style
  else
    AStyle := ActionBarStyles.Style[0];
  Writer.WriteString(AStyle.GetStyleName);
end;

{ TCustomActionPopupMenuEx }

procedure TCustomActionPopupMenuEx.DoPopup(Item: TCustomActionControl);
begin
  inherited;
  // Check to see if we've already built this submenu this time around
{$IF DEFINED(CLR)}
  if Item.ActionClient.Items[0].Tag is TMenuItem then
{$ELSE}
  if (Item.ActionClient.Items[0].Tag < -1) or (Item.ActionClient.Items[0].Tag > 0) then
{$ENDIF}
    Exit;
  // If we haven't then call the actual TMenuItem's OnClick event (if assigned)
  // which causing any dynamically created menus to populate
  if Assigned(TMenuItem(Item.ActionClient.Tag).OnClick) then
    TMenuItem(Item.ActionClient.Tag).OnClick(TMenuItem(Item.ActionClient.Tag));
  // Since submenus are always recreated clear any old items...
  Item.ActionClient.Items.Clear;
  // ...and reload the actual TMenuItem
  LoadMenu(Item.ActionClient.Items, TMenuItem(Item.ActionClient.Tag));
end;

procedure TCustomActionPopupMenuEx.ExecAction(Action: TContainedAction);
begin
  if (FSelectedItem.Tag < -1) or (FSelectedItem.Tag > 0) then
    PostMessage(PopupList.Window, WM_COMMAND, TMenuItem(FSelectedItem.Tag).Command, 0);
end;

function TCustomActionPopupMenuEx.GetPopupClass: TCustomPopupClass;
begin
  Result := TXPStylePopupMenu;
end;

procedure TCustomActionPopupMenuEx.LoadMenu(Clients: TActionClients; AMenu: TMenuItem);
var
  I: Integer;
  AC: TActionClientItem;
begin
  Clients.AutoHotKeys := False;
  for I := 0 to AMenu.Count - 1 do
  begin
    AC := Clients.Add;
    AC.Caption := AMenu.Items[I].Caption;
{$IF DEFINED(CLR)}
    AC.Tag := Variant(AMenu.Items[I]);
{$ELSE}
    AC.Tag := IntPtr(AMenu.Items[I]);
{$ENDIF}
    AC.Action := TContainedAction(AMenu.Items[I].Action);
    if (AMenu.Items[I].Count > 0) and (AMenu.Items[I].Visible) then
      AC.Items.Add
    else
      if ((AMenu.Items[I].Caption <> '') and (AMenu.Items[I].Action = nil) and
          (AMenu.Items[I].Caption <> '-')) then
      begin
        AC.Action := TMenuAction.Create(Self, AMenu.Items[I]);
        AC.Action.ActionList := FPopupActionBar.FActionManager;
        AC.Action.Tag := AMenu.Items[I].Tag;
        TCustomAction(AC.Action).HelpContext := AMenu.Items[I].HelpContext;
        TCustomAction(AC.Action).AutoCheck := AMenu.Items[I].AutoCheck;
        TCustomAction(AC.Action).GroupIndex := AMenu.Items[I].GroupIndex;
        TCustomAction(AC.Action).OnExecute := AMenu.Items[I].OnClick;
        TCustomAction(AC.Action).ImageIndex := AMenu.Items[I].ImageIndex;
        TCustomAction(AC.Action).Visible := AMenu.Items[I].Visible;
        TCustomAction(AC.Action).Checked := AMenu.Items[I].Checked;
        TCustomAction(AC.Action).Caption := AMenu.Items[I].Caption;
        TCustomAction(AC.Action).ShortCut := AMenu.Items[I].ShortCut;
        TCustomAction(AC.Action).Enabled := AMenu.Items[I].Enabled;
        AC.ImageIndex := AMenu.Items[I].ImageIndex;
        AC.ShortCut := AMenu.Items[I].ShortCut;
        AC.Default := AMenu.Items[I].Default;
      end;
    AC.Caption := AMenu.Items[I].Caption;
    AC.ShortCut := AMenu.Items[I].ShortCut;
    AC.HelpContext := AMenu.Items[I].HelpContext;
    AC.ImageIndex := AMenu.Items[I].ImageIndex;
    AC.Visible := AMenu.Items[I].Visible;
  end;
end;

{ TMenuAction }

constructor TMenuAction.Create(AOwner: TComponent; AMenuItem: TMenuItem);
begin
  inherited Create(AOwner);
  FMenuItem := AMenuItem;
end;

function TMenuAction.Execute: Boolean;
begin
  Result := True;
  if (FMenuItem <> nil) and Assigned(FMenuItem.OnClick) then
    FMenuItem.OnClick(FMenuItem);
end;

end.
