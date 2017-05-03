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
{ Copyright(c) 1995-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Vcl.BandActn;

interface

//(*$HPPEMIT '#pragma link "dclact.lib"'*)

uses
  Vcl.Graphics, System.Classes, Winapi.Messages, Vcl.Controls, Vcl.ActnList, Vcl.ActnMan, Vcl.Forms, Vcl.CustomizeDlg;

type
  TCustomizeActionBars = class(TAction)
  private
    FCustomizeDlg: TCustomizeDlg;
    FActionManager: TCustomActionManager;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ExecuteTarget(Target: TObject); override;
    function HandlesTarget(Target: TObject): Boolean; override;
  published
    property ActionManager: TCustomActionManager read FActionManager
      write FActionManager;
    property CustomizeDlg: TCustomizeDlg read FCustomizeDlg;
  end;

implementation

uses Winapi.Windows, Vcl.Consts;

{ TCustomizeActionBars }

constructor TCustomizeActionBars.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Caption := SCustomize;
  FCustomizeDlg := TCustomizeDlg.Create(Self);
  FCustomizeDlg.Name := Copy(FCustomizeDlg.ClassName, 2, Length(FCustomizeDlg.ClassName));
  FCustomizeDlg.SetSubComponent(True);
end;

procedure TCustomizeActionBars.ExecuteTarget(Target: TObject);
begin
  if not Assigned(FCustomizeDlg.ActionManager) then
  begin
    if Assigned(FActionManager) then
      FCustomizeDlg.ActionManager := FActionManager
    else
      FCustomizeDlg.ActionManager := TCustomActionManager(ActionList);
  end;
  FCustomizeDlg.Show;
end;

function TCustomizeActionBars.HandlesTarget(Target: TObject): Boolean;
begin
  Result := (ActionList is TCustomActionManager) or Assigned(ActionManager);
end;

end.
