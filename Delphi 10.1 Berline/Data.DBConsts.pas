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
  SCantAdjustPrecision = 'Error adjusting BCD precision';
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
  SCircularDataLink = 'Circular datalinks are not allowed';
  SLookupInfoError = 'Lookup information for field ''%s'' is incomplete';
  SNewLookupFieldCaption = 'New Lookup Field';
  SDataSourceChange = 'DataSource cannot be changed';
  SNoNestedMasterSource = 'Nested datasets cannot have a MasterSource';
  SDataSetOpen = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ÏÇÊÇÓíÊ ãİÊæÍÉ';
  SNotEditing = 'ÇáÈíÇäÇÊ áíÓÊ İí æÖÚ ÇáÅÏÎÇá Ãæ ÇáÊÚÏíá';
  SDataSetClosed = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ŞÇÚÏÉ ÈíÇäÇÊ ãÛáŞÉ';
  SDataSetEmpty = 'áÇíãßä ÇáŞíÇã ÈåĞå ÇáÚãáíÉ Úáì ÌÏæá ÈíÇäÇÊ İÇÑÛ';
  SDataSetReadOnly = 'áÇíãßä ÊÚÏíá ÌÏæá ÈíÇäÇÊ ãÎÕÕ ááŞÑÇÁÉ İŞØ';
  SNestedDataSetClass = 'Nested dataset must inherit from %s';
  SExprTermination = 'ÊÚÈíÑ ÇáİáÊÑÉ ÇäÊåì ÈÔßá ÛíÑ ãäÇÓÈ';
  SExprNameError = 'Unterminated field name';
  SExprStringError = 'Unterminated string constant';
  SExprInvalidChar = 'Êã ÇÓÊÎÏÇã ãÍÑİ ÛíÑ ãäÇÓÈ İí ÊÚÈíÑ ÇáİáÊÑÉ : ''%s''';
  SExprNoLParen = '''('' ãÊæŞÚå , áßä %s æÌÏÊ';
  SExprNoRParen = ''')'' ãÊæŞÚÉ , áßä %s æÌÏÊ';
  SExprNoRParenOrComma = ''')'' Ãæ '','' ßÇäÊ ãÊæŞÚå æáßä %s æÌÏÊ';
  SExprExpected = 'Expression expected but %s found';
  SExprBadField = 'ÇáÍŞá ''%s'' áÇíãßä ÇÓÊÎÏÇãå İí ÊÚÈíÑ ÇáİáÊÑÉ';
  SExprBadNullTest = 'NULL only allowed with ''='' and ''<>''';
  SExprRangeError = 'ÇáËÇÈÊ ÇáããÑ ÎÇÑÌ ÇáãÌÇá ÇáãÓãæÍ';
  SExprNotBoolean = 'ÍŞá ''%s'' áíÓ ãä äãØ ÈæáíÇäí';
  SExprIncorrect = 'ÊÚÈíÑ ÇáİáÊÑÉ áíÓ ãÕÇÛ ÈÔßá ÕÍíÍ';
  SExprNothing = 'áÇ ÔíÁ';
  SExprTypeMis = 'ÇáäãØ ÛíÑ ãØÇÈŞ İí ÇáÊÚÈíÑ ÇáãÓÊÎÏã';
  SExprBadScope = 'Operation cannot mix aggregate value with record-varying value';
  SExprNoArith = 'ÇáŞíÇã ÈÇáÍÓÇÈÇÊ ÇáÑíÇÖíÉ İí ÊÚÈíÑ ÇáİáÊÑÉ ÛíÑ ãÓãæÍÉ';
  SExprNotAgg = 'Expression is not an aggregate expression';
  SExprBadConst = 'ÇáËÇÈÊ áíÓ ãä äãØ ãäÇÓÈ : %s';
  SExprNoAggFilter = 'Aggregate expressions not allowed in filters';
  SExprEmptyInList = 'IN predicate list may not be empty';
  SInvalidKeywordUse = 'ÇÓÊÎÏÇã ÎÇØÆ áßáãÉ ãİÊÇÍíÉ';
  STextFalse = 'ÎØÃ';
  STextTrue = 'ÕÍ';
  SParameterNotFound = 'ÇáÈÇÑÇãÊÑ ''%s'' ÛíÑ ãæÌæÏ';
  SInvalidVersion = 'Unable to load bind parameters';
  SParamTooBig = 'ÇáÈÇÑÇãÊÑ ''%s'', áÇíÓÊØíÚ ÍİÙ ÈíÇäÇÊ ÃßÈÑ ãä  %d ÈÇíÊ';
  SBadFieldType = 'ÍŞá ''%s'' ãä äãØ ÛíÑ ãÏÚæã';
  SAggActive = 'áÇíãßä ÊÚÏíá ÇáÎÇÕíÉ ÚäÏãÇ íßæä ÇáÊÌãíÚ İÚÇá';
  SProviderSQLNotSupported = 'ÊÚÇÈíÑ ÅÓ ßíæ Åá ÛíÑ ãÏÚæãÉ';
  SProviderExecuteNotSupported = 'ÇáÊäİíĞ ÛíÑ ãÏÚæã';
  SExprNoAggOnCalcs = 'Field ''%s'' is not the correct type of calculated field to be used in an aggregate, use an internalcalc';
  SRecordChanged = 'áã íÊã ÇáÚËæÑ Úáì ÇáÓÌá , ÑÈãÇ Êã ÊÚÏíáå ãä ãÓÊÎÏã ÂÎÑ';
  SDataSetUnidirectional = 'ÇáÚãáíÉ ÛíÑ ãÓãæÍÉ Úáì ÌÏæá ÈíÇäÇÊ ãä äãØ ÛíÑ ÇÊÌÇåí';
  SUnassignedVar = 'Unassigned variant value';
  SRecordNotFound = 'áã íÊã ÇáÚËæÑ Úáì ÇáÓÌá';
  SFileNameBlank = 'ÎÇÕíÉ ÇÓã Çáãáİ áÇíÌÈ Çä Êßæä İÇÑÛÉ';
  SFieldNameTooLarge = 'ÇáÍŞá %s ÊÎØì ÚÏÏ ãÍÇÑİ %d ';

{ For FMTBcd }

  SBcdOverflow = 'BCD overflow';
  SInvalidBcdValue = '%s is not a valid BCD value';
  SInvalidFormatType = 'Invalid format type for BCD';

{ For SqlTimSt }

  SCouldNotParseTimeStamp = 'áÇ íãßä ÇáÊÚãá ãÚ ÇáÊÇÑíÎ Öãä ÇáÇÓÊÚáÇã';
  SInvalidSqlTimeStamp = 'ŞíãÉ ÇáÊÇÑíÎ æÇáæŞÊ ÇáãÓÊÎÏãÉ İí ÇáÇÓÊÚáÇã ÛíÑ ÕÇáÍÉ';
  SCalendarTimeCannotBeRepresented = 'Calendar time cannot be represented';

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
  SAdt = '(ADT)';   
  SArray = '(ãÕİæİÉ)'; 
  SFieldName = 'ÇÓã ÇáÍŞá'; 
  SOriginal = 'ÇáŞíãÉ ÇáÃÕáíÉ'; 
  SConflict = 'ÇáŞíãÉ ÇáãÊÖÇÑÈÉ';  
  SValue = ' ŞíãÉ';   
  SNoData = '<áÇÓÌáÇÊ>';
  SNew = 'ÌÏíÏ';    

implementation

end.
