{*******************************************************}
{                                                       }
{            Arabic Delphi VCL Units                    }
{                                                       }
{ Modified by : Orwah Ali Issa (www.sy-it.com)          }
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
  SAncestorNotFound = 'Ancestor for ''%s'' not found';
  SAssignError = '·«Ì„ﬂ‰ ‰”»  %s ≈·Ï a %s';
  SBitsIndexError = 'Bits index out of range';
  SBucketListLocked = 'List is locked during an active ForEach';
  SCantWriteResourceStreamError = 'Can''t write to a read-only resource stream';
  SCharExpected = '''''%s'''' „ Êﬁ⁄…';
  SCheckSynchronizeError = 'CheckSynchronize called from thread $%x, which is NOT the main thread';
  SClassNotFound = 'Class %s not found';
  SDelimiterQuoteCharError = 'Delimiter and QuoteChar properties cannot have the same value';
  SDuplicateClass = 'A class named %s already exists';
  SDuplicateItem = '«··«∆Õ… ·« ”„Õ »«·ﬁÌ„ «·„ﬂ——… ($0%x)';
  SDuplicateName = '„ﬂÊ‰ »Â–« «·«”„ %s „ÊÃÊœ „”»ﬁ«';
  SDuplicateString = '«··«∆Õ… «·‰’Ì… ·« ”„Õ »«·ﬁÌ„ «·„ﬂ——…';
  SFCreateError = '·«Ì„ﬂ‰ ≈‰‘«¡ «·„·› %s';
  SFCreateErrorEx = '·«Ì„ﬂ‰ ≈‰‘«¡ «·„·› "%s". %s';
  SFixedColTooBig = 'Fixed column count must be less than column count';
  SFixedRowTooBig = 'Fixed row count must be less than row count';
  SFOpenError = '·«Ì„ﬂ‰ › Õ «·„·› %s';
  SFOpenErrorEx = '·«Ì„ﬂ‰ › Õ «·„·› "%s". %s';
  SGridTooLarge = '«·‘»ﬂ… ﬂ»Ì—… Ãœ« ·Â–Â «·⁄„·Ì…';
  SIdentifierExpected = 'Identifier expected';
  SIndexOutOfRange = '›Â—” «·‘»ﬂ… Œ«—Ã «·„Ã«· «·„”„ÊÕ';
  SIniFileWriteError = '·«Ì„ﬂ‰ «·ﬂ «»… ≈·Ï %s';

  SInvalidActionCreation = '›‘· ›Ì ≈‰‘«¡ «·ÕœÀ';
  SInvalidActionEnumeration = 'Invalid action enumeration';
  SInvalidActionRegistration = 'Invalid action registration';
  SInvalidActionUnregistration = 'Invalid action unregistration';
  StrNoClientClass = 'The client can not be an instance of class %s';
  StrEActionNoSuported = '«·’‰› %s ·«Ìœ⁄„ Â–« «·ÕœÀ';

  SInvalidBinary = 'ﬁÌ„… À‰«∆Ì… €Ì— ’«·Õ…';
  SInvalidFileName = '«”„ «·„·› €Ì— ’«·Õ : - %s';
  SInvalidImage = ' ‰”Ìﬁ €Ì— ’«·Õ';
  SInvalidMask = '''%s'' ÂÊ ﬁ‰«⁄ €Ì— ’«·Â „‰ √Ã· (%d)';
  SInvalidName = '''''%s'''' «”„ „ﬂÊ‰ €Ì— ’«·Õ';
  SInvalidProperty = 'ﬁÌ„… «·Œ«’Ì… €Ì— ’«·Õ…';
  SInvalidPropertyElement = '⁄‰’— Œ«’Ì… €Ì— ’«·Õ: %s';
  SInvalidPropertyPath = '„”«— Œ«’Ì… €Ì— ’«·Õ';
  SInvalidPropertyType = '‰„ÿ Œ«’Ì… €Ì— ’«·Õ: %s';
  SInvalidPropertyValue = 'ﬁÌ„… «·Œ«’Ì… €Ì— ’«·Õ…';
  SInvalidRegType = '‰„ÿ „⁄ÿÌ«  €Ì— ’«·Õ „‰ √Ã· ''%s''';
  SInvalidString = 'À«»  ‰’Ì €Ì— ’«·Õ';
  SInvalidStringGridOp = '·« Ì„ﬂ‰ ≈÷«›… √Ê Õ–› ’›Ê› „‰ «·‘»ﬂ…';
  SItemNotFound = '·«Ì„ﬂ‰ «·⁄ÀÊ— ⁄·Ï «·⁄‰’—  ($0%x)';
  SLineTooLong = '”ÿ— ÿÊÌ· Ãœ«';
  SListCapacityError = '”⁄… «··«∆Õ… Œ«—Ã «·ÕœÊœ «·„„ﬂ‰… (%d)';
  SListCountError = ' ⁄œ«œ «··«∆Õ… Œ«—Ã «·ÕœÊœ «·„„ﬂ‰… (%d)';
  SListIndexError = 'œ·Ì· «··«∆Õ… Œ«—Ã «·ÕœÊœ «·„„ﬂ‰… (%d)';
  SMaskErr = 'ﬁÌ„… «·≈œŒ«· €Ì— ’ÕÌÕ…';
  SMaskEditErr = 'ﬁÌ„… ≈œŒ«· €Ì— ’ÕÌÕ… , «” Œœ„ “— «·≈·€«¡ ·· —«Ã⁄ ⁄‰ «· €Ì—« ';
  SMemoryBufferOverrun = 'Memory Buffer overrun';
  SMemoryStreamError = 'Out of memory while expanding memory stream';
  SNoComSupport = '%s has not been registered as a COM class';
  SNotPrinting = '«·ÿ«»⁄… ·« ﬁÊ„ »«·ÿ»«⁄… Õ«·Ì«';
  SNumberExpected = 'ﬁÌ„… —ﬁ„Ì… „ Êﬁ⁄…';
  SAnsiUTF8Expected = 'ﬂÊœ ANSI √Ê UTF8 „ Êﬁ⁄';
  SParseError = '%s ›Ì «·”ÿ— %d';
  SComponentNameTooLong = '«·„ﬂÊ‰ ''%s'' Ì Êﬁ⁄ ÕœÊœ 64 „Õ—›';
  SPropertyException = 'Œÿ√ ›Ì ﬁ—«¡… %s%s%s: %s';
  SPrinting = 'Ã«—Ì «·ÿ»«⁄…';
  SReadError = 'Œÿ√ ›Ì ﬁ—«¡… «·„”·ﬂ';
  SReadOnlyProperty = '«·Œ«’Ì… ··ﬁ—«¡… ›ﬁÿ';
  SRegCreateFailed = '›‘· ≈‰‘«¡ «·„› «Õ %s';
  SRegGetDataFailed = '›‘· «” Õ’«· »Ì«‰«  ''%s''';
  SRegisterError = ' ”ÃÌ· „ﬂÊ‰ €Ì— ’«·Õ';
  SRegSetDataFailed = '›‘· ÷»ÿ »Ì«‰«  ''%s''';
  SResNotFound = '«·„Ê—œ %s ·„ Ì „ «·⁄ÀÊ— ⁄·ÌÂ';
  SSeekNotImplemented = '%s.Seek not implemented';
  SSortedListError = '«·⁄„·Ì… €Ì— „”„ÊÕ… ⁄·Ï ·«∆Õ… „— »…';
  SStringExpected = 'ﬁÌ„… ‰’Ì… „ Êﬁ⁄…';
  SSymbolExpected = '%s „ Êﬁ⁄';
  STooManyDeleted = ' „ Õ–› ’›Ê› √Ê √⁄„œ… √ﬂÀ— „‰ «·„ Êﬁ⁄';
  SUnknownGroup = '%s not in a class registration group';
  SUnknownProperty = '«·Œ«’Ì… %s €Ì— „ÊÃÊœ…';
  SWriteError = 'Œÿ√ ﬂ «»… ›Ì «·„”·ﬂ';
  SStreamSetSize = 'Œÿ√ ›Ì  ÕœÌœ ÕÃ„ «·„”·ﬂ';
  SThreadCreateError = 'Œÿ√ ›Ì ≈‰‘«¡ «·„”·ﬂ: %s';
  SThreadError = 'Œÿ√ ›Ì «·„”·ﬂ : %s (%d)';
  SThreadExternalTerminate = 'Cannot terminate an externally created thread';
  SThreadExternalWait = 'Cannot wait for an externally created thread';
  SThreadStartError = 'Cannot call Start on a running or suspended thread';
  SThreadExternalCheckTerminated = 'Cannot call CheckTerminated on an externally created thread';
  SThreadExternalSetReturnValue = 'Cannot call SetReturnValue on an externally create thread';

  SParamIsNil = '«·„ €Ì— %s ·«Ì„ﬂ‰ √‰  ﬂÊ‰ ﬁÌ„ Â Œ«·Ì… nil';
  SParamIsNegative = '«·„ €Ì— %s ·«Ì„ﬂ‰ √‰  ﬂÊ‰ ﬁÌ„ Â ”«·»…';
  SInputBufferExceed = ' „  Ã«Ê“ ﬁÌ„… «·„Œ“‰ «·„ƒﬁ  ··≈œŒ«· Input Buffer %s = %d, %s = %d';

  SInvalidCharsInPath = '«·„”«— ÌÕÊÌ „Õ«—› €Ì— ’«·Õ…';
  SInvalidCharsInFileName = '«”„ «·„·› ÌÕÊÌ „Õ«—› €Ì— ’«·Õ…';
  SInvalidCharsInSearchPattern = '√‰„«ÿ «·»ÕÀ  ÕÊÌ „Õ«—› €Ì— ’«·Õ…';
  SPathTooLong = '«·„”«— «·„Õœœ ÿÊÌ· Ãœ«';
  SPathNotFound = '«·„”«— «·„Õœœ €Ì— „ÊÃÊœ';
  SPathFormatNotSupported = ' ‰”Ìﬁ «·„”«— Â–« €Ì— „œ⁄Ê„';
  SDirectoryNotEmpty = '«·„Ã·œ «·„Õœœ €Ì— ›«—€';
  SDirectoryAlreadyExists = '«·„Ã·œ «·„Õœœ „ÊÃÊœ „”»ﬁ«';
  SDirectoryInvalid = '«”„ «·„Ã·œ «·„Õœœ €Ì— ’«·Õ';
  SSourceDirIsDestDir = '«·„Ã·œ «·Âœ› ÂÊ ‰›” «·„Ã·œ «·„’œ—';
  SSourceFileIsDestFile = '«·„·› «·Âœ› ÂÊ ‰›” «·„Ã·œ «·ÊÃÂ…';
  SPathToFileNeeded = '«·„”«— ÌÃ» √‰ ÌÕœœ „·›';
  SSameRootDrive = '„”«— «·Âœ› Ê«·„’œ— ÌÃ» √‰ ÌﬂÊ‰« ›Ì ‰›” «·ﬁ—’';
  SDriveNotFound = '«·ﬁ—’ ·«Ì„ﬂ‰ «·⁄ÀÊ— ⁄·ÌÂ';
  SFileNotFound = '«·„·› «·„Õœœ ·«Ì„ﬂ‰ «·⁄ÀÊ— ⁄·ÌÂ';
  SFileAlreadyExists = '«·„·› «·„Õœœ „ÊÃÊœ „”»ﬁ«';

  SInvalidDateDay = '(%d, %d) is not a valid DateDay pair';
  SInvalidDateWeek = '(%d, %d, %d) is not a valid DateWeek triplet';
  SInvalidDateMonthWeek = '(%d, %d, %d, %d) is not a valid DateMonthWeek quad';
  SInvalidDayOfWeekInMonth = '(%d, %d, %d, %d) is not a valid DayOfWeekInMonth quad';
  SInvalidJulianDate = '%f Julian cannot be represented as a DateTime';
  SMissingDateTimeField = '?';
  SMinimumDateError = '«· Ê«—ÌŒ ﬁ»· «·”‰… 1 €Ì— „”„ÊÕ…';
  SLocalTimeInvalid = '«·Êﬁ  «·„Õ·Ì «·„⁄ÿÏ "%s" €Ì— „”„ÊÕ (ﬂ«∆‰ ›Ì «·ﬁ —… «·„›ﬁÊœ… ⁄‰œ  ﬁœÌ„ «·”«⁄…).';

  SConvIncompatibleTypes2 = '√‰„«ÿ  ÕÊÌ· €Ì— „ﬂ „·… [%s, %s]';
  SConvIncompatibleTypes3 = '√‰„«ÿ  ÕÊÌ· €Ì— „ﬂ „·… [%s, %s, %s]';
  SConvIncompatibleTypes4 = '√‰„«ÿ  ÕÊÌ· €Ì— „ﬂ „·… [%s - %s, %s - %s]';
  SConvUnknownType = '‰„ÿ  ÕÊÌ· €Ì— „⁄—Ê› %s';
  SConvDuplicateType = '‰„ÿ «· ÕÊÌ· (%s) „”Ã· „”»ﬁ« ›Ì %s';
  SConvUnknownFamily = '⁄«∆·… «· ÕÊÌ· €Ì— „⁄—Ê›… %s';
  SConvDuplicateFamily = '⁄«∆·… «· ÕÊÌ· (%s) „”Ã·… „”»ﬁ«';
  SConvUnknownDescription = '[$%.8x]' deprecated; // no longer used
  SConvUnknownDescriptionWithPrefix = '[%s%.8x]';
  SConvIllegalType = '‰„ÿ €Ì— „”„ÊÕ';
  SConvIllegalFamily = '⁄«∆·… €Ì— „”„ÊÕ…';
  SConvFactorZero = '%s ·œÌÂ „⁄«„· ’›—Ì';
  SConvStrParseError = '·«Ì„ﬂ‰  Õ·Ì· %s';
  SFailedToCallConstructor = 'TStrings descendant %s failed to call inherited constructor';

  sWindowsSocketError = 'Windows socket error: %s (%d), on API ''%s''';
  sAsyncSocketError = 'Asynchronous socket error %d';
  sNoAddress = '·„ Ì „  ÕœÌœ ⁄‰Ê«‰';
  sCannotListenOnOpen = 'Can''t listen on an open socket';
  sCannotCreateSocket = 'Can''t create new socket';
  sSocketAlreadyOpen = 'Socket already open';
  sCantChangeWhileActive = 'Can''t change value while socket is active';
  sSocketMustBeBlocking = 'Socket must be in blocking mode';
  sSocketIOError = '%s Œÿ√ %d, %s';
  sSocketRead = 'ﬁ—«¡…';
  sSocketWrite = 'ﬂ «»…';

  SCmplxCouldNotParseImaginary = '·«Ì„ﬂ‰  Õ·Ì· «·ﬁ”„ «· ŒÌ·Ì';
  SCmplxCouldNotParseSymbol = '·«Ì„ﬂ‰  Õ·Ì· «·—„“ «·„ÿ·Ê» ''%s'' ';
  SCmplxCouldNotParsePlus = '·«Ì„ﬂ‰  Õ·Ì· «·—„“ «·„ÿ·Ê»  ''+'' (√Ê ''-'') ';
  SCmplxCouldNotParseReal = '·«Ì„ﬂ‰  Õ·Ì· «·ﬁ”„ «·ÕﬁÌﬁÌ';
  SCmplxUnexpectedEOS = '‰Â«Ì… «·”·”·… «·‰’Ì… €Ì— „ Êﬁ⁄Â [%s]';
  SCmplxUnexpectedChars = '„Õ«—› €Ì— „ Êﬁ⁄…';
  SCmplxErrorSuffix = '%s [%s<?>%s]';

  hNoSystem = '·„ Ì „  ‰’Ì» „œÌ— „·›«  «·„”«⁄œ….';
  hNoTopics = '·„ Ì „  ‰’Ì» „”«⁄œ… »‰«¡ ⁄·Ï «·„Ê«÷Ì⁄.';
  hNoContext = '·„ Ì „  ‰’Ì» „”«⁄œ… Õ”«”… ··”Ì«ﬁ.';
  hNoContextFound = '·„ Ì „ «·⁄ÀÊ— ⁄·Ï „”«⁄œ… ··”Ì«ﬁ %d.';
  hNothingFound = '·„ Ì „ «·⁄ÀÊ— ⁄·Ï „”«⁄œ… ·‹ "%s"';
  hNoTableOfContents = '·„ Ì „ «·⁄ÀÊ— ⁄·Ï ÃœÊ· «·„Õ ÊÌ« .';
  hNoFilterViewer = '·«ÌÊÃœ „” ⁄—÷ „”«⁄œ… Ìœ⁄„ «·›· —…';

  sArgumentInvalid = '„⁄«„· €Ì— ’«·Õ';
  sArgumentOutOfRange_InvalidHighSurrogate = 'A valid high surrogate character is >= $D800 and <= $DBFF';
  sArgumentOutOfRange_InvalidLowSurrogate = 'A valid low surrogate character is >= $DC00 and <= $DFFF';
  sArgumentOutOfRange_Index = '«·›Â—” Œ«—Ã «·ÕœÊœ (%d).  ÌÃ» «‰ ÌﬂÊ‰ >= 0 Ê < %d';
  sArgumentOutOfRange_StringIndex = '«·›Â—” «·‰’Ì Œ«—Ã «·ÕœÊœ (%d).  ÌÃ» √‰ ÌﬂÊ‰ >= %d Ê <= %d';
  sArgumentOutOfRange_InvalidUTF32 = 'Invalid UTF32 character value.  Must be >= 0 and <= $10FFFF, excluding surrogate pair ranges';
  sArgument_InvalidHighSurrogate = 'High surrogate char without a following low surrogate char at index: %d. Check that the string is encoded properly';
  sArgument_InvalidLowSurrogate = 'Low surrogate char without a preceding high surrogate char at index: %d. Check that the string is encoded properly';
  sArgumentOutOfRange_NeedNonNegValue = '«·„⁄«„·, %s, ÌÃ» «‰ ÌﬂÊ‰ >= 0';
  sArgumentOutOfRange_OffLenInvalid = '«·≈“«Õ… Ê«·ÿÊ· €Ì— „”„ÊÕ… ··„’›Ê›… «·„⁄ÿ«…';

  sInvalidStringAndObjectArrays = 'Length of Strings and Objects arrays must be equal';

  sSameArrays = 'Source and Destination arrays must not be the same';

  sNoConstruct = '«·’‰› %s ·«Ì»œÊ √‰Â  „  ‘ÌÌœÂ';

  sCannotCallAcquireOnConditionVar = 'Cannot call Acquire on TConditionVariable.  Must call WaitFor with an external TMutex';
  sInvalidTimeoutValue = 'Invalid Timeout value: %s';
  sNamedSyncObjectsNotSupported = 'Named synchronization objects not supported on this platform';

  sInvalidInitialSemaphoreCount = 'Invalid InitialCount: %d';
  sInvalidMaxSemaphoreCount = 'Invalid MaxCount: %d';
  sSemaphoreCanceled = 'Invalid operation. Semaphore canceled';
  sInvalidSemaphoreReleaseCount = 'Invalid semaphore release count: %d';
  sSemaphoreReachedMaxCount = 'Semaphore reached MaxCount';
  sErrorCreatingSemaphore = 'Error Creating Semaphore';

  sErrorCreatingEvent = 'Œÿ√ ›Ì ≈‰‘«¡ «·ÕœÀ';

  sSpinCountOutOfRange = 'SpinCount out of range. Must be between 0 and %d';

  sCountdownEventCanceled = 'Countdown canceled';
  sInvalidResetCount = 'Invalid Reset Count: %d';
  sInvalidInitialCount = 'Invalid Count: %d';
  sInvalidDecrementCount = 'Invalid Decrement Count: %d';
  sInvalidIncrementCount = 'Invalid Increment Count: %d';
  sInvalidDecrementOperation = 'Decrement amount will cause invalid results: Count: %d, CurCount: %d';
  sInvalidIncrementOperation = 'Count already max: Amount: %d, CurCount: %d';
  sCountdownAlreadyZero = 'Countdown already reached zero (0)';

  sTimespanTooLong = 'Timespan too long';
  sInvalidTimespanDuration = 'The duration cannot be returned because the absolute value exceeds the value of TTimeSpan.MaxValue';
  sTimespanValueCannotBeNan = 'Value cannot be NaN';
  sCannotNegateTimespan = 'Negating the minimum value of a Timespan is invalid';
  sInvalidTimespanFormat = 'Invalid Timespan format';
  sTimespanElementTooLong = 'Timespan element too long';

  { ************************************************************************* }
  { Distance's family type }
  SDistanceDescription = '«·„”«›…';

  { Distance's various conversion types }
  SMicromicronsDescription = '„Ìﬂ—Ê „Ìﬂ—Ê‰';
  SAngstromsDescription = '√‰Ã” —Ê„';
  SMillimicronsDescription = '„Ì·Ì „Ìﬂ—Ê‰';
  SMicronsDescription = '„Ìﬂ—Ê‰';
  SMillimetersDescription = '„Ì·Ì„ —';
  SCentimetersDescription = '”‰ Ì„ —';
  SDecimetersDescription = 'œÌ”Ì„ —';
  SMetersDescription = '„ —';
  SDecametersDescription = 'œÌﬂ«„ —(10„)';
  SHectometersDescription = 'ÂÌﬂ Ê„ —(100„)';
  SKilometersDescription = 'ﬂÌ·Ê„ —';
  SMegametersDescription = '„Ì€«„ —';
  SGigametersDescription = '€Ì€«„ —';
  SInchesDescription = '≈‰‘';
  SFeetDescription = 'ﬁœ„';
  SYardsDescription = 'Ì«—œ';
  SMilesDescription = '„Ì·';
  SNauticalMilesDescription = 'NauticalMiles';
  SAstronomicalUnitsDescription = 'AstronomicalUnits';
  SLightYearsDescription = '”‰… ÷Ê∆Ì…';
  SParsecsDescription = '›—”Œ ‰Ã„Ì';
  SCubitsDescription = '–—«⁄';
  SFathomsDescription = 'ﬁ«„…';
  SFurlongsDescription = '›—·‰€';
  SHandsDescription = '–—«⁄';
  SPacesDescription = 'ŒÿÊ…';
  SRodsDescription = 'ﬁ÷Ì»';
  SChainsDescription = '”·”·…';
  SLinksDescription = '«— »«ÿ';
  SPicasDescription = 'Picas';
  SPointsDescription = '‰ﬁÿ…';

  { ************************************************************************* }
  { Area's family type }
  SAreaDescription = '«·„”«Õ…';

  { Area's various conversion types }
  SSquareMillimetersDescription = '„·Ì„ — „—»⁄';
  SSquareCentimetersDescription = '”‰ Ì„ — „—»⁄';
  SSquareDecimetersDescription = 'œÌ”Ì„ — „—»⁄';
  SSquareMetersDescription = '„ — „—»⁄';
  SSquareDecametersDescription = 'SquareDecameters';
  SSquareHectometersDescription = 'SquareHectometers';
  SSquareKilometersDescription = 'ﬂÌ·Ê„ — „—»⁄';
  SSquareInchesDescription = '≈‰‘ „—»⁄';
  SSquareFeetDescription = 'SquareFeet';
  SSquareYardsDescription = 'SquareYards';
  SSquareMilesDescription = 'SquareMiles';
  SAcresDescription = '›œ«‰';
  SCentaresDescription = 'Centares';
  SAresDescription = 'Ares';
  SHectaresDescription = 'Âﬂ «—';
  SSquareRodsDescription = 'SquareRods';

  { ************************************************************************* }
  { Volume's family type }
  SVolumeDescription = '«·ÕÃÊ„';

  { Volume's various conversion types }
  SCubicMillimetersDescription = '„Ì·Ì„ — „ﬂ⁄»';
  SCubicCentimetersDescription = '”‰ Ì„ — „ﬂ⁄»';
  SCubicDecimetersDescription = 'œÌ”Ì„ — „ﬂ⁄»';
  SCubicMetersDescription = '„ — „ﬂ⁄»';
  SCubicDecametersDescription = 'CubicDecameters';
  SCubicHectometersDescription = 'CubicHectometers';
  SCubicKilometersDescription = 'ﬂÌ·Ê„ — „ﬂ⁄»';
  SCubicInchesDescription = '≈‰‘ „ﬂ⁄»';
  SCubicFeetDescription = 'CubicFeet';
  SCubicYardsDescription = 'CubicYards';
  SCubicMilesDescription = 'CubicMiles';
  SMilliLitersDescription = 'MilliLiters';
  SCentiLitersDescription = 'CentiLiters';
  SDeciLitersDescription = 'DeciLiters';
  SLitersDescription = 'Liters';
  SDecaLitersDescription = 'DecaLiters';
  SHectoLitersDescription = 'HectoLiters';
  SKiloLitersDescription = 'KiloLiters';
  SAcreFeetDescription = 'AcreFeet';
  SAcreInchesDescription = 'AcreInches';
  SCordsDescription = 'Cords';
  SCordFeetDescription = 'CordFeet';
  SDecisteresDescription = 'Decisteres';
  SSteresDescription = 'Steres';
  SDecasteresDescription = 'Decasteres';

  { American Fluid Units }
  SFluidGallonsDescription = 'FluidGallons';
  SFluidQuartsDescription = 'FluidQuarts';
  SFluidPintsDescription = 'FluidPints';
  SFluidCupsDescription = 'FluidCups';
  SFluidGillsDescription = 'FluidGills';
  SFluidOuncesDescription = 'FluidOunces';
  SFluidTablespoonsDescription = 'FluidTablespoons';
  SFluidTeaspoonsDescription = 'FluidTeaspoons';

  { American Dry Units }
  SDryGallonsDescription = 'DryGallons';
  SDryQuartsDescription = 'DryQuarts';
  SDryPintsDescription = 'DryPints';
  SDryPecksDescription = 'DryPecks';
  SDryBucketsDescription = 'DryBuckets';
  SDryBushelsDescription = 'DryBushels';

  { English Imperial Fluid/Dry Units }
  SUKGallonsDescription = 'UKGallons';
  SUKPottlesDescription = 'UKPottle';
  SUKQuartsDescription = 'UKQuarts';
  SUKPintsDescription = 'UKPints';
  SUKGillsDescription = 'UKGill';
  SUKOuncesDescription = 'UKOunces';
  SUKPecksDescription = 'UKPecks';
  SUKBucketsDescription = 'UKBuckets';
  SUKBushelsDescription = 'UKBushels';

  { ************************************************************************* }
  { Mass's family type }
  SMassDescription = '«·√Ê“«‰';

  { Mass's various conversion types }
  SNanogramsDescription = '‰«‰Ê €—«„';
  SMicrogramsDescription = '„Ìﬂ—Ê €—«„';
  SMilligramsDescription = '„Ì·Ì €—«„';
  SCentigramsDescription = '”‰ Ì€—«„';
  SDecigramsDescription = 'œÌ”Ì€—«„';
  SGramsDescription = '€—«„';
  SDecagramsDescription = 'œÌﬂ« €—«„';
  SHectogramsDescription = 'ÂÌﬂ Ê€—«„';
  SKilogramsDescription = 'ﬂÌ·Ê€—«„';
  SMetricTonsDescription = 'ÿ‰ „ —Ì';
  SDramsDescription = 'Drams';
  SGrainsDescription = 'Grains';
  STonsDescription = 'ÿ‰';
  SLongTonsDescription = 'LongTons';
  SOuncesDescription = 'Ounces';
  SPoundsDescription = 'Pounds';
  SStonesDescription = 'Stones';

  { ************************************************************************* }
  { Temperature's family type }
  STemperatureDescription = '«·Õ—«—…';

  { Temperature's various conversion types }
  SCelsiusDescription = '”Ì·”ÌÊ”';
  SKelvinDescription = 'ﬂÌ·›‰';
  SFahrenheitDescription = '›«Â—‰Â«Ì ';
  SRankineDescription = '—«‰ﬂÌ‰';
  SReaumurDescription = '—Ì«„Ê—';

  { ************************************************************************* }
  { Time's family type }
  STimeDescription = '«·Êﬁ ';

  { Time's various conversion types }
  SMilliSecondsDescription = '„Ì·Ì À«‰Ì…';
  SSecondsDescription = 'À«‰Ì…';
  SMinutesDescription = 'œﬁÌﬁ…';
  SHoursDescription = '”«⁄…';
  SDaysDescription = 'ÌÊ„';
  SWeeksDescription = '√”»Ê⁄';
  SFortnightsDescription = '√”»Ê⁄«‰';
  SMonthsDescription = '‘Â—';
  SYearsDescription = '”‰…';
  SDecadesDescription = '⁄ﬁœ';
  SCenturiesDescription = 'ﬁ—‰';
  SMillenniaDescription = '√·›Ì…';
  SDateTimeDescription = ' «—ÌŒ ÊÊﬁ ';
  SJulianDateDescription = '«· ﬁÊÌ„ «·ÌÊ·ÌÊ”Ì';
  SModifiedJulianDateDescription = '«· ﬁÊÌ„ «·ÌÊ·ÌÊ”Ì «·„⁄œ·';

  SInvalidDate = '''''%s'''' is not a valid date' deprecated 'Use SysConst.SInvalidDate';
  SInvalidDateTime = '''''%s'''' is not a valid date and time' deprecated 'Use SysConst.SInvalidDateTime';
  SInvalidInteger = '''''%s'''' is not a valid integer value' deprecated 'Use SysConst.SInvalidInteger';
  SInvalidTime = '''''%s'''' is not a valid time' deprecated 'Use SysConst.SInvalidTime';
  STimeEncodeError = 'Invalid argument to time encode' deprecated 'Use SysConst.STimeEncodeError';

  SGUIDAlreadyDefined = 'GUID ''%s'' was previously registered';
  SNoComComponent = 'Constructing COM object ''%s'' for which there is no wrapper component';
  SNoComClass = '%s.GetComClass returned nil';
  SNoCOMClassSpecified = 'No ComClass specified';
  SNoCOMClassesRegistered = 'No COM classes have been registered';

  SNoContext = 'No context-sensitive help installed';
  SNoContextFound = 'No help found for context %d';
  SNoIndex = 'Unable to open Index';
  SNoSearch = 'Unable to open Search';
  SNoTableOfContents = 'Unable to find a Table of Contents';
  SNoTopics = 'No topic-based help system installed';
  SNothingFound = 'No help found for %s';

  SMethodNotFound = 'Method %s of class %s not found';
  STypeMisMatch = 'Type mismatch in parameter %d for method %s';
  SInvalidDispID = 'Invalid DispID for parameter %d in method %s';
  SParamRequired = 'Parameter %d required for method %s';
  SMethodOver = 'Method definition for %s has over %d parameters';
  STooManyParams = 'Too many parameters for method %s';
  SNoRTTIInfoType = 'Unable to invoke method %s that use unpublished type';
  SResultIsExtended = '10bytes-Extended type in method %s'' return type is not supported';
  SParamIsExtended = '10bytes-Extended type in parameter %d in method %s is not supported';

  SArgumentOutOfRange = '«·„ €Ì— Œ«—Ã «·„œÏ «·„”„ÊÕ';
  SArgumentNil = '«·„ €Ì— ÌÃ» √‰ ·«ÌﬂÊ‰ Œ«·Ì Nil';
  SErrorCantModifyWhileIterating = 'Cannot modify a collection while iterating';
  SUnbalancedOperation = 'Unbalanced stack or queue operation';
  SGenericItemNotFound = '«·⁄‰’— €Ì— „ÊÃÊœ';
  SGenericDuplicateItem = '«·ﬁÌ„ «·„ﬂ——… €Ì— „”„ÊÕ…';

  SSpinLockInvalidOperation = 'Thread tracking isn''t enabled';
  SSpinLockReEntered = 'SpinLock has been re-entered on the same thread';
  SSpinLockNotOwned = 'SpinLock not owned by the current thread';

  SInsufficientRtti = 'Insufficient RTTI available to support this operation';
  SParameterCountMismatch = '⁄œœ «·„ €Ì—«  €Ì— „ÿ«»ﬁ';
  SParameterCountExceeded = ' „  ŒÿÌ ⁄œœ «·„ €Ì—« ';
  SConversionError = '‰„ÿ €Ì— „ Ê«›ﬁ';
  SNonPublicType = 'Type ''%s'' is not declared in the interface section of a unit';
  SByRefArgMismatch = 'VAR and OUT arguments must match parameter type exactly';

  SInsufficientReadBuffer = 'Insufficient buffer for requested data';

  SInvalid7BitEncodedInteger = 'Invalid 7 bit integer stream encoding';
  SNoSurrogates = 'Surrogates not allowed as a single char';
  SInvalidStringLength = 'Invalid string length';
  SReadPastEndOfStream = 'Attempt to read past end of stream';

  SInvalidGuidArray = 'Byte array for GUID must be exactly %d bytes long';

  SServiceNotFound = 'Specified Login Credential Service not found';

  { Class group report strings }

  sClassGroupHeader = 'Group[%d] - Active: %s';
  sGroupClassesHeader = '  Group Classes';
  sClassListHeader = '  Classes';
  sClassAliasesHeader = '  Class Aliases';

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
  SVersionStr = '%s («·≈’œ«—… %d.%d, «·»‰«¡ %d, %5:s)';
  SSPVersionStr = '%s Õ“„… «·Œœ„… %4:d («·≈’œ«—… %1:d.%2:d, «·»‰«¡ %3:d, %5:s)';
  SVersion32 = '≈’œ«— 32 » ';
  SVersion64 = '≈’œ«— 64 » ';
  SWindows = 'ÊÌ‰œÊ“';
  SWindowsVista = 'ÊÌ‰œÊ“ ›Ì” «';
  SWindowsServer2008 = 'Windows Server 2008';
  SWindows7 = 'ÊÌ‰œÊ“ 7';
  SWindowsServer2008R2 = 'Windows Server 2008 R2';
  SWindows2000 = 'Windows 2000';
  SWindowsXP = 'ÊÌ‰œÊ“ ≈ﬂ” »Ì';
  SWindowsServer2003 = 'Windows Server 2003';
  SWindowsServer2003R2 = 'Windows Server 2003 R2';
  SWindowsServer2012 = 'Windows Server 2012';
  SWindowsServer2012R2 = 'Windows Server 2012 R2';
  SWindows8 = 'ÊÌ‰œÊ“ 8';
  SWindows8Point1 = 'ÊÌ‰œÊ“ 8.1';
  SWindows10 = 'ÊÌ‰œÊ“ 10';
  SItaskbarInterfaceException = '%s interface is not supported on this OS version';
  SHookException = 'Could not hook messages, buttons and preview events will not work';
  SInitializeException = 'Could not initialize taskbar. Error: %d';
  SInstanceException = 'There is another taskbar control instance';
  SButtonsLimitException = 'Windows taskbar only supports %d buttons on preview tabs';
  SCouldNotRegisterTabException = 'Could not register tab. Error %d';
  SInvalidProgressValueException = '%d is incorrect. Should be between 0 and %d';
  SThumbPreviewException = 'Failed to set bitmap as thumbnail preview. Error: %d';
  SBitmapPreviewException = 'Failed to set bitmap as preview. Error: %d';
  { WinRT support strings }
  SWinRTNoRTTI = 'No RTTI information found for class %s';
  SWinRTInstanceError = 'Cannot create instance of class %s';
  SWinRTICreatedError = 'The created instance of class %s is wrong';
  SWinRTHStringError = 'Error creating HString for %s';
  SWinRTFactoryError = 'Cannot get factory for class %s';
  SWinRTWrongFactoryError = 'The factory obtained for %s is wrong';
  SWinRTInteropError = 'Cannot create interop class';
{$ENDIF}
{$IF defined(MACOS) or defined(ANDROID)}
  SVersionStr = '%s (Version %d.%d.%d)';
{$ENDIF}
  { Zip Strings}
  SZipErrorRead            = 'Error reading zip file';
  SZipErrorWrite           = 'Error writing zip file';
  SZipInvalidLocalHeader   = 'Invalid Zip Local Header signature';
  SZipInvalidCentralHeader = 'Invalid Zip Central Header signature';
  SZipNotSupported         = 'Support for compression method not registered: %s';
  SZipNotOpen              = 'File must be open';
  SZipNoWrite              = 'File must be open for writing';
  SZipNoRead               = 'File must be open for reading';
  SZipNotEmpty             = 'Zip file must be empty';
  SZipFileNameEmpty        = 'File name must not be empty';

  sObserverUnsupported = 'Observer is not supported';
  sObserverMultipleSingleCast = 'Cannot have multiple single cast observers added to the observers collection';
  sObserverNoInterface = 'The object does not implement the observer interface';
  sObserverNoSinglecastFound = 'No single cast observer with ID %d was added to the observer collection';
  sObserverNoMulticastFound = 'No multi cast observer with ID %d was added to the observer collection';
  sObserverNotAvailable = 'Observer is not available';

  SGeocodeMultipleRequests = 'Cannot initiate two or more geocoding requests at the same time';
  SLocationSensorStarted = 'The location sensor is started';
  SSensorIndexError = 'The sensor on the specified index (%d) is not found';
                                                          
{IFDEF MACOS}
  SLocationServiceUnauthorized = 'Unauthorized to use location services';
  SLocationServiceDisabled = 'Location services are disabled';
{ENDIF}

  {$IFDEF ANDROID}
  SAssetFileNotFound = 'Cannot deploy, "%s" file not found in assets';
  SExternalExtorageNotAvailable = 'Cannot have access to external storage on device';
  {$ENDIF}

  { System.DateUtils }
  SInvalidDateString = '‰’ «· «—ÌŒ €Ì— „ﬁ»Ê·: %s';
  SInvalidTimeString = '‰’ «·Êﬁ  €Ì— „ﬁ»Ê·: %s';
  SInvalidOffsetString = '‰’ ≈“«Õ… «·Êﬁ  €Ì— „”„ÊÕ…: %s';

  { System.Devices }
  sCannotManuallyConstructDevice = 'Manual construction of TDeviceInfo is not supported'; // move to System.RTLConsts.
  sAttributeExists = 'Attribute ''%s'' already exists';
  sDeviceExists = 'Device ''%s'' already exists';

  { System.Hash }
  SHashCanNotUpdateMD5 = 'MD5: Cannot update a finalized hash';
  SHashCanNotUpdateSHA1 = 'SHA1: Cannot update a finalized hash';
  SHashCanNotUpdateSHA2 = 'SHA2: Cannot update a finalized hash';

  { System.NetEncoding }
  sErrorDecodingURLText = 'Error decoding URL style (%%XX) encoded string at position %d';
  sInvalidURLEncodedChar = 'Invalid URL encoded character (%s) at position %d';
  sInvalidHTMLEncodedChar = 'Invalid HTML encoded character (%s) at position %d';

  { System.Threading }
  sStopAfterBreak = 'The Break method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sBreakAfterStop = 'The Stop method was previously called. Break and Stop may not be used in combination in iterations of the same loop';
  sInvalidTaskConstruction = 'Cannot construct an ITask in this manner';
  sEmptyJoinTaskList = 'List of tasks to Join method empty';
  sWaitNilTask = 'At least one task in array nil';
  sCannotStartCompletedTask = 'Cannot start a task that has already completed';
  sOneOrMoreTasksCancelled = 'One or more tasks were cancelled';
  sDefaultAggregateExceptionMsg = 'One or more errors occurred';

  { System.Types }
  sMustWaitOnOneEvent = 'Must wait on at least one event';

  { TComponent.BeginInvoke }
  sBeginInvokeDestroying = 'Cannot call BeginInvoke on a TComponent in the process of destruction';

  { System.ShareContract }
  SShareContractNotAvailable = 'ShareContract not available';
  SShareContractNotSupported = 'Sharing not supported under %s';
  SShareContractNotInitialized = 'TShareContract.OnProcessMessages event must be assigned first';


const
  SEmpty: string = 'Empty';  // do not localize
  SMenuSeparator: string = '-';   // do not localize

implementation

end.
