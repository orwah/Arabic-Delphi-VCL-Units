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
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 1995-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

unit System.RTLConsts;

interface

resourcestring
  SAncestorNotFound = 'ÇáÓáİ ÇáÃÚáì áÜ ''%s'' áã íÊã ÇáÚËæÑ Úáíå';
  SAssignError = 'áÇíãßä äÓÈ  %s Åáì a %s';
  SBitsIndexError = 'İåÑÓ ÇáŞíã ÇáËäÇÆíÉ ÎÇÑÌ ÇáÍÏæÏ ÇáãÓãæÍÉ';
  SBucketListLocked = 'ÇáŞÇÆãÉ ãŞİáÉ ÎáÇá ÍáŞÉ ForEach İÚÇáÉ';
  SCantWriteResourceStreamError = 'áÇíãßä ÇáßÊÇÈÉ Åáì ãÓáß resource stream ÎÇÕ ÈÇáŞÑÇÁÉ İŞØ';
  SCharExpected = '''''%s'''' ãÊæŞÚÉ';
  SCheckSynchronizeError = 'CheckSynchronize Êã ÇÓÊÏÚÇÆå ãä ÇáãÓáß thread $%x, æåæ áíÓ ÇáãÓáß ÇáÑÆíÓí';
  SClassNotFound = 'ÇáÕäİ %s áã íÊã ÇáÚËæÑ Úáíå';
  SDelimiterQuoteCharError = 'ÇáÎÇÕíÊÇä Delimiter æ QuoteChar áÇíÌÈ Ãä íãÊáßÇ äİÓ ÇáŞíãÉ';
  SDuplicateClass = 'Õäİ ÈÇáÇÓã %s ãæÌæÏ ãÓÈŞÇ';
  SDuplicateItem = 'ÇááÇÆÍÉ áÇÊÓãÍ ÈÇáŞíã ÇáãßÑÑÉ ($0%x)';
  SDuplicateName = 'ãßæä ÈåĞÇ ÇáÇÓã %s ãæÌæÏ ãÓÈŞÇ';
  SDuplicateString = 'ÇááÇÆÍÉ ÇáäÕíÉ áÇÊÓãÍ ÈÇáŞíã ÇáãßÑÑÉ';
  SFCreateError = 'áÇíãßä ÅäÔÇÁ Çáãáİ %s';
  SFCreateErrorEx = 'áÇíãßä ÅäÔÇÁ Çáãáİ "%s". %s';
  SFixedColTooBig = 'ÚÏÏ ÇáÍŞæá ÇáËÇÈÊ íÌÈ Ãä íßæä ÃŞá ãä ÇáÚÏÏ Çáßáí ááÍŞæá ';
  SFixedRowTooBig = 'ÚÏÏ ÇáÓØæÑ ÇáËÇÈÊå íÌÈ Ãä íßæä ÃŞá ãä ÇáÚÏÏ Çáßáí ááÓØæÑ';
  SFOpenError = 'áÇíãßä İÊÍ Çáãáİ %s';
  SFOpenErrorEx = 'áÇíãßä İÊÍ Çáãáİ "%s". %s';
  SGridTooLarge = 'ÇáÔÈßÉ ßÈíÑÉ ÌÏÇ áåĞå ÇáÚãáíÉ';
  SIdentifierExpected = 'ãä ÇáãÊæŞÚ æÌæÏ ãÚÑİ';
  SIndexOutOfRange = 'İåÑÓ ÇáÔÈßÉ ÎÇÑÌ ÇáãÌÇá ÇáãÓãæÍ';
  SIniFileWriteError = 'áÇíãßä ÇáßÊÇÈÉ Åáì %s';

  SInvalidActionCreation = 'İÔá İí ÅäÔÇÁ ÇáÍÏË';
  SInvalidActionEnumeration = 'ÓÑÏ ÇáÍÏË ÛíÑ ÕÇáÍ';
  SInvalidActionRegistration = 'ÊÍÏíË ÇáÍÏË ÛíÑ ÕÇáÍ ';
  SInvalidActionUnregistration = 'ÅáÛÇÁ ÊÓÌíá ÇáÍÏË ÛíÑ ÕÇáÍ';
  StrNoClientClass = 'ÇáÒÈæä áÇíãßä Ãä íßæä ãä ÇáÕäİ %s';
  StrEActionNoSuported = 'ÇáÕäİ %s áÇíÏÚã åĞÇ ÇáÍÏË';

  SInvalidBinary = 'ŞíãÉ ËäÇÆíÉ ÛíÑ ÕÇáÍÉ';
  SInvalidFileName = 'ÇÓã Çáãáİ ÛíÑ ÕÇáÍ : - %s';
  SInvalidImage = 'ÊäÓíŞ ÛíÑ ÕÇáÍ';
  SInvalidMask = '''%s'' åæ ŞäÇÚ ÛíÑ ÕÇáå ãä ÃÌá (%d)';
  SInvalidName = '''''%s'''' ÇÓã ãßæä ÛíÑ ÕÇáÍ';
  SInvalidProperty = 'ŞíãÉ ÇáÎÇÕíÉ ÛíÑ ÕÇáÍÉ';
  SInvalidPropertyElement = 'ÚäÕÑ ÎÇÕíÉ ÛíÑ ÕÇáÍ: %s';
  SInvalidPropertyPath = 'ãÓÇÑ ÎÇÕíÉ ÛíÑ ÕÇáÍ';
  SInvalidPropertyType = 'äãØ ÎÇÕíÉ ÛíÑ ÕÇáÍ: %s';
  SInvalidPropertyValue = 'ŞíãÉ ÇáÎÇÕíÉ ÛíÑ ÕÇáÍÉ';
  SInvalidRegType = 'äãØ ãÚØíÇÊ ÛíÑ ÕÇáÍ ãä ÃÌá ''%s''';
  SInvalidString = 'ËÇÈÊ äÕí ÛíÑ ÕÇáÍ';
  SInvalidStringGridOp = 'áÇ íãßä ÅÖÇİÉ Ãæ ÍĞİ Õİæİ ãä ÇáÔÈßÉ';
  SItemNotFound = 'áÇíãßä ÇáÚËæÑ Úáì ÇáÚäÕÑ  ($0%x)';
  SLineTooLong = 'ÓØÑ Øæíá ÌÏÇ';
  SListCapacityError = 'ÓÚÉ ÇááÇÆÍÉ ÎÇÑÌ ÇáÍÏæÏ ÇáããßäÉ (%d)';
  SListCountError = 'ÊÚÏÇÏ ÇááÇÆÍÉ ÎÇÑÌ ÇáÍÏæÏ ÇáããßäÉ (%d)';
  SListIndexError = 'Ïáíá ÇááÇÆÍÉ ÎÇÑÌ ÇáÍÏæÏ ÇáããßäÉ (%d)';
  SMaskErr = 'ŞíãÉ ÇáÅÏÎÇá ÛíÑ ÕÍíÍÉ';
  SMaskEditErr = 'ŞíãÉ ÅÏÎÇá ÛíÑ ÕÍíÍÉ , ÇÓÊÎÏã ÒÑ ÇáÅáÛÇÁ ááÊÑÇÌÚ Úä ÇáÊÛíÑÇÊ';
  SMemoryBufferOverrun = 'Êã ÊÌÇæÒ ÇáĞÇßÑÉ ÇáæÓíØíÉ ÇáãÎÕÕÉ (ÇáÈİÑ)';
  SMemoryStreamError = 'Êã ÊÌÇæÒ ÇáĞÇßÑÉ ÎáÇá  ÚãáíÉ ÊæÓíÚ ãÓáß ãä äæÚ memory stream';
  SNoComSupport = '%s áã íÊã ÊÓÌíáÉ ßÕäİ ãä äæÚ  COM ';
  SNotPrinting = 'ÇáØÇÈÚÉ áÇÊŞæã ÈÇáØÈÇÚÉ ÍÇáíÇ';
  SNumberExpected = 'ŞíãÉ ÑŞãíÉ ãÊæŞÚÉ';
  SAnsiUTF8Expected = 'ßæÏ ANSI Ãæ UTF8 ãÊæŞÚ';
  SParseError = '%s İí ÇáÓØÑ %d';
  SComponentNameTooLong = 'Çáãßæä ''%s'' íÊæŞÚ ÍÏæÏ 64 ãÍÑİ';
  SPropertyException = 'ÎØÃ İí ŞÑÇÁÉ %s%s%s: %s';
  SPrinting = 'ÌÇÑí ÇáØÈÇÚÉ';
  SReadError = 'ÎØÃ İí ŞÑÇÁÉ ÇáãÓáß';
  SReadOnlyProperty = 'ÇáÎÇÕíÉ ááŞÑÇÁÉ İŞØ';
  SRegCreateFailed = 'İÔá ÅäÔÇÁ ÇáãİÊÇÍ %s';
  SRegGetDataFailed = 'İÔá ÇÓÊÍÕÇá ÈíÇäÇÊ ''%s''';
  SRegisterError = 'ÊÓÌíá ãßæä ÛíÑ ÕÇáÍ';
  SRegSetDataFailed = 'İÔá ÖÈØ ÈíÇäÇÊ ''%s''';
  SResNotFound = 'ÇáãæÑÏ %s áã íÊã ÇáÚËæÑ Úáíå';
  SSeekNotImplemented = 'ÇáØáÈ %s .áã íÏÎá ÍíÒ ÇáÊäİíĞ';
  SSortedListError = 'ÇáÚãáíÉ ÛíÑ ãÓãæÍÉ Úáì áÇÆÍÉ ãÑÊÈÉ';
  SStringExpected = 'ŞíãÉ äÕíÉ ãÊæŞÚÉ';
  SSymbolExpected = '%s ãÊæŞÚ';
  STooManyDeleted = 'Êã ÍĞİ Õİæİ Ãæ ÃÚãÏÉ ÃßËÑ ãä ÇáãÊæŞÚ';
  SUnknownGroup = '%s áíÓÊ İí ãÌãæÚÉ ÊÓÌíá Õäİ';
  SUnknownProperty = 'ÇáÎÇÕíÉ %s ÛíÑ ãæÌæÏÉ';
  SWriteError = 'ÎØÃ ßÊÇÈÉ İí ÇáãÓáß';
  SStreamSetSize = 'ÎØÃ İí ÊÍÏíÏ ÍÌã ÇáãÓáß';
  SThreadCreateError = 'ÎØÃ İí ÅäÔÇÁ ÇáãÓáß: %s';
  SThreadError = 'ÎØÃ İí ÇáãÓáß : %s (%d)';
  SThreadExternalTerminate = 'áÇíãßä ÅäåÇÁ ãÓáß Êã ÅäÔÇÄÉ ÎÇÑÌíÇ';
  SThreadExternalWait = 'áÇíãßä ÇäÊÙÇÑ ãÓáß Êã ÅäÔÇÄÉ ÎÇÑÌíÇ';
  SThreadStartError = 'áÇíãßä ÇÓÊÏÚÇÁ æÈÏÁ ãÓáß İí ÍÇáÉ ÇáÊäİíĞ Ãæ ÇáÅíŞÇİ';
  SThreadExternalCheckTerminated = 'áÇíãßä ÇÓÊÏÚÇÁ CheckTerminated áãÓáß Êã ÅäÔÇÄÉ ÎÇÑÌíÇ';
  SThreadExternalSetReturnValue = 'áÇíãßä ÇÓÊÏÚÇÁ SetReturnValue áãÓáß Êã ÅäÔÇÄÉ ÎÇÑÌíÇ';

  SParamIsNil = 'ÇáãÊÛíÑ %s áÇíãßä Ãä Êßæä ŞíãÊå ÎÇáíÉ nil';
  SParamIsNegative = 'ÇáãÊÛíÑ %s áÇíãßä Ãä Êßæä ŞíãÊå ÓÇáÈÉ';
  SInputBufferExceed = 'Êã ÊÌÇæÒ ŞíãÉ ÇáãÎÒä ÇáãÄŞÊ ááÅÏÎÇá Input Buffer %s = %d, %s = %d';

  SInvalidCharsInPath = 'ÇáãÓÇÑ íÍæí ãÍÇÑİ ÛíÑ ÕÇáÍÉ';
  SInvalidCharsInFileName = 'ÇÓã Çáãáİ íÍæí ãÍÇÑİ ÛíÑ ÕÇáÍÉ';
  SInvalidCharsInSearchPattern = 'ÃäãÇØ ÇáÈÍË ÊÍæí ãÍÇÑİ ÛíÑ ÕÇáÍÉ';
  SPathTooLong = 'ÇáãÓÇÑ ÇáãÍÏÏ Øæíá ÌÏÇ';
  SPathNotFound = 'ÇáãÓÇÑ ÇáãÍÏÏ ÛíÑ ãæÌæÏ';
  SPathFormatNotSupported = 'ÊäÓíŞ ÇáãÓÇÑ åĞÇ ÛíÑ ãÏÚæã';
  SDirectoryNotEmpty = 'ÇáãÌáÏ ÇáãÍÏÏ ÛíÑ İÇÑÛ';
  SDirectoryAlreadyExists = 'ÇáãÌáÏ ÇáãÍÏÏ ãæÌæÏ ãÓÈŞÇ';
  SDirectoryInvalid = 'ÇÓã ÇáãÌáÏ ÇáãÍÏÏ ÛíÑ ÕÇáÍ';
  SSourceDirIsDestDir = 'ÇáãÌáÏ ÇáåÏİ åæ äİÓ ÇáãÌáÏ ÇáãÕÏÑ';
  SSourceFileIsDestFile = 'Çáãáİ ÇáåÏİ åæ äİÓ ÇáãÌáÏ ÇáæÌåÉ';
  SPathToFileNeeded = 'ÇáãÓÇÑ íÌÈ Ãä íÍÏÏ ãáİ';
  SSameRootDrive = 'ãÓÇÑ ÇáåÏİ æÇáãÕÏÑ íÌÈ Ãä íßæäÇ İí äİÓ ÇáŞÑÕ';
  SDriveNotFound = 'ÇáŞÑÕ áÇíãßä ÇáÚËæÑ Úáíå';
  SFileNotFound = 'Çáãáİ ÇáãÍÏÏ áÇíãßä ÇáÚËæÑ Úáíå';
  SFileAlreadyExists = 'Çáãáİ ÇáãÍÏÏ ãæÌæÏ ãÓÈŞÇ';

  SInvalidDateDay = '(%d, %d) áíÓ ÒæÌ ÊÇÑíÎ æíæã ãÓãæÍ (DateDay) ';
  SInvalidDateWeek = '(%d, %d, %d) áíÓ ËáÇËí ÊÇÑíÎ æÇÓÈæÚ ãÓãæÍ (DateWeek)';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) áíÓ ÑÈÇÚí ÊÇÑíÎ ÔåÑ ÇÓÈæÚ ãÓãæÍ (DateMonthWeek)';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) áíÓ ÑÈÇÚí íæã ÇÓÈæÚ İí ÔåÑ ãÓãæÍ (DayOfWeekInMonth)';
  SInvalidJulianDate = '%f ÇáÊŞæíã ÇáíæáíæÓí áÇíãßä ÅÚÇÏÉ ÊãËíáÉ ãä äæÚ ÊÇÑíÎ';
  SMissingDateTimeField = '?';
  SMinimumDateError = 'ÇáÊæÇÑíÎ ŞÈá ÇáÓäÉ 1 ÛíÑ ãÓãæÍÉ';
  SLocalTimeInvalid = 'ÇáæŞÊ ÇáãÍáí ÇáãÚØì "%s" ÛíÑ ãÓãæÍ (ßÇÆä İí ÇáŞÊÑÉ ÇáãİŞæÏÉ ÚäÏ ÊŞÏíã ÇáÓÇÚÉ).';

  SConvIncompatibleTypes2 = 'ÃäãÇØ ÊÍæíá ÛíÑ ãßÊãáÉ [%s, %s]';
  SConvIncompatibleTypes3 = 'ÃäãÇØ ÊÍæíá ÛíÑ ãßÊãáÉ [%s, %s, %s]';
  SConvIncompatibleTypes4 = 'ÃäãÇØ ÊÍæíá ÛíÑ ãßÊãáÉ [%s - %s, %s - %s]';
  SConvUnknownType = 'äãØ ÊÍæíá ÛíÑ ãÚÑæİ %s';
  SConvDuplicateType = 'äãØ ÇáÊÍæíá (%s) ãÓÌá ãÓÈŞÇ İí %s';
  SConvUnknownFamily = 'ÚÇÆáÉ ÇáÊÍæíá ÛíÑ ãÚÑæİÉ %s';
  SConvDuplicateFamily = 'ÚÇÆáÉ ÇáÊÍæíá (%s) ãÓÌáÉ ãÓÈŞÇ';
  SConvUnknownDescription = '[$%.8x]' deprecated; // no longer used
  SConvUnknownDescriptionWithPrefix = '[%s%.8x]';
  SConvIllegalType = 'äãØ ÛíÑ ãÓãæÍ';
  SConvIllegalFamily = 'ÚÇÆáÉ ÛíÑ ãÓãæÍÉ';
  SConvFactorZero = '%s áÏíå ãÚÇãá ÕİÑí';
  SConvStrParseError = 'áÇíãßä ÊÍáíá %s';
  SFailedToCallConstructor = ' %s Õäİ ãäÍÏÑ ãä TStrings İÔá İí ÇÓÊÏÚÇÁ ÇáãäåÌ ÇáÈÇäí ÇáÃÈ';

  sWindowsSocketError = 'ÎØÃ İí ãŞÈÓ æäÏæÒ : %s (%d), İí Çá API ''%s''';
  sAsyncSocketError = 'ÎØÃ ãŞÈÓ áÇãÊÒÇãä %d';
  sNoAddress = 'áã íÊã ÊÍÏíÏ ÚäæÇä';
  sCannotListenOnOpen = 'áÇíãßä ÇáÇÓÊãÇÚ Çáì ãŞÈÓ ŞíÏ ÇáİÊÍ';
  sCannotCreateSocket = 'áÇíãßä ÅäÔÇÁ ãŞÈÓ ÌÏíÏ';
  sSocketAlreadyOpen = 'ÇáãŞÈÓ ãİÊæÍ ãÓÈŞÇ';
  sCantChangeWhileActive = 'áÇíãßä ÊÛííÑ ÇáŞíãÉ ÈíäãÇ íßæä ÇáãŞÈÓ İÚÇá';
  sSocketMustBeBlocking = 'ÇáãŞÈÓ íÌÈ Çä íßæä İí äãØ blocking mode';
  sSocketIOError = '%s ÎØÃ %d, %s';
  sSocketRead = 'ŞÑÇÁÉ';
  sSocketWrite = 'ßÊÇÈÉ';

  SCmplxCouldNotParseImaginary = 'áÇíãßä ÊÍáíá ÇáŞÓã ÇáÊÎíáí';
  SCmplxCouldNotParseSymbol = 'áÇíãßä ÊÍáíá ÇáÑãÒ ÇáãØáæÈ ''%s'' ';
  SCmplxCouldNotParsePlus = 'áÇíãßä ÊÍáíá ÇáÑãÒ ÇáãØáæÈ  ''+'' (Ãæ ''-'') ';
  SCmplxCouldNotParseReal = 'áÇíãßä ÊÍáíá ÇáŞÓã ÇáÍŞíŞí';
  SCmplxUnexpectedEOS = 'äåÇíÉ ÇáÓáÓáÉ ÇáäÕíÉ ÛíÑ ãÊæŞÚå [%s]';
  SCmplxUnexpectedChars = 'ãÍÇÑİ ÛíÑ ãÊæŞÚÉ';
  SCmplxErrorSuffix = '%s [%s<?>%s]';

  hNoSystem = 'áã íÊã ÊäÕíÈ ãÏíÑ ãáİÇÊ ÇáãÓÇÚÏÉ.';
  hNoTopics = 'áã íÊã ÊäÕíÈ ãÓÇÚÏÉ ÈäÇÁ Úáì ÇáãæÇÖíÚ.';
  hNoContext = 'áã íÊã ÊäÕíÈ ãÓÇÚÏÉ ÍÓÇÓÉ ááÓíÇŞ.';
  hNoContextFound = 'áã íÊã ÇáÚËæÑ Úáì ãÓÇÚÏÉ ááÓíÇŞ %d.';
  hNothingFound = 'áã íÊã ÇáÚËæÑ Úáì ãÓÇÚÏÉ áÜ "%s"';
  hNoTableOfContents = 'áã íÊã ÇáÚËæÑ Úáì ÌÏæá ÇáãÍÊæíÇÊ.';
  hNoFilterViewer = 'áÇíæÌÏ ãÓÊÚÑÖ ãÓÇÚÏÉ íÏÚã ÇáİáÊÑÉ';

  sArgumentInvalid = 'ãÚÇãá ÛíÑ ÕÇáÍ';
  sArgumentOutOfRange_InvalidHighSurrogate = 'A valid high surrogate character is >= $D800 and <= $DBFF';
  sArgumentOutOfRange_InvalidLowSurrogate = 'A valid low surrogate character is >= $DC00 and <= $DFFF';
  sArgumentOutOfRange_Index = 'ÇáİåÑÓ ÎÇÑÌ ÇáÍÏæÏ (%d).  íÌÈ Çä íßæä >= 0 æ < %d';
  sArgumentOutOfRange_StringIndex = 'ÇáİåÑÓ ÇáäÕí ÎÇÑÌ ÇáÍÏæÏ (%d).  íÌÈ Ãä íßæä >= %d æ <= %d';
  sArgumentOutOfRange_InvalidUTF32 = 'ŞíãÉ ãÍÇÑİ ÈÊÑãíÒ UTF32 ÛíÑ ÕÇáÍÉ.  íÌÈ Çä Êßæä >= 0 æ <= $10FFFF, ÈÇÓÊËäÇÁ surrogate pair ranges';
  sArgument_InvalidHighSurrogate = 'High surrogate char without a following low surrogate char at index: %d. Check that the string is encoded properly';
  sArgument_InvalidLowSurrogate = 'Low surrogate char without a preceding high surrogate char at index: %d. Check that the string is encoded properly';
  sArgumentOutOfRange_NeedNonNegValue = 'ÇáãÚÇãá, %s, íÌÈ Çä íßæä >= 0';
  sArgumentOutOfRange_OffLenInvalid = 'ÇáÅÒÇÍÉ æÇáØæá ÛíÑ ãÓãæÍÉ ááãÕİæİÉ ÇáãÚØÇÉ';

  sInvalidStringAndObjectArrays = 'Øæá ÇáÜ Strings æ ãÕİæİÉ ÇáÜ Objects íÌÈ Ãä íßæä ãÊØÇÈŞ';

  sSameArrays = 'ãÕİæİÉ ÇáãÕÏÑ æÇáæÌåÉ íÌÈ Ãä áÇíßæäÇ ãÊØÇÈŞÊíä';

  sNoConstruct = 'ÇáÕäİ %s áÇíÈÏæ Ãäå Êã ÊÔííÏå';

  sCannotCallAcquireOnConditionVar = 'Cannot call Acquire on TConditionVariable.  Must call WaitFor with an external TMutex';
  sInvalidTimeoutValue = 'ŞíãÉ ãåáÉ ÇáÇäÊåÇÁ ÛíÑ ÕÇáÍÉ : %s';
  sNamedSyncObjectsNotSupported = 'ÇáÃÛÑÇÖ ÇáãÊÒÇãäÉ ÇáãÓÇÉ ÛíÑ ãÏÚæãÉ İí åĞå ÇáãäÕÉ (ÇáäÙÇã)';

  sInvalidInitialSemaphoreCount = 'ÇáÊÚÏÇÏ ÇáÃæáí ÛíÑ ÕÇáÍ : %d';
  sInvalidMaxSemaphoreCount = 'ÇáÊÚÏÇÏ ÇáÃŞÕì ÛíÑ ÕÍíÍ: %d';
  sSemaphoreCanceled = 'Invalid operation. Semaphore canceled';
  sInvalidSemaphoreReleaseCount = 'Invalid semaphore release count: %d';
  sSemaphoreReachedMaxCount = 'Semaphore reached MaxCount';
  sErrorCreatingSemaphore = 'Error Creating Semaphore';

  sErrorCreatingEvent = 'ÎØÃ İí ÅäÔÇÁ ÇáÍÏË';

  sSpinCountOutOfRange = 'SpinCount ÎÇÑÌ ÇáãÏì , íÌÈ Ãä íßæä Èíä  0 æ %d';

  sCountdownEventCanceled = 'ÇáÚÏ ÇáÊäÇÒáí Êã ÅáÛÇÁÉ';
  sInvalidResetCount = 'ÊÚÏÇÏ ÅÚÇÏÉ ÇáÖÈØ ÛíÑ ÕÇáÍ: %d';
  sInvalidInitialCount = 'ÊÚÏÇÏ ÛíÑ ÕÇáÍ: %d';
  sInvalidDecrementCount = 'ÊÚÏÇÏ ÇáÒíÇÏÉ ÛíÑ ÕÇáÍ : %d';
  sInvalidIncrementCount = 'ÊÚÏÇÏ ÇáÅäŞÇÕ ÛíÑ ÕÇáÍ: %d';
  sInvalidDecrementOperation = 'ÊÚÏÇÏ ÇáÅäŞÇÕ Óæİ íÓÈÈ äÊÇÆÌ ÛíÑ ÕÇáÍÉ: ÇáÊÚÏÇÏ: %d, ÇáÊÚÏÇÏ ÇáÍÇáí: %d';
  sInvalidIncrementOperation = 'Count already max: Amount: %d, CurCount: %d';
  sCountdownAlreadyZero = 'ÇáÚÏ ÇáÊäÇÒáí ŞÏ æÕá Åáì ÇáÕİÑ ãÓÈŞÇ';

  sTimespanTooLong = 'ÇáİÇÕá ÇáÒãäí ÇáãÍÏÏ Øæíá ÌÏÇ';
  sInvalidTimespanDuration = 'áÇíãßä ÅÚÇÏÉ ÇáãÏÉ ÇáÒãäíÉ , áÅä ÇáŞíãå ÊÌÇæÒÊ ÇáŞíãÉ ÇáÚáíÇ áÜ TTimeSpan.MaxValue';
  sTimespanValueCannotBeNan = 'ÇáŞíãÉ áÇíãßä Ãä Êßæä NaN';
  sCannotNegateTimespan = 'ÚßÓ ÇáŞíãÉ ÇáÏäíÇ ááİÇÕá ÇáÒãäí ÛíÑ ãÓãæÍ ';
  sInvalidTimespanFormat = 'ÊäÓíŞ ÇáİÇÕá ÇáÒãäí ÛíÑ ÕÇáÌ';
  sTimespanElementTooLong = 'ÚäÕÑ ÇáİÇÕá ÇáÒãäí Øæíá ÌÏÇ';

  { ************************************************************************* }
  { Distance's family type }
  SDistanceDescription = 'ÇáãÓÇİÉ';

  { Distance's various conversion types }
  SMicromicronsDescription = 'ãíßÑæ ãíßÑæä';
  SAngstromsDescription = 'ÃäÌÓÊÑæã';
  SMillimicronsDescription = 'ãíáí ãíßÑæä';
  SMicronsDescription = 'ãíßÑæä';
  SMillimetersDescription = 'ãíáíãÊÑ';
  SCentimetersDescription = 'ÓäÊíãÊÑ';
  SDecimetersDescription = 'ÏíÓíãÊÑ';
  SMetersDescription = 'ãÊÑ';
  SDecametersDescription = 'ÏíßÇãÊÑ(10ã)';
  SHectometersDescription = 'åíßÊæãÊÑ(100ã)';
  SKilometersDescription = 'ßíáæãÊÑ';
  SMegametersDescription = 'ãíÛÇãÊÑ';
  SGigametersDescription = 'ÛíÛÇãÊÑ';
  SInchesDescription = 'ÅäÔ';
  SFeetDescription = 'ŞÏã';
  SYardsDescription = 'íÇÑÏ';
  SMilesDescription = 'ãíá';
  SNauticalMilesDescription = 'ãíá ÈÍÑí';
  SAstronomicalUnitsDescription = 'æÍÏÉ İáßíÉ';
  SLightYearsDescription = 'ÓäÉ ÖæÆíÉ';
  SParsecsDescription = 'İÑÓÎ äÌãí';
  SCubitsDescription = 'ĞÑÇÚ';
  SFathomsDescription = 'ŞÇãÉ';
  SFurlongsDescription = 'İÑáäÛ';
  SHandsDescription = 'ĞÑÇÚ';
  SPacesDescription = 'ÎØæÉ';
  SRodsDescription = 'ŞÖíÈ';
  SChainsDescription = 'ÓáÓáÉ';
  SLinksDescription = 'ÇÑÊÈÇØ';
  SPicasDescription = 'Picas';
  SPointsDescription = 'äŞØÉ';

  { ************************************************************************* }
  { Area's family type }
  SAreaDescription = 'ÇáãÓÇÍÉ';

  { Area's various conversion types }
  SSquareMillimetersDescription = 'ãáíãÊÑ ãÑÈÚ';
  SSquareCentimetersDescription = 'ÓäÊíãÊÑ ãÑÈÚ';
  SSquareDecimetersDescription = 'ÏíÓíãÊÑ ãÑÈÚ';
  SSquareMetersDescription = 'ãÊÑ ãÑÈÚ';
  SSquareDecametersDescription = 'ÏíÓíãÊÑ ãÑÈÚ';
  SSquareHectometersDescription = 'åßÊæãÊÑ ãÑÈÚ';
  SSquareKilometersDescription = 'ßíáæãÊÑ ãÑÈÚ';
  SSquareInchesDescription = 'ÅäÔ ãÑÈÚ';
  SSquareFeetDescription = 'ŞÏã ãÑÈÚ';
  SSquareYardsDescription = 'íÇÑÏå ãÑÈÚå';
  SSquareMilesDescription = 'ãíá ãÑÈÚ';
  SAcresDescription = 'İÏÇä';
  SCentaresDescription = 'ãÊÑ ãÑÈÚ';
  SAresDescription = 'ÚÔÑ Ïæäã';
  SHectaresDescription = 'åßÊÇÑ';
  SSquareRodsDescription = 'SquareRods';

  { ************************************************************************* }
  { Volume's family type }
  SVolumeDescription = 'ÇáÍÌæã';

  { Volume's various conversion types }
  SCubicMillimetersDescription = 'ãíáíãÊÑ ãßÚÈ';
  SCubicCentimetersDescription = 'ÓäÊíãÊÑ ãßÚÈ';
  SCubicDecimetersDescription = 'ÏíÓíãÊÑ ãßÚÈ';
  SCubicMetersDescription = 'ãÊÑ ãßÚÈ';
  SCubicDecametersDescription = 'ÏíÓãÊÑ ãßÚÈ';
  SCubicHectometersDescription = 'åíßÊæãÊÑ ãßÚÈ';
  SCubicKilometersDescription = 'ßíáæãÊÑ ãßÚÈ';
  SCubicInchesDescription = 'ÅäÔ ãßÚÈ';
  SCubicFeetDescription = 'ŞÏã ãßÚÈÉ';
  SCubicYardsDescription = 'íÇÑÏå ãßÚÈÉ';
  SCubicMilesDescription = 'ãíá ãßÚÈ';
  SMilliLitersDescription = 'ãíáí áÊÑ';
  SCentiLitersDescription = 'ÓäÊí áíÊÑ';
  SDeciLitersDescription = 'ÏíÓí áíÊÑ';
  SLitersDescription = 'áÊÑ';
  SDecaLitersDescription = 'ÏíßÇ áíÊÑ';
  SHectoLitersDescription = 'åíßÊæ áÊÑ';
  SKiloLitersDescription = 'ßíáæ áÊÑ';
  SAcreFeetDescription = 'ÃßÑÉ  ŞÏã';
  SAcreInchesDescription = 'ÃßÑÉ ÅäÔ';
  SCordsDescription = 'ßÏÓÉ';
  SCordFeetDescription = 'ßÏÓÉ ŞÏã';
  SDecisteresDescription = 'ÏÓí ÇÓÊíÑ';
  SSteresDescription = 'ÇÓÊíÑ';
  SDecasteresDescription = 'ÏíßÇ ÇÓÊíÑ';

  { American Fluid Units }
  SFluidGallonsDescription = 'ÛÇáæä ãÇÆÚ';
  SFluidQuartsDescription = 'ÑÈÚ ÛÇáæä ãÇÆÚ';
  SFluidPintsDescription = 'Ëãä ÛÇáæä (äÕİ áíÊÑ)';
  SFluidCupsDescription = 'ßæÈ';
  SFluidGillsDescription = 'ãßíÇá';
  SFluidOuncesDescription = 'ÃæäÕÉ ÓÇÆáÉ';
  SFluidTablespoonsDescription = 'ãáÚŞÉ ØÚÇã';
  SFluidTeaspoonsDescription = 'ãáÚŞÉ ÔÇí';

  { American Dry Units }
  SDryGallonsDescription = 'ÛÇáæä ÌÇİ';
  SDryQuartsDescription = 'ÑÈÚ ÛÇáæä';
  SDryPintsDescription = 'Ëãä ÛÇáæä';
  SDryPecksDescription = 'Èßø';
  SDryBucketsDescription = 'ÓØá';
  SDryBushelsDescription = 'ÈæÔá';

  { English Imperial Fluid/Dry Units }
  SUKGallonsDescription = 'ÛÇáæä ÈÑíØÇäí';
  SUKPottlesDescription = 'äÕİ ÛÇáæä ÈÑíØÇäí';
  SUKQuartsDescription = 'ÑÈÚ ÛÇáæä ÈÑíØÇäí';
  SUKPintsDescription = 'Ëãä ÛÇáæä ÈÑíØÇäí';
  SUKGillsDescription = 'ãßíÇá ÈÑíØÇäí';
  SUKOuncesDescription = 'ÇæäÕÉ ÈÑíØÇäíÉ';
  SUKPecksDescription = 'Èßø ÈÑíØÇäí';
  SUKBucketsDescription = 'ÓØá ÈÑíØÇäí';
  SUKBushelsDescription = 'ÈæÔá ÈÑíØÇäí';

  { ************************************************************************* }
  { Mass's family type }
  SMassDescription = 'ÇáÃæÒÇä';

  { Mass's various conversion types }
  SNanogramsDescription = 'äÇäæ ÛÑÇã';
  SMicrogramsDescription = 'ãíßÑæ ÛÑÇã';
  SMilligramsDescription = 'ãíáí ÛÑÇã';
  SCentigramsDescription = 'ÓäÊíÛÑÇã';
  SDecigramsDescription = 'ÏíÓíÛÑÇã';
  SGramsDescription = 'ÛÑÇã';
  SDecagramsDescription = 'ÏíßÇ ÛÑÇã';
  SHectogramsDescription = 'åíßÊæÛÑÇã';
  SKilogramsDescription = 'ßíáæÛÑÇã';
  SMetricTonsDescription = 'Øä ãÊÑí';
  SDramsDescription = 'ÏÑåã';
  SGrainsDescription = 'ÍÈÉ';
  STonsDescription = 'Øä';
  SLongTonsDescription = 'Øä Øæíá';
  SOuncesDescription = 'ÃæäÕÉ';
  SPoundsDescription = 'ÈÇæäÏ';
  SStonesDescription = 'ÍÌÑ';

  { ************************************************************************* }
  { Temperature's family type }
  STemperatureDescription = 'ÇáÍÑÇÑÉ';

  { Temperature's various conversion types }
  SCelsiusDescription = 'ÓíáÓíæÓ';
  SKelvinDescription = 'ßíáİä';
  SFahrenheitDescription = 'İÇåÑäåÇíÊ';
  SRankineDescription = 'ÑÇäßíä';
  SReaumurDescription = 'ÑíÇãæÑ';

  { ************************************************************************* }
  { Time's family type }
  STimeDescription = 'ÇáæŞÊ';

  { Time's various conversion types }
  SMilliSecondsDescription = 'ãíáí ËÇäíÉ';
  SSecondsDescription = 'ËÇäíÉ';
  SMinutesDescription = 'ÏŞíŞÉ';
  SHoursDescription = 'ÓÇÚÉ';
  SDaysDescription = 'íæã';
  SWeeksDescription = 'ÃÓÈæÚ';
  SFortnightsDescription = 'ÃÓÈæÚÇä';
  SMonthsDescription = 'ÔåÑ';
  SYearsDescription = 'ÓäÉ';
  SDecadesDescription = 'ÚŞÏ';
  SCenturiesDescription = 'ŞÑä';
  SMillenniaDescription = 'ÃáİíÉ';
  SDateTimeDescription = 'ÊÇÑíÎ ææŞÊ';
  SJulianDateDescription = 'ÇáÊŞæíã ÇáíæáíæÓí';
  SModifiedJulianDateDescription = 'ÇáÊŞæíã ÇáíæáíæÓí ÇáãÚÏá';


  SGUIDAlreadyDefined = 'GUID ''%s'' Êã ÊÓÌíáå ãÓÈŞÇ';
  SNoComComponent = 'ÈäÇÁ ÛÑÖ ãä äæÚ COM : ''%s'' áíÓ áå ãßæä íÛáİå ';
  SNoComClass = '%s.GetComClass ÃÚÇÏ ŞíãÉ İÇÑÛÉ nil';
  SNoCOMClassSpecified = 'áã íÊã ÊÍÏíÏ ComClass';
  SNoCOMClassesRegistered = 'áã íÊã ÊÓÌíá Ãí ÃÕäÇİ ãä äãØ COM';

  SNoContext = 'áÇ íæÌÏ ãÓÇÚÏÉ ÍÓÇÓÉ ááÓíÇŞ Êã ÊäÕíÈåÇ';
  SNoContextFound = 'áã íÊã ÇáÚËæÑ Úáì ãÓÇÚÏÉ á %d';
  SNoIndex = 'ÛíÑ ŞÇÏÑ Úáì İÊÍ ÇáİåÑÓ';
  SNoSearch = 'ÛíÑ ŞÇÏÑ Úáì İÊÍ ÇáÈÍË';
  SNoTableOfContents = 'ÛíÑ ŞÇÏÑ Úáì ÅíÌÇÏ İåÑÓ ÇáãÍÊæíÇÊ';
  SNoTopics = 'áã íÊã ÊäÕíÈ äÙÇã ãÓÇÚÏÉ ãÈäí Úáì ÇáãæÇÖíÚ topic-based help';
  SNothingFound = 'áã íÊã ÇáÚËæÑ Úáì ãÓÇÚÏÉ ãä ÇÌá %s';

  SMethodNotFound = 'ãäåÌ %s ÇáÕäİ %s áã íÊã ÇáÚËæÑ Úáíå';
  STypeMisMatch = 'äãØ ÛíÑ ãØÇÈŞ ááãÊÛíÑ %d ãä Ìá ÇáãäåÌ %s';
  SInvalidDispID = 'DispID ÛíÑ ÕÇáÍ ááãÊÛíÑ  %d İí ÇáãäåÌ %s';
  SParamRequired = 'ãÊÛíÑ ãØáæÈ %d ãä ÃÌá ÇáãäåÌ %s';
  SMethodOver = 'ÊÚÑíİ ÇáãäåÌ áÜ %s áÏíå ÃßËÑ ãä  %d ãÊÛíÑ';
  STooManyParams = 'ãÊÛíÑÇÊ ÃßËÑ ãä ÇáãØáæÈ , ááãäåÌ %s';
  SNoRTTIInfoType = 'ÛíÑ ŞÇÏÑ Úáì ÇÓÊÍÖÇÑ ÇáãäåÌ %s ÇáĞí íÓÊÎÏã äãØ ÛíÑ ãäÔæÑ (unpublished)';
  SResultIsExtended = 'äãØ 10bytes-Extended type İí ÇáãäåÌ %s'' íÚíÏ Ãä ŞíãÉ ÇáäãØ ÛíÑ ãÏÚæãÉ';
  SParamIsExtended = 'äãØ 10bytes-Extended type İí ÇáãÊÛíÑ %d İí ÇáãäåÌ %s ÛíÑ ãÏÚæã ';

  SArgumentOutOfRange = 'ÇáãÊÛíÑ ÎÇÑÌ ÇáãÏì ÇáãÓãæÍ';
  SArgumentNil = 'ÇáãÊÛíÑ íÌÈ Ãä áÇíßæä ÎÇáí Nil';
  SErrorCantModifyWhileIterating = 'áÇ íãßä ÊÚÏíá ãÌãæÚÉ ÃËäÇÁ ÇáÊßÑÇÑ';
  SUnbalancedOperation = 'ÚãáíÉ ãßÏÓ Ãæ ÑÊá ÛíÑ ãÊæÇÒäÉ ';
  SGenericItemNotFound = 'ÇáÚäÕÑ ÛíÑ ãæÌæÏ';
  SGenericDuplicateItem = 'ÇáŞíã ÇáãßÑÑÉ ÛíÑ ãÓãæÍÉ';

  SSpinLockInvalidOperation = 'ÊÊÈÚ ÇáãÓÇáß ÛíÑ ãİÚá';
  SSpinLockReEntered = 'Êã ÅÚÇÏÉ ÅÏÎÇá SpinLock İí äİÓ ÇáãÓáß';
  SSpinLockNotOwned = 'SpinLock ÛíÑ ããáæß ãä ŞÈá ÇáãÓáß ÇáÍÇáí';

  SInsufficientRtti = 'ãÚáæãÇÊ ÇáÃäãÇØ ÛíÑ ãÊæİÑÉ İí Òãä ÇáÊÔÛíá RTTI áÏÚã åĞå ÇáÚãáíÉ';
  SParameterCountMismatch = 'ÚÏÏ ÇáãÊÛíÑÇÊ ÛíÑ ãØÇÈŞ';
  SParameterCountExceeded = 'Êã ÊÎØí ÚÏÏ ÇáãÊÛíÑÇÊ';
  SConversionError = 'äãØ ÛíÑ ãÊæÇİŞ';
  SNonPublicType = 'ÇáäãØ ''%s'' áã íÚÑİ İí ŞÓã interface ááæÍÏÉ';
  SByRefArgMismatch = 'ßá ãä VAR æ OUT íÌÈ Çä íãáßÇ ÇäãÇØ ãÊÛíÑÇÊ ãÊØÇÈŞÉ';

  SInsufficientReadBuffer = 'ÇáĞÇßÑÉ ÇáæÓíØíÉ (ÇáÈİÑ) ÛíÑ ßÇİíå ááÈíÇäÇÊ ÇáÊí ÊãÊ ÇÓÊÚÇÏÊåÇ';

  SInvalid7BitEncodedInteger = 'ÊÑãíÒ 7ÈÊ ááinteger stream ÛíÑ ÕÇáÍ';
  SNoSurrogates = 'ÇáÈÏíá ÛíÑ ãÓãæÍ ßãÍÑİ ãİÑÏ';
  SInvalidStringLength = 'Øæá ÇáäÕ ÛíÑ ÕÇáÍ';
  SReadPastEndOfStream = 'ãÍÇæáÉ ááŞÑÇÁÉ ãä ÇáäÕ ÊÊÌÇæÒ äåÇíÊå';

  SInvalidGuidArray = 'Byte array for GUID must be exactly %d bytes long';

  SServiceNotFound = 'ÎÏãÉ ÇÚÊãÇÏ ÊÓÌíá ÇáÏÎæá ÇáÊí Êã ÇÎÊíÇÑåÇ ÛíÑ ãæÌæÏÉ';

  { Class group report strings }

  sClassGroupHeader = 'ÇáãÌãæÚÉ[%d] - äÔØ: %s';
  sGroupClassesHeader = '  ÃÕäÇİ ÇáãÌãæÚÉ';
  sClassListHeader = '  ÇÕäÇİ';
  sClassAliasesHeader = '  ÈÏÇÆá ÇáÃÕäÇİ';

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
  SVersionStr = '%s (ÇáÅÕÏÇÑÉ %d.%d, ÇáÈäÇÁ %d, %5:s)';
  SSPVersionStr = '%s ÍÒãÉ ÇáÎÏãÉ %4:d (ÇáÅÕÏÇÑÉ %1:d.%2:d, ÇáÈäÇÁ %3:d, %5:s)';
  SVersion32 = 'ÅÕÏÇÑ 32 ÈÊ';
  SVersion64 = 'ÅÕÏÇÑ 64 ÈÊ';
  SWindows = 'æíäÏæÒ';
  SWindowsVista = 'æíäÏæÒ İíÓÊÇ';
  SWindowsServer2008 = 'Windows Server 2008';
  SWindows7 = 'æíäÏæÒ 7';
  SWindowsServer2008R2 = 'Windows Server 2008 R2';
  SWindows2000 = 'Windows 2000';
  SWindowsXP = 'æíäÏæÒ ÅßÓ Èí';
  SWindowsServer2003 = 'Windows Server 2003';
  SWindowsServer2003R2 = 'Windows Server 2003 R2';
  SWindowsServer2012 = 'Windows Server 2012';
  SWindowsServer2012R2 = 'Windows Server 2012 R2';
  SWindows8 = 'æíäÏæÒ 8';
  SWindows8Point1 = 'æíäÏæÒ 8.1';
  SWindows10 = 'æíäÏæÒ 10';
  SItaskbarInterfaceException = '%s åĞå ÇáæÇÌåÉ ÛíÑ ãÏÚæãÉ İí åĞå ÇáÅÕÏÇÑÉ ãä ÇáäÙÇã';
  SHookException = 'áÇíãßä ÑÈØ æÊÈÇÏá ÇáÑÓÇÆá, ÇáÃÒÑÇÑ æÃÍÏÇË ÇáÚÑÖ áä ÊÚãá ';
  SInitializeException = 'áÇíãßä ÊåíÆÉ ÔÑíØ ÇáãåÇã . ÎØÃ : %d';
  SInstanceException = 'åäÇß äÓÎÉ ÃÎÑì ãä ÔÑíØ ÇáãåÇã ';
  SButtonsLimitException = 'ÔÑíØ ãåÇã æäÏæÒ íÏÚã İŞØ %d ÃÒÑÇÑ İí ÕİÍÇÊ ÇáãÚÇíäÉ';
  SCouldNotRegisterTabException = 'áÇíãßä ÊÓÌíá ÇáÕİÍÉ . ÎØÃ %d';
  SInvalidProgressValueException = '%d áíÓ ÕÍíÍ . íÌÈ Çä íßæä Èíä 0 æ %d';
  SThumbPreviewException = 'İÔá ÅÚÏÇÏ ÇáÕæÑÉ ßÚÑÖ ãÕÛÑÇÊ . ÎØÃ: %d';
  SBitmapPreviewException = 'İÔá ÅÚÏÇÏ ÇáÕæÑÉ ááãÚÇíäå. ÎØÃ: %d';
  { WinRT support strings }
  SWinRTNoRTTI = 'áã íÊã ÇáÚËæÑ Úáì ãÚáæãÇÊ ÃäãÇØ Òãä ÇáÊÔÛíá RTTI ááÕäİ %s';
  SWinRTInstanceError = 'áÇ íãßä ÅäÔÇÁ ÛÑÖ ãä ÇáÕäİ %s';
  SWinRTICreatedError = 'ÇáÛÑÖ ÇáĞí íÊã ÅäÔÇÄå ãä ÇáÕäİ %s ÎÇØÆ';
  SWinRTHStringError = 'ÎØÃ İí ÅäÔÇÁ HString ãä ÃÌá %s';
  SWinRTFactoryError = 'áÇíãßä ÇÓÊÍÕÇá factory ááÕäİ %s';
  SWinRTWrongFactoryError = 'ÇáÜ factory ÇáãÓÊÍÕá ãä ÃÌá %s ÎÇØÆ';
  SWinRTInteropError = 'áÇíãßä ÅäÔÇÁ Õäİ interop';
{$ENDIF}
{$IF defined(MACOS) or defined(ANDROID)}
  SVersionStr = '%s (Version %d.%d.%d)';
{$ENDIF}
  { Zip Strings}
  SZipErrorRead            = 'ÎØÃ İí ŞÑÇÁÉ ãáİ ãÖÛæØ zip';
  SZipErrorWrite           = 'ÎØÃ İí ßÊÇÈÉ ãáİ ãÖÛæØ zip';
  SZipInvalidLocalHeader   = 'ÎØÃ İí ÊæŞíÚ ÊÑæíÓÉ LocalHeader ãáİ ãÖÛæØ zip';
  SZipInvalidCentralHeader = 'ÎØÃ İí ÊæŞíÚ ÊÑæíÓÉ Central Header ãáİ ãÖÛæØ Zip';
  SZipNotSupported         = 'ÏÚã äãØ ÇáÖÛØ ÛíÑ ãÓÌá : %s';
  SZipNotOpen              = 'íÌÈ Çä íÊã İÊÍ Çáãáİ';
  SZipNoWrite              = 'ÓÌÈ Çä íÊã İÊÍ Çáãáİ ááßÊÇÈÉ';
  SZipNoRead               = 'íÌÈ Çä íÊã İÊÍ Çáãáİ ááŞÑÇÁÉ';
  SZipNotEmpty             = 'ãáİ Zip íÌÈ Çä íßæä İÇÑÛ';
  SZipFileNameEmpty        = 'ÇÓã Çáãáİ íÌÈ Çä áÇíßæä İÇÑÛ';

  sObserverUnsupported = 'ÇáãÑÇŞÈ Observer ÛíÑ ãÏÚæã';
  sObserverMultipleSingleCast = 'Cannot have multiple single cast observers added to the observers collection';
  sObserverNoInterface = 'The object does not implement the observer interface';
  sObserverNoSinglecastFound = 'No single cast observer with ID %d was added to the observer collection';
  sObserverNoMulticastFound = 'No multi cast observer with ID %d was added to the observer collection';
  sObserverNotAvailable = 'ÇáãÑÇŞÈ Observer ÛíÑ ãÊæİÑ';

  SGeocodeMultipleRequests = 'áÇíãßä ÊåíÆÉ ÃËäÇÁ Ãæ ÃßËÑ ãä ØáÈÇÊ geocoding requests İí äİÓ ÇáæŞÊ';
  SLocationSensorStarted = 'ÍÓÇÓ ÇáãæŞÚ Êã ÊÔÛíáå';
  SSensorIndexError = 'ÇáÍÓÇÓ ÇáãÍÏÏ ÈÇáÊÑÊíÈ (%d) áã íÊã ÇáÚËæÑ Úáíå';
                                                          
{IFDEF MACOS}
  SLocationServiceUnauthorized = 'ÛíÑ ãÕÑÍ áß ÈÇÓÊÎÏÇã ÎÏãÉ ÇáãæÇŞÚ';
  SLocationServiceDisabled = 'ÎÏãÇÊ ÇáãæÇŞÚ ÛíÑ ãİÚáÉ';
{ENDIF}

  {$IFDEF ANDROID}
  SAssetFileNotFound = 'Cannot deploy, "%s" file not found in assets';
  SExternalExtorageNotAvailable = 'Cannot have access to external storage on device';
  {$ENDIF}

  { System.DateUtils }
  SInvalidDateString = 'äÕ ÇáÊÇÑíÎ ÛíÑ ãŞÈæá: %s';
  SInvalidTimeString = 'äÕ ÇáæŞÊ ÛíÑ ãŞÈæá: %s';
  SInvalidOffsetString = 'äÕ ÅÒÇÍÉ ÇáæŞÊ ÛíÑ ãÓãæÍÉ: %s';

  { System.Devices }
  sCannotManuallyConstructDevice = 'Manual construction of TDeviceInfo is not supported'; // move to System.RTLConsts.
  sAttributeExists = 'ÇáÕİÉ ''%s'' ãæÌæÏÉ ãÓÈŞÇ';
  sDeviceExists = 'ÇáÌåÇÒ ''%s'' ãæÌæÏ ãÓÈŞÇ';

  { System.Hash }
  SHashCanNotUpdateMD5 = 'MD5: áÇíãßä ÊÍÏíË åÇÔ ÇáäåÇíÉ finalized hash';
  SHashCanNotUpdateSHA1 = 'SHA1: áÇíãßä ÊÍÏíË åÇÔ ÇáäåÇíÉ finalized hash';
  SHashCanNotUpdateSHA2 = 'SHA2: áÇíãßä ÊÍÏíË åÇÔ ÇáäåÇíÉfinalized hash';

  { System.NetEncoding }
  sErrorDecodingURLText = 'ÎØÃ İí İß äãØ URL style (%%XX) ÇáäÕ ÇáãÑãÒ İí ÇáãæŞÚ %d';
  sInvalidURLEncodedChar = 'ãÍÑİ ÚäæÇä URL ãÑãÒ ÛíÑ ÕÇáÍ (%s) İí ÇáãæŞÚ %d';
  sInvalidHTMLEncodedChar = 'ãÍÑİ HTML ãÑãÒ ÛíÑ ÕÇáÍ (%s) İí ÇáãæŞÚ %d';

  { System.Threading }
  sStopAfterBreak = 'The Break method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sBreakAfterStop = 'The Stop method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sInvalidTaskConstruction = 'Cannot construct an ITask in this manner';
  sEmptyJoinTaskList = 'List of tasks to Join method empty';
  sWaitNilTask = 'At least one task in array nil';
  sCannotStartCompletedTask = 'áÇíãßä ÈÏÁ ãåãÉ ÇßÊãáÊ ááÊæ';
  sOneOrMoreTasksCancelled = 'ãåãÉ Ãæ ÃßËÑ ÓíÊã ÅáÛÇÆåÇ';
  sDefaultAggregateExceptionMsg = 'ÍÏËÊ ÃÎØÇÁ';

  { System.Types }
  sMustWaitOnOneEvent = 'íÌÈ ÇäÊÙÇÑ ÍÏË æÇÍÏ Úáì ÇáÃŞá';

  { TComponent.BeginInvoke }
  sBeginInvokeDestroying = 'Cannot call BeginInvoke on a TComponent in the process of destruction';

  { System.ShareContract }
  SShareContractNotAvailable = 'ShareContract ÛíÑ ãÊæİÑ';
  SShareContractNotSupported = 'ÇáãÔÇÑßÉ áíÓÊ ãÓãæÍÉ ÊÍÊ %s';
  SShareContractNotInitialized = 'ÍÏË TShareContract.OnProcessMessages íÌÈ Ãä íÊã ÇÓäÇÏå ÃæáÇ';


const
  SEmpty: string = 'Empty';  // do not localize
  SMenuSeparator: string = '-';   // do not localize

implementation

end.
