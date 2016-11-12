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
  SInvalidFieldSize = 'ÍÌã ÇáÍŞá ÛíÑ ÕÍíÍ';
  SInvalidFieldKind = 'äãØ ÇáÍŞá ÛíÑ ÕÍíÍ';
  SInvalidFieldRegistration = 'ÊÓÌíá ÇáÍŞá ÛíÑ ÕÍíÍ';
  SUnknownFieldType = 'ÍŞá ''%s'' ãä äãØ ÛíÑ ãÚÑæİ';
  SFieldNameMissing = 'ÇÓã ÇáÍŞá ÛíÑ ãÖÈæØ';
  SDuplicateFieldName = 'ÇÓã ÇáÍŞá ''%s'' ãßÑÑ';
  SFieldNotFound = 'áã íÊã ÇáÚËæÑ Úáì ÇáÍŞá : ''%s''';
  SFieldAccessError = 'áÇíãßä ÇáæÕæá ááÍŞá ''%s'' ßäãØ %s';
  SFieldValueError = 'ŞíãÉ ÛíÑ ÕÇáÍÉ áÍŞá  ''%s''';
  SFieldRangeError = '%g áíÓÊ ŞíãÉ ÕÇáÍÉ áÍŞá ''%s''. ÇáãÌÇá ÇáãÓãæÍ åæ ãä %g Åáì %g';
  SBcdFieldRangeError = '%s áíÓÊ ŞíãÉ ÕÇáÍÉ áÍŞá ''%s''. ÇáãÌÇá ÇáãÓãæÍ åæ ãä %s Åáì %s';
  SInvalidIntegerValue = '''%s'' áíÓÊ ŞíãÉ ÚÏÏ ÕÍíÍ (ÈáÇ İÇÕáÉ) ááÍŞá ''%s''';
  SInvalidBoolValue = '''%s'' áíÓÊ ŞíãÉ ÈæáíÇäíÉ ÕÍíÍÉ ááÍŞá ''%s''';
  SInvalidFloatValue = '''%s'' áíÓÊ ŞíãÉ ÚÏÏ ÍŞíŞí (İÇÕáÉ ÚÇÆãÉ) ááÍŞá ''%s''';
  SFieldTypeMismatch = 'ÇáäãØ ÛíÑ ãØÇÈŞ ááÍŞá ''%s'', ÇáãÊæŞÚ: %s ÇáãØÈŞ: %s';
  SFieldSizeMismatch = 'ÇáÓÚÉ Ãæ ÇáÍÌã ÛíÑ ãØÇÈŞÉ ááÍŞá ''%s'', ÇáãÊæŞÚ: %d ÇáãØÈŞ: %d';
  SInvalidVarByteArray = 'äãØ Ãæ ÍÌã ÛíÑ ÕÇáÍ ááÍŞá ''%s''';
  SFieldOutOfRange = 'ŞíãÉ ÍŞá ''%s'' ÎÇÑÌ ÇáãÌÇá ÇáãÓãæÍ';
//  SBCDOverflow = '(Overflow)';
  SCantAdjustPrecision = 'ÎØÃ İí ÖÈØ ÏŞÉ ÇáÊÑŞíã ÇáÚÔÑí ÇáËäÇÆí BCD precision';
  SFieldRequired = 'ÍŞá ''%s'' íÌÈ Ãä íÍæí ŞíãÉ';
  SDataSetMissing = 'ÍŞá ''%s'' áíÓ áå ŞÇÚÏÉ ÏÇÊÇÓíÊ';
  SInvalidCalcType = 'ÍŞá ''%s'' áÇíãßäå Ãä íßæä ãä äãØ ÍÓÇÈí Ãæ ÈÍË (áæß ÃÈ)';
  SFieldReadOnly = 'ÍŞá ''%s'' ÛíÑ ŞÇÈá ááÊÚÏíá';
  SFieldIndexError = 'ÑŞã ÇáÍŞá ÎÇÑÌ ÇáãÌÇá ÇáãÓãæÍ';
  SNoFieldIndexes = 'áÇíæÌÏ ÑŞã ÍŞá äÔØ ÍÇáíÇğ';
  SNotIndexField = 'ÍŞá ''%s'' áíÓ ãİåÑÓ æáÇíãßä ÊÚÏíáå';
  SIndexFieldMissing = 'áÇíãßä ÇáæÕæá ááÍŞá ÇáãİåÑÓ ''%s''';
  SDuplicateIndexName = 'ÇÓã İåÑÓ ãßÑÑ : ''%s''';
  SNoIndexForFields = 'áÇİåÑÓ ááÍŞæá : ''%s''';
  SIndexNotFound = 'ÇáİåÑÓ ''%s'' ÛíÑ ãæÌæÏ';
  SDBDuplicateName = 'ÇÓã ''%s'' ãßÑÑ İí %s';
  SCircularDataLink = 'æÕáÇÊ ÇáÈíÇäÇÊ ÊÓÊÏÚí ÈÚÖåÇ ÈÔßá ÏÇÆÑí (ßá ãäåÇ íÓÊÏÚí ÇáÂÎÑ) æåĞÇ ÛíÑ ãÓãæÍ';
  SLookupInfoError = 'ãÚáæãÇÊ ÇáÈÍË Lookup ááÍŞá ''%s'' ÛíÑ ãßÊãáÉ';
  SNewLookupFieldCaption = 'ÍŞá ÈÍË Lookup ÌÏíÏ';
  SDataSourceChange = 'áÇíãßä ÊÛííÑ ãäÈÚ ÇáÈíÇäÇÊ DataSource';
  SNoNestedMasterSource = 'Nested datasets cannot have a MasterSource';
  SDataSetOpen = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ÏÇÊÇÓíÊ ãİÊæÍÉ';
  SNotEditing = 'ÇáÈíÇäÇÊ áíÓÊ İí æÖÚ ÇáÅÏÎÇá Ãæ ÇáÊÚÏíá';
  SDataSetClosed = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ŞÇÚÏÉ ÈíÇäÇÊ ãÛáŞÉ';
  SDataSetEmpty = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ÌÏæá ÈíÇäÇÊ İÇÑÛ';
  SDataSetReadOnly = 'áÇíãßä ÊÚÏíá ÌÏæá ÈíÇäÇÊ ãÎÕÕ ááŞÑÇÁÉ İŞØ';
  SNestedDataSetClass = 'Nested dataset must inherit from %s';
  SExprTermination = 'ÊÚÈíÑ ÇáİáÊÑÉ ÇäÊåì ÈÔßá ÛíÑ ãäÇÓÈ';
  SExprNameError = 'ÇÓã ÇáÍŞá ÛíÑ ãäÊåí Unterminated';
  SExprStringError = 'ËÇÈÊ äÕí ÛíÑ ãäÊåí Unterminated';
  SExprInvalidChar = 'Êã ÇÓÊÎÏÇã ãÍÑİ ÛíÑ ãäÇÓÈ İí ÊÚÈíÑ ÇáİáÊÑÉ : ''%s''';
  SExprNoLParen = '''('' ãÊæŞÚå , áßä %s æÌÏÊ';
  SExprNoRParen = ''')'' ãÊæŞÚÉ , áßä %s æÌÏÊ';
  SExprNoRParenOrComma = ''')'' Ãæ '','' ßÇäÊ ãÊæŞÚå æáßä %s æÌÏÊ';
  SExprExpected = 'ÊÚÈíÑ ãÊæŞÚ æÈÏáÇ ãäå æÌÏ %s ';
  SExprBadField = 'ÇáÍŞá ''%s'' áÇíãßä ÇÓÊÎÏÇãå İí ÊÚÈíÑ ÇáİáÊÑÉ';
  SExprBadNullTest = 'ÇáŞíãÉ ÇáÎÇáíÉ NULL ãÓãæÍÉ İŞØ ãÚ ''='' æ ''<>''';
  SExprRangeError = 'ÇáËÇÈÊ ÇáããÑ ÎÇÑÌ ÇáãÌÇá ÇáãÓãæÍ';
  SExprNotBoolean = 'ÍŞá ''%s'' áíÓ ãä äãØ ÈæáíÇäí';
  SExprIncorrect = 'ÊÚÈíÑ ÇáİáÊÑÉ áíÓ ãÕÇÛ ÈÔßá ÕÍíÍ';
  SExprNothing = 'áÇ ÔíÁ';
  SExprTypeMis = 'ÇáäãØ ÛíÑ ãØÇÈŞ İí ÇáÊÚÈíÑ ÇáãÓÊÎÏã';
  SExprBadScope = 'Operation cannot mix aggregate value with record-varying value';
  SExprNoArith = 'ÇáŞíÇã ÈÇáÍÓÇÈÇÊ ÇáÑíÇÖíÉ İí ÊÚÈíÑ ÇáİáÊÑÉ ÛíÑ ãÓãæÍÉ';
  SExprNotAgg = 'Expression is not an aggregate expression';
  SExprBadConst = 'ÇáËÇÈÊ áíÓ ãä äãØ ãäÇÓÈ : %s';
  SExprNoAggFilter = 'ÚÈÇÑÇÊ ÇáÊÌãíÚ ÛíÑ ãÓãæÍÉ ÈÇáİáÇÊÑ';
  SExprEmptyInList = 'IN predicate list may not be empty';
  SInvalidKeywordUse = 'ÇÓÊÎÏÇã ÎÇØÆ áßáãÉ ãİÊÇÍíÉ';
  STextFalse = 'áÇ';
  STextTrue = 'äÚã';
  SParameterNotFound = 'ÇáÈÇÑÇãÊÑ ''%s'' ÛíÑ ãæÌæÏ';
  SInvalidVersion = 'ÛíÑ ŞÇÏÑ Úáì ÊÍãíá ãÊÛíÑ ÇáÑÈØ bind parameters';
  SParamTooBig = 'ÇáÈÇÑÇãÊÑ ''%s'', áÇíÓÊØíÚ ÍİÙ ÈíÇäÇÊ ÃßÈÑ ãä  %d ÈÇíÊ';
  SBadFieldType = 'ÍŞá ''%s'' ãä äãØ ÛíÑ ãÏÚæã';
  SAggActive = 'áÇíãßä ÊÚÏíá ÇáÎÇÕíÉ ÚäÏãÇ íßæä ÇáÊÌãíÚ İÚÇá';
  SProviderSQLNotSupported = 'ÊÚÇÈíÑ ÅÓ ßíæ Åá ÛíÑ ãÏÚæãÉ';
  SProviderExecuteNotSupported = 'ÇáÊäİíĞ ÛíÑ ãÏÚæã';
  SExprNoAggOnCalcs = 'ÇáÍŞá ''%s'' áíÓ ÇáäãØ ÇáÕÍíÍ ááÍŞæá ÇáÍÓÇÈíÉ ÇáĞí íÓÊÎÏã İí ÇáÊÌãíÚ aggregate,ÇÓÊÎÏã internalcalc';
  SRecordChanged = 'áã íÊã ÇáÚËæÑ Úáì ÇáÓÌá , ÑÈãÇ Êã ÊÚÏíáå ãä ãÓÊÎÏã ÂÎÑ';
  SDataSetUnidirectional = 'ÇáÚãáíÉ ÛíÑ ãÓãæÍÉ Úáì ÌÏæá ÈíÇäÇÊ ãä äãØ ÛíÑ ÇÊÌÇåí';
  SUnassignedVar = 'ŞíãÉ ÛíÑ ãåíÃÉ ãä äæÚ variant';
  SRecordNotFound = 'áã íÊã ÇáÚËæÑ Úáì ÇáÓÌá';
  SFileNameBlank = 'ÎÇÕíÉ ÇÓã Çáãáİ áÇíÌÈ Çä Êßæä İÇÑÛÉ';
  SFieldNameTooLarge = 'ÇáÍŞá %s ÊÎØì ÚÏÏ ãÍÇÑİ %d ';

{ For FMTBcd }

  SBcdOverflow = 'BCD overflow';
  SInvalidBcdValue = '%s áíÓÊ ŞíãÉ ÊÑŞíã ÚÔÑí ËäÇÆí ÕÇáÍÉ';
  SInvalidFormatType = 'äãØ ÇáÊäÓíŞ ÛíÑ ÕÇáÍ ááÊÑŞíã ÇáÚÔÑí ÇáËäÇÆí BCD';

{ For SqlTimSt }

  SCouldNotParseTimeStamp = 'áÇ íãßä ÇáÊÚãá ãÚ ÇáÊÇÑíÎ Öãä ÇáÇÓÊÚáÇã';
  SInvalidSqlTimeStamp = 'ŞíãÉ ÇáÊÇÑíÎ æÇáæŞÊ ÇáãÓÊÎÏãÉ İí ÇáÇÓÊÚáÇã ÛíÑ ÕÇáÍÉ';
  SCalendarTimeCannotBeRepresented = 'áÇíãßä ÊãËíá æÚÑÖ ÇáÊæŞíÊ İí ÇáÊŞæíã (ÇáÑæÒäÇãå)';

  SDeleteRecordQuestion = 'åá ÊÑíÏ ÊÃßíÏ ÍĞİ ÇáÓÌá ¿';
  SDeleteMultipleRecordsQuestion = 'åá ÊÑíÏ ÍĞİ ÌãíÚ ÇáÓÌáÇÊ ÇáãÍÏÏÉ¿';
  STooManyColumns = 'íØáÈ ãä ÇáÔÈßÉ Çä ÊÚÑÖ ÃßËÑ ãä 256 ÚãæÏ';

  { For reconcile error }
  SSkip = 'ÊÎØí';
  SAbort = 'ÅÍÈÇØ';
  SMerge = 'ÏãÌ';
  SCorrect = 'ÊÕÍíÍ';
  SCancel  = 'ÅáÛÇÁ';
  SRefresh = 'ÊÍÏíË';
  SModified = 'Êã ÊÚÏíáå';
  SInserted = 'Êã ÅÖÇİÊå';
  SDeleted  = 'Êã ÍĞİå';
  SCaption = 'ÎØÃ İí ÇáÊÍÏíË - %s';
  SUnchanged = '<áã íÚÏá>';  
  SBinary = '(ËäÇÆí)';                              
  SAdt = '(ãÛáİ)';   
  SArray = '(ãÕİæİÉ)'; 
  SFieldName = 'ÇÓã ÇáÍŞá'; 
  SOriginal = 'ÇáŞíãÉ ÇáÃÕáíÉ'; 
  SConflict = 'ÇáŞíãÉ ÇáãÊÖÇÑÈÉ';  
  SValue = ' ŞíãÉ';   
  SNoData = '<áÇÓÌáÇÊ>';
  SNew = 'ÌÏíÏ';    

implementation

end.
