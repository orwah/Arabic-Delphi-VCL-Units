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
  SSelectADate = 'اختر تاريخ';
  SOpenFileTitle = 'فتح';
  SCantWriteResourceStreamError = 'لايمكن الكتابة لمورد مخصص للقراءة فقط';
  SDuplicateReference = 'تم استدعاء غرض الكتابة WriteObject مرتين من أجل نفس المنتسخ';
  SClassMismatch = 'الموارد %s تابعه لصنف غير صحيح';
  SInvalidTabIndex = 'فهرس التبويب خارج الحدود المسموحة';
  SInvalidTabPosition = 'موقع الصفحة غير متوافق مع نمط الصفحات الحالي ';
  SInvalidTabStyle = 'نمط الصفحة غير متوافق مع موقع الصفحات الحالي';
  SInvalidBitmap = 'صورة نقطية غير صالحة';
  SInvalidIcon = 'أيقونة غير صالحة';
  SInvalidMetafile = 'ملف الميتا Metafile غير صالح';
  SInvalidPixelFormat = 'تنسيق البيكسلات غير صالح';
  SInvalidImage = 'صورة غير صالحة';
  SBitmapEmpty = 'الصورة النقطية فارغة';
  SScanLine = 'فهرس تعليمة Scan line خارج الحدود الممكنة';
  SChangeIconSize = 'لايمكن تغيير حجم الأيقونة';
  SChangeWicSize = 'لايمكن تغيير حجم صورة WIC';
  SOleGraphic = 'عملية غير صالحة على TOleGraphic';
  SUnknownExtension = 'امتداد ملف صورة غير معروف (.%s)';
  SUnknownClipboardFormat = 'تنسيق حافظة غير مدعوم';
  SOutOfResources = 'خارج موارد النظام';
  SNoCanvasHandle = 'الكانفاس لايسمح بالرسم';
  SInvalidTextFormatFlag = 'ال ''%s'' في تنسيق النص غير مدعومة ';
  SInvalidImageSize = 'حجم الصورة غير صالح';
  STooManyImages = 'الصور أكثر من الممكن';
  SDimsDoNotMatch = 'أبعاد الصورة لاتطابق أبعاد لائحة الصور image list';
  SInvalidImageList = 'لائحة صور ImageList غير صالحة';
  SReplaceImage = 'غير قادر على استبدال الصورة';
  SInsertImage =  'غير قادر على إدراج الصورة';
  SImageIndexError = 'فهرس لائحة الصور ImageList غير صالح';
  SImageReadFail = 'لايمكن قراءة بيانات لائحة الصور ImageList من المجرى stream';
  SImageWriteFail = 'لايمكن كتابة بيانات لائحة الصور ImageList إلى المجرى stream';
  SWindowDCError = 'خطأ في إنشاء  window device context';
  SClientNotSet = 'وكيل TDrag لم تتم تهيأته';
  SWindowClass = 'خطأ في إنشاء صنف النافذة';
  SWindowCreate = 'خطأ في إنشاء النافذة';
  SCannotFocus = 'لايمكن التركيز على نافذة معطلة أو غير مرئية';
  SParentRequired = 'المكون ''%s'' ليس له نافذة أب';
  SParentGivenNotAParent = 'المكون الأب المعطى ليس أبا لـ ''%s''';
  SMDIChildNotVisible = 'لايمكن إخفاء نافذة MDI فرعية';
  SVisibleChanged = 'لايمكن تغيير خاصية الرؤية في حدثي OnShow و OnHide';
  SCannotShowModal = 'لايمكن تحويل نافذة مرئية إلى نوع modal';
  SScrollBarRange = 'خاصية شريط التمرير خارج الحدود';
  SPropertyOutOfRange = 'خاصية %s خارج القيمة المسموحة';
  SMenuIndexError = 'فهرس القائمة خارج الحدود';
  SMenuReinserted = 'تم إضافة القائمة مرتين';
  SMenuNotFound = 'القائمة الفرعية ليست في القائمة';
  SNoTimers = 'لايوجد مؤقتات كافيه';
  SNotPrinting = 'الطابعة لاتقوم حاليا بالطباعة';
  SPrinting = 'جاري الطباعة';
  SPrinterIndexError = 'ترقيم الطباعة خارج الحد الممكن';
  SInvalidPrinter = 'الطابعة التي تم اختيارها غير صالحة';
  SDeviceOnPort = '%s على %s';
  SGroupIndexTooLow = 'GroupIndex لايمكن أن تكون أقل من قيمة GroupIndex سابقة في أحد العناصر';
  STwoMDIForms = 'لايمكن وجود أكثر من نموذج MDI واحد في التطبيق';
  SNoMDIForm = 'لايمكن إنشاء نموذج. لايوجد نموذج MDI فعال حاليا';
  SImageCanvasNeedsBitmap = 'يمكن تعديل الصورة إذا كانت تحوي مصفوفة نقطية فقط من نوع bitmap';
  SControlParentSetToSelf = 'لايمكن للمكون أن يكون أبا لنفسة';
  SOKButton = 'موافق';
  SCancelButton = 'إلغاء';
  SYesButton = '&نعم';
  SNoButton = '&لا';
  SHelpButton = '&مساعدة';
  SCloseButton = 'إ&غلاق';
  SIgnoreButton = '&تجاهل';
  SRetryButton = 'إ&عادة المحاولة';
  SAbortButton = 'إنهاء';
  SAllButton = 'ال&كل';

  SCannotDragForm = 'لايمكن سحب النافذة';
  SPutObjectError = 'PutObject to undefined item';
  SCardDLLNotLoaded = 'لايمكن تحميل ملف CARDS.DLL';
  SDuplicateCardId = 'رقم CardId الذي تم العثور عليه مكرر';

  SDdeErr = 'خطأ من  DDE  ($0%x)';
  SDdeConvErr = 'خطأ DDE - لم يتم تأسيس المحادثة ($0%x)';
  SDdeMemErr = 'حدث خطأ بأن DDE تجاوز الذاكرة المسموحة ($0%x)';
  SDdeNoConnect = 'لايمكن الاتصال بمحادثة DDE ';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = 'لايمكن تحميل إصدارة أقدم من TShape';
  SVMetafiles = 'ملفات ميتا Metafiles';
  SVEnhMetafiles = 'ملفات ميتا محسنة Enhanced Metafiles';
  SVIcons = 'أيقونات Icons';
  SVBitmaps = 'صور نقطية Bitmaps';
  SVTIFFImages = 'صور TIFF';

  SVJPGImages = 'JPEG صور';
  SVPNGImages = 'PNG صور';
  SVGIFImages = 'GIF صور';

  SGridTooLarge = 'الشبكة كبيرة جدا على هذه العملية';
  STooManyDeleted = 'تم حذف كمية كبيرة من الحقول والأسطر';
  SIndexOutOfRange = 'ترقيم الشبكة خارج الحد المسموح';
  SFixedColTooBig = 'عدد الحقول الثابتة يجب ان يكون أقل من عدد الحقول الكلي';
  SFixedRowTooBig = 'عدد الأسطر الثابتة يجب ان يكون أقل من عدد الاسطر الكلي';
  SInvalidStringGridOp = 'لايمكن إدراج أو حذف السجلات من الشبكة';
  SInvalidEnumValue = 'قيمة سردية غير صالحة';
  SInvalidNumber = 'قيمة رقمية غير صالحة';
  SOutlineIndexError = 'فهرس الحد الخارجي Outline لم يتم العثور عليه';
  SOutlineExpandError = 'يجب أن يتم توسيع الأب';
  SInvalidCurrentItem = 'قيمة غير صالحة للعنصر الحالي';
  SMaskErr = 'قيمة المدخلات غير صحيحة';
  SMaskEditErr = 'قيمة المدخلات غير صحيحة.  استخدم زر الإلغاء للتراجع';
  SOutlineError = 'الفهرس الخارجي outline غير صالح';
  SOutlineBadLevel = 'نسب قيمة مستوى غير صحيح';
  SOutlineSelection = 'اختيار غير صالح';
  SOutlineFileLoad = 'خطأ في تحميل الملف';
  SOutlineLongLine = 'السطر طويل جدا';
  SOutlineMaxLevels = 'تم تجاوز العمق الأعظمي';

  SMsgDlgWarning = ' تحذير';
  SMsgDlgError = ' خطأ';
  SMsgDlgInformation = ' معلومات';
  SMsgDlgConfirm = ' تأكيد';
  SMsgDlgYes = '&نعم';
  SMsgDlgNo = '&لا';
  SMsgDlgOK = '&موافق';
  SMsgDlgCancel = 'إل&غاء';
  SMsgDlgHelp = 'م&ساعدة';
  SMsgDlgHelpNone = ' لاتتوفر مساعدة';
  SMsgDlgHelpHelp = 'مساعدة';
  SMsgDlgAbort = 'إن&هاء';
  SMsgDlgRetry = 'إ&عادة المحاولة';
  SMsgDlgIgnore = '&تجاهل';
  SMsgDlgAll = 'ال&كل';
  SMsgDlgNoToAll = 'لا للكل';
  SMsgDlgYesToAll = 'نعم للكل';
  SMsgDlgClose = 'إ&غلاق';

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

  srUnknown = '(غير معروف)';
  srNone = '(لاشيء)';
  SOutOfRange = 'يجب أن تكون القيمة بين %d و %d';

  SDateEncodeError = 'تنسيق التاريخ خاطئ';
  SDefaultFilter = 'كل الملفات (*.*)|*.*';
  sAllFilter = 'الكل';
  SNoVolumeLabel = ': [ - لااسم - ]';
  SInsertLineError = 'غير قادر على إضافة سطر';

  SConfirmCreateDir = 'المجلد المحدد غير موجود , هل تريد إنشاءه?';
  SSelectDirCap = 'اختر مجلد';
  SDirNameCap = 'اسم الم&جلد:';
  SDrivesCap = 'الأ&قراص:';
  SDirsCap = 'الم&جلدات:';
  SFilesCap = 'ال&ملفات: (*.*)';
  SNetworkCap = 'ال&شبكة...';

  SColorPrefix = 'اللون' deprecated;          //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP' deprecated; //!! obsolete - delete in 5.0

  SInvalidClipFmt = 'تنسيق حافظة غير صالح';
  SIconToClipboard = 'الحافظة لاتدعم الأيقونات';
  SCannotOpenClipboard = 'لايمكن فتح حافظة: %s';

  SDefault = 'افتراضي';

  SInvalidMemoSize = 'النص تجاوز سعة المفكرة';
  SCustomColors = 'ألوان مخصصة';
  SInvalidPrinterOp = 'العملية غير مدعومة على الطابعة المختارة';
  SNoDefaultPrinter = 'لم يتم اختيار طابعة افتراضية بعد';

  SIniFileWriteError = 'لايمكن الكتابة على %s';

  SBitsIndexError = 'فهرس البتات خارج الحدود';

  SUntitled = '(بلا تسمية)';

  SInvalidRegType = 'نوع بيانات غير صالح من أجل ''%s''';

  SUnknownConversion = 'امتداد ملف نص منسق غير معروف (.%s)';
  SDuplicateMenus = 'القائمة ''%s'' تستخدم مسبقا من قبل نافذة اخرى';

  SPictureLabel = 'الصورة:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = 'استعراض';

  SCannotOpenAVI = 'لايمكن فتح ملف فيديو AVI';

  SNotOpenErr = 'لم يتم فتح جهاز MCI device ';
  SMPOpenFilter = 'كل الملفات (*.*)|*.*|Wave  (*.wav)|*.wav|Midi  (*.mid)|*.mid| فيديو وندوز (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = 'آخر';
  SMCIOverlay = 'تغطيه';
  SMCIScanner = 'ماسحه';
  SMCISequencer = 'مسلسل';
  SMCIVCR = 'مسجل فيديو كاسيت (VCR)';
  SMCIVideodisc = 'Videodisc';
  SMCIWaveAudio = 'WaveAudio';
  SMCIUnknownError = 'خطأ غير معروف';

  SBoldItalicFont = 'عريض مائل';
  SBoldFont = 'عريض';
  SItalicFont = 'مائل';
  SRegularFont = 'عادي';

  SPropertiesVerb = 'خصائص';

  SServiceFailed = 'فشلت الخدمة على %s: %s';
  SExecute = 'تنفيذ';
  SStart = 'بدء';
  SStop = 'توقف';
  SPause = 'توقف مؤقت';
  SContinue = 'متابعة';
  SInterrogate = 'استجواب';
  SShutdown = 'إيقاف تشغيل';
  SCustomError = 'فشل في الخدمة , رسالة مخصصة (%d): %s';
  SServiceInstallOK = 'تم تنصيب الخدمة بنجاح';
  SServiceInstallFailed = 'فشل تنصيب الخدمة "%s" حدث الخطأ التالي: "%s"';
  SServiceUninstallOK = 'تم إلغاء تنصيب الخدمة بنجاح';
  SServiceUninstallFailed = 'فشل تنصيب الخدمة "%s" مع الخطأ: "%s"';



  SDockedCtlNeedsName = 'مكون التراصف يجب ان يكون له اسم';
  SDockTreeRemoveError = 'خطأ إزالة المكون من شجرة التراصف';
  SDockZoneNotFound = ' - منطقة التراصف غير موجودة';
  SDockZoneHasNoCtl = ' - منطقة التراصف ليس لاتملك مكونات';
  SDockZoneVersionConflict = 'خطأ في تحميل منطقة تراصف من المسلك Stream . ' +
    'النسخة المتوقعة %d, النسخة الموجودة %d.';

  SAllCommands = 'كل الأوامر';

  SDuplicateItem = 'القائمة لا تسمح بالتكرارات  ($0%x)';

  STextNotFound = 'لم يتم العثور على : "%s"';
  SBrowserExecError = 'لم يتم تحديد المستعرض الافتراضي';

  SColorBoxCustomCaption = 'مخصص...';

  SMultiSelectRequired = 'يجب تفعيل الاختيار المتعدد من أجل هذه الخاصية';

  SPromptArrayTooShort = 'طول مصفوفة القيم يجب ان يكون >= طول مصفوفة الأوصاف';
  SPromptArrayEmpty = 'مصفوفة الأوصاف يجب ان لاتكون فارغة';

  SUsername = 'ا&سم المستخدم';
  SPassword = '&كلمة المرور';
  SDomain = 'ال&دومين';
  SLogin = 'دخول';

  SKeyCaption = 'المفتاح';
  SValueCaption = 'القيمة';
  SKeyConflict = 'مفتاح باسم "%s" موجود مسبقا';
  SKeyNotFound = 'المفتاح "%s" غير موجود';
  SNoColumnMoving = 'goColMoving ليس خيار مدعوم';
  SNoEqualsInKey = 'المفتاح يجب ان لايحوي اشارة المساواة ("=")';

  SSendError = 'خطأ في ارسال البريد';
  SAssignSubItemError = 'Cannot assign a subitem to an actionbar when one of it''s parent''s is already assigned to an actionbar';
  SDeleteItemWithSubItems = 'العنصر %s يحوي عناصر فرعية, هل تريد حذفها على كل حال?';
  SDeleteNotAllowed = 'لايسمح لك بحذف هذا العنصر';
  SMoveNotAllowed = 'لايسمح بتحريك العنصر %s ';
  SMoreButtons = 'المزيد من الأزرار';
  SErrorDownloadingURL = 'خطأ في تحميل  URL: %s';
  SUrlMonDllMissing = 'غير قادر على تحميل %s';
  SAllActions = '(كل الأوامر)';
  SNoCategory = '(لاتصنيف)';
  SExpand = 'توسيع';
  SErrorSettingPath = 'خطأ في مسار الإعدادات: "%s"';
  SLBPutError = 'محاولة لوضع عنصر في لائحة اختيار ذات نمط افتراضي virtual style listbox';
  SErrorLoadingFile = 'خطأ في محاولة تحميل ملف الإعدادات : %s'#13' هل تريد حذفه?';
  SResetUsageData = 'إعادة ضبط كل بيانات الاستخدام ؟';
  SFileRunDialogTitle = 'تشغيل';
  SNoName = '(لا اسم)';
  SErrorActionManagerNotAssigned = 'يجب تحديد مدير الأوامر أولا';
  SAddRemoveButtons = '&إضافة وإزالة الأزرار';
  SResetActionToolBar = 'إعادة ضبط شريط الأدوات';
  SCustomize = '&التخصيص...';
  SSeparator = 'فاصل';
  SCircularReferencesNotAllowed = 'المرجع الدائري غير مسموح';
  SCannotHideActionBand = '%s لا يسمح بالإخفاء';
  SErrorSettingCount = 'خطأ في تحدد عدد  %s.';
  SListBoxMustBeVirtual = 'نمط لائحة الاختيار (%s) يجب ان يكون افتراضي virtual من أجل تحديد العدد';
  SUnableToSaveSettings = 'غير قادر على حفظ الإعدادات';
  SRestoreDefaultSchedule = 'هل تريد إعادة الضبط إلى ترتيب الأولويات الافتراضي?';
  SNoGetItemEventHandler = 'لم يتم نسب حدث OnGetItem ';
  SInvalidColorMap = 'قائمة ألوان غير صالحة مكون الـ ActionBand يحتاج قائمة ألوان من نمط TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = 'تم تسجيل ستايل باسم %s مسبقا';
  SMissingActionBarStyleName = 'لم يتم تسجيل ستايل باسم %s لم يتم التسجيل';
  SStandardStyleActionBars = 'هيئة قياسية';
  SXPStyleActionBars = 'هيئة إكس بي';
  SActionBarStyleMissing = 'No ActionBand style unit present in the uses clause.'#13 +
    'Your application must include either XPStyleActnCtrls, StdStyleActnCtrls or ' +
    'a third party ActionBand style unit in its uses clause';
  sParameterCannotBeNil = 'البارامتر %sفي الاستدعاء %s لايمكن أن يكون خالي nil';
  SInvalidColorString = 'نص اللون غير صالح';
  SActionManagerNotAssigned = 'لم يتم تحديد خاصية ActionManager من اجل %s ';

  SInvalidPath = '"%s" هو مسار غير صالح';
  SInvalidPathCaption = 'مسار غير صالح';

  SANSIEncoding = 'ANSI';
  SASCIIEncoding = 'ASCII';
  SUnicodeEncoding = 'Unicode';
  SBigEndianEncoding = 'Big Endian Unicode';
  SUTF8Encoding = 'UTF-8';
  SUTF7Encoding = 'UTF-7';
  SEncodingLabel = 'الترميز:';

  sCannotAddFixedSize = 'لايمكن إضافة حقول أو أسطر بينما نمط التوسع ثابت الحجم';
  sInvalidSpan = '''%d'' ليس اتساع صالح';
  sInvalidRowIndex = 'فهرس السطر, %d, خارج الحدود';
  sInvalidColumnIndex = 'فهرس الحقل, %d, خارج الحدود';
  sInvalidControlItem = 'ControlItem.Control لايمكن ان يمتلك ضمنه GridPanel';
  sCannotDeleteColumn = 'لايمكن حذف عمود يحوي مكونات من نوع controls';
  sCannotDeleteRow = 'لايمكن حذف سطر يحوي مكونات من نوع controls';
  sCellMember = 'عضو';
  sCellSizeType = 'نمط الحجم';
  sCellValue = 'القيمة';
  sCellAutoSize = 'آلي';
  sCellPercentSize = 'بالمئة';
  sCellAbsoluteSize = 'مطلق';
  sCellColumn = 'العمود%d';
  sCellRow = 'السطر%d';

  STrayIconRemoveError = 'لايمكن إزالة أيقونة تبليغات القشرة shell notification icon';
  STrayIconCreateError = 'لايمكن إنشاء أيقونة تبليغات القشرة shell notification icon';

  SPageControlNotSet = ' يجب أن يتم نسب الـ PageControl أولا';

  SWindowsVistaRequired = '%s يحتاج إلى Windows Vista أو أحدث';
  SXPThemesRequired = '%s يتطلب تفعيل السمات على وندوز';

  STaskDlgButtonCaption = 'زر%d';
  STaskDlgRadioButtonCaption = 'خانة اختيار%d';
  SInvalidTaskDlgButtonCaption = 'يجب ان لايكون انص العنوان فارغ';

  SInvalidCategoryPanelParent = 'CategoryPanel يجب ان تملك CategoryPanelGroup كأب لها';
  SInvalidCategoryPanelGroupChild = 'فقط CategoryPanels يمكن إضافتها في  CategoryPanelGroup';

  SInvalidCanvasOperation = 'عملية رسم غير صالحة على  Canvas';
  SNoOwner = '%s لايملك أب';
  SRequireSameOwner = 'الوجهة والهدق يتطلبان نفس المالك';
  SDirect2DInvalidOwner = '%s لايمكن أن يكونا مملوكين من قبل الواح رسم مختلفة canvas';
  SDirect2DInvalidSolidBrush = 'ليس فرشاة ألوان غير منقطعة';
  SDirect2DInvalidBrushStyle = 'نمط فرشاة غير صالح';

  SKeyboardLocaleInfo = 'خطأ في استعادة المعلومات المحلية';
  SKeyboardLangChange = 'فشل في تغيير لغة الإدخال';

  SOnlyWinControls = 'You can only tab dock TWinControl based Controls';

  SNoKeyword = 'لم يتم تحديد كلمات مفتاحية للمساعدة.';

  SStyleLoadError = 'غير قادر على تحميل الستايل ''%s''';
  SStyleLoadErrors = 'غير قادر على تحميل الستايلات: %s';
  SStyleRegisterError = 'الستايل ''%s'' تم تسجيله مسبقا';
  SStyleClassRegisterError = 'صنف الستايل ''%s'' تم تسجيله مسبقا';
  SStyleNotFound = 'الستايل ''%s'' غير موجود';
  SStyleClassNotFound = 'صنف الستايل''%s'' غير موجود';
  SStyleInvalidHandle = 'رقم مقبض الستايل غير صالح';
  SStyleFormatError = 'تنسيق الستايل غير صالح';
  SStyleFileDescription = 'ملف ستايل VCL ';
  SStyleHookClassRegistered = 'الصنف ''%s'' تم تسجيله مسبقا من اجل ''%s''';
  SStyleHookClassNotRegistered = 'الصنف ''%s'' لم يتم تسجيله من أجل ''%s''';
  SStyleInvalidParameter = 'البارامتر %s لايمكن أن يكون خالي nil';
  SStyleHookClassNotFound = 'صنف StyleHook لم يتم تسجيله من أجل %s';
  SStyleFeatureNotSupported = 'الميزة ليست مدعومة من هذا الستايل';
  SStyleNotRegistered = 'الستايل ''%s'' ليس مسجل';
  SStyleUnregisterError = 'لايمكن إلغاء تسجيل ستايل من النظام';
  SStyleNotRegisteredNoName = 'لم يتم تسجيل الستايل';


  // ColorToPrettyName strings
  SNameBlack = 'اسود';
  SNameMaroon = 'كستنائي';
  SNameGreen = 'أخضر';
  SNameOlive = 'زيتوني';
  SNameNavy = 'بحري';
  SNamePurple = 'أرجواني';
  SNameTeal = 'أخضر مزرق';
  SNameGray = 'رمادي';
  SNameSilver = 'فضي';
  SNameRed = 'أحمر';
  SNameLime = 'ليموني';
  SNameYellow = 'أصفر';
  SNameBlue = 'أزرق';
  SNameFuchsia = 'فوشيا';
  SNameAqua = 'أكوا';
  SNameWhite = 'أبيض';
  SNameMoneyGreen = 'أخضر مالي';
  SNameSkyBlue = 'سماوي';
  SNameCream = 'كريم';
  SNameMedGray = 'رمادي معتدل';
  SNameActiveBorder = '_حد فعال';
  SNameActiveCaption = '_عنوان فعال';
  SNameAppWorkSpace = '_مساحة التطبيق';
  SNameBackground = '_خلفية';
  SNameBtnFace = '_وجه الزر';
  SNameBtnHighlight = '_إشراق الزر';
  SNameBtnShadow = '_ظل الزر';
  SNameBtnText = '_نص الزر';
  SNameCaptionText = '_نص العنوان';
  SNameDefault = 'افتراضي';
  SNameGradientActiveCaption = '_عنوان فعال متدرج';
  SNameGradientInactiveCaption = '_عنوان غيرفعال متدرج';
  SNameGrayText = '_نص رمادي';
  SNameHighlight = '_خلفية مشرقة';
  SNameHighlightText = '_نص مشرق';
  SNameHotLight = '_ضوء حار';
  SNameInactiveBorder = '_حد غير فعال';
  SNameInactiveCaption = '_عنوان غير فعال';
  SNameInactiveCaptionText = 'نص عنوان غير فعال';
  SNameInfoBk = '_خلفية معلومات';
  SNameInfoText = '_نص معلومات';
  SNameMenu = '_خلفية قائمة';
  SNameMenuBar = '_شريط قائمة';
  SNameMenuHighlight = '_قائمة مشرقة';
  SNameMenuText = '_نص القائمة';
  SNameNone = 'لاشيء';
  SNameScrollBar = '_شريط الأدوات';
  SName3DDkShadow = '_ظل 3د';
  SName3DLight = '_ضوء 3د';
  SNameWindow = '_خلفية نافذة';
  SNameWindowFrame = '_إطار نافذة';
  SNameWindowText = '_نص نافذة';

  SInvalidBitmapPixelFormat = 'صورة نقطية بنمط تنسيق بكسلات غير صالح, يجب ان تكون 32 bit ';
  SJumplistsItemErrorGetpsi = 'Querying the IPropertyStore interface';
  SJumplistsItemErrorInitializepropvar = 'تهيئة خاصية من نمط variant ';
  SJumplistsItemErrorSetps = 'ضبط قيمة مخزن الخاصية';
  SJumplistsItemErrorCommitps = 'إيداع مخزن الخاصية (حفظ)';
  SJumplistsItemErrorSettingarguments = 'Setting the arguments of a jump list item';
  SJumplistsItemErrorSettingpath = 'Setting the path of a jump list item';
  SJumplistsItemErrorSettingicon = 'Setting the icon location of a jump list item';
  SJumplistsItemErrorAddingtobjarr = 'Adding an item to an object array';
  SJumplistsItemErrorGettingobjarr = 'Querying the IObjectArray interface';
  SJumplistsItemErrorNofriendlyname = 'The FriendlyName property of an item must not be empty';
  SJumplistsItemException = 'استثناء وخطأ في JumpListItem : %d: %s';
  SJumplistException = 'استثناء وخطأ فث JumpList : %d: %s';
  SJumplistErrorBeginlist = 'Initiating a building session for a new jump list';
  SJumplistErrorAppendrc = 'Appending an item to the recent files category of a new jump list';
  SJumplistErrorAppendfc = 'Appending an item to the frequent files category of a new jump list';
  SJumplistErrorAddusertasks = 'Adding your tasks to a new jump list';
  SJumplistErrorAddcategory = 'Adding a custom category (''%s'') and its child items to a new jump list';
  SJumplistErrorCommitlist = 'Committing a new jump list';
  SJumplistExceptionInvalidOS = 'عملية النظام الحالية لاتدعم لوائح القفز jump lists';
  SJumplistExceptionAppID = 'العملية الحالية لها رقم تطبيق مسبق application ID: %s';

  { BeginInvoke }

  sBeginInvokeNoHandle = 'لايمكن استدعاءl BeginInvoke لمكون ليس له أب أو رقم مقبض';

  SToggleSwitchCaptionOn = 'إيقاف';
  SToggleSwitchCaptionOff = 'تشغيل';
  SInvalidRelativePanelControlItem = 'ControlItem.Control لايمكن ضبطة لامتلاك RelativePanel';
  SInvalidRelativePanelSibling = 'Control is not a sibling within RelativePanel';
  SInvalidRelativePanelSiblingSelf = 'لايمكن ضبط المكون ليكون موقعه متعلق بنفسه relative to itself';

implementation

end.


