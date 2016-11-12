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
{*******************************************************}

unit Vcl.Consts;

interface

  resourcestring
  SOpenFileTitle = '› Õ';
  SCantWriteResourceStreamError = '·«Ì„ﬂ‰ «·ﬂ «»… ·„Ê—œ „Œ’’ ··ﬁ—«¡… ›ﬁÿ';
  SDuplicateReference = ' „ «” œ⁄«¡ €—÷ «·ﬂ «»… WriteObject „— Ì‰ „‰ √Ã· ‰›” «·„‰ ”Œ';
  SClassMismatch = '«·„Ê«—œ %s  «»⁄Â ·’‰› €Ì— ’ÕÌÕ';
  SInvalidTabIndex = '›Â—” «· »ÊÌ» Œ«—Ã «·ÕœÊœ «·„”„ÊÕ…';
  SInvalidTabPosition = '„Êﬁ⁄ «·’›Õ… €Ì— „ Ê«›ﬁ „⁄ ‰„ÿ «·’›Õ«  «·Õ«·Ì ';
  SInvalidTabStyle = '‰„ÿ «·’›Õ… €Ì— „ Ê«›ﬁ „⁄ „Êﬁ⁄ «·’›Õ«  «·Õ«·Ì';
  SInvalidBitmap = '’Ê—… ‰ﬁÿÌ… €Ì— ’«·Õ…';
  SInvalidIcon = '√ÌﬁÊ‰… €Ì— ’«·Õ…';
  SInvalidMetafile = '„·› «·„Ì « Metafile €Ì— ’«·Õ';
  SInvalidPixelFormat = ' ‰”Ìﬁ «·»Ìﬂ”·«  €Ì— ’«·Õ';
  SInvalidImage = '’Ê—… €Ì— ’«·Õ…';
  SBitmapEmpty = '«·’Ê—… «·‰ﬁÿÌ… ›«—€…';
  SScanLine = '›Â—”  ⁄·Ì„… Scan line Œ«—Ã «·ÕœÊœ «·„„ﬂ‰…';
  SChangeIconSize = '·«Ì„ﬂ‰  €ÌÌ— ÕÃ„ «·√ÌﬁÊ‰…';
  SChangeWicSize = '·«Ì„ﬂ‰  €ÌÌ— ÕÃ„ ’Ê—… WIC';
  SOleGraphic = '⁄„·Ì… €Ì— ’«·Õ… ⁄·Ï TOleGraphic';
  SUnknownExtension = '«„ œ«œ „·› ’Ê—… €Ì— „⁄—Ê› (.%s)';
  SUnknownClipboardFormat = ' ‰”Ìﬁ Õ«›Ÿ… €Ì— „œ⁄Ê„';
  SOutOfResources = 'Œ«—Ã „Ê«—œ «·‰Ÿ«„';
  SNoCanvasHandle = '«·ﬂ«‰›«” ·«Ì”„Õ »«·—”„';
  SInvalidTextFormatFlag = '«· ''%s'' ›Ì  ‰”Ìﬁ «·‰’ €Ì— „œ⁄Ê„… ';
  SInvalidImageSize = 'ÕÃ„ «·’Ê—… €Ì— ’«·Õ';
  STooManyImages = '«·’Ê— √ﬂÀ— „‰ «·„„ﬂ‰';
  SDimsDoNotMatch = '√»⁄«œ «·’Ê—… ·« ÿ«»ﬁ √»⁄«œ ·«∆Õ… «·’Ê— image list';
  SInvalidImageList = '·«∆Õ… ’Ê— ImageList €Ì— ’«·Õ…';
  SReplaceImage = '€Ì— ﬁ«œ— ⁄·Ï «” »œ«· «·’Ê—…';
  SInsertImage =  '€Ì— ﬁ«œ— ⁄·Ï ≈œ—«Ã «·’Ê—…';
  SImageIndexError = '›Â—” ·«∆Õ… «·’Ê— ImageList €Ì— ’«·Õ';
  SImageReadFail = '·«Ì„ﬂ‰ ﬁ—«¡… »Ì«‰«  ·«∆Õ… «·’Ê— ImageList „‰ «·„Ã—Ï stream';
  SImageWriteFail = '·«Ì„ﬂ‰ ﬂ «»… »Ì«‰«  ·«∆Õ… «·’Ê— ImageList ≈·Ï «·„Ã—Ï stream';
  SWindowDCError = 'Œÿ√ ›Ì ≈‰‘«¡  window device context';
  SClientNotSet = 'ÊﬂÌ· TDrag ·„   „  ÂÌ√ Â';
  SWindowClass = 'Œÿ√ ›Ì ≈‰‘«¡ ’‰› «·‰«›–…';
  SWindowCreate = 'Œÿ√ ›Ì ≈‰‘«¡ «·‰«›–…';
  SCannotFocus = '·«Ì„ﬂ‰ «· —ﬂÌ“ ⁄·Ï ‰«›–… „⁄ÿ·… √Ê €Ì— „—∆Ì…';
  SParentRequired = '«·„ﬂÊ‰ ''%s'' ·Ì” ·Â ‰«›–… √»';
  SParentGivenNotAParent = '«·„ﬂÊ‰ «·√» «·„⁄ÿÏ ·Ì” √»« ·‹ ''%s''';
  SMDIChildNotVisible = '·«Ì„ﬂ‰ ≈Œ›«¡ ‰«›–… MDI ›—⁄Ì…';
  SVisibleChanged = '·«Ì„ﬂ‰  €ÌÌ— Œ«’Ì… «·—ƒÌ… ›Ì ÕœÀÌ OnShow Ê OnHide';
  SCannotShowModal = '·«Ì„ﬂ‰  ÕÊÌ· ‰«›–… „—∆Ì… ≈·Ï ‰Ê⁄ modal';
  SScrollBarRange = 'Œ«’Ì… ‘—Ìÿ «· „—Ì— Œ«—Ã «·ÕœÊœ';
  SPropertyOutOfRange = 'Œ«’Ì… %s Œ«—Ã «·ﬁÌ„… «·„”„ÊÕ…';
  SMenuIndexError = '›Â—” «·ﬁ«∆„… Œ«—Ã «·ÕœÊœ';
  SMenuReinserted = ' „ ≈÷«›… «·ﬁ«∆„… „— Ì‰';
  SMenuNotFound = '«·ﬁ«∆„… «·›—⁄Ì… ·Ì”  ›Ì «·ﬁ«∆„…';
  SNoTimers = '·«ÌÊÃœ „ƒﬁ «  ﬂ«›ÌÂ';
  SNotPrinting = '«·ÿ«»⁄… ·« ﬁÊ„ Õ«·Ì« »«·ÿ»«⁄…';
  SPrinting = 'Ã«—Ì «·ÿ»«⁄…';
  SPrinterIndexError = ' —ﬁÌ„ «·ÿ»«⁄… Œ«—Ã «·Õœ «·„„ﬂ‰';
  SInvalidPrinter = '«·ÿ«»⁄… «· Ì  „ «Œ Ì«—Â« €Ì— ’«·Õ…';
  SDeviceOnPort = '%s ⁄·Ï %s';
  SGroupIndexTooLow = 'GroupIndex ·«Ì„ﬂ‰ √‰  ﬂÊ‰ √ﬁ· „‰ ﬁÌ„… GroupIndex ”«»ﬁ… ›Ì √Õœ «·⁄‰«’—';
  STwoMDIForms = '·«Ì„ﬂ‰ ÊÃÊœ √ﬂÀ— „‰ ‰„Ê–Ã MDI Ê«Õœ ›Ì «· ÿ»Ìﬁ';
  SNoMDIForm = '·«Ì„ﬂ‰ ≈‰‘«¡ ‰„Ê–Ã. ·«ÌÊÃœ ‰„Ê–Ã MDI ›⁄«· Õ«·Ì«';
  SImageCanvasNeedsBitmap = 'Ì„ﬂ‰  ⁄œÌ· «·’Ê—… ≈–« ﬂ«‰   ÕÊÌ „’›Ê›… ‰ﬁÿÌ… ›ﬁÿ „‰ ‰Ê⁄ bitmap';
  SControlParentSetToSelf = '·«Ì„ﬂ‰ ··„ﬂÊ‰ √‰ ÌﬂÊ‰ √»« ·‰›”…';
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
  SCardDLLNotLoaded = '·«Ì„ﬂ‰  Õ„Ì· „·› CARDS.DLL';
  SDuplicateCardId = '—ﬁ„ CardId «·–Ì  „ «·⁄ÀÊ— ⁄·ÌÂ „ﬂ——';

  SDdeErr = 'Œÿ√ „‰  DDE  ($0%x)';
  SDdeConvErr = 'Œÿ√ DDE - ·„ Ì „  √”Ì” «·„Õ«œÀ… ($0%x)';
  SDdeMemErr = 'ÕœÀ Œÿ√ »√‰ DDE  Ã«Ê“ «·–«ﬂ—… «·„”„ÊÕ… ($0%x)';
  SDdeNoConnect = '·«Ì„ﬂ‰ «·« ’«· »„Õ«œÀ… DDE ';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = '·«Ì„ﬂ‰  Õ„Ì· ≈’œ«—… √ﬁœ„ „‰ TShape';
  SVMetafiles = '„·›«  „Ì « Metafiles';
  SVEnhMetafiles = '„·›«  „Ì « „Õ”‰… Enhanced Metafiles';
  SVIcons = '√ÌﬁÊ‰«  Icons';
  SVBitmaps = '’Ê— ‰ﬁÿÌ… Bitmaps';
  SVTIFFImages = '’Ê— TIFF';

  SVJPGImages = 'JPEG ’Ê—';
  SVPNGImages = 'PNG ’Ê—';
  SVGIFImages = 'GIF ’Ê—';

  SGridTooLarge = '«·‘»ﬂ… ﬂ»Ì—… Ãœ« ⁄·Ï Â–Â «·⁄„·Ì…';
  STooManyDeleted = ' „ Õ–› ﬂ„Ì… ﬂ»Ì—… „‰ «·ÕﬁÊ· Ê«·√”ÿ—';
  SIndexOutOfRange = ' —ﬁÌ„ «·‘»ﬂ… Œ«—Ã «·Õœ «·„”„ÊÕ';
  SFixedColTooBig = '⁄œœ «·ÕﬁÊ· «·À«» … ÌÃ» «‰ ÌﬂÊ‰ √ﬁ· „‰ ⁄œœ «·ÕﬁÊ· «·ﬂ·Ì';
  SFixedRowTooBig = '⁄œœ «·√”ÿ— «·À«» … ÌÃ» «‰ ÌﬂÊ‰ √ﬁ· „‰ ⁄œœ «·«”ÿ— «·ﬂ·Ì';
  SInvalidStringGridOp = '·«Ì„ﬂ‰ ≈œ—«Ã √Ê Õ–› «·”Ã·«  „‰ «·‘»ﬂ…';
  SInvalidEnumValue = 'ﬁÌ„… ”—œÌ… €Ì— ’«·Õ…';
  SInvalidNumber = 'ﬁÌ„… —ﬁ„Ì… €Ì— ’«·Õ…';
  SOutlineIndexError = '›Â—” «·Õœ «·Œ«—ÃÌ Outline ·„ Ì „ «·⁄ÀÊ— ⁄·ÌÂ';
  SOutlineExpandError = 'ÌÃ» √‰ Ì „  Ê”Ì⁄ «·√»';
  SInvalidCurrentItem = 'ﬁÌ„… €Ì— ’«·Õ… ··⁄‰’— «·Õ«·Ì';
  SMaskErr = 'ﬁÌ„… «·„œŒ·«  €Ì— ’ÕÌÕ…';
  SMaskEditErr = 'ﬁÌ„… «·„œŒ·«  €Ì— ’ÕÌÕ….  «” Œœ„ “— «·≈·€«¡ ·· —«Ã⁄';
  SOutlineError = '«·›Â—” «·Œ«—ÃÌ outline €Ì— ’«·Õ';
  SOutlineBadLevel = '‰”» ﬁÌ„… „” ÊÏ €Ì— ’ÕÌÕ';
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
  SInsertLineError = '€Ì— ﬁ«œ— ⁄·Ï ≈÷«›… ”ÿ—';

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

  SBitsIndexError = '›Â—” «·» «  Œ«—Ã «·ÕœÊœ';

  SUntitled = '(»·«  ”„Ì…)';

  SInvalidRegType = '‰Ê⁄ »Ì«‰«  €Ì— ’«·Õ „‰ √Ã· ''%s''';

  SUnknownConversion = '«„ œ«œ „·› ‰’ „‰”ﬁ €Ì— „⁄—Ê› (.%s)';
  SDuplicateMenus = '«·ﬁ«∆„… ''%s''  ” Œœ„ „”»ﬁ« „‰ ﬁ»· ‰«›–… «Œ—Ï';

  SPictureLabel = '«·’Ê—…:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = '«” ⁄—«÷';

  SCannotOpenAVI = '·«Ì„ﬂ‰ › Õ „·› ›ÌœÌÊ AVI';

  SNotOpenErr = '·„ Ì „ › Õ ÃÂ«“ MCI device ';
  SMPOpenFilter = 'ﬂ· «·„·›«  (*.*)|*.*|Wave  (*.wav)|*.wav|Midi  (*.mid)|*.mid| ›ÌœÌÊ Ê‰œÊ“ (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = '¬Œ—';
  SMCIOverlay = ' €ÿÌÂ';
  SMCIScanner = '„«”ÕÂ';
  SMCISequencer = '„”·”·';
  SMCIVCR = '„”Ã· ›ÌœÌÊ ﬂ«”Ì  (VCR)';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'Œÿ√ €Ì— „⁄—Ê›';

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
  SInterrogate = '«” ÃÊ«»';
  SShutdown = '≈Ìﬁ«›  ‘€Ì·';
  SCustomError = '›‘· ›Ì «·Œœ„… , —”«·… „Œ’’… (%d): %s';
  SServiceInstallOK = ' „  ‰’Ì» «·Œœ„… »‰Ã«Õ';
  SServiceInstallFailed = '›‘·  ‰’Ì» «·Œœ„… "%s" ÕœÀ «·Œÿ√ «· «·Ì: "%s"';
  SServiceUninstallOK = ' „ ≈·€«¡  ‰’Ì» «·Œœ„… »‰Ã«Õ';
  SServiceUninstallFailed = '›‘·  ‰’Ì» «·Œœ„… "%s" „⁄ «·Œÿ√: "%s"';



  SDockedCtlNeedsName = '„ﬂÊ‰ «· —«’› ÌÃ» «‰ ÌﬂÊ‰ ·Â «”„';
  SDockTreeRemoveError = 'Œÿ√ ≈“«·… «·„ﬂÊ‰ „‰ ‘Ã—… «· —«’›';
  SDockZoneNotFound = ' - „‰ÿﬁ… «· —«’› €Ì— „ÊÃÊœ…';
  SDockZoneHasNoCtl = ' - „‰ÿﬁ… «· —«’› ·Ì” ·« „·ﬂ „ﬂÊ‰« ';
  SDockZoneVersionConflict = 'Œÿ√ ›Ì  Õ„Ì· „‰ÿﬁ…  —«’› „‰ «·„”·ﬂ Stream . ' +
    '«·‰”Œ… «·„ Êﬁ⁄… %d, «·‰”Œ… «·„ÊÃÊœ… %d.';

  SAllCommands = 'ﬂ· «·√Ê«„—';

  SDuplicateItem = '«·ﬁ«∆„… ·«  ”„Õ »«· ﬂ—«—«   ($0%x)';

  STextNotFound = '·„ Ì „ «·⁄ÀÊ— ⁄·Ï : "%s"';
  SBrowserExecError = '·„ Ì „  ÕœÌœ «·„” ⁄—÷ «·«› —«÷Ì';

  SColorBoxCustomCaption = '„Œ’’...';

  SMultiSelectRequired = 'ÌÃ»  ›⁄Ì· «·«Œ Ì«— «·„ ⁄œœ „‰ √Ã· Â–Â «·Œ«’Ì…';

  SPromptArrayTooShort = 'ÿÊ· „’›Ê›… «·ﬁÌ„ ÌÃ» «‰ ÌﬂÊ‰ >= ÿÊ· „’›Ê›… «·√Ê’«›';
  SPromptArrayEmpty = '„’›Ê›… «·√Ê’«› ÌÃ» «‰ ·« ﬂÊ‰ ›«—€…';

  SUsername = '«&”„ «·„” Œœ„';
  SPassword = '&ﬂ·„… «·„—Ê—';
  SDomain = '«·&œÊ„Ì‰';
  SLogin = 'œŒÊ·';

  SKeyCaption = '«·„› «Õ';
  SValueCaption = '«·ﬁÌ„…';
  SKeyConflict = '„› «Õ »«”„ "%s" „ÊÃÊœ „”»ﬁ«';
  SKeyNotFound = '«·„› «Õ "%s" €Ì— „ÊÃÊœ';
  SNoColumnMoving = 'goColMoving ·Ì” ŒÌ«— „œ⁄Ê„';
  SNoEqualsInKey = '«·„› «Õ ÌÃ» «‰ ·«ÌÕÊÌ «‘«—… «·„”«Ê«… ("=")';

  SSendError = 'Œÿ√ ›Ì «—”«· «·»—Ìœ';
  SAssignSubItemError = 'Cannot assign a subitem to an actionbar when one of it''s parent''s is already assigned to an actionbar';
  SDeleteItemWithSubItems = '«·⁄‰’— %s ÌÕÊÌ ⁄‰«’— ›—⁄Ì…, Â·  —Ìœ Õ–›Â« ⁄·Ï ﬂ· Õ«·?';
  SDeleteNotAllowed = '·«Ì”„Õ ·ﬂ »Õ–› Â–« «·⁄‰’—';
  SMoveNotAllowed = '·«Ì”„Õ » Õ—Ìﬂ «·⁄‰’— %s ';
  SMoreButtons = '«·„“Ìœ „‰ «·√“—«—';
  SErrorDownloadingURL = 'Œÿ√ ›Ì  Õ„Ì·  URL: %s';
  SUrlMonDllMissing = '€Ì— ﬁ«œ— ⁄·Ï  Õ„Ì· %s';
  SAllActions = '(ﬂ· «·√Ê«„—)';
  SNoCategory = '(·« ’‰Ì›)';
  SExpand = ' Ê”Ì⁄';
  SErrorSettingPath = 'Œÿ√ ›Ì „”«— «·≈⁄œ«œ« : "%s"';
  SLBPutError = '„Õ«Ê·… ·Ê÷⁄ ⁄‰’— ›Ì ·«∆Õ… «Œ Ì«— –«  ‰„ÿ «› —«÷Ì virtual style listbox';
  SErrorLoadingFile = 'Œÿ√ ›Ì „Õ«Ê·…  Õ„Ì· „·› «·≈⁄œ«œ«  : %s'#13' Â·  —Ìœ Õ–›Â?';
  SResetUsageData = '≈⁄«œ… ÷»ÿ ﬂ· »Ì«‰«  «·«” Œœ«„ ø';
  SFileRunDialogTitle = ' ‘€Ì·';
  SNoName = '(·« «”„)';
  SErrorActionManagerNotAssigned = 'ÌÃ»  ÕœÌœ „œÌ— «·√Ê«„— √Ê·«';
  SAddRemoveButtons = '&≈÷«›… Ê≈“«·… «·√“—«—';
  SResetActionToolBar = '≈⁄«œ… ÷»ÿ ‘—Ìÿ «·√œÊ« ';
  SCustomize = '&«· Œ’Ì’...';
  SSeparator = '›«’·';
  SCircularReferencesNotAllowed = '«·„—Ã⁄ «·œ«∆—Ì €Ì— „”„ÊÕ';
  SCannotHideActionBand = '%s ·« Ì”„Õ »«·≈Œ›«¡';
  SErrorSettingCount = 'Œÿ√ ›Ì  Õœœ ⁄œœ  %s.';
  SListBoxMustBeVirtual = '‰„ÿ ·«∆Õ… «·«Œ Ì«— (%s) ÌÃ» «‰ ÌﬂÊ‰ «› —«÷Ì virtual „‰ √Ã·  ÕœÌœ «·⁄œœ';
  SUnableToSaveSettings = '€Ì— ﬁ«œ— ⁄·Ï Õ›Ÿ «·≈⁄œ«œ« ';
  SRestoreDefaultSchedule = 'Â·  —Ìœ ≈⁄«œ… «·÷»ÿ ≈·Ï  — Ì» «·√Ê·ÊÌ«  «·«› —«÷Ì?';
  SNoGetItemEventHandler = '·„ Ì „ ‰”» ÕœÀ OnGetItem ';
  SInvalidColorMap = 'ﬁ«∆„… √·Ê«‰ €Ì— ’«·Õ… „ﬂÊ‰ «·‹ ActionBand ÌÕ «Ã ﬁ«∆„… √·Ê«‰ „‰ ‰„ÿ TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = ' „  ”ÃÌ· ” «Ì· »«”„ %s „”»ﬁ«';
  SMissingActionBarStyleName = '·„ Ì „  ”ÃÌ· ” «Ì· »«”„ %s ·„ Ì „ «· ”ÃÌ·';
  SStandardStyleActionBars = 'ÂÌ∆… ﬁÌ«”Ì…';
  SXPStyleActionBars = 'ÂÌ∆… ≈ﬂ” »Ì';
  SActionBarStyleMissing = 'No ActionBand style unit present in the uses clause.'#13 +
    'Your application must include either XPStyleActnCtrls, StdStyleActnCtrls or ' +
    'a third party ActionBand style unit in its uses clause';
  sParameterCannotBeNil = '«·»«—«„ — %s›Ì «·«” œ⁄«¡ %s ·«Ì„ﬂ‰ √‰ ÌﬂÊ‰ Œ«·Ì nil';
  SInvalidColorString = '‰’ «··Ê‰ €Ì— ’«·Õ';
  SActionManagerNotAssigned = '·„ Ì „  ÕœÌœ Œ«’Ì… ActionManager „‰ «Ã· %s ';

  SInvalidPath = '"%s" ÂÊ „”«— €Ì— ’«·Õ';
  SInvalidPathCaption = '„”«— €Ì— ’«·Õ';

  SANSIEncoding = 'ANSI';
  SASCIIEncoding = 'ASCII';
  SUnicodeEncoding = 'Unicode';
  SBigEndianEncoding = 'Big Endian Unicode';
  SUTF8Encoding = 'UTF-8';
  SUTF7Encoding = 'UTF-7';
  SEncodingLabel = '«· —„Ì“:';

  sCannotAddFixedSize = '·«Ì„ﬂ‰ ≈÷«›… ÕﬁÊ· √Ê √”ÿ— »Ì‰„« ‰„ÿ «· Ê”⁄ À«»  «·ÕÃ„';
  sInvalidSpan = '''%d'' ·Ì” « ”«⁄ ’«·Õ';
  sInvalidRowIndex = '›Â—” «·”ÿ—, %d, Œ«—Ã «·ÕœÊœ';
  sInvalidColumnIndex = '›Â—” «·Õﬁ·, %d, Œ«—Ã «·ÕœÊœ';
  sInvalidControlItem = 'ControlItem.Control ·«Ì„ﬂ‰ «‰ Ì„ ·ﬂ ÷„‰Â GridPanel';
  sCannotDeleteColumn = '·«Ì„ﬂ‰ Õ–› ⁄„Êœ ÌÕÊÌ „ﬂÊ‰«  „‰ ‰Ê⁄ controls';
  sCannotDeleteRow = '·«Ì„ﬂ‰ Õ–› ”ÿ— ÌÕÊÌ „ﬂÊ‰«  „‰ ‰Ê⁄ controls';
  sCellMember = '⁄÷Ê';
  sCellSizeType = '‰„ÿ «·ÕÃ„';
  sCellValue = '«·ﬁÌ„…';
  sCellAutoSize = '¬·Ì';
  sCellPercentSize = '»«·„∆…';
  sCellAbsoluteSize = '„ÿ·ﬁ';
  sCellColumn = '«·⁄„Êœ%d';
  sCellRow = '«·”ÿ—%d';

  STrayIconRemoveError = '·«Ì„ﬂ‰ ≈“«·… √ÌﬁÊ‰…  »·Ì€«  «·ﬁ‘—… shell notification icon';
  STrayIconCreateError = '·«Ì„ﬂ‰ ≈‰‘«¡ √ÌﬁÊ‰…  »·Ì€«  «·ﬁ‘—… shell notification icon';

  SPageControlNotSet = ' ÌÃ» √‰ Ì „ ‰”» «·‹ PageControl √Ê·«';

  SWindowsVistaRequired = '%s ÌÕ «Ã ≈·Ï Windows Vista √Ê √ÕœÀ';
  SXPThemesRequired = '%s Ì ÿ·»  ›⁄Ì· «·”„«  ⁄·Ï Ê‰œÊ“';

  STaskDlgButtonCaption = '“—%d';
  STaskDlgRadioButtonCaption = 'Œ«‰… «Œ Ì«—%d';
  SInvalidTaskDlgButtonCaption = 'ÌÃ» «‰ ·«ÌﬂÊ‰ «‰’ «·⁄‰Ê«‰ ›«—€';

  SInvalidCategoryPanelParent = 'CategoryPanel ÌÃ» «‰  „·ﬂ CategoryPanelGroup ﬂ√» ·Â«';
  SInvalidCategoryPanelGroupChild = '›ﬁÿ CategoryPanels Ì„ﬂ‰ ≈÷«› Â« ›Ì  CategoryPanelGroup';

  SInvalidCanvasOperation = '⁄„·Ì… —”„ €Ì— ’«·Õ… ⁄·Ï  Canvas';
  SNoOwner = '%s ·«Ì„·ﬂ √»';
  SRequireSameOwner = '«·ÊÃÂ… Ê«·Âœﬁ Ì ÿ·»«‰ ‰›” «·„«·ﬂ';
  SDirect2DInvalidOwner = '%s ·«Ì„ﬂ‰ √‰ ÌﬂÊ‰« „„·ÊﬂÌ‰ „‰ ﬁ»· «·Ê«Õ —”„ „Œ ·›… canvas';
  SDirect2DInvalidSolidBrush = '·Ì” ›—‘«… √·Ê«‰ €Ì— „‰ﬁÿ⁄…';
  SDirect2DInvalidBrushStyle = '‰„ÿ ›—‘«… €Ì— ’«·Õ';

  SKeyboardLocaleInfo = 'Œÿ√ ›Ì «” ⁄«œ… «·„⁄·Ê„«  «·„Õ·Ì…';
  SKeyboardLangChange = '›‘· ›Ì  €ÌÌ— ·€… «·≈œŒ«·';

  SOnlyWinControls = 'You can only tab dock TWinControl based Controls';

  SNoKeyword = '·„ Ì „  ÕœÌœ ﬂ·„«  „› «ÕÌ… ··„”«⁄œ….';

  SStyleLoadError = '€Ì— ﬁ«œ— ⁄·Ï  Õ„Ì· «·” «Ì· ''%s''';
  SStyleLoadErrors = '€Ì— ﬁ«œ— ⁄·Ï  Õ„Ì· «·” «Ì·« : %s';
  SStyleRegisterError = '«·” «Ì· ''%s''  „  ”ÃÌ·Â „”»ﬁ«';
  SStyleClassRegisterError = '’‰› «·” «Ì· ''%s''  „  ”ÃÌ·Â „”»ﬁ«';
  SStyleNotFound = '«·” «Ì· ''%s'' €Ì— „ÊÃÊœ';
  SStyleClassNotFound = '’‰› «·” «Ì·''%s'' €Ì— „ÊÃÊœ';
  SStyleInvalidHandle = '—ﬁ„ „ﬁ»÷ «·” «Ì· €Ì— ’«·Õ';
  SStyleFormatError = ' ‰”Ìﬁ «·” «Ì· €Ì— ’«·Õ';
  SStyleFileDescription = '„·› ” «Ì· VCL ';
  SStyleHookClassRegistered = '«·’‰› ''%s''  „  ”ÃÌ·Â „”»ﬁ« „‰ «Ã· ''%s''';
  SStyleHookClassNotRegistered = '«·’‰› ''%s'' ·„ Ì „  ”ÃÌ·Â „‰ √Ã· ''%s''';
  SStyleInvalidParameter = '«·»«—«„ — %s ·«Ì„ﬂ‰ √‰ ÌﬂÊ‰ Œ«·Ì nil';
  SStyleHookClassNotFound = '’‰› StyleHook ·„ Ì „  ”ÃÌ·Â „‰ √Ã· %s';
  SStyleFeatureNotSupported = '«·„Ì“… ·Ì”  „œ⁄Ê„… „‰ Â–« «·” «Ì·';
  SStyleNotRegistered = '«·” «Ì· ''%s'' ·Ì” „”Ã·';
  SStyleUnregisterError = '·«Ì„ﬂ‰ ≈·€«¡  ”ÃÌ· ” «Ì· „‰ «·‰Ÿ«„';
  SStyleNotRegisteredNoName = '·„ Ì „  ”ÃÌ· «·” «Ì·';


  // ColorToPrettyName strings
  SNameBlack = '«”Êœ';
  SNameMaroon = 'ﬂ” ‰«∆Ì';
  SNameGreen = '√Œ÷—';
  SNameOlive = '“Ì Ê‰Ì';
  SNameNavy = '»Õ—Ì';
  SNamePurple = '√—ÃÊ«‰Ì';
  SNameTeal = '√Œ÷— „“—ﬁ';
  SNameGray = '—„«œÌ';
  SNameSilver = '›÷Ì';
  SNameRed = '√Õ„—';
  SNameLime = '·Ì„Ê‰Ì';
  SNameYellow = '√’›—';
  SNameBlue = '√“—ﬁ';
  SNameFuchsia = '›Ê‘Ì«';
  SNameAqua = '√ﬂÊ«';
  SNameWhite = '√»Ì÷';
  SNameMoneyGreen = '√Œ÷— „«·Ì';
  SNameSkyBlue = '”„«ÊÌ';
  SNameCream = 'ﬂ—Ì„';
  SNameMedGray = '—„«œÌ „⁄ œ·';
  SNameActiveBorder = '_Õœ ›⁄«·';
  SNameActiveCaption = '_⁄‰Ê«‰ ›⁄«·';
  SNameAppWorkSpace = '_„”«Õ… «· ÿ»Ìﬁ';
  SNameBackground = '_Œ·›Ì…';
  SNameBtnFace = '_ÊÃÂ «·“—';
  SNameBtnHighlight = '_≈‘—«ﬁ «·“—';
  SNameBtnShadow = '_Ÿ· «·“—';
  SNameBtnText = '_‰’ «·“—';
  SNameCaptionText = '_‰’ «·⁄‰Ê«‰';
  SNameDefault = '«› —«÷Ì';
  SNameGradientActiveCaption = '_⁄‰Ê«‰ ›⁄«· „ œ—Ã';
  SNameGradientInactiveCaption = '_⁄‰Ê«‰ €Ì—›⁄«· „ œ—Ã';
  SNameGrayText = '_‰’ —„«œÌ';
  SNameHighlight = '_Œ·›Ì… „‘—ﬁ…';
  SNameHighlightText = '_‰’ „‘—ﬁ';
  SNameHotLight = '_÷Ê¡ Õ«—';
  SNameInactiveBorder = '_Õœ €Ì— ›⁄«·';
  SNameInactiveCaption = '_⁄‰Ê«‰ €Ì— ›⁄«·';
  SNameInactiveCaptionText = '‰’ ⁄‰Ê«‰ €Ì— ›⁄«·';
  SNameInfoBk = '_Œ·›Ì… „⁄·Ê„« ';
  SNameInfoText = '_‰’ „⁄·Ê„« ';
  SNameMenu = '_Œ·›Ì… ﬁ«∆„…';
  SNameMenuBar = '_‘—Ìÿ ﬁ«∆„…';
  SNameMenuHighlight = '_ﬁ«∆„… „‘—ﬁ…';
  SNameMenuText = '_‰’ «·ﬁ«∆„…';
  SNameNone = '·«‘Ì¡';
  SNameScrollBar = '_‘—Ìÿ «·√œÊ« ';
  SName3DDkShadow = '_Ÿ· 3œ';
  SName3DLight = '_÷Ê¡ 3œ';
  SNameWindow = '_Œ·›Ì… ‰«›–…';
  SNameWindowFrame = '_≈ÿ«— ‰«›–…';
  SNameWindowText = '_‰’ ‰«›–…';

  SInvalidBitmapPixelFormat = '’Ê—… ‰ﬁÿÌ… »‰„ÿ  ‰”Ìﬁ »ﬂ”·«  €Ì— ’«·Õ, ÌÃ» «‰  ﬂÊ‰ 32 bit ';
  SJumplistsItemErrorGetpsi = 'Querying the IPropertyStore interface';
  SJumplistsItemErrorInitializepropvar = ' ÂÌ∆… Œ«’Ì… „‰ ‰„ÿ variant ';
  SJumplistsItemErrorSetps = '÷»ÿ ﬁÌ„… „Œ“‰ «·Œ«’Ì…';
  SJumplistsItemErrorCommitps = '≈Ìœ«⁄ „Œ“‰ «·Œ«’Ì… (Õ›Ÿ)';
  SJumplistsItemErrorSettingarguments = 'Setting the arguments of a jump list item';
  SJumplistsItemErrorSettingpath = 'Setting the path of a jump list item';
  SJumplistsItemErrorSettingicon = 'Setting the icon location of a jump list item';
  SJumplistsItemErrorAddingtobjarr = 'Adding an item to an object array';
  SJumplistsItemErrorGettingobjarr = 'Querying the IObjectArray interface';
  SJumplistsItemErrorNofriendlyname = 'The FriendlyName property of an item must not be empty';
  SJumplistsItemException = '«” À‰«¡ ÊŒÿ√ ›Ì JumpListItem : %d: %s';
  SJumplistException = '«” À‰«¡ ÊŒÿ√ ›À JumpList : %d: %s';
  SJumplistErrorBeginlist = 'Initiating a building session for a new jump list';
  SJumplistErrorAppendrc = 'Appending an item to the recent files category of a new jump list';
  SJumplistErrorAppendfc = 'Appending an item to the frequent files category of a new jump list';
  SJumplistErrorAddusertasks = 'Adding your tasks to a new jump list';
  SJumplistErrorAddcategory = 'Adding a custom category (''%s'') and its child items to a new jump list';
  SJumplistErrorCommitlist = 'Committing a new jump list';
  SJumplistExceptionInvalidOS = '⁄„·Ì… «·‰Ÿ«„ «·Õ«·Ì… ·« œ⁄„ ·Ê«∆Õ «·ﬁ›“ jump lists';
  SJumplistExceptionAppID = '«·⁄„·Ì… «·Õ«·Ì… ·Â« —ﬁ„  ÿ»Ìﬁ „”»ﬁ application ID: %s';

  { BeginInvoke }

  sBeginInvokeNoHandle = '·«Ì„ﬂ‰ «” œ⁄«¡l BeginInvoke ·„ﬂÊ‰ ·Ì” ·Â √» √Ê —ﬁ„ „ﬁ»÷';

  SToggleSwitchCaptionOn = '≈Ìﬁ«›';
  SToggleSwitchCaptionOff = ' ‘€Ì·';
  SInvalidRelativePanelControlItem = 'ControlItem.Control ·«Ì„ﬂ‰ ÷»ÿ… ·«„ ·«ﬂ RelativePanel';
  SInvalidRelativePanelSibling = 'Control is not a sibling within RelativePanel';
  SInvalidRelativePanelSiblingSelf = '·«Ì„ﬂ‰ ÷»ÿ «·„ﬂÊ‰ ·ÌﬂÊ‰ „Êﬁ⁄Â „ ⁄·ﬁ »‰›”Â relative to itself';

implementation

end.


