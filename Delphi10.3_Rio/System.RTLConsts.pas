{*******************************************************}
{                                                       }
{            Arabic Delphi VCL Units                    }
{                                                       }
{ Modified by : Orwah Ali Issa (www.orwah.net)          }
{                                                       }
{ Delphi 10.3 Rio ..  File Version 0.1  14/9/2019       }
{                                                       }
{ Get Last Version From Here :                          }
{ https://github.com/orwah/Arabic-Delphi-VCL-Units      }
{                                                       }
{*******************************************************}


{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit System.RTLConsts;

interface
{$HPPEMIT LEGACYHPP}

resourcestring
  SAncestorNotFound = 'السلف الأعلى لـ ''%s'' لم يتم العثور عليه';
  SAssignError = 'لايمكن نسب  %s إلى a %s';
  SBitsIndexError = 'فهرس القيم الثنائية خارج الحدود المسموحة';
  SBucketListLocked = 'القائمة مقفلة خلال حلقة ForEach فعالة';
  SCantWriteResourceStreamError = 'لايمكن الكتابة إلى مسلك resource stream خاص بالقراءة فقط';
  SCharExpected = '''''%s'''' متوقعة';
  SCheckSynchronizeError = 'CheckSynchronize تم استدعائه من المسلك thread $%x, وهو ليس المسلك الرئيسي';
  SClassNotFound = 'الصنف %s لم يتم العثور عليه';
  SDelimiterQuoteCharError = 'الخاصيتان Delimiter و QuoteChar لايجب أن يمتلكا نفس القيمة';
  SDuplicateClass = 'صنف بالاسم %s موجود مسبقا';
  SDuplicateItem = 'اللائحة لاتسمح بالقيم المكررة ($0%x)';
  SDuplicateName = 'مكون بهذا الاسم %s موجود مسبقا';
  SDuplicateString = 'اللائحة النصية لاتسمح بالقيم المكررة';
  SFCreateError = 'لايمكن إنشاء الملف %s';
  SFCreateErrorEx = 'لايمكن إنشاء الملف "%s". %s';
  SFixedColTooBig = 'عدد الحقول الثابت يجب أن يكون أقل من العدد الكلي للحقول ';
  SFixedRowTooBig = 'عدد السطور الثابته يجب أن يكون أقل من العدد الكلي للسطور';
  SFOpenError = 'لايمكن فتح الملف %s';
  SFOpenErrorEx = 'لايمكن فتح الملف "%s". %s';
  SGridTooLarge = 'الشبكة كبيرة جدا لهذه العملية';
  SIdentifierExpected = 'من المتوقع وجود معرف';
  SIndexOutOfRange = 'فهرس الشبكة خارج المجال المسموح';
  SIniFileWriteError = 'لايمكن الكتابة إلى %s';

  SInvalidActionCreation = 'فشل في إنشاء الحدث';
  SInvalidActionEnumeration = 'سرد الحدث غير صالح';
  SInvalidActionRegistration = 'تحديث الحدث غير صالح ';
  SInvalidActionUnregistration = 'إلغاء تسجيل الحدث غير صالح';
  StrNoClientClass = 'الزبون لايمكن أن يكون من الصنف %s';
  StrEActionNoSuported = 'الصنف %s لايدعم هذا الحدث';

  SInvalidBinary = 'قيمة ثنائية غير صالحة';
  SInvalidFilename = 'اسم الملف غير صالح : - %s' deprecated 'Use SInvalidKnownFilename';
  SInvalidKnownFilename = 'اسم الملف غير صالح : - %s';
  SInvalidImage = 'تنسيق غير صالح';
  SInvalidMask = '''%s'' هو قناع غير صاله من أجل (%d)';
  SInvalidName = '''''%s'''' اسم مكون غير صالح';
  SInvalidProperty = 'قيمة الخاصية غير صالحة';
  SInvalidPropertyElement = 'عنصر خاصية غير صالح: %s';
  SInvalidPropertyPath = 'مسار خاصية غير صالح';
  SInvalidPropertyType = 'نمط خاصية غير صالح: %s';
  SInvalidPropertyValue = 'قيمة الخاصية غير صالحة';
  SInvalidRegType = 'نمط معطيات غير صالح من أجل ''%s''';
  SInvalidString = 'ثابت نصي غير صالح';
  SInvalidStringGridOp = 'لا يمكن إضافة أو حذف صفوف من الشبكة';
  SItemNotFound = 'لايمكن العثور على العنصر  ($0%x)';
  SLineTooLong = 'سطر طويل جدا';
  SListCapacityError = 'سعة اللائحة خارج الحدود الممكنة (%d)';
  SListCountError = 'تعداد اللائحة خارج الحدود الممكنة (%d)';
  SListIndexError = 'دليل اللائحة خارج الحدود الممكنة (%d)';
  SMaskErr = 'قيمة الإدخال غير صحيحة';
  SMaskEditErr = 'قيمة إدخال غير صحيحة , استخدم زر الإلغاء للتراجع عن التغيرات';
  SMemoryBufferOverrun = 'تم تجاوز الذاكرة الوسيطية المخصصة (البفر)';
  SMemoryStreamError = 'تم تجاوز الذاكرة خلال  عملية توسيع مسلك من نوع memory stream';
  SNoComSupport = '%s لم يتم تسجيلة كصنف من نوع  COM ';
  SNotPrinting = 'الطابعة لاتقوم بالطباعة حاليا';
  SNumberExpected = 'قيمة رقمية متوقعة';
  SAnsiUTF8Expected = 'كود ANSI أو UTF8 متوقع';
  SParseError = '%s في السطر %d';
  SComponentNameTooLong = 'المكون ''%s'' يتوقع حدود 64 محرف';
  SPropertyException = 'خطأ في قراءة %s%s%s: %s';
  SPrinting = 'جاري الطباعة';
  SReadError = 'خطأ في قراءة المسلك';
  SReadOnlyProperty = 'الخاصية للقراءة فقط';
  SRegCreateFailed = 'فشل إنشاء المفتاح %s';
  SRegGetDataFailed = 'فشل استحصال بيانات ''%s''';
  SRegisterError = 'تسجيل مكون غير صالح';
  SRegSetDataFailed = 'فشل ضبط بيانات ''%s''';
  SResNotFound = 'المورد %s لم يتم العثور عليه';
  SSeekNotImplemented = 'الطلب %s .لم يدخل حيز التنفيذ';
  SSortedListError = 'العملية غير مسموحة على لائحة مرتبة';
  SStringExpected = 'قيمة نصية متوقعة';
  SSymbolExpected = '%s متوقع';
  STooManyDeleted = 'تم حذف صفوف أو أعمدة أكثر من المتوقع';
  SUnknownGroup = '%s ليست في مجموعة تسجيل صنف';
  SUnknownProperty = 'الخاصية %s غير موجودة';
  SWriteError = 'خطأ كتابة في المسلك';
  SStreamSetSize = 'خطأ في تحديد حجم المسلك';
  SThreadCreateError = 'خطأ في إنشاء المسلك: %s';
  SThreadError = 'خطأ في المسلك : %s (%d)';
  SThreadExternalTerminate = 'لايمكن إنهاء مسلك تم إنشاؤة خارجيا';
  SThreadExternalWait = 'لايمكن انتظار مسلك تم إنشاؤة خارجيا';
  SThreadStartError = 'لايمكن استدعاء وبدء مسلك في حالة التنفيذ أو الإيقاف';
  SThreadExternalCheckTerminated = 'لايمكن استدعاء CheckTerminated لمسلك تم إنشاؤة خارجيا';
  SThreadExternalSetReturnValue = 'لايمكن استدعاء SetReturnValue لمسلك تم إنشاؤة خارجيا';

  SParamIsNil = 'المتغير %s لايمكن أن تكون قيمته خالية nil';
  SParamIsNegative = 'المتغير %s لايمكن أن تكون قيمته سالبة';
  SInputBufferExceed = 'تم تجاوز قيمة المخزن المؤقت للإدخال Input Buffer %s = %d, %s = %d';

  SInvalidCharsInPath = 'المسار يحوي محارف غير صالحة';
  SInvalidCharsInFileName = 'اسم الملف يحوي محارف غير صالحة';
  SInvalidCharsInSearchPattern = 'أنماط البحث تحوي محارف غير صالحة';
  SPathTooLong = 'المسار المحدد طويل جدا';
  SPathNotFound = 'المسار المحدد غير موجود';
  SPathFormatNotSupported = 'تنسيق المسار هذا غير مدعوم';
  SDirectoryNotEmpty = 'المجلد المحدد غير فارغ';
  SDirectoryAlreadyExists = 'المجلد المحدد موجود مسبقا';
  SDirectoryInvalid = 'اسم المجلد المحدد غير صالح';
  SSourceDirIsDestDir = 'المجلد الهدف هو نفس المجلد المصدر';
  SSourceFileIsDestFile = 'الملف الهدف هو نفس المجلد الوجهة';
  SPathToFileNeeded = 'المسار يجب أن يحدد ملف';
  SSameRootDrive = 'مسار الهدف والمصدر يجب أن يكونا في نفس القرص';
  SDriveNotFound = 'القرص لايمكن العثور عليه';
  SFileNotFound = 'الملف المحدد لايمكن العثور عليه';
  SSpecifiedFileNotFound = 'لملف المحدد غير موجود';
  SFileAlreadyExists = 'الملف المحدد موجود مسبقا';

  SInvalidDateDay = '(%d, %d) ليس زوج تاريخ ويوم مسموح (DateDay) ';
  SInvalidDateWeek = '(%d, %d, %d) ليس ثلاثي تاريخ واسبوع مسموح (DateWeek)';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) ليس رباعي تاريخ شهر اسبوع مسموح (DateMonthWeek)';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) ليس رباعي يوم اسبوع في شهر مسموح (DayOfWeekInMonth)';
  SInvalidJulianDate = '%f التقويم اليوليوسي لايمكن إعادة تمثيلة من نوع تاريخ';
  SMissingDateTimeField = '?';
  SMinimumDateError = 'التواريخ قبل السنة 1 غير مسموحة';
  SLocalTimeInvalid = 'الوقت المحلي المعطى "%s" غير مسموح (كائن في القترة المفقودة عند تقديم الساعة).';

  SConvIncompatibleTypes2 = 'أنماط تحويل غير مكتملة [%s, %s]';
  SConvIncompatibleTypes3 = 'أنماط تحويل غير مكتملة [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'أنماط تحويل غير مكتملة [%s - %s, %s - %s]';
  SConvUnknownType = 'نمط تحويل غير معروف %s';
  SConvDuplicateType = 'نمط التحويل (%s) مسجل مسبقا في %s';
  SConvUnknownFamily = 'عائلة التحويل غير معروفة %s';
  SConvDuplicateFamily = 'عائلة التحويل (%s) مسجلة مسبقا';
  SConvUnknownDescription = '[$%.8x]' deprecated; // no longer used
  SConvUnknownDescriptionWithPrefix = '[%s%.8x]';
  SConvIllegalType = 'نمط غير مسموح';
  SConvIllegalFamily = 'عائلة غير مسموحة';
  SConvFactorZero = '%s لديه معامل صفري';
  SConvStrParseError = 'لايمكن تحليل %s';
  SFailedToCallConstructor = ' %s صنف منحدر من TStrings فشل في استدعاء المنهج الباني الأب';

  sWindowsSocketError = 'خطأ في مقبس وندوز : %s (%d), في ال API ''%s''';
  sAsyncSocketError = 'خطأ مقبس لامتزامن %d';
  sNoAddress = 'لم يتم تحديد عنوان';
  sCannotListenOnOpen = 'لايمكن الاستماع الى مقبس قيد الفتح';
  sCannotCreateSocket = 'لايمكن إنشاء مقبس جديد';
  sSocketAlreadyOpen = 'المقبس مفتوح مسبقا';
  sCantChangeWhileActive = 'لايمكن تغيير القيمة بينما يكون المقبس فعال';
  sSocketMustBeBlocking = 'المقبس يجب ان يكون في نمط blocking mode';
  sSocketIOError = '%s خطأ %d, %s';
  sSocketRead = 'قراءة';
  sSocketWrite = 'كتابة';

  SCmplxCouldNotParseImaginary = 'لايمكن تحليل القسم التخيلي';
  SCmplxCouldNotParseSymbol = 'لايمكن تحليل الرمز المطلوب ''%s'' ';
  SCmplxCouldNotParsePlus = 'لايمكن تحليل الرمز المطلوب  ''+'' (أو ''-'') ';
  SCmplxCouldNotParseReal = 'لايمكن تحليل القسم الحقيقي';
  SCmplxUnexpectedEOS = 'نهاية السلسلة النصية غير متوقعه [%s]';
  SCmplxUnexpectedChars = 'محارف غير متوقعة';
  SCmplxErrorSuffix = '%s [%s<?>%s]';

  hNoSystem = 'لم يتم تنصيب مدير ملفات المساعدة.';
  hNoTopics = 'لم يتم تنصيب مساعدة بناء على المواضيع.';
  hNoContext = 'لم يتم تنصيب مساعدة حساسة للسياق.';
  hNoContextFound = 'لم يتم العثور على مساعدة للسياق %d.';
  hNothingFound = 'لم يتم العثور على مساعدة لـ "%s"';
  hNoTableOfContents = 'لم يتم العثور على جدول المحتويات.';
  hNoFilterViewer = 'لايوجد مستعرض مساعدة يدعم الفلترة';

  sArgumentInvalid = 'معامل غير صالح';
  sArgumentOutOfRange_InvalidHighSurrogate = 'A valid high surrogate character is >= $D800 and <= $DBFF';
  sArgumentOutOfRange_InvalidLowSurrogate = 'A valid low surrogate character is >= $DC00 and <= $DFFF';
  sArgumentOutOfRange_Index = 'الفهرس خارج الحدود (%d).  يجب ان يكون >= 0 و < %d';
  sArgumentOutOfRange_StringIndex = 'الفهرس النصي خارج الحدود (%d).  يجب أن يكون >= %d و <= %d';
  sArgumentOutOfRange_InvalidUTF32 = 'قيمة محارف بترميز UTF32 غير صالحة.  يجب ان تكون >= 0 و <= $10FFFF, باستثناء surrogate pair ranges';
  sArgument_InvalidHighSurrogate = 'High surrogate char without a following low surrogate char at index: %d. Check that the string is encoded properly';
  sArgument_InvalidLowSurrogate = 'Low surrogate char without a preceding high surrogate char at index: %d. Check that the string is encoded properly';
  sArgumentOutOfRange_NeedNonNegValue = 'المعامل, %s, يجب ان يكون >= 0';
  sArgumentOutOfRange_OffLenInvalid = 'الإزاحة والطول غير مسموحة للمصفوفة المعطاة';

  sInvalidStringAndObjectArrays = 'طول الـ Strings و مصفوفة الـ Objects يجب أن يكون متطابق';

  sSameArrays = 'مصفوفة المصدر والوجهة يجب أن لايكونا متطابقتين';

  sNoConstruct = 'الصنف %s لايبدو أنه تم تشييده';

  sCannotCallAcquireOnConditionVar = 'Cannot call Acquire on TConditionVariable.  Must call WaitFor with an external TMutex';
  sInvalidTimeoutValue = 'قيمة مهلة الانتهاء غير صالحة : %s';
  sNamedSyncObjectsNotSupported = 'الأغراض المتزامنة المساة غير مدعومة في هذه المنصة (النظام)';

  sInvalidInitialSemaphoreCount = 'التعداد الأولي غير صالح : %d';
  sInvalidMaxSemaphoreCount = 'التعداد الأقصى غير صحيح: %d';
  sSemaphoreCanceled = 'Invalid operation. Semaphore canceled';
  sInvalidSemaphoreReleaseCount = 'Invalid semaphore release count: %d';
  sSemaphoreReachedMaxCount = 'Semaphore reached MaxCount';
  sErrorCreatingSemaphore = 'Error Creating Semaphore';

  sErrorCreatingEvent = 'خطأ في إنشاء الحدث';

  sSpinCountOutOfRange = 'SpinCount خارج المدى , يجب أن يكون بين  0 و %d';

  sCountdownEventCanceled = 'العد التنازلي تم إلغاءة';
  sInvalidResetCount = 'تعداد إعادة الضبط غير صالح: %d';
  sInvalidInitialCount = 'تعداد غير صالح: %d';
  sInvalidDecrementCount = 'تعداد الزيادة غير صالح : %d';
  sInvalidIncrementCount = 'تعداد الإنقاص غير صالح: %d';
  sInvalidDecrementOperation = 'تعداد الإنقاص سوف يسبب نتائج غير صالحة: التعداد: %d, التعداد الحالي: %d';
  sInvalidIncrementOperation = 'Count already max: Amount: %d, CurCount: %d';
  sCountdownAlreadyZero = 'العد التنازلي قد وصل إلى الصفر مسبقا';

  sTimespanTooLong = 'الفاصل الزمني المحدد طويل جدا';
  sInvalidTimespanDuration = 'لايمكن إعادة المدة الزمنية , لإن القيمه تجاوزت القيمة العليا لـ TTimeSpan.MaxValue';
  sTimespanValueCannotBeNan = 'القيمة لايمكن أن تكون NaN';
  sCannotNegateTimespan = 'عكس القيمة الدنيا للفاصل الزمني غير مسموح ';
  sInvalidTimespanFormat = 'تنسيق الفاصل الزمني غير صالج';
  sTimespanElementTooLong = 'عنصر الفاصل الزمني طويل جدا';

  { ************************************************************************* }
  { Distance's family type }
  SDistanceDescription = 'المسافة';

  { Distance's various conversion types }
  SMicromicronsDescription = 'ميكرو ميكرون';
  SAngstromsDescription = 'أنجستروم';
  SMillimicronsDescription = 'ميلي ميكرون';
  SMicronsDescription = 'ميكرون';
  SMillimetersDescription = 'ميليمتر';
  SCentimetersDescription = 'سنتيمتر';
  SDecimetersDescription = 'ديسيمتر';
  SMetersDescription = 'متر';
  SDecametersDescription = 'ديكامتر(10م)';
  SHectometersDescription = 'هيكتومتر(100م)';
  SKilometersDescription = 'كيلومتر';
  SMegametersDescription = 'ميغامتر';
  SGigametersDescription = 'غيغامتر';
  SInchesDescription = 'إنش';
  SFeetDescription = 'قدم';
  SYardsDescription = 'يارد';
  SMilesDescription = 'ميل';
  SNauticalMilesDescription = 'ميل بحري';
  SAstronomicalUnitsDescription = 'وحدة فلكية';
  SLightYearsDescription = 'سنة ضوئية';
  SParsecsDescription = 'فرسخ نجمي';
  SCubitsDescription = 'ذراع';
  SFathomsDescription = 'قامة';
  SFurlongsDescription = 'فرلنغ';
  SHandsDescription = 'ذراع';
  SPacesDescription = 'خطوة';
  SRodsDescription = 'قضيب';
  SChainsDescription = 'سلسلة';
  SLinksDescription = 'ارتباط';
  SPicasDescription = 'Picas';
  SPointsDescription = 'نقطة';

  { ************************************************************************* }
  { Area's family type }
  SAreaDescription = 'المساحة';

  { Area's various conversion types }
  SSquareMillimetersDescription = 'مليمتر مربع';
  SSquareCentimetersDescription = 'سنتيمتر مربع';
  SSquareDecimetersDescription = 'ديسيمتر مربع';
  SSquareMetersDescription = 'متر مربع';
  SSquareDecametersDescription = 'ديسيمتر مربع';
  SSquareHectometersDescription = 'هكتومتر مربع';
  SSquareKilometersDescription = 'كيلومتر مربع';
  SSquareInchesDescription = 'إنش مربع';
  SSquareFeetDescription = 'قدم مربع';
  SSquareYardsDescription = 'يارده مربعه';
  SSquareMilesDescription = 'ميل مربع';
  SAcresDescription = 'فدان';
  SCentaresDescription = 'متر مربع';
  SAresDescription = 'عشر دونم';
  SHectaresDescription = 'هكتار';
  SSquareRodsDescription = 'SquareRods';

  { ************************************************************************* }
  { Volume's family type }
  SVolumeDescription = 'الحجوم';

  { Volume's various conversion types }
  SCubicMillimetersDescription = 'ميليمتر مكعب';
  SCubicCentimetersDescription = 'سنتيمتر مكعب';
  SCubicDecimetersDescription = 'ديسيمتر مكعب';
  SCubicMetersDescription = 'متر مكعب';
  SCubicDecametersDescription = 'ديسمتر مكعب';
  SCubicHectometersDescription = 'هيكتومتر مكعب';
  SCubicKilometersDescription = 'كيلومتر مكعب';
  SCubicInchesDescription = 'إنش مكعب';
  SCubicFeetDescription = 'قدم مكعبة';
  SCubicYardsDescription = 'يارده مكعبة';
  SCubicMilesDescription = 'ميل مكعب';
  SMilliLitersDescription = 'ميلي لتر';
  SCentiLitersDescription = 'سنتي ليتر';
  SDeciLitersDescription = 'ديسي ليتر';
  SLitersDescription = 'لتر';
  SDecaLitersDescription = 'ديكا ليتر';
  SHectoLitersDescription = 'هيكتو لتر';
  SKiloLitersDescription = 'كيلو لتر';
  SAcreFeetDescription = 'أكرة  قدم';
  SAcreInchesDescription = 'أكرة إنش';
  SCordsDescription = 'كدسة';
  SCordFeetDescription = 'كدسة قدم';
  SDecisteresDescription = 'دسي استير';
  SSteresDescription = 'استير';
  SDecasteresDescription = 'ديكا استير';

  { American Fluid Units }
  SFluidGallonsDescription = 'غالون مائع';
  SFluidQuartsDescription = 'ربع غالون مائع';
  SFluidPintsDescription = 'ثمن غالون (نصف ليتر)';
  SFluidCupsDescription = 'كوب';
  SFluidGillsDescription = 'مكيال';
  SFluidOuncesDescription = 'أونصة سائلة';
  SFluidTablespoonsDescription = 'ملعقة طعام';
  SFluidTeaspoonsDescription = 'ملعقة شاي';

  { American Dry Units }
  SDryGallonsDescription = 'غالون جاف';
  SDryQuartsDescription = 'ربع غالون';
  SDryPintsDescription = 'ثمن غالون';
  SDryPecksDescription = 'بكّ';
  SDryBucketsDescription = 'سطل';
  SDryBushelsDescription = 'بوشل';

  { English Imperial Fluid/Dry Units }
  SUKGallonsDescription = 'غالون بريطاني';
  SUKPottlesDescription = 'نصف غالون بريطاني';
  SUKQuartsDescription = 'ربع غالون بريطاني';
  SUKPintsDescription = 'ثمن غالون بريطاني';
  SUKGillsDescription = 'مكيال بريطاني';
  SUKOuncesDescription = 'اونصة بريطانية';
  SUKPecksDescription = 'بكّ بريطاني';
  SUKBucketsDescription = 'سطل بريطاني';
  SUKBushelsDescription = 'بوشل بريطاني';

  { ************************************************************************* }
  { Mass's family type }
  SMassDescription = 'الأوزان';

  { Mass's various conversion types }
  SNanogramsDescription = 'نانو غرام';
  SMicrogramsDescription = 'ميكرو غرام';
  SMilligramsDescription = 'ميلي غرام';
  SCentigramsDescription = 'سنتيغرام';
  SDecigramsDescription = 'ديسيغرام';
  SGramsDescription = 'غرام';
  SDecagramsDescription = 'ديكا غرام';
  SHectogramsDescription = 'هيكتوغرام';
  SKilogramsDescription = 'كيلوغرام';
  SMetricTonsDescription = 'طن متري';
  SDramsDescription = 'درهم';
  SGrainsDescription = 'حبة';
  STonsDescription = 'طن';
  SLongTonsDescription = 'طن طويل';
  SOuncesDescription = 'أونصة';
  SPoundsDescription = 'باوند';
  SStonesDescription = 'حجر';

  { ************************************************************************* }
  { Temperature's family type }
  STemperatureDescription = 'الحرارة';

  { Temperature's various conversion types }
  SCelsiusDescription = 'سيلسيوس';
  SKelvinDescription = 'كيلفن';
  SFahrenheitDescription = 'فاهرنهايت';
  SRankineDescription = 'رانكين';
  SReaumurDescription = 'ريامور';

  { ************************************************************************* }
  { Time's family type }
  STimeDescription = 'الوقت';

  { Time's various conversion types }
  SMilliSecondsDescription = 'ميلي ثانية';
  SSecondsDescription = 'ثانية';
  SMinutesDescription = 'دقيقة';
  SHoursDescription = 'ساعة';
  SDaysDescription = 'يوم';
  SWeeksDescription = 'أسبوع';
  SFortnightsDescription = 'أسبوعان';
  SMonthsDescription = 'شهر';
  SYearsDescription = 'سنة';
  SDecadesDescription = 'عقد';
  SCenturiesDescription = 'قرن';
  SMillenniaDescription = 'ألفية';
  SDateTimeDescription = 'تاريخ ووقت';
  SJulianDateDescription = 'التقويم اليوليوسي';
  SModifiedJulianDateDescription = 'التقويم اليوليوسي المعدل';

  SInvalidDate = '''%s'' ليس تاريخ صالح' deprecated 'Use SysConst.SInvalidDate';
  SInvalidDateTime = '''%s'' ليست قيمة تاريخ ووقت صالحة' deprecated 'Use SysConst.SInvalidDateTime';
  SInvalidInteger = '''%s'' ليس رقم صحيح صالح' deprecated 'Use SysConst.SInvalidInteger';
  SInvalidTime = '''%s'' ليس وقت صالح' deprecated 'Use SysConst.SInvalidTime';
  STimeEncodeError = 'Invalid argument to time encode' deprecated 'Use SysConst.STimeEncodeError';

  SGUIDAlreadyDefined = 'GUID ''%s'' تم تسجيله مسبقا';
  SNoComComponent = 'بناء غرض من نوع COM : ''%s'' ليس له مكون يغلفه ';
  SNoComClass = '%s.GetComClass أعاد قيمة فارغة nil';
  SNoCOMClassSpecified = 'لم يتم تحديد ComClass';
  SNoCOMClassesRegistered = 'لم يتم تسجيل أي أصناف من نمط COM';

  SNoContext = 'لا يوجد مساعدة حساسة للسياق تم تنصيبها';
  SNoContextFound = 'لم يتم العثور على مساعدة ل %d';
  SNoIndex = 'غير قادر على فتح الفهرس';
  SNoSearch = 'غير قادر على فتح البحث';
  SNoTableOfContents = 'غير قادر على إيجاد فهرس المحتويات';
  SNoTopics = 'لم يتم تنصيب نظام مساعدة مبني على المواضيع topic-based help';
  SNothingFound = 'لم يتم العثور على مساعدة من اجل %s';

  SMethodNotFound = 'منهج %s الصنف %s لم يتم العثور عليه';
  STypeMisMatch = 'نمط غير مطابق للمتغير %d من جل المنهج %s';
  SInvalidDispID = 'DispID غير صالح للمتغير  %d في المنهج %s';
  SParamRequired = 'متغير مطلوب %d من أجل المنهج %s';
  SMethodOver = 'تعريف المنهج لـ %s لديه أكثر من  %d متغير';
  STooManyParams = 'متغيرات أكثر من المطلوب , للمنهج %s';
  SNoRTTIInfoType = 'غير قادر على استحضار المنهج %s الذي يستخدم نمط غير منشور (unpublished)';
  SResultIsExtended = 'نمط 10bytes-Extended type في المنهج %s'' يعيد أن قيمة النمط غير مدعومة';
  SParamIsExtended = 'نمط 10bytes-Extended type في المتغير %d في المنهج %s غير مدعوم ';

  SArgumentOutOfRange = 'المتغير خارج المدى المسموح';
  SArgumentNil = 'المتغير يجب أن لايكون خالي Nil';
  SErrorCantModifyWhileIterating = 'لا يمكن تعديل مجموعة أثناء التكرار';
  SUnbalancedOperation = 'عملية مكدس أو رتل غير متوازنة ';
  SGenericItemNotFound = 'العنصر غير موجود';
  SGenericDuplicateItem = 'القيم المكررة غير مسموحة';

  SSpinLockInvalidOperation = 'تتبع المسالك غير مفعل';
  SSpinLockReEntered = 'تم إعادة إدخال SpinLock في نفس المسلك';
  SSpinLockNotOwned = 'SpinLock غير مملوك من قبل المسلك الحالي';

  SInsufficientRtti = 'معلومات الأنماط غير متوفرة في زمن التشغيل RTTI لدعم هذه العملية';
  SParameterCountMismatch = 'عدد المتغيرات غير مطابق';
  SParameterCountExceeded = 'تم تخطي عدد المتغيرات';
  SConversionError = 'نمط غير متوافق';
  SNonPublicType = 'النمط ''%s'' لم يعرف في قسم interface للوحدة';
  SByRefArgMismatch = 'كل من VAR و OUT يجب ان يملكا انماط متغيرات متطابقة';

  SInsufficientReadBuffer = 'الذاكرة الوسيطية (البفر) غير كافيه للبيانات التي تمت استعادتها';

  SInvalid7BitEncodedInteger = 'ترميز 7بت للinteger stream غير صالح';
  SNoSurrogates = 'البديل غير مسموح كمحرف مفرد';
  SInvalidStringLength = 'طول النص غير صالح';
  SReadPastEndOfStream = 'محاولة للقراءة من النص تتجاوز نهايته';

  SInvalidGuidArray = 'Byte array for GUID must be exactly %d bytes long';

  SServiceNotFound = 'خدمة اعتماد تسجيل الدخول التي تم اختيارها غير موجودة';

  { Class group report strings }

  sClassGroupHeader = 'المجموعة[%d] - نشط: %s';
  sGroupClassesHeader = '  أصناف المجموعة';
  sClassListHeader = '  اصناف';
  sClassAliasesHeader = '  بدائل الأصناف';

{$IFDEF MACOS}
  sInvalidConversion = 'Invalid conversion from %s to %s';
  sInvalidPListType = 'Invalid CFPropertyList type';
  sConvertArrayArray = 'Cannot convert CFArray of CFArray';
  sConvertArrayDictionary = 'Cannot convert CFArray of CFDictionary';
  sConvertDictionary = 'Cannot translate CFDictionary to Delphi type';
  sKeyNotPresent = 'Key not present';
  SFailedClassCreate = 'Unable to create class ''%s''';
  SObjCSelectorNotFound = 'Selector ''%s'' not found';
  SObjCClassRegistrationFailed = 'Unable to register class ''%s''';
  SInvalidObjCType = 'The type ''%s'' is not supported with ObjectiveC interoperability';
  SFatalInvoke = 'Fatal error during function invocation';
{$ENDIF MACOS}

{$IFDEF MSWINDOWS}
  { TOSVersion strings }
  SVersionStr = '%s (الإصدارة %d.%d, البناء %d, %5:s)';
  SSPVersionStr = '%s حزمة الخدمة %4:d (الإصدارة %1:d.%2:d, البناء %3:d, %5:s)';
  SVersion32 = 'إصدار 32 بت';
  SVersion64 = 'إصدار 64 بت';
  SWindows = 'ويندوز';
  SWindowsVista = 'ويندوز فيستا';
  SWindowsServer2008 = 'Windows Server 2008';
  SWindows7 = 'ويندوز 7';
  SWindowsServer2008R2 = 'Windows Server 2008 R2';
  SWindows2000 = 'Windows 2000';
  SWindowsXP = 'ويندوز إكس بي';
  SWindowsServer2003 = 'Windows Server 2003';
  SWindowsServer2003R2 = 'Windows Server 2003 R2';
  SWindowsServer2012 = 'Windows Server 2012';
  SWindowsServer2012R2 = 'Windows Server 2012 R2';
  SWindowsServer2016 = 'Windows Server 2016';
  SWindows8 = 'ويندوز 8';
  SWindows8Point1 = 'ويندوز 8.1';
  SWindows10 = 'ويندوز 10';
  SItaskbarInterfaceException = '%s هذه الواجهة غير مدعومة في هذه الإصدارة من النظام';
  SHookException = 'لايمكن ربط وتبادل الرسائل, الأزرار وأحداث العرض لن تعمل ';
  SInitializeException = 'لايمكن تهيئة شريط المهام . خطأ : %d';
  SInstanceException = 'هناك نسخة أخرى من شريط المهام ';
  SButtonsLimitException = 'شريط مهام وندوز يدعم فقط %d أزرار في صفحات المعاينة';
  SCouldNotRegisterTabException = 'لايمكن تسجيل الصفحة . خطأ %d';
  SInvalidProgressValueException = '%d ليس صحيح . يجب ان يكون بين 0 و %d';
  SThumbPreviewException = 'فشل إعداد الصورة كعرض مصغرات . خطأ: %d';
  SBitmapPreviewException = 'فشل إعداد الصورة للمعاينه. خطأ: %d';
  { WinRT support strings }
  SWinRTNoRTTI = 'لم يتم العثور على معلومات أنماط زمن التشغيل RTTI للصنف %s';
  SWinRTInstanceError = 'لا يمكن إنشاء غرض من الصنف %s';
  SWinRTICreatedError = 'الغرض الذي يتم إنشاؤه من الصنف %s خاطئ';
  SWinRTHStringError = 'خطأ في إنشاء HString من أجل %s';
  SWinRTFactoryError = 'لايمكن استحصال factory للصنف %s';
  SWinRTWrongFactoryError = 'الـ factory المستحصل من أجل %s خاطئ';
  SWinRTInteropError = 'لايمكن إنشاء صنف interop';
{$ENDIF}
{$IF defined(LINUX)}
  SVersionStr = '%s %s (Version %d.%d.%d)';
{$ENDIF}
{$IF defined(MACOS) or defined(ANDROID)}
  SVersionStr = '%s (Version %d.%d.%d)';
{$ENDIF}
  { Zip Strings}
  SZipErrorRead            = 'خطأ في قراءة ملف مضغوط zip';
  SZipErrorWrite           = 'خطأ في كتابة ملف مضغوط zip';
  SZipInvalidLocalHeader   = 'خطأ في توقيع ترويسة LocalHeader ملف مضغوط zip';
  SZipInvalidCentralHeader = 'خطأ في توقيع ترويسة Central Header ملف مضغوط Zip';
  SZipNotSupported         = 'دعم نمط الضغط غير مسجل : %s';
  SZipNotOpen              = 'يجب ان يتم فتح الملف';
  SZipNoWrite              = 'سجب ان يتم فتح الملف للكتابة';
  SZipNoRead               = 'يجب ان يتم فتح الملف للقراءة';
  SZipNotEmpty             = 'ملف Zip يجب ان يكون فارغ';
  SZipFileNameEmpty        = 'اسم الملف يجب ان لايكون فارغ';
  SZipExceedNumberOfFiles  = 'عدد الملفات تجاوز الحد';

  sObserverUnsupported = 'المراقب Observer غير مدعوم';
  sObserverMultipleSingleCast = 'Cannot have multiple single cast observers added to the observers collection';
  sObserverNoInterface = 'The object does not implement the observer interface';
  sObserverNoSinglecastFound = 'No single cast observer with ID %d was added to the observer collection';
  sObserverNoMulticastFound = 'No multi cast observer with ID %d was added to the observer collection';
  sObserverNotAvailable = 'المراقب Observer غير متوفر';

  SGeocodeMultipleRequests = 'لايمكن تهيئة أثناء أو أكثر من طلبات geocoding requests في نفس الوقت';
  SLocationSensorStarted = 'حساس الموقع تم تشغيله';
  SSensorIndexError = 'الحساس المحدد بالترتيب (%d) لم يتم العثور عليه';
                                                          
{IFDEF MACOS}
  SLocationServiceUnauthorized = 'غير مصرح لك باستخدام خدمة المواقع';
  SLocationServiceDisabled = 'خدمات المواقع غير مفعلة';
{ENDIF}

  {$IFDEF ANDROID}
  SAssetFileNotFound = 'Cannot deploy, "%s" file not found in assets';
  SExternalExtorageNotAvailable = 'Cannot have access to external storage on device';
  {$ENDIF}

  { System.DateUtils }
  SInvalidDateString = 'نص التاريخ غير مقبول: %s';
  SInvalidTimeString = 'نص الوقت غير مقبول: %s';
  SInvalidOffsetString = 'نص إزاحة الوقت غير مسموحة: %s';

  { System.Devices }
  sCannotManuallyConstructDevice = 'Manual construction of TDeviceInfo is not supported'; // move to System.RTLConsts.
  sAttributeExists = 'الصفة ''%s'' موجودة مسبقا';
  sDeviceExists = 'الجهاز ''%s'' موجود مسبقا';

  { System.Hash }
  SHashCanNotUpdateMD5 = 'MD5: لايمكن تحديث هاش النهاية finalized hash';
  SHashCanNotUpdateSHA1 = 'SHA1: لايمكن تحديث هاش النهاية finalized hash';
  SHashCanNotUpdateSHA2 = 'SHA2: لايمكن تحديث هاش النهايةfinalized hash';

  { System.NetEncoding }
  sErrorDecodingURLText = 'خطأ في فك نمط URL style (%%XX) النص المرمز في الموقع %d';
  sInvalidURLEncodedChar = 'محرف عنوان URL مرمز غير صالح (%s) في الموقع %d';
  sInvalidHTMLEncodedChar = 'محرف HTML مرمز غير صالح (%s) في الموقع %d';

  { System.Threading }
  sStopAfterBreak = 'The Break method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sBreakAfterStop = 'The Stop method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sInvalidTaskConstruction = 'Cannot construct an ITask in this manner';
  sEmptyJoinTaskList = 'List of tasks to Join method empty';
  sWaitNilTask = 'At least one task in array nil';
  sCannotStartCompletedTask = 'لايمكن بدء مهمة اكتملت للتو';
  sOneOrMoreTasksCancelled = 'مهمة أو أكثر سيتم إلغائها';
  sDefaultAggregateExceptionMsg = 'حدثت أخطاء';

  { System.Types }
  sMustWaitOnOneEvent = 'يجب انتظار حدث واحد على الأقل';

  { TComponent.BeginInvoke }
  sBeginInvokeDestroying = 'Cannot call BeginInvoke on a TComponent in the process of destruction';

  { System.ShareContract }
  SShareContractNotAvailable = 'ShareContract غير متوفر';
  SShareContractNotSupported = 'المشاركة ليست مسموحة تحت %s';
  SShareContractNotInitialized = 'حدث TShareContract.OnProcessMessages يجب أن يتم اسناده أولا';

  { WinRT.Bluetooth }
  SNoAsyncInfo = 'The object does not implement the IAsyncInfo interface';

  { System.Rtti }
  SInsufficientTypeInformation = 'Insufficient type information for record ''%s''. Use ''var'', ''[Ref]'' or ''out'' pameters for this type.';
  SInsufficientTypeInformationResult = 'Insufficient type information for record ''%s''. Type can not be used as result of a function.';

const
  SEmpty: string = 'Empty';  // do not localize
  SMenuSeparator: string = '-';   // do not localize

implementation

end.
