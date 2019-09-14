{*******************************************************}
{                                                       }
{               Delphi FireDAC Framework                }
{                 FireDAC Error dialog                  }
{                                                       }
{ Copyright(c) 2004-2017 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}
{$I FireDAC.inc}
{$HPPEMIT LINKUNIT}

unit FireDAC.VCLUI.Error;

interface

uses
{$IFDEF MSWINDOWS}
  Winapi.Messages, Winapi.Windows,
{$ENDIF}
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, 
    Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Clipbrd,
  FireDAC.Stan.Intf, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.VCLUI.Controls, FireDAC.VCLUI.Memo, FireDAC.VCLUI.OptsBase;

type
  TfrmFDGUIxFormsError = class(TfrmFDGUIxFormsOptsBase)
    pcAdvanced: TPageControl;
    tsAdvanced: TTabSheet;
    tsQuery: TTabSheet;
    Bevel1: TBevel;
    NativeLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtErrorCode: TEdit;
    edtServerObject: TEdit;
    edtMessage: TMemo;
    edtErrorKind: TEdit;
    edtCommandTextOffset: TEdit;
    btnPrior: TButton;
    btnNext: TButton;
    Label9: TLabel;
    Label5: TLabel;
    lvCommandParams: TListView;
    tsOther: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    edtClassName: TEdit;
    edtADCode: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    pnlMsg: TPanel;
    memMsg: TMemo;
    pnlAdvanced: TPanel;
    btnCopy: TButton;
    Label12: TLabel;
    edtADObjName: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DetailsBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCopyClick(Sender: TObject);
  private
    mmCommandText: TFDGUIxFormsMemo;
    FError: EFDDBEngineException;
    FDetailsHeight, CurItem: Integer;
    FDetails: string;
    FPrevWidth: Integer;
    FOnHide: TFDGUIxErrorDialogEvent;
    FOnShow: TFDGUIxErrorDialogEvent;
    procedure UpdateLayout(ASwitching: Boolean);
    procedure ShowError;
    procedure ShowCommand;
  protected
    procedure Execute(AExc: EFDDBEngineException);
  end;

var
  frmFDGUIxFormsError: TfrmFDGUIxFormsError;

implementation

uses
  FireDAC.Stan.Consts, FireDAC.Stan.Factory, FireDAC.Stan.Util, FireDAC.Stan.ResStrs,
  FireDAC.UI;

{$R *.dfm}

{ --------------------------------------------------------------------------- }
{ TfrmFDGUIxFormsError                                                        }
{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.FormCreate(Sender: TObject);
begin
  mmCommandText := TFDGUIxFormsMemo.Create(Self);
  mmCommandText.Left := 5;
  mmCommandText.Top := 45;
  mmCommandText.Width := 418;
  mmCommandText.Height := 80;
  mmCommandText.TabStop := False;
  mmCommandText.Anchors := [akLeft, akTop, akRight, akBottom];
  mmCommandText.ReadOnly := True;
  mmCommandText.ScrollBars := ssBoth;
  mmCommandText.TabOrder := 0;
  mmCommandText.Parent := tsQuery;

  Caption := S_FD_ErrorDialogDefCaption;
  FDetailsHeight := ClientHeight;
  FDetails := btnCancel.Caption;
  UpdateLayout(False);
  ActiveControl := btnOk;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.FormDestroy(Sender: TObject);
begin
  if frmFDGUIxFormsError = Self then
    frmFDGUIxFormsError := nil;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    ModalResult := mrCancel;
    Key := 0;
  end
  else if (ssCtrl in Shift) and ((Key = Ord('C')) or (Key = VK_INSERT)) then begin
    btnCopyClick(nil);
    Key := 0;
  end;
  inherited;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.btnCopyClick(Sender: TObject);
const
  C_Delim: String = '-------------------------------------------';
var
  oStrs: TFDStringList;
  i: Integer;
begin
  oStrs := TFDStringList.Create;
  try
    oStrs.Add(Caption);
    oStrs.Add(lblPrompt.Caption);
    oStrs.Add(C_Delim);
    oStrs.Add(Label4.Caption + ' ' + edtMessage.Text);
    oStrs.Add(NativeLabel.Caption + ' ' + edtErrorCode.Text);
    oStrs.Add(Label2.Caption + ' ' + edtErrorKind.Text);
    oStrs.Add(Label1.Caption + ' ' + edtServerObject.Text);
    oStrs.Add(Label3.Caption + ' ' + edtCommandTextOffset.Text);
    oStrs.Add(C_Delim);
    oStrs.Add(Label9.Caption + ' ' + mmCommandText.Text);
    oStrs.Add(Label5.Caption);
    for i := 0 to lvCommandParams.Items.Count - 1 do
      oStrs.Add('  ' + lvCommandParams.Items[i].Caption + '=' +
        lvCommandParams.Items[i].SubItems[0]);
    oStrs.Add(C_Delim);
    oStrs.Add(Label6.Caption + ' ' + edtClassName.Text);
    oStrs.Add(Label7.Caption + ' ' + edtADCode.Text);
    oStrs.Add(Label12.Caption + ' ' + edtADObjName.Text);
    Clipboard.AsText := oStrs.Text;
  finally
    FDFree(oStrs);
  end;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.UpdateLayout(ASwitching: Boolean);
const
  DetailsOn: array [Boolean] of string = ('%s >>', '<< %s');
begin
  DisableAlign;
  try
    if pnlAdvanced.Visible then
      ClientHeight := FDetailsHeight
    else begin
      FDetailsHeight := ClientHeight;
      ClientHeight := ClientHeight - pnlAdvanced.Height;
    end;
    btnCancel.Caption := Format(DetailsOn[pnlAdvanced.Visible], [FDetails]);
  finally
    EnableAlign;
  end;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.ShowError;
const
  ErrorKinds: array [TFDCommandExceptionKind] of String =
    ('Other', 'NoDataFound', 'TooManyRows', 'RecordLocked', 'UKViolated',
     'FKViolated', 'ObjNotExists', 'UserPwdInvalid', 'UserPwdExpired',
     'UserPwdWillExpire', 'CmdAborted', 'ServerGone', 'ServerOutput',
     'ArrExecMalfunc', 'InvalidParams');
var
  oError: TFDDBError;
  s: String;
  i: Integer;
begin
  btnPrior.Enabled := CurItem > 0;
  btnNext.Enabled := CurItem < FError.ErrorCount - 1;
  if CurItem > FError.ErrorCount - 1 then
    CurItem := FError.ErrorCount - 1
  else if CurItem < 0 then
    CurItem := 0;
  if FError.ErrorCount > 0 then begin
    oError := FError.Errors[CurItem];
    s := IntToStr(oError.ErrorCode);
    if oError.ErrorCode > 0 then
      for i := 1 to 5 - Length(s) do
        s := '0' + s;
    edtErrorCode.Text := s;
    edtErrorKind.Text := ErrorKinds[oError.Kind];
    edtMessage.Text := AdjustLineBreaks(oError.Message, tlbsCRLF);
    edtServerObject.Text := oError.ObjName;
    if oError.CommandTextOffset = -1 then
      edtCommandTextOffset.Text := ''
    else
      edtCommandTextOffset.Text := IntToStr(oError.CommandTextOffset);
  end
  else begin
    edtErrorCode.Text := '';
    edtErrorKind.Text := '';
    edtMessage.Text := '';
    edtServerObject.Text := '';
    edtCommandTextOffset.Text := '';
  end;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.ShowCommand;
var
  i: Integer;
  oParams: TStrings;
  oLI: TListItem;
begin
  mmCommandText.Text := FError.SQL;
  lvCommandParams.Items.Clear;
  oParams := FError.Params;
  for i := 0 to oParams.Count - 1 do begin
    oLI := lvCommandParams.Items.Add;
    oLI.Caption := oParams.KeyNames[i];
    oLI.SubItems.Add(oParams.ValueFromIndex[i]);
  end;
  tsQuery.TabVisible := (Trim(mmCommandText.Text) <> '') or (lvCommandParams.Items.Count > 0);
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.FormShow(Sender: TObject);
begin
  memMsg.Text := AdjustLineBreaks(FError.Message, tlbsCRLF);
  edtClassName.Text := FError.ClassName;
  edtADCode.Text := IntToStr(FError.FDCode);
  edtADObjName.Text := FError.FDObjName;
  CurItem := 0;
  ShowError;
  ShowCommand;
  FPrevWidth := ClientWidth;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.BackClick(Sender: TObject);
begin
  Dec(CurItem);
  ShowError;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.NextClick(Sender: TObject);
begin
  Inc(CurItem);
  ShowError;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.DetailsBtnClick(Sender: TObject);
begin
  DisableAlign;
  try
    pnlAdvanced.Visible := not pnlAdvanced.Visible;
    UpdateLayout(True);
  finally
    EnableAlign;
  end;
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.Execute(AExc: EFDDBEngineException);
var
  oPrevForm: TCustomForm;
begin
  if Assigned(FOnShow) then
    FOnShow(Self, AExc);
  FError := AExc;
  oPrevForm := Screen.ActiveCustomForm;
  Application.BringToFront;
  ShowModal;
  if oPrevForm <> nil then
    oPrevForm.BringToFront;
  FError := nil;
  if Assigned(FOnHide) then
    FOnHide(Self, AExc);
end;

{ --------------------------------------------------------------------------- }
procedure TfrmFDGUIxFormsError.FormResize(Sender: TObject);
begin
  FPrevWidth := ClientWidth;
end;

{ --------------------------------------------------------------------------- }
{ TFDGUIxErrorDialogImpl                                                      }
{ --------------------------------------------------------------------------- }
type
  TFDGUIxErrorDialogImpl = class(TFDGUIxObject, IFDGUIxErrorDialog)
  private
    FPrevOnException: TExceptionEvent;
    FHandlingException: Boolean;
    function GetForm: TfrmFDGUIxFormsError;
    procedure HandleException(Sender: TObject; E: Exception);
  protected
    // IFDGUIxErrorDialog
    function GetOnShow: TFDGUIxErrorDialogEvent;
    procedure SetOnShow(const AValue: TFDGUIxErrorDialogEvent);
    function GetOnHide: TFDGUIxErrorDialogEvent;
    procedure SetOnHide(const AValue: TFDGUIxErrorDialogEvent);
    function GetCaption: String;
    procedure SetCaption(const AValue: String);
    function GetEnabled: Boolean;
    procedure SetEnabled(const AValue: Boolean);
    function GetStayOnTop: Boolean;
    procedure SetStayOnTop(const AValue: Boolean);
    procedure Execute(AExc: EFDDBEngineException);
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.Initialize;
begin
  inherited Initialize;
  frmFDGUIxFormsError := nil;
  SetEnabled(True);
end;

{ --------------------------------------------------------------------------- }
destructor TFDGUIxErrorDialogImpl.Destroy;
begin
  SetEnabled(False);
  FDFreeAndNil(frmFDGUIxFormsError);
  inherited Destroy;
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetForm: TfrmFDGUIxFormsError;
begin
  if frmFDGUIxFormsError = nil then
    frmFDGUIxFormsError := TfrmFDGUIxFormsError.Create(Application);
  Result := frmFDGUIxFormsError;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.HandleException(Sender: TObject; E: Exception);
begin
  if (E is EFDDBEngineException) and not Application.Terminated and
     not FHandlingException then begin
    FHandlingException := True;
    try
      Execute(EFDDBEngineException(E))
    finally
      FHandlingException := False;
    end;
  end
  else if Assigned(FPrevOnException) then
    FPrevOnException(Sender, E)
  else
    Application.ShowException(E);
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.Execute(AExc: EFDDBEngineException);
begin
  if not FDGUIxSilent() then
    GetForm.Execute(AExc);
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetOnHide: TFDGUIxErrorDialogEvent;
begin
  Result := GetForm.FOnHide;
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetOnShow: TFDGUIxErrorDialogEvent;
begin
  Result := GetForm.FOnShow;
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetCaption: String;
begin
  Result := GetForm.Caption;
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetEnabled: Boolean;
var
  oHndlExc: TExceptionEvent;
begin
  oHndlExc := HandleException;
  Result := (Application <> nil) and
            (TMethod(Application.OnException).Code = TMethod(oHndlExc).Code) and
            (TMethod(Application.OnException).Data = TMethod(oHndlExc).Data);
end;

{ --------------------------------------------------------------------------- }
function TFDGUIxErrorDialogImpl.GetStayOnTop: Boolean;
begin
  Result := GetForm.FormStyle = fsStayOnTop;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.SetOnHide(const AValue: TFDGUIxErrorDialogEvent);
begin
  if Assigned(AValue) or Assigned(frmFDGUIxFormsError) then
    GetForm.FOnHide := AValue;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.SetOnShow(const AValue: TFDGUIxErrorDialogEvent);
begin
  if Assigned(AValue) or Assigned(frmFDGUIxFormsError) then
    GetForm.FOnShow := AValue;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.SetCaption(const AValue: String);
begin
  if (AValue <> '') or Assigned(frmFDGUIxFormsError) then
    GetForm.Caption := AValue;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.SetEnabled(const AValue: Boolean);
begin
  if GetEnabled <> AValue then
    if AValue then begin
      FPrevOnException := Application.OnException;
      Application.OnException := HandleException;
    end
    else begin
      if Application <> nil then
        Application.OnException := FPrevOnException;
      FPrevOnException := nil;
    end;
end;

{ --------------------------------------------------------------------------- }
procedure TFDGUIxErrorDialogImpl.SetStayOnTop(const AValue: Boolean);
begin
  if AValue then
    GetForm.FormStyle := fsStayOnTop
  else
    GetForm.FormStyle := fsNormal;
end;

{ --------------------------------------------------------------------------- }
var
  oFact: TFDFactory;

initialization
  oFact := TFDSingletonFactory.Create(TFDGUIxErrorDialogImpl,
    IFDGUIxErrorDialog, C_FD_GUIxFormsProvider);

finalization
  FDReleaseFactory(oFact);

end.
