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
{                Delphi Runtime Library                 }
{                                                       }
{ Copyright(c) 1995-2018 Embarcadero Technologies, Inc. }
{              All rights reserved                      }
{                                                       }
{*******************************************************}

unit Data.Win.ADOConst;

interface

resourcestring
  SInvalidEnumValue = 'قيمة ترتيب غير صالحة';
  SMissingConnection = 'لم يتم ضبط إعدادات الاتصال بالقاعدة بشكل صحيح : ConnectionString';
  SNoDetailFilter = 'لايمكن استخدام خاصية الفلترة مع جدول نفصيلي مرتبط بجدول رئيسي';
  SBookmarksRequired = 'مجموعة البيانات لاتدعم مؤشر bookmarks, وهي ضرورية للمكونات التي تتعامل مع السجلات المتعددة'; 
  SMissingCommandText = 'الخاصية %s غير متوفرة';
  SNoResultSet = 'نص الأمر لايرجع قيمة';
  SADOCreateError = 'خطأ في إنشاء غرض.  الرجاء التأكد أن مكونات الوصول للبيانات الخاصة بمايكروسوفت تم تنصيبها على جهازك :'+#13+ 'Microsoft Data Access Components 2.1 (or later) .';
  SEventsNotSupported = 'Events are not supported with server side TableDirect cursors';
  SUsupportedFieldType = 'نم بيانات غير مدعوم , من نوع (%s) في الحقل %s';
  SNoMatchingADOType = 'لايوجد نمط مطابق من مكونات أدو : ADO data type من أجل %s';
  SConnectionRequired = 'مكون الاتصال connection مطلوب من أجل خيارات التنفيذ المتزامنة';
  SCantRequery = 'لايمكن إجراء إعادة الاستعلام بعد تغيير الاتصال';
  SNoFilterOptions = 'خيارات الفلترة غير مدعومة';
  SRecordsetNotOpen = 'مجموعة السجلات ليست مفتوحة';
  sNameAttr = 'الاسم';
  sValueAttr = 'القيمة';

implementation

end.
 
