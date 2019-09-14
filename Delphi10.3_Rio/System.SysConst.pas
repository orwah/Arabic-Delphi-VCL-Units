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

unit System.SysConst;

{$IFDEF ANDROID}
{$define USE_LIBICU}
{$ENDIF ANDROID}

                                                                                  
{$IFDEF LINUX}
  {$DEFINE USE_LIBICU}
{$ENDIF LINUX}

interface
{$HPPEMIT LEGACYHPP}

resourcestring
  SUnknown = '<غير معروف>';
  SInvalidInteger = '''%s'' ليست قيمة مناسبة لرقم صحيح (بلا فاصلة)';
  SInvalidInteger2 = '''%s'' ليست قيمة مناسبة لرقم صحيح (بلا فاصلة) للنمط %s ';
  SInvalidFloat = '''%s'' ليست قيمة مناسبة لرقم عشري (فاصلة عائمة)';
  SInvalidFloat2 = '''%s'' ست قيمة مناسبة لرقم عشري (فاصلة عائمة) للنمط %s ';
  SInvalidCurrency = '''%s'' ليس قيمة مناسبة للدفعات النقدية';
  SInvalidDate = '''%s'' ليس تاريخ صالح';
  SInvalidTime = '''%s'' ليس وقت صالح';
  SInvalidDateTime = '''%s'' ليست قيمة مناسبة للتاريخ';
  SInvalidDateTimeFloat = '''%g'' ليست قيمة مناسبة للتاريخ والوقت';
  SInvalidTimeStamp = '''%d.%d'' ليست قيمة منطقة زمنية مناسبة';
  SInvalidGUID = '''%s'' ليست قيمة GUID صالحة';
  SInvalidBoolean = '''%s'' ليست قيمة بوليانية مناسبة';
  STimeEncodeError = 'معامل تنسيق الوقت غير مسموح';
  SDateEncodeError = 'معامل تنسيق التاريخ غير مسموح';
  SOutOfMemory = 'الذاكرة لاتكفي';
  SInOutError = 'خطأ من نوع إدخال /إخراج %d';
  SFileNotFound = 'الملف غير موجود';
  SInvalidFilename = 'اسم ملف غير صالح';
  SInvalidUnknownFilename = 'اسم ملف غير صالح';
  STooManyOpenFiles = 'الملفات المفتوحة أكثر من المتوقع';
  SAccessDenied = 'تم رفض الوصول للملف';
  SEndOfFile = 'تجري القراءة خلف نهاية بيانات الملف';
  SDiskFull = 'القرص ممتلئ';
  SInvalidInput = 'إدخال قيمة رقمية غير صالحة';
  SDivByZero = 'التقسيم على صفر';
  SRangeError = 'خطأ في فحص المجال المسموح';
  SIntOverflow = 'قيمة عدد صحيح فائضة';
  SInvalidOp = 'عملية عشرية غير مسموحة';
  SZeroDivide = 'قسمة عدد عشري على الصفر';
  SOverflow = 'قيمة عدد عشري فائضة';
  SUnderflow = 'قيمة عدد عشري دون المسموح';
  SInvalidPointer = 'عملية مؤشرات غير مسموحة';
  SInvalidCast = 'تحويل غير صالح للأصناف';
{$IFDEF MSWINDOWS}
  SAccessViolationArg3 = 'دخول انتهاكي للعنوان %p. %s من العنوان %p';
{$ENDIF MSWINDOWS}
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SAccessViolationArg2 = 'دخول انتهاكي للعنوان %p, عنوان الدخول %p';
{$ENDIF LINUX or MACOS or ANDROID}
  SAccessViolationNoArg = 'دخول انتهاكي';
  SStackOverflow = 'فيض في المكدس';
  SControlC = 'إضغط Control-C';
  SQuit = 'إضغط زر الخروج Quit';
  SPrivilege = 'التعليمة تحتاج صلاحيات';
  SOperationAborted = 'تم انهاء العملية';
  SException = 'استثناء %s في وحدة %s في %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'خطأ في التطبيق ';
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SSigactionFailed = 'sigaction call failed';
  SOSExceptionHandlingFailed = 'OS exception handling initialization failed';
{$ENDIF LINUX or MACOS or ANDROID}
  SInvalidFormat = 'التنسيق ''%s'' غير صالح أو غير متوافق مع المعامل';
  SArgumentMissing = 'لامعامل  من أجل التنسيق ''%s''';
  SDispatchError = 'استدعاءات المناهج من نوع Variant غير مدعومة';
  SReadAccess = 'قراءة';
  SWriteAccess = 'كتابة';
  SExecuteAccess = 'تنفيذ';
  SInvalidAccess = 'دخول غير مسموح';
  SResultTooLong = 'نتيجة التنسيق أكبر من 4096 محرف';
  SFormatTooLong = 'نص التنسيق طويل جدا';
{$IFDEF MACOS}
  SCFStringFailed = 'خطأ في إنشاء CFString';
{$ENDIF MACOS}
{$IF defined(USE_LIBICU)}
  SICUError = 'خطأ ICU : %d, %s';
  SICUErrorOverflow = 'ICU Overflow Error: %d, %s, Needed Length=%d';
{$ENDIF defined(USE_LIBICU)}

  SVarArrayCreate = 'خطأ في إنشاء المتغير أو المصفوفة';
  SVarArrayBounds = 'الفهرس المحدد خارج الحدود';
  SVarArrayLocked = 'المتغير أو المصفوفة مقفلة';
  SVarArrayWithHResult = 'خطأ غير متوقع في المتغير او المصفوفة : %s%.8x';

  SInvalidVarCast = 'تغير غير صالح لنمط المتحول من نوع variant';
  SInvalidVarOp = 'عملية غير صالحة على متحول من نمط variant';
  SInvalidVarNullOp = 'عملية غير صالحة على متغير variant قيمته  NULL';
  SInvalidVarOpWithHResultWithPrefix = 'عملية غير صالحة على متغير من نمط variant (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = 'Range check error for variant of type (%s)';
  SVarTypeRangeCheck2 = 'Range check error while converting variant of type (%s) into type (%s)';
  SVarTypeOutOfRangeWithPrefix = 'Custom variant type (%s%.4x) is out of range';
  SVarTypeAlreadyUsedWithPrefix = 'Custom variant type (%s%.4x) already used by %s';
  SVarTypeNotUsableWithPrefix = 'Custom variant type (%s%.4x) is not usable';
  SVarTypeTooManyCustom = 'Too many custom variant types have been registered';

  // the following are not used anymore
  SVarNotArray = 'Variant is not an array' deprecated; // not used, use SVarInvalid instead
  SVarTypeUnknown = 'Unknown custom variant type ($%.4x)' deprecated; // not used anymore
  SVarTypeOutOfRange = 'Custom variant type ($%.4x) is out of range' deprecated;
  SVarTypeAlreadyUsed = 'Custom variant type ($%.4x) already used by %s' deprecated;
  SVarTypeNotUsable = 'Custom variant type ($%.4x) is not usable' deprecated;
  SInvalidVarOpWithHResult = 'Invalid variant operation ($%.8x)' deprecated;
  
  SVarTypeCouldNotConvert = 'لايمكن تحويل متحول variant من نمط (%s) الى نمط (%s)';
  SVarTypeConvertOverflow = 'حدثت حالة فيض عند تغيير متحول variant من نمط (%s) إلى نمط (%s)';
  SVarOverflow = 'حدثت حالة فيض مع متحول من نوع Variant';
  SVarInvalid = 'معامل غير صالح';
  SVarBadType = 'نمط متحول variant غير صالح';
  SVarNotImplemented = 'العملية غير مدعومة';
  SVarOutOfMemory = 'العملية على متحول Variant خرجت عن الذاكرة المخصصة';
  SVarUnexpected = 'خطأ غير معروف في متحول variant';

  SVarDataClearRecursing = 'Recursion while doing a VarDataClear';
  SVarDataCopyRecursing = 'Recursion while doing a VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Recursion while doing a VarDataCopyNoInd';
  SVarDataInitRecursing = 'Recursion while doing a VarDataInit';
  SVarDataCastToRecursing = 'Recursion while doing a VarDataCastTo';
  SVarIsEmpty = 'المتحول Variant فارغ';
  sUnknownFromType = 'لايمكن التحويل من النمط المحدد';
  sUnknownToType = 'لايمكن التحويل إلى النمط المحدد';
  SExternalException = 'استثناء خارجي %x';
  SAssertionFailed = 'فشل في التوكيد';
  SIntfCastError = 'الواجهة غير مدعومة';
  SSafecallException = 'Exception in safecall method';
  SMonitorLockException = 'Object lock not owned';
  SNoMonitorSupportException = 'Monitor support function not initialized';
  SNotImplemented = 'الميزة غير مدعومة';
  SObjectDisposed = 'Method called on disposed object';
  SAssertError = '%s (%s, السطر %d)';
  SAbstractError = 'Abstract Error';
  SModuleAccessViolation = 'انتهاك في الوصول للعنوان %p في الوحدة ''%s''. %s للعنوان %p';
  SCannotReadPackageInfo = 'لايمكن الدخول الى معلومات الرزمة , للحزمة ''%s''';
  sErrorLoadingPackage = 'لايمكن تحميل الحزمة %s.'+sLineBreak+'%s';
  SInvalidPackageFile = 'ملف الحزمة غير صالح ''%s''';
  SInvalidPackageHandle = 'رقم مقبض الحزمة غير صالح';
  SDuplicatePackageUnit = 'لايمكن تحميل الحزمة ''%s.''  انها تحوي الوحدة ''%s'', ' +
    'والتي هي ايضا محتواة في الحزمة ''%s''';
  SOSError = 'خطأ في النظام.  الكود: %d.'+sLineBreak+'%s%s';
  SUnkOSError = 'فشل استدعاء وظيفة من النظام';
{$IFDEF MSWINDOWS}
  SWin32Error = 'خطأ ويندوز32 , الرمز: %d.'#10'%s' deprecated 'Use SOSError'; 
  SUnkWin32Error = 'A Win32 API function failed' deprecated 'Use SUnkOSError';
{$ENDIF}
  SNL = 'التطبيق غير مرخص لاستخدام هذه الميزة';

  SShortMonthNameJan = 'كا2';
  SShortMonthNameFeb = 'شبا';
  SShortMonthNameMar = 'آذا';
  SShortMonthNameApr = 'نيس';
  SShortMonthNameMay = 'أيا';
  SShortMonthNameJun = 'حزي';
  SShortMonthNameJul = 'تمو';
  SShortMonthNameAug = 'اب ';
  SShortMonthNameSep = 'ايل';
  SShortMonthNameOct = 'تش1';
  SShortMonthNameNov = 'تش2';
  SShortMonthNameDec = 'كا1';

  SLongMonthNameJan = 'كانون الثاني';
  SLongMonthNameFeb = 'شباط';
  SLongMonthNameMar = 'آذار';
  SLongMonthNameApr = 'نيسان';
  SLongMonthNameMay = 'أيار';
  SLongMonthNameJun = 'حزيران';
  SLongMonthNameJul = 'تموز';
  SLongMonthNameAug = 'آب';
  SLongMonthNameSep = 'أيلول';
  SLongMonthNameOct = 'تشرين الأول';
  SLongMonthNameNov = 'تشرين الثاني';
  SLongMonthNameDec = 'كانون الأول';

  SShortDayNameSun = 'احد';
  SShortDayNameMon = 'إثن';
  SShortDayNameTue = 'ثلا';
  SShortDayNameWed = 'أرب';
  SShortDayNameThu = 'خمي';
  SShortDayNameFri = 'جمع';
  SShortDayNameSat = 'سبت';

  SLongDayNameSun = 'الأحد';
  SLongDayNameMon = 'الإثنين';
  SLongDayNameTue = 'الثلاثاء';
  SLongDayNameWed = 'الأربعاء';
  SLongDayNameThu = 'الخميس';
  SLongDayNameFri = 'الجمعة';
  SLongDayNameSat = 'السبت';

{$IFDEF POSIX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = 'لايمكن إنشاء المجلد';
  SCodesetConversionError = 'فشل في تحويل Codeset';

  // Used by TEncoding
  SInvalidSourceArray = 'مصفوفة المصدر غير صالحة';
  SInvalidDestinationArray = 'مصفوفة الوجهة غير صالحة';
  SCharIndexOutOfBounds = 'فهرس المحرف خارج الحدود (%d)';
  SByteIndexOutOfBounds = 'فهرس البداية خارج الحدود (%d)';
  SInvalidCharCount = 'تعداد غير صالح (%d)';
  SInvalidDestinationIndex = 'فهرس وجهة غير صالح (%d)';
  SInvalidCodePage = 'صفحة الكود غير صالحة';
  SInvalidEncodingName = 'اسم الترميز غير صالح';
  SNoMappingForUnicodeCharacter = 'لايوجد تخطيط من اجل محارف يونيكود موجود في صفحة الكود الهدف multi-byte code page';
  SInvalidStringBaseIndex = 'Invalid StringBaseIndex';
 SOperationCancelled = 'العملية الغيت';
 
implementation

end.
