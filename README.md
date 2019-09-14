# Arabic-Delphi-VCL-Units
# Delphi RTL BidiRightToLeft Arabic VCL Units
وحدات مكتبة مكونات دلفي الداعمة للغة العربية

آخر تعديل : 14/9/2019

هي عبارة عن جهد متواضع الهدف منه تحديث وحدات ومكتبات دلفي القياسية بحيث تدعم اللغة العربية والرصف من اليمين لليسار , وبالتالي لاتحتاج تنصيب أي مكونات إضافية أو إجراء أي تعديلات على الكود . ويكفي إرفاقها ضمن ملفات المشروع وسيتم تعريب مكونات المشروع تلقائيا .

الملفات مفيدة وطريقة استخدامها سهلة ولكنها لاتزال تحتاج إلى الكثير من العمل , وفيها أخطاء ومشاكل , لذلك تم وضعها هنا للمساعدة في تصحيحها وتحسينها من قبل عدد اكبر من المطورين وعلى فترات زمنية متلاحقة .

_______________
الميزات الرئيسية 

- دعم صناديق الرسائل العربية
- تحويل المكونات إلى اليمين
- تعريب الكثير من النصوص التي تظهر في زمن التشغيل
- لايحتاج استخدامها لإضافة أي كود
- لايحتاج استخدامها لتنصيب أي مكون

![](https://github.com/orwah/Arabic-Delphi-VCL-Units/blob/master/Pics/1.png)

_______________
طريقة التشغيل :
- إذا اردت استخدام الوحدات في مشروع واحد فقط تستطيع إرفقات ملفات الوحدات مباشرة مع المشروع 
.ضعها بنفس المجلد مع بقية وحدات المشروع وسيتم التعامل معها اليا من دون تغير اي سطر في الكود
- أو بإمكانك فصلها في مجلد منفصل عن ملفات المشروع , ووضع روابط لها من ملف المشروع 
Project.dpr :
![](https://github.com/orwah/Arabic-Delphi-VCL-Units/blob/master/Pics/add_units_folder_to_project_dpr.png)
- لاستخدامها في كل المشاريع , وبدلا من اضافة الوحدات كل مرة , يكفي إضافة مسار الوحدات إلى لائحة مسارات مكتبة دلفي من خيار :

tools -> Options -> Library -> Library Path
وسيتم التعامل معها اليا بدل الملفات الافتراضية باعتبارها موجوده بعد الملفات الرئيسية في ترتيب الاستخدام 

_______________
البيئات المدعومة حاليا :
- Delphi 10.1 Berline
- Delphi 10.2 Tokyo
- Delphi 10.3 Rio
- قد تعمل الملفات نفسها على إصدارات أقدم ولكن لم يتم تجربتها 


_______________
بعض المشاكل المعروفة :

- ToolBar DrawingStyle = dsNormal :
 يتسبب بانقلاب الصور , يمكن تلافي ذلك باختيار 
DrawingStyle = dsGradient 
- التلميحات : Hints قد لاتعمل بشكل صحيح
- عند استخدام الثيمات قد تنقلب بعض النصوص 
ولإصلاح ذلك يتم الغاء خاصية 
styleElement : seClient 
مما قد يتسبب باختلاف شكل المكون قليلا عن شكل الثيم

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
English :
- This is a replacement for VCL Standard Unites to make them support Right to Left RTL Alignment  ( BidiMode = bdRightToLeft ) and Translate alot of Arabic Messages and Strings , 
including :
RTL ToolBar
RTL TreeView
RTL PageControl
RTL DateTimePicker
RTL StatusBar
RTL ListView 
etc ...

_______________
عروة علي عيسى
- www.orwah.net
- www.sy-it.com
