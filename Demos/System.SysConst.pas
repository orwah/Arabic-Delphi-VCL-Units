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

unit System.SysConst;

{$IFDEF ANDROID}
{$define USE_LIBICU}
{$ENDIF ANDROID}

interface

resourcestring
  SUnknown = '<€Ì— „⁄—Ê›>';
  SInvalidInteger = '''%s'' ·Ì”  ﬁÌ„… „‰«”»… ·—ﬁ„ ’ÕÌÕ (»·« ›«’·…)';
  SInvalidFloat = '''%s'' ·Ì”  ﬁÌ„… „‰«”»… ·—ﬁ„ ⁄‘—Ì (›«’·… ⁄«∆„…)';
  SInvalidCurrency = '''%s'' ·Ì” ﬁÌ„… „‰«”»… ··œ›⁄«  «·‰ﬁœÌ…';
  SInvalidDate = '''%s'' ·Ì”  «—ÌŒ ’«·Õ';
  SInvalidTime = '''%s'' ·Ì” Êﬁ  ’«·Õ';
  SInvalidDateTime = '''%s'' ·Ì”  ﬁÌ„… „‰«”»… ·· «—ÌŒ';
  SInvalidDateTimeFloat = '''%g'' ·Ì”  ﬁÌ„… „‰«”»… ·· «—ÌŒ Ê«·Êﬁ ';
  SInvalidTimeStamp = '''%d.%d'' ·Ì”  ﬁÌ„… „‰ÿﬁ… “„‰Ì… „‰«”»…';
  SInvalidGUID = '''%s'' ·Ì”  ﬁÌ„… GUID ’«·Õ…';
  SInvalidBoolean = '''%s'' ·Ì”  ﬁÌ„… »Ê·Ì«‰Ì… „‰«”»…';
  STimeEncodeError = '„⁄«„·  ‰”Ìﬁ «·Êﬁ  €Ì— „”„ÊÕ';
  SDateEncodeError = '„⁄«„·  ‰”Ìﬁ «· «—ÌŒ €Ì— „”„ÊÕ';
  SOutOfMemory = '«·–«ﬂ—… ·« ﬂ›Ì';
  SInOutError = 'Œÿ√ „‰ ‰Ê⁄ ≈œŒ«· /≈Œ—«Ã %d';
  SFileNotFound = '«·„·› €Ì— „ÊÃÊœ';
  SInvalidFilename = '«”„ „·› €Ì— ’«·Õ';
  STooManyOpenFiles = '«·„·›«  «·„› ÊÕ… √ﬂÀ— „‰ «·„ Êﬁ⁄';
  SAccessDenied = ' „ —›÷ «·Ê’Ê· ··„·›';
  SEndOfFile = ' Ã—Ì «·ﬁ—«¡… Œ·› ‰Â«Ì… »Ì«‰«  «·„·›';
  SDiskFull = '«·ﬁ—’ „„ ·∆';
  SInvalidInput = '≈œŒ«· ﬁÌ„… —ﬁ„Ì… €Ì— ’«·Õ…';
  SDivByZero = '«· ﬁ”Ì„ ⁄·Ï ’›—';
  SRangeError = 'Œÿ√ ›Ì ›Õ’ «·„Ã«· «·„”„ÊÕ';
  SIntOverflow = 'ﬁÌ„… ⁄œœ ’ÕÌÕ ›«∆÷…';
  SInvalidOp = '⁄„·Ì… ⁄‘—Ì… €Ì— „”„ÊÕ…';
  SZeroDivide = 'ﬁ”„… ⁄œœ ⁄‘—Ì ⁄·Ï «·’›—';
  SOverflow = 'ﬁÌ„… ⁄œœ ⁄‘—Ì ›«∆÷…';
  SUnderflow = 'ﬁÌ„… ⁄œœ ⁄‘—Ì œÊ‰ «·„”„ÊÕ';
  SInvalidPointer = '⁄„·Ì… „ƒ‘—«  €Ì— „”„ÊÕ…';
  SInvalidCast = ' ÕÊÌ· €Ì— ’«·Õ ··√’‰«›';
{$IFDEF MSWINDOWS}
  SAccessViolationArg3 = 'œŒÊ· «‰ Â«ﬂÌ ··⁄‰Ê«‰ %p. %s „‰ «·⁄‰Ê«‰ %p';
{$ENDIF MSWINDOWS}
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SAccessViolationArg2 = 'œŒÊ· «‰ Â«ﬂÌ ··⁄‰Ê«‰ %p, ⁄‰Ê«‰ «·œŒÊ· %p';
{$ENDIF LINUX or MACOS or ANDROID}
  SAccessViolationNoArg = 'œŒÊ· «‰ Â«ﬂÌ';
  SStackOverflow = '›Ì÷ ›Ì «·„ﬂœ”';
  SControlC = '≈÷€ÿ Control-C';
  SQuit = '≈÷€ÿ “— «·Œ—ÊÃ Quit';
  SPrivilege = '«· ⁄·Ì„…  Õ «Ã ’·«ÕÌ« ';
  SOperationAborted = ' „ «‰Â«¡ «·⁄„·Ì…';
  SException = '«” À‰«¡ %s ›Ì ÊÕœ… %s ›Ì %p.' + sLineBreak + '%s%s' + sLineBreak;
  SExceptTitle = 'Œÿ√ ›Ì «· ÿ»Ìﬁ ';
{$IF Defined(LINUX) or Defined(MACOS) or Defined(ANDROID)}
  SSigactionFailed = 'sigaction call failed';
  SOSExceptionHandlingFailed = 'OS exception handling initialization failed';
{$ENDIF LINUX or MACOS or ANDROID}
  SInvalidFormat = '«· ‰”Ìﬁ ''%s'' €Ì— ’«·Õ √Ê €Ì— „ Ê«›ﬁ „⁄ «·„⁄«„·';
  SArgumentMissing = '·«„⁄«„·  „‰ √Ã· «· ‰”Ìﬁ ''%s''';
  SDispatchError = '«” œ⁄«¡«  «·„‰«ÂÃ „‰ ‰Ê⁄ Variant €Ì— „œ⁄Ê„…';
  SReadAccess = 'ﬁ—«¡…';
  SWriteAccess = 'ﬂ «»…';
  SExecuteAccess = ' ‰›Ì–';
  SInvalidAccess = 'œŒÊ· €Ì— „”„ÊÕ';
  SResultTooLong = '‰ ÌÃ… «· ‰”Ìﬁ √ﬂ»— „‰ 4096 „Õ—›';
  SFormatTooLong = '‰’ «· ‰”Ìﬁ ÿÊÌ· Ãœ«';
{$IFDEF MACOS}
  SCFStringFailed = 'Œÿ√ ›Ì ≈‰‘«¡ CFString';
{$ENDIF MACOS}
{$IF defined(USE_LIBICU)}
  SICUError = 'Œÿ√ ICU : %d, %s';
  SICUErrorOverflow = 'ICU Overflow Error: %d, %s, Needed Length=%d';
{$ENDIF defined(USE_LIBICU)}

  SVarArrayCreate = 'Œÿ√ ›Ì ≈‰‘«¡ «·„ €Ì— √Ê «·„’›Ê›…';
  SVarArrayBounds = '«·›Â—” «·„Õœœ Œ«—Ã «·ÕœÊœ';
  SVarArrayLocked = '«·„ €Ì— √Ê «·„’›Ê›… „ﬁ›·…';
  SVarArrayWithHResult = 'Œÿ√ €Ì— „ Êﬁ⁄ ›Ì «·„ €Ì— «Ê «·„’›Ê›… : %s%.8x';

  SInvalidVarCast = ' €Ì— €Ì— ’«·Õ ·‰„ÿ «·„ ÕÊ· „‰ ‰Ê⁄ variant';
  SInvalidVarOp = '⁄„·Ì… €Ì— ’«·Õ… ⁄·Ï „ ÕÊ· „‰ ‰„ÿ variant';
  SInvalidVarNullOp = '⁄„·Ì… €Ì— ’«·Õ… ⁄·Ï „ €Ì— variant ﬁÌ„ Â  NULL';
  SInvalidVarOpWithHResultWithPrefix = '⁄„·Ì… €Ì— ’«·Õ… ⁄·Ï „ €Ì— „‰ ‰„ÿ variant (%s%.8x)'#10'%s';
  SVarTypeRangeCheck1 = 'Range check error for variant of type (%s)';
  SVarTypeRangeCheck2 = 'Range check error while converting variant of type (%s) into type (%s)';
  SVarTypeOutOfRangeWithPrefix = 'Custom variant type (%s%.4x) is out of range';
  SVarTypeAlreadyUsedWithPrefix = 'Custom variant type (%s%.4x) already used by %s';
  SVarTypeNotUsableWithPrefix = 'Custom variant type (%s%.4x) is not usable';
  SVarTypeTooManyCustom = 'Too many custom variant types have been registered';

  SVarTypeCouldNotConvert = '·«Ì„ﬂ‰  ÕÊÌ· „ ÕÊ· variant „‰ ‰„ÿ (%s) «·Ï ‰„ÿ (%s)';
  SVarTypeConvertOverflow = 'ÕœÀ  Õ«·… ›Ì÷ ⁄‰œ  €ÌÌ— „ ÕÊ· variant „‰ ‰„ÿ (%s) ≈·Ï ‰„ÿ (%s)';
  SVarOverflow = 'ÕœÀ  Õ«·… ›Ì÷ „⁄ „ ÕÊ· „‰ ‰Ê⁄ Variant';
  SVarInvalid = '„⁄«„· €Ì— ’«·Õ';
  SVarBadType = '‰„ÿ „ ÕÊ· variant €Ì— ’«·Õ';
  SVarNotImplemented = '«·⁄„·Ì… €Ì— „œ⁄Ê„…';
  SVarOutOfMemory = '«·⁄„·Ì… ⁄·Ï „ ÕÊ· Variant Œ—Ã  ⁄‰ «·–«ﬂ—… «·„Œ’’…';
  SVarUnexpected = 'Œÿ√ €Ì— „⁄—Ê› ›Ì „ ÕÊ· variant';

  SVarDataClearRecursing = 'Recursion while doing a VarDataClear';
  SVarDataCopyRecursing = 'Recursion while doing a VarDataCopy';
  SVarDataCopyNoIndRecursing = 'Recursion while doing a VarDataCopyNoInd';
  SVarDataInitRecursing = 'Recursion while doing a VarDataInit';
  SVarDataCastToRecursing = 'Recursion while doing a VarDataCastTo';
  SVarIsEmpty = '«·„ ÕÊ· Variant ›«—€';
  sUnknownFromType = '·«Ì„ﬂ‰ «· ÕÊÌ· „‰ «·‰„ÿ «·„Õœœ';
  sUnknownToType = '·«Ì„ﬂ‰ «· ÕÊÌ· ≈·Ï «·‰„ÿ «·„Õœœ';
  SExternalException = '«” À‰«¡ Œ«—ÃÌ %x';
  SAssertionFailed = '›‘· ›Ì «· ÊﬂÌœ';
  SIntfCastError = '«·Ê«ÃÂ… €Ì— „œ⁄Ê„…';
  SSafecallException = 'Exception in safecall method';
  SMonitorLockException = 'Object lock not owned';
  SNoMonitorSupportException = 'Monitor support function not initialized';
  SNotImplemented = '«·„Ì“… €Ì— „œ⁄Ê„…';
  SObjectDisposed = 'Method called on disposed object';
  SAssertError = '%s (%s, «·”ÿ— %d)';
  SAbstractError = 'Abstract Error';
  SModuleAccessViolation = '«‰ Â«ﬂ ›Ì «·Ê’Ê· ··⁄‰Ê«‰ %p ›Ì «·ÊÕœ… ''%s''. %s ··⁄‰Ê«‰ %p';
  SCannotReadPackageInfo = '·«Ì„ﬂ‰ «·œŒÊ· «·Ï „⁄·Ê„«  «·—“„… , ··Õ“„… ''%s''';
  sErrorLoadingPackage = '·«Ì„ﬂ‰  Õ„Ì· «·Õ“„… %s.'+sLineBreak+'%s';
  SInvalidPackageFile = '„·› «·Õ“„… €Ì— ’«·Õ ''%s''';
  SInvalidPackageHandle = '—ﬁ„ „ﬁ»÷ «·Õ“„… €Ì— ’«·Õ';
  SDuplicatePackageUnit = '·«Ì„ﬂ‰  Õ„Ì· «·Õ“„… ''%s.''  «‰Â«  ÕÊÌ «·ÊÕœ… ''%s'', ' +
    'Ê«· Ì ÂÌ «Ì÷« „Õ Ê«… ›Ì «·Õ“„… ''%s''';
  SOSError = 'Œÿ√ ›Ì «·‰Ÿ«„.  «·ﬂÊœ: %d.'+sLineBreak+'%s%s';
  SUnkOSError = '›‘· «” œ⁄«¡ ÊŸÌ›… „‰ «·‰Ÿ«„';
{$IFDEF MSWINDOWS}
  SWin32Error = 'Œÿ√ ÊÌ‰œÊ“32 , «·—„“: %d.'#10'%s' deprecated 'Use SOSError'; 
  SUnkWin32Error = 'A Win32 API function failed' deprecated 'Use SUnkOSError';
{$ENDIF}
  SNL = '«· ÿ»Ìﬁ €Ì— „—Œ’ ·«” Œœ«„ Â–Â «·„Ì“…';

  SShortMonthNameJan = 'ﬂ«2';
  SShortMonthNameFeb = '‘»«';
  SShortMonthNameMar = '¬–«';
  SShortMonthNameApr = '‰Ì”';
  SShortMonthNameMay = '√Ì«';
  SShortMonthNameJun = 'Õ“Ì';
  SShortMonthNameJul = ' „Ê';
  SShortMonthNameAug = '«» ';
  SShortMonthNameSep = '«Ì·';
  SShortMonthNameOct = ' ‘1';
  SShortMonthNameNov = ' ‘2';
  SShortMonthNameDec = 'ﬂ«1';

  SLongMonthNameJan = 'ﬂ«‰Ê‰ «·À«‰Ì';
  SLongMonthNameFeb = '‘»«ÿ';
  SLongMonthNameMar = '¬–«—';
  SLongMonthNameApr = '‰Ì”«‰';
  SLongMonthNameMay = '√Ì«—';
  SLongMonthNameJun = 'Õ“Ì—«‰';
  SLongMonthNameJul = ' „Ê“';
  SLongMonthNameAug = '¬»';
  SLongMonthNameSep = '√Ì·Ê·';
  SLongMonthNameOct = ' ‘—Ì‰ «·√Ê·';
  SLongMonthNameNov = ' ‘—Ì‰ «·À«‰Ì';
  SLongMonthNameDec = 'ﬂ«‰Ê‰ «·√Ê·';

  SShortDayNameSun = '«Õœ';
  SShortDayNameMon = '≈À‰';
  SShortDayNameTue = 'À·«';
  SShortDayNameWed = '√—»';
  SShortDayNameThu = 'Œ„Ì';
  SShortDayNameFri = 'Ã„⁄';
  SShortDayNameSat = '”» ';

  SLongDayNameSun = '«·√Õœ';
  SLongDayNameMon = '«·≈À‰Ì‰';
  SLongDayNameTue = '«·À·«À«¡';
  SLongDayNameWed = '«·√—»⁄«¡';
  SLongDayNameThu = '«·Œ„Ì”';
  SLongDayNameFri = '«·Ã„⁄…';
  SLongDayNameSat = '«·”» ';

{$IFDEF POSIX}
  SEraEntries = '';
{$ENDIF}

  SCannotCreateDir = '·«Ì„ﬂ‰ ≈‰‘«¡ «·„Ã·œ';
  SCodesetConversionError = '›‘· ›Ì  ÕÊÌ· Codeset';

  // Used by TEncoding
  SInvalidSourceArray = '„’›Ê›… «·„’œ— €Ì— ’«·Õ…';
  SInvalidDestinationArray = '„’›Ê›… «·ÊÃÂ… €Ì— ’«·Õ…';
  SCharIndexOutOfBounds = '›Â—” «·„Õ—› Œ«—Ã «·ÕœÊœ (%d)';
  SByteIndexOutOfBounds = '›Â—” «·»œ«Ì… Œ«—Ã «·ÕœÊœ (%d)';
  SInvalidCharCount = ' ⁄œ«œ €Ì— ’«·Õ (%d)';
  SInvalidDestinationIndex = '›Â—” ÊÃÂ… €Ì— ’«·Õ (%d)';
  SInvalidCodePage = '’›Õ… «·ﬂÊœ €Ì— ’«·Õ…';
  SInvalidEncodingName = '«”„ «· —„Ì“ €Ì— ’«·Õ';
  SNoMappingForUnicodeCharacter = '·«ÌÊÃœ  ŒÿÌÿ „‰ «Ã· „Õ«—› ÌÊ‰ÌﬂÊœ „ÊÃÊœ ›Ì ’›Õ… «·ﬂÊœ «·Âœ› multi-byte code page';

implementation

end.
