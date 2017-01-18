# Arabic-Delphi-VCL-Units
وحدات مكتبة أدوات دلفي الداعمة للغة العربية


- دعم صناديق الرسائل العربية
- تحويل مكونات هامة إلى اليمين 
- تعريب الكثير من الرسائل التي قد تظهر في زمن التشغيل
- لايحتاج استخدامها لإضافة أي كود

_______________
طريقة التشغيل :
فقط قم بارفقات ملفات الوحدات مع برنامجك 
ضعها بنفس المجلد مع بقية ملفات برنامجك 
وسيتم التعامل معها اليا من دون تغير اي سطر في الكود

-يفضل ان تقوم بوضع السطر Application.BiDiMode:= bdRightToLeft; عند بدء تنفيذ المشروع لانه مفيد ببعض الحالات


_______________
البيئات المدعومة حاليا :
- Delphi 10.1 Berline


_______________
المشاكل المعروفة :
ToolBar DrawingStyle = dsNormal : يتسبب بانقلاب الصور , يمكن تلافي ذلك باختيار DrawingStyle = dsGradient
التلميحات : Hints لاتعمل بشكل صحيح
عند استخدام الثيمات تنقلب بعض النصوص لإصلاح ذلك يتم الغاء خاصية styleElement : seClient مما قد يتسبب باختلاف شكل المكون قليلا عن شكل الثيم
تم ازالة الضبط الالي للمشروع الى يمين لليسار باعتبار ان المستخدك قد يصمم مشاريع من اليسار لليمين ولا يحق للوحدات ان تضبط هذه الميزة افتراضيا . لذلك يجب ان تقوم يدويا بوضع السطر : Application.BiDiMode:= bdRightToLeft; عند بدء التنفيذ

English :
This is a replacement for VCL Standard Unites to make them support Right to Left RTL Alignment ( BidiMode = bdRightToLeft ) and Translate alot of Arabic Messages and Strings , including : RTL ToolBar RTL TreeView RTL PageControl RTL DateTimePicker RTL StatusBar RTL ListView etc ...

_______________
روابط :

- سيتم تطوير هذه الملفات بشكل دوري وتوفير نسخ احدث منها
لمتابعة تطوير الملفات : 
https://github.com/orwah/Arabic-Delphi-VCL-Units/

- للحصول على آخر نسخة من الملفات : 
https://github.com/orwah/Arabic-Delphi-VCL-Units/archive/master.zip

- للمزيد من المعلومات والشروحات : 
https://github.com/orwah/Arabic-Delphi-VCL-Units/wiki

_______________
عروة علي عيسى
 www.orwah.net
 www.orwah.net
