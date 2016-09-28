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

unit Vcl.Consts;

interface

  resourcestring
  SOpenFileTitle = '› Õ';
  SCantWriteResourceStreamError = '·«Ì„ﬂ‰ «·ﬂ «»… ·„Ê—œ „Œ’’ ··ﬁ—«¡… ›ﬁÿ';
  SDuplicateReference = 'WriteObject called twice for the same instance';
  SClassMismatch = 'Resource %s is of incorrect class';
  SInvalidTabIndex = '›Â—” «· »ÊÌ» Œ«—Ã «·ÕœÊœ «·„”„ÊÕ…';
  SInvalidTabPosition = 'Tab position incompatible with current tab style';
  SInvalidTabStyle = 'Tab style incompatible with current tab position';
  SInvalidBitmap = '’Ê—… ‰ﬁÿÌ… €Ì— ’«·Õ…';
  SInvalidIcon = '√ÌﬁÊ‰… €Ì— ’«·Õ…';
  SInvalidMetafile = 'Metafile is not valid';
  SInvalidPixelFormat = ' ‰”Ìﬁ «·»Ìﬂ”·«  €Ì— ’«·Õ';
  SInvalidImage = '’Ê—… €Ì— ’«·Õ…';
  SBitmapEmpty = '«·’Ê—… «·‰ﬁÿÌ… ›«—€…';
  SScanLine = 'Scan line index out of range';
  SChangeIconSize = '·«Ì„ﬂ‰  €ÌÌ— ÕÃ„ «·√ÌﬁÊ‰…';
  SChangeWicSize = 'Cannot change the size of a WIC Image';
  SOleGraphic = 'Invalid operation on TOleGraphic';
  SUnknownExtension = '«„ œ«œ „·› ’Ê—… €Ì— „⁄—Ê› (.%s)';
  SUnknownClipboardFormat = ' ‰”Ìﬁ Õ«›Ÿ… €Ì— „œ⁄Ê„';
  SOutOfResources = 'Œ«—Ã „Ê«—œ «·‰Ÿ«„';
  SNoCanvasHandle = '«·ﬂ«‰›«” ·«Ì”„Õ »«·—”„';
  SInvalidTextFormatFlag = 'Text format flag ''%s'' not supported';
  SInvalidImageSize = 'ÕÃ„ «·’Ê—… €Ì— ’«·Õ';
  STooManyImages = '«·’Ê— √ﬂÀ— „‰ «·„„ﬂ‰';
  SDimsDoNotMatch = 'Image dimensions do not match image list dimensions';
  SInvalidImageList = 'Invalid ImageList';
  SReplaceImage = '€Ì— ﬁ«œ— ⁄·Ï «” »œ«· «·’Ê—…';
  SInsertImage =  '€Ì— ﬁ«œ— ⁄·Ï ≈œ—«Ã «·’Ê—…';
  SImageIndexError = 'Invalid ImageList Index';
  SImageReadFail = 'Failed to read ImageList data from stream';
  SImageWriteFail = 'Failed to write ImageList data to stream';
  SWindowDCError = 'Error creating window device context';
  SClientNotSet = 'Client of TDrag not initialized';
  SWindowClass = 'Error creating window class';
  SWindowCreate = 'Error creating window';
  SCannotFocus = '·«Ì„ﬂ‰ «· —ﬂÌ“ ⁄·Ï ‰«›–… „⁄ÿ·… √Ê €Ì— „—∆Ì…';
  SParentRequired = 'Control ''%s'' has no parent window';
  SParentGivenNotAParent = 'Parent given is not a parent of ''%s''';
  SMDIChildNotVisible = 'Cannot hide an MDI Child Form';
  SVisibleChanged = 'Cannot change Visible in OnShow or OnHide';
  SCannotShowModal = 'Cannot make a visible window modal';
  SScrollBarRange = 'Scrollbar property out of range';
  SPropertyOutOfRange = 'Œ«’Ì… %s Œ«—Ã «·ﬁÌ„… «·„”„ÊÕ…';
  SMenuIndexError = 'Menu index out of range';
  SMenuReinserted = 'Menu inserted twice';
  SMenuNotFound = 'Sub-menu is not in menu';
  SNoTimers = 'Not enough timers available';
  SNotPrinting = '«·ÿ«»⁄… ·« ﬁÊ„ Õ«·Ì« »«·ÿ»«⁄…';
  SPrinting = 'Ã«—Ì «·ÿ»«⁄…';
  SPrinterIndexError = ' —ﬁÌ„ «·ÿ»«⁄… Œ«—Ã «·Õœ «·„„ﬂ‰';
  SInvalidPrinter = '«·ÿ«»⁄… «· Ì  „ «Œ Ì«—Â« €Ì— ’«·Õ…';
  SDeviceOnPort = '%s ⁄·Ï %s';
  SGroupIndexTooLow = 'GroupIndex cannot be less than a previous menu item''s GroupIndex';
  STwoMDIForms = 'Cannot have more than one MDI form per application';
  SNoMDIForm = 'Cannot create form. No MDI forms are currently active';
  SImageCanvasNeedsBitmap = 'Can only modify an image if it contains a bitmap';
  SControlParentSetToSelf = 'A control cannot have itself as its parent';
  SOKButton = '„Ê«›ﬁ';
  SCancelButton = '≈·€«¡';
  SYesButton = '&‰⁄„';
  SNoButton = '&·«';
  SHelpButton = '&„”«⁄œ…';
  SCloseButton = '≈&€·«ﬁ';
  SIgnoreButton = '& Ã«Â·';
  SRetryButton = '≈&⁄«œ… «·„Õ«Ê·…';
  SAbortButton = '≈‰Â«¡';
  SAllButton = '«·&ﬂ·';

  SCannotDragForm = '·«Ì„ﬂ‰ ”Õ» «·‰«›–…';
  SPutObjectError = 'PutObject to undefined item';
  SCardDLLNotLoaded = 'Could not load CARDS.DLL';
  SDuplicateCardId = 'Duplicate CardId found';

  SDdeErr = 'An error returned from DDE  ($0%x)';
  SDdeConvErr = 'DDE Error - conversation not established ($0%x)';
  SDdeMemErr = 'Error occurred when DDE ran out of memory ($0%x)';
  SDdeNoConnect = 'Unable to connect DDE conversation';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = 'Cannot load older version of TShape';
  SVMetafiles = 'Metafiles';
  SVEnhMetafiles = 'Enhanced Metafiles';
  SVIcons = 'Icons';
  SVBitmaps = 'Bitmaps';
  SVTIFFImages = 'TIFF Images';

  SVJPGImages = 'JPEG ’Ê—';
  SVPNGImages = 'PNG ’Ê—';
  SVGIFImages = 'GIF ’Ê—';

  SGridTooLarge = 'Grid too large for operation';
  STooManyDeleted = 'Too many rows or columns deleted';
  SIndexOutOfRange = ' —ﬁÌ„ «·‘»ﬂ… Œ«—Ã «·Õœ «·„”„ÊÕ';
  SFixedColTooBig = 'Fixed column count must be less than column count';
  SFixedRowTooBig = 'Fixed row count must be less than row count';
  SInvalidStringGridOp = '·«Ì„ﬂ‰ ≈œ—«Ã √Ê Õ–› «·”Ã·«  „‰ «·‘»ﬂ…';
  SInvalidEnumValue = 'Invalid Enum Value';
  SInvalidNumber = 'Invalid numeric value';
  SOutlineIndexError = 'Outline index not found';
  SOutlineExpandError = 'Parent must be expanded';
  SInvalidCurrentItem = 'ﬁÌ„… €Ì— ’«·Õ… ··⁄‰’— «·Õ«·Ì';
  SMaskErr = 'ﬁÌ„… «·„œŒ·«  €Ì— ’ÕÌÕ…';
  SMaskEditErr = 'ﬁÌ„… «·„œŒ·«  €Ì— ’ÕÌÕ….  «” Œœ„ “— «·≈·€«¡ ·· —«Ã⁄';
  SOutlineError = 'Invalid outline index';
  SOutlineBadLevel = 'Incorrect level assignment';
  SOutlineSelection = '«Œ Ì«— €Ì— ’«·Õ';
  SOutlineFileLoad = 'Œÿ√ ›Ì  Õ„Ì· «·„·›';
  SOutlineLongLine = '«·”ÿ— ÿÊÌ· Ãœ«';
  SOutlineMaxLevels = ' „  Ã«Ê“ «·⁄„ﬁ «·√⁄Ÿ„Ì';

  SMsgDlgWarning = '  Õ–Ì—';
  SMsgDlgError = ' Œÿ√';
  SMsgDlgInformation = ' „⁄·Ê„« ';
  SMsgDlgConfirm = '  √ﬂÌœ';
  SMsgDlgYes = '&‰⁄„';
  SMsgDlgNo = '&·«';
  SMsgDlgOK = '&„Ê«›ﬁ';
  SMsgDlgCancel = '≈·&€«¡';
  SMsgDlgHelp = '„&”«⁄œ…';
  SMsgDlgHelpNone = ' ·«  Ê›— „”«⁄œ…';
  SMsgDlgHelpHelp = '„”«⁄œ…';
  SMsgDlgAbort = '≈‰&Â«¡';
  SMsgDlgRetry = '≈&⁄«œ… «·„Õ«Ê·…';
  SMsgDlgIgnore = '& Ã«Â·';
  SMsgDlgAll = '«·&ﬂ·';
  SMsgDlgNoToAll = '·« ··ﬂ·';
  SMsgDlgYesToAll = '‰⁄„ ··ﬂ·';
  SMsgDlgClose = '≈&€·«ﬁ';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(€Ì— „⁄—Ê›)';
  srNone = '(·«‘Ì¡)';
  SOutOfRange = 'ÌÃ» √‰  ﬂÊ‰ «·ﬁÌ„… »Ì‰ %d Ê %d';

  SDateEncodeError = ' ‰”Ìﬁ «· «—ÌŒ Œ«ÿ∆';
  SDefaultFilter = 'ﬂ· «·„·›«  (*.*)|*.*';
  sAllFilter = '«·ﬂ·';
  SNoVolumeLabel = ': [ - ·««”„ - ]';
  SInsertLineError = 'Unable to insert a line';

  SConfirmCreateDir = '«·„Ã·œ «·„Õœœ €Ì— „ÊÃÊœ , Â·  —Ìœ ≈‰‘«¡Â?';
  SSelectDirCap = '«Œ — „Ã·œ';
  SDirNameCap = '«”„ «·„&Ã·œ:';
  SDrivesCap = '«·√&ﬁ—«’:';
  SDirsCap = '«·„&Ã·œ« :';
  SFilesCap = '«·&„·›« : (*.*)';
  SNetworkCap = '«·&‘»ﬂ…...';

  SColorPrefix = '«··Ê‰' deprecated;          //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP' deprecated; //!! obsolete - delete in 5.0

  SInvalidClipFmt = ' ‰”Ìﬁ Õ«›Ÿ… €Ì— ’«·Õ';
  SIconToClipboard = '«·Õ«›Ÿ… ·« œ⁄„ «·√ÌﬁÊ‰« ';
  SCannotOpenClipboard = '·«Ì„ﬂ‰ › Õ Õ«›Ÿ…: %s';

  SDefault = '«› —«÷Ì';

  SInvalidMemoSize = '«·‰’  Ã«Ê“ ”⁄… «·„›ﬂ—…';
  SCustomColors = '√·Ê«‰ „Œ’’…';
  SInvalidPrinterOp = '«·⁄„·Ì… €Ì— „œ⁄Ê„… ⁄·Ï «·ÿ«»⁄… «·„Œ «—…';
  SNoDefaultPrinter = '·„ Ì „ «Œ Ì«— ÿ«»⁄… «› —«÷Ì… »⁄œ';

  SIniFileWriteError = '·«Ì„ﬂ‰ «·ﬂ «»… ⁄·Ï %s';

  SBitsIndexError = 'Bits index out of range';

  SUntitled = '(Untitled)';

  SInvalidRegType = '‰Ê⁄ »Ì«‰«  €Ì— ’«·Õ „‰ √Ã· ''%s''';

  SUnknownConversion = 'Unknown RichEdit conversion file extension (.%s)';
  SDuplicateMenus = 'Menu ''%s'' is already being used by another form';

  SPictureLabel = '«·’Ê—…:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = '«” ⁄—«÷';

  SCannotOpenAVI = '·«Ì„ﬂ‰ › Õ „·› ›ÌœÌÊ AVI';

  SNotOpenErr = 'No MCI device open';
  SMPOpenFilter = 'ﬂ· «·„·›«  (*.*)|*.*|Wave  (*.wav)|*.wav|Midi  (*.mid)|*.mid|Video for Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'Other';
  SMCIOverlay = 'Overlay';
  SMCIScanner = 'Scanner';
  SMCISequencer = 'Sequencer';
  SMCIVCR = 'VCR';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Unknown error code';

  SBoldItalicFont = '⁄—Ì÷ „«∆·';
  SBoldFont = '⁄—Ì÷';
  SItalicFont = '„«∆·';
  SRegularFont = '⁄«œÌ';

  SPropertiesVerb = 'Œ’«∆’';

  SServiceFailed = '›‘·  «·Œœ„… ⁄·Ï %s: %s';
  SExecute = ' ‰›Ì–';
  SStart = '»œ¡';
  SStop = ' Êﬁ›';
  SPause = ' Êﬁ› „ƒﬁ ';
  SContinue = '„ «»⁄…';
  SInterrogate = 'interrogate';
  SShutdown = '≈Ìﬁ«›  ‘€Ì·';
  SCustomError = 'Service failed in custom message(%d): %s';
  SServiceInstallOK = 'Service installed successfully';
  SServiceInstallFailed = 'Service "%s" failed to install with error: "%s"';
  SServiceUninstallOK = 'Service uninstalled successfully';
  SServiceUninstallFailed = 'Service "%s" failed to uninstall with error: "%s"';



  SDockedCtlNeedsName = 'Docked control must have a name';
  SDockTreeRemoveError = 'Error removing control from dock tree';
  SDockZoneNotFound = ' - Dock zone not found';
  SDockZoneHasNoCtl = ' - Dock zone has no control';
  SDockZoneVersionConflict = 'Error loading dock zone from the stream. ' +
    'Expecting version %d, but found %d.';

  SAllCommands = 'ﬂ· «·√Ê«„—';

  SDuplicateItem = 'List does not allow duplicates ($0%x)';

  STextNotFound = '·„ Ì „ «·⁄ÀÊ— ⁄·Ï : "%s"';
  SBrowserExecError = '·„ Ì „  ÕœÌœ «·„” ⁄—÷ «·«› —«÷Ì';

  SColorBoxCustomCaption = '„Œ’’...';

  SMultiSelectRequired = 'Multiselect mode must be on for this feature';

  SPromptArrayTooShort = 'Length of value array must be >= length of prompt array';
  SPromptArrayEmpty = 'Prompt array must not be empty';

  SUsername = '«&”„ «·„” Œœ„';
  SPassword = '&ﬂ·„… «·„—Ê—';
  SDomain = '«·&œÊ„Ì‰';
  SLogin = 'œŒÊ·';

  SKeyCaption = 'Key';
  SValueCaption = 'Value';
  SKeyConflict = 'A key with the name of "%s" already exists';
  SKeyNotFound = 'Key "%s" not found';
  SNoColumnMoving = 'goColMoving is not a supported option';
  SNoEqualsInKey = 'Key may not contain equals sign ("=")';

  SSendError = 'Œÿ√ ›Ì «—”«· «·»—Ìœ';
  SAssignSubItemError = 'Cannot assign a subitem to an actionbar when one of it''s parent''s is already assigned to an actionbar';
  SDeleteItemWithSubItems = 'Item %s has subitems, delete anyway?';
  SDeleteNotAllowed = 'You are not allowed to delete this item';
  SMoveNotAllowed = 'Item %s is not allowed to be moved';
  SMoreButtons = '«·„“Ìœ „‰ «·√“—«—';
  SErrorDownloadingURL = 'Œÿ√ ›Ì  Õ„Ì·  URL: %s';
  SUrlMonDllMissing = '€Ì— ﬁ«œ— ⁄·Ï  Õ„Ì· %s';
  SAllActions = '(ﬂ· «·√Ê«„—)';
  SNoCategory = '(·« ’‰Ì›)';
  SExpand = ' Ê”Ì⁄';
  SErrorSettingPath = 'Œÿ√ ›Ì „”«— «·≈⁄œ«œ« : "%s"';
  SLBPutError = 'Attempting to put items into a virtual style listbox';
  SErrorLoadingFile = 'Œÿ√ ›Ì „Õ«Ê·…  Õ„Ì· „·› «·≈⁄œ«œ«  : %s'#13'Would you like to delete it?';
  SResetUsageData = '≈⁄«œ… ÷»ÿ ﬂ· »Ì«‰«  «·«” Œœ«„ ø';
  SFileRunDialogTitle = ' ‘€Ì·';
  SNoName = '(·« «”„)';
  SErrorActionManagerNotAssigned = 'ÌÃ»  ÕœÌœ „œÌ— «·√Ê«„— √Ê·«';
  SAddRemoveButtons = '&≈÷«›… Ê≈“«·… «·√“—«—';
  SResetActionToolBar = '≈⁄«œ… ÷»ÿ ‘—Ìÿ «·√œÊ« ';
  SCustomize = '&«· Œ’Ì’...';
  SSeparator = '›«’·';
  SCircularReferencesNotAllowed = 'Circular references not allowed';
  SCannotHideActionBand = '%s ·« Ì”„Õ »«·≈Œ›«¡';
  SErrorSettingCount = 'Error setting %s.Count';
  SListBoxMustBeVirtual = 'Listbox (%s) style must be virtual in order to set Count';
  SUnableToSaveSettings = '€Ì— ﬁ«œ— ⁄·Ï Õ›Ÿ «·≈⁄œ«œ« ';
  SRestoreDefaultSchedule = 'Would you like to reset to the default Priority Schedule?';
  SNoGetItemEventHandler = 'No OnGetItem event handler assigned';
  SInvalidColorMap = 'Invalid Colormap this ActionBand requires ColorMaps of type TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = 'A style named %s has already been registered';
  SMissingActionBarStyleName = 'A style named %s has not been registered';
  SStandardStyleActionBars = 'ÂÌ∆… ﬁÌ«”Ì…';
  SXPStyleActionBars = 'ÂÌ∆… ≈ﬂ” »Ì';
  SActionBarStyleMissing = 'No ActionBand style unit present in the uses clause.'#13 +
    'Your application must include either XPStyleActnCtrls, StdStyleActnCtrls or ' +
    'a third party ActionBand style unit in its uses clause';
  sParameterCannotBeNil = '%s parameter in call to %s cannot be nil';
  SInvalidColorString = 'Invalid Color string';
  SActionManagerNotAssigned = '%s ActionManager property has not been assigned';

  SInvalidPath = '"%s" ÂÊ „”«— €Ì— ’«·Õ';
  SInvalidPathCaption = '„”«— €Ì— ’«·Õ';

  SANSIEncoding = 'ANSI';
  SASCIIEncoding = 'ASCII';
  SUnicodeEncoding = 'Unicode';
  SBigEndianEncoding = 'Big Endian Unicode';
  SUTF8Encoding = 'UTF-8';
  SUTF7Encoding = 'UTF-7';
  SEncodingLabel = 'Encoding:';

  sCannotAddFixedSize = 'Cannot add columns or rows while expand style is fixed size';
  sInvalidSpan = '''%d'' is not a valid span';
  sInvalidRowIndex = 'Row index, %d, out of bounds';
  sInvalidColumnIndex = 'Column index, %d, out of bounds';
  sInvalidControlItem = 'ControlItem.Control cannot be set to owning GridPanel';
  sCannotDeleteColumn = 'Cannot delete a column that contains controls';
  sCannotDeleteRow = 'Cannot delete a row that contains controls';
  sCellMember = 'Member';
  sCellSizeType = 'Size Type';
  sCellValue = 'Value';
  sCellAutoSize = 'Auto';
  sCellPercentSize = 'Percent';
  sCellAbsoluteSize = 'Absolute';
  sCellColumn = 'Column%d';
  sCellRow = 'Row%d';

  STrayIconRemoveError = 'Cannot remove shell notification icon';
  STrayIconCreateError = 'Cannot create shell notification icon';

  SPageControlNotSet = 'PageControl must first be assigned';

  SWindowsVistaRequired = '%s ÌÕ «Ã ≈·Ï Windows Vista √Ê √ÕœÀ';
  SXPThemesRequired = '%s Ì ÿ·»  ›⁄Ì· «·”„«  ⁄·Ï Ê‰œÊ“';

  STaskDlgButtonCaption = '“—%d';
  STaskDlgRadioButtonCaption = 'Œ«‰… «Œ Ì«—%d';
  SInvalidTaskDlgButtonCaption = 'ÌÃ» «‰ ·«ÌﬂÊ‰ «‰’ «·⁄‰Ê«‰ ›«—€';

  SInvalidCategoryPanelParent = 'CategoryPanel must have a CategoryPanelGroup as its parent';
  SInvalidCategoryPanelGroupChild = 'Only CategoryPanels can be inserted into a CategoryPanelGroup';

  SInvalidCanvasOperation = 'Invalid canvas operation';
  SNoOwner = '%s has no owner';
  SRequireSameOwner = 'Source and destination require the same owner';
  SDirect2DInvalidOwner = '%s cannot be owned by a different canvas';
  SDirect2DInvalidSolidBrush = 'Not a solid color brush';
  SDirect2DInvalidBrushStyle = 'Invalid brush style';

  SKeyboardLocaleInfo = 'Œÿ√ ›Ì «” ⁄«œ… «·„⁄·Ê„«  «·„Õ·Ì…';
  SKeyboardLangChange = '›‘· ›Ì  €ÌÌ— ·€… «·≈œŒ«·';

  SOnlyWinControls = 'You can only tab dock TWinControl based Controls';

  SNoKeyword = 'No help keyword specified.';

  SStyleLoadError = 'Unable to load style ''%s''';
  SStyleLoadErrors = 'Unable to load styles: %s';
  SStyleRegisterError = 'Style ''%s'' already registered';
  SStyleClassRegisterError = 'Style class ''%s'' already registered';
  SStyleNotFound = 'Style ''%s'' not found';
  SStyleClassNotFound = 'Style class ''%s'' not found';
  SStyleInvalidHandle = 'Invalid style handle';
  SStyleFormatError = 'Invalid style format';
  SStyleFileDescription = 'VCL Style File';
  SStyleHookClassRegistered = 'Class ''%s'' is already registered for ''%s''';
  SStyleHookClassNotRegistered = 'Class ''%s'' is not registered for ''%s''';
  SStyleInvalidParameter = '%s parameter cannot be nil';
  SStyleHookClassNotFound = 'A StyleHook class has not been registered for %s';
  SStyleFeatureNotSupported = 'Feature not supported by this style';
  SStyleNotRegistered = 'Style ''%s'' is not registered';
  SStyleUnregisterError = 'Cannot unregister the system style';
  SStyleNotRegisteredNoName = 'Style not registered';


  // ColorToPrettyName strings
  SNameBlack = 'Black';
  SNameMaroon = 'Maroon';
  SNameGreen = 'Green';
  SNameOlive = 'Olive';
  SNameNavy = 'Navy';
  SNamePurple = 'Purple';
  SNameTeal = 'Teal';
  SNameGray = 'Gray';
  SNameSilver = 'Silver';
  SNameRed = 'Red';
  SNameLime = 'Lime';
  SNameYellow = 'Yellow';
  SNameBlue = 'Blue';
  SNameFuchsia = 'Fuchsia';
  SNameAqua = 'Aqua';
  SNameWhite = 'White';
  SNameMoneyGreen = 'Money Green';
  SNameSkyBlue = 'Sky Blue';
  SNameCream = 'Cream';
  SNameMedGray = 'Medium Gray';
  SNameActiveBorder = 'Active Border';
  SNameActiveCaption = 'Active Caption';
  SNameAppWorkSpace = 'Application Workspace';
  SNameBackground = 'Background';
  SNameBtnFace = 'Button Face';
  SNameBtnHighlight = 'Button Highlight';
  SNameBtnShadow = 'Button Shadow';
  SNameBtnText = 'Button Text';
  SNameCaptionText = 'Caption Text';
  SNameDefault = 'Default';
  SNameGradientActiveCaption = 'Gradient Active Caption';
  SNameGradientInactiveCaption = 'Gradient Inactive Caption';
  SNameGrayText = 'Gray Text';
  SNameHighlight = 'Highlight Background';
  SNameHighlightText = 'Highlight Text';
  SNameHotLight = 'Hot Light';
  SNameInactiveBorder = 'Inactive Border';
  SNameInactiveCaption = 'Inactive Caption';
  SNameInactiveCaptionText = 'Inactive Caption Text';
  SNameInfoBk = 'Info Background';
  SNameInfoText = 'Info Text';
  SNameMenu = 'Menu Background';
  SNameMenuBar = 'Menu Bar';
  SNameMenuHighlight = 'Menu Highlight';
  SNameMenuText = 'Menu Text';
  SNameNone = 'None';
  SNameScrollBar = 'Scroll Bar';
  SName3DDkShadow = '3D Dark Shadow';
  SName3DLight = '3D Light';
  SNameWindow = 'Window Background';
  SNameWindowFrame = 'Window Frame';
  SNameWindowText = 'Window Text';

  SInvalidBitmapPixelFormat = 'Invalid bitmap pixel format, should be a 32 bit image';
  SJumplistsItemErrorGetpsi = 'Querying the IPropertyStore interface';
  SJumplistsItemErrorInitializepropvar = 'Initializing a variant property';
  SJumplistsItemErrorSetps = 'Setting the value of a property store';
  SJumplistsItemErrorCommitps = 'Committing a property store';
  SJumplistsItemErrorSettingarguments = 'Setting the arguments of a jump list item';
  SJumplistsItemErrorSettingpath = 'Setting the path of a jump list item';
  SJumplistsItemErrorSettingicon = 'Setting the icon location of a jump list item';
  SJumplistsItemErrorAddingtobjarr = 'Adding an item to an object array';
  SJumplistsItemErrorGettingobjarr = 'Querying the IObjectArray interface';
  SJumplistsItemErrorNofriendlyname = 'The FriendlyName property of an item must not be empty';
  SJumplistsItemException = 'JumpListItem exception: Error %d: %s';
  SJumplistException = 'JumpList exception: Error %d: %s';
  SJumplistErrorBeginlist = 'Initiating a building session for a new jump list';
  SJumplistErrorAppendrc = 'Appending an item to the recent files category of a new jump list';
  SJumplistErrorAppendfc = 'Appending an item to the frequent files category of a new jump list';
  SJumplistErrorAddusertasks = 'Adding your tasks to a new jump list';
  SJumplistErrorAddcategory = 'Adding a custom category (''%s'') and its child items to a new jump list';
  SJumplistErrorCommitlist = 'Committing a new jump list';
  SJumplistExceptionInvalidOS = 'The current operating system does not support jump lists';
  SJumplistExceptionAppID = 'The current process already has an application ID: %s';

  { BeginInvoke }

  sBeginInvokeNoHandle = 'Cannot call BeginInvoke on a control with no parent or window handle';

  SToggleSwitchCaptionOn = '≈Ìﬁ«›';
  SToggleSwitchCaptionOff = ' ‘€Ì·';
  SInvalidRelativePanelControlItem = 'ControlItem.Control cannot be set to owning RelativePanel';
  SInvalidRelativePanelSibling = 'Control is not a sibling within RelativePanel';
  SInvalidRelativePanelSiblingSelf = 'Control cannot be positioned relative to itself';

implementation

end.


