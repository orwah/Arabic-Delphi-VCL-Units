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
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit Data.DBConsts;

interface

resourcestring
  SInvalidFieldSize = 'حجم الحقل غير صحيح';
  SInvalidFieldKind = 'نمط الحقل غير صحيح';
  SInvalidFieldRegistration = 'تسجيل الحقل غير صحيح';
  SUnknownFieldType = 'حقل ''%s'' من نمط غير معروف';
  SFieldNameMissing = 'اسم الحقل غير مضبوط';
  SDuplicateFieldName = 'اسم الحقل ''%s'' مكرر';
  SFieldNotFound = 'لم يتم العثور على الحقل : ''%s''';
  SFieldAccessError = 'لايمكن الوصول للحقل ''%s'' كنمط %s';
  SFieldValueError = 'قيمة غير صالحة لحقل  ''%s''';
  SFieldRangeError = '%g ليست قيمة صالحة لحقل ''%s''. المجال المسموح هو من %g إلى %g';
  SBcdFieldRangeError = '%s ليست قيمة صالحة لحقل ''%s''. المجال المسموح هو من %s إلى %s';
  SInvalidIntegerValue = '''%s'' ليست قيمة عدد صحيح (بلا فاصلة) للحقل ''%s''';
  SInvalidBoolValue = '''%s'' ليست قيمة بوليانية صحيحة للحقل ''%s''';
  SInvalidFloatValue = '''%s'' ليست قيمة عدد حقيقي (فاصلة عائمة) للحقل ''%s''';
  SFieldTypeMismatch = 'النمط غير مطابق للحقل ''%s'', المتوقع: %s المطبق: %s';
  SFieldSizeMismatch = 'السعة أو الحجم غير مطابقة للحقل ''%s'', المتوقع: %d المطبق: %d';
  SInvalidVarByteArray = 'نمط أو حجم غير صالح للحقل ''%s''';
  SFieldOutOfRange = 'قيمة حقل ''%s'' خارج المجال المسموح';
//  SBCDOverflow = '(Overflow)';
  SCantAdjustPrecision = 'خطأ في ضبط دقة الترقيم العشري الثنائي BCD precision';
  SFieldRequired = 'حقل ''%s'' يجب أن يحوي قيمة';
  SDataSetMissing = 'حقل ''%s'' ليس له قاعدة داتاسيت';
  SInvalidCalcType = 'حقل ''%s'' لايمكنه أن يكون من نمط حسابي أو بحث (لوك أب)';
  SFieldReadOnly = 'حقل ''%s'' غير قابل للتعديل';
  SFieldIndexError = 'رقم الحقل خارج المجال المسموح';
  SNoFieldIndexes = 'لايوجد رقم حقل نشط حالياً';
  SNotIndexField = 'حقل ''%s'' ليس مفهرس ولايمكن تعديله';
  SIndexFieldMissing = 'لايمكن الوصول للحقل المفهرس ''%s''';
  SDuplicateIndexName = 'اسم فهرس مكرر : ''%s''';
  SNoIndexForFields = 'لافهرس للحقول : ''%s''';
  SIndexNotFound = 'الفهرس ''%s'' غير موجود';
  SDBDuplicateName = 'اسم ''%s'' مكرر في %s';
  SCircularDataLink = 'وصلات البيانات تستدعي بعضها بشكل دائري (كل منها يستدعي الآخر) وهذا غير مسموح';
  SLookupInfoError = 'معلومات البحث Lookup للحقل ''%s'' غير مكتملة';
  SNewLookupFieldCaption = 'حقل بحث Lookup جديد';
  SDataSourceChange = 'لايمكن تغيير منبع البيانات DataSource';
  SNoNestedMasterSource = 'Nested datasets cannot have a MasterSource';
  SDataSetOpen = 'لايمكن القيام بهذه العملية على داتاسيت مفتوحة';
  SNotEditing = 'البيانات ليست في وضع الإدخال أو التعديل';
  SDataSetClosed = 'لايمكن القيام بهذه العملية على قاعدة بيانات مغلقة';
  SDataSetEmpty = 'لايمكن القيام بهذه العملية على جدول بيانات فارغ';
  SDataSetReadOnly = 'لايمكن تعديل جدول بيانات مخصص للقراءة فقط';
  SNestedDataSetClass = 'Nested dataset must inherit from %s';
  SExprTermination = 'تعبير الفلترة انتهى بشكل غير مناسب';
  SExprNameError = 'اسم الحقل غير منتهي Unterminated';
  SExprStringError = 'ثابت نصي غير منتهي Unterminated';
  SExprInvalidChar = 'تم استخدام محرف غير مناسب في تعبير الفلترة : ''%s''';
  SExprNoLParen = '''('' متوقعه , لكن %s وجدت';
  SExprNoRParen = ''')'' متوقعة , لكن %s وجدت';
  SExprNoRParenOrComma = ''')'' أو '','' كانت متوقعه ولكن %s وجدت';
  SExprExpected = 'تعبير متوقع وبدلا منه وجد %s ';
  SExprBadField = 'الحقل ''%s'' لايمكن استخدامه في تعبير الفلترة';
  SExprBadNullTest = 'القيمة الخالية NULL مسموحة فقط مع ''='' و ''<>''';
  SExprRangeError = 'الثابت الممر خارج المجال المسموح';
  SExprNotBoolean = 'حقل ''%s'' ليس من نمط بولياني';
  SExprIncorrect = 'تعبير الفلترة ليس مصاغ بشكل صحيح';
  SExprNothing = 'لا شيء';
  SExprTypeMis = 'النمط غير مطابق في التعبير المستخدم';
  SExprBadScope = 'Operation cannot mix aggregate value with record-varying value';
  SExprNoArith = 'القيام بالحسابات الرياضية في تعبير الفلترة غير مسموحة';
  SExprNotAgg = 'Expression is not an aggregate expression';
  SExprBadConst = 'الثابت ليس من نمط مناسب : %s';
  SExprNoAggFilter = 'عبارات التجميع غير مسموحة بالفلاتر';
  SExprEmptyInList = 'IN predicate list may not be empty';
  SInvalidKeywordUse = 'استخدام خاطئ لكلمة مفتاحية';
  STextFalse = 'لا';
  STextTrue = 'نعم';
  SParameterNotFound = 'البارامتر ''%s'' غير موجود';
  SInvalidVersion = 'غير قادر على تحميل متغير الربط bind parameters';
  SParamTooBig = 'البارامتر ''%s'', لايستطيع حفظ بيانات أكبر من  %d بايت';
  SBadFieldType = 'حقل ''%s'' من نمط غير مدعوم';
  SAggActive = 'لايمكن تعديل الخاصية عندما يكون التجميع فعال';
  SProviderSQLNotSupported = 'تعابير إس كيو إل غير مدعومة';
  SProviderExecuteNotSupported = 'التنفيذ غير مدعوم';
  SExprNoAggOnCalcs = 'الحقل ''%s'' ليس النمط الصحيح للحقول الحسابية الذي يستخدم في التجميع aggregate,استخدم internalcalc';
  SRecordChanged = 'لم يتم العثور على السجل , ربما تم تعديله من مستخدم آخر';
  SDataSetUnidirectional = 'العملية غير مسموحة على جدول بيانات من نمط غير اتجاهي';
  SUnassignedVar = 'قيمة غير مهيأة من نوع variant';
  SRecordNotFound = 'لم يتم العثور على السجل';
  SFileNameBlank = 'خاصية اسم الملف لايجب ان تكون فارغة';
  SFieldNameTooLarge = 'الحقل %s تخطى عدد محارف %d ';

{ For FMTBcd }

  SBcdOverflow = 'BCD overflow';
  SInvalidBcdValue = '%s ليست قيمة ترقيم عشري ثنائي صالحة';
  SInvalidFormatType = 'نمط التنسيق غير صالح للترقيم العشري الثنائي BCD';

{ For SqlTimSt }

  SCouldNotParseTimeStamp = 'لا يمكن التعمل مع التاريخ ضمن الاستعلام';
  SInvalidSqlTimeStamp = 'قيمة التاريخ والوقت المستخدمة في الاستعلام غير صالحة';
  SCalendarTimeCannotBeRepresented = 'لايمكن تمثيل وعرض التوقيت في التقويم (الروزنامه)';

  SDeleteRecordQuestion = 'هل تريد تأكيد حذف السجل ؟';
  SDeleteMultipleRecordsQuestion = 'هل تريد حذف جميع السجلات المحددة؟';
  STooManyColumns = 'يطلب من الشبكة ان تعرض أكثر من 256 عمود';

  { For reconcile error }
  SSkip = 'تخطي';
  SAbort = 'إحباط';
  SMerge = 'دمج';
  SCorrect = 'تصحيح';
  SCancel  = 'إلغاء';
  SRefresh = 'تحديث';
  SModified = 'تم تعديله';
  SInserted = 'تم إضافته';
  SDeleted  = 'تم حذفه';
  SCaption = 'خطأ في التحديث - %s';
  SUnchanged = '<لم يعدل>';  
  SBinary = '(ثنائي)';                              
  SAdt = '(مغلف)';   
  SArray = '(مصفوفة)'; 
  SFieldName = 'اسم الحقل'; 
  SOriginal = 'القيمة الأصلية'; 
  SConflict = 'القيمة المتضاربة';  
  SValue = ' قيمة';   
  SNoData = '<لاسجلات>';
  SNew = 'جديد';    

implementation

end.
