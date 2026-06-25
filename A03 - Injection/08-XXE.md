# XXE Injection (XML External Entity) | حقن الكيانات الخارجية XML

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - XXE Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-XXE-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/XXE/)

---

## 📌 Definition (التعريف)

> ثغرة XXE تحدث عندما يقبل التطبيق مدخلات XML ويعالجها باستخدام مكتبة تحليل XML (XML Parser) مهيأة بشكل غير آمن. المهاجم يستغل خاصية "الكيانات الخارجية" (External Entities) في لغة XML لإجبار السيرفر على جلب ملفات داخلية، أو تنفيذ طلبات SSRF، أو التفاعل مع خدمات خارجية. هذه الثغرة تستهدف السيرفر نفسه من خلال محتوى XML خبيث.

---

## 🧩 أنواعها الرئيسية | Main Types

- **XXE لاسترجاع الملفات (File Retrieval)**: إجبار السيرفر على قراءة محتوى ملفات النظام (مثل `/etc/passwd`) وإعادتها في استجابة HTTP.

- **XXE لتنفيذ SSRF**: استخدام الكيان الخارجي لإجبار السيرفر على الاتصال بعناوين داخلية أو خارجية، مما يحولها إلى هجوم SSRF.

- **XXE أعمى مع تفاعل خارجي (Blind XXE - OAST)**: عندما لا تظهر نتيجة الملف مباشرة، يتم إجبار السيرفر على الاتصال بـ Burp Collaborator أو خادم خارجي.

- **XXE أعمى مع كيانات معامل (Blind XXE - Parameter Entities)**: استخدام كيانات XML داخلية لاستخراج بيانات أو التفاعل مع خدمات خارجية في حالة عدم ظهور الناتج.

- **XXE عبر رفع الملفات (File Upload)**: استغلال صيغ ملفات تعتمد على XML مثل SVG أو DOCX لتنفيذ XXE عند معالجة الملف.

- **XXE مع رسائل الخطأ (Error-Based)**: إجبار السيرفر على إظهار محتويات ملف حساس داخل رسالة خطأ عند فشل تحليل XML.

- **XInclude**: استخدام تقنية XInclude بدلاً من الكيانات الخارجية لاسترجاع الملفات عندما تكون الكيانات معطلة.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تعطيل الكيانات الخارجية (Disable External Entities):** قم بتعطيل معالجة DTD والكيانات الخارجية في إعدادات محلل XML.

- **تعطيل DTD بالكامل:** إذا لم تكن بحاجة إلى DTD، قم بتعطيلها نهائياً في إعدادات المحلل.

- **استخدام JSON بدلاً من XML:** إذا أمكن، استخدم JSON كبديل لـ XML لتجنب مشاكل الكيانات الخارجية.

- **التحقق من المدخلات (Input Validation):** تحقق من صحة بيانات XML وارفض أي مدخلات تحتوي على تعريفات DOCTYPE.

- **تحديث مكتبات XML:** استخدم أحدث إصدارات مكتبات تحليل XML مع إعدادات الأمان الافتراضية.

- **استخدام جدار حماية للتطبيقات (WAF):** استخدم WAF لتصفية طلبات XML الخبيثة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - XXE Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-XXE-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Exploiting XXE to retrieve files | Apprentice | [الحل](../../../portswigger-labs/Server-Side/XXE/01-retrieve-files.md) |
| Exploiting XXE to perform SSRF attacks | Apprentice | [الحل](../../../portswigger-labs/Server-Side/XXE/02-ssrf.md) |
| Blind XXE with out-of-band interaction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/03-blind-oast.md) |
| Blind XXE with parameter entities | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/04-blind-parameter-entities.md) |
| Exploiting XXE via image file upload | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/05-image-upload.md) |
| Exploiting XXE to read files using error messages | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/06-error-messages.md) |
| Exploiting XInclude to retrieve files | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/07-xinclude.md) |
| Exploiting XXE via SVG file upload | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/08-svg-upload.md) |
| Exploiting XXE via SOAP parameter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/09-soap.md) |
