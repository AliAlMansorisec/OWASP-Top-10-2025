# Insecure Deserialization | إلغاء التسلسل غير الآمن

> **OWASP Category:** [A08 - Software and Data Integrity Failures](../README.md)  
> **Methodology:** [Step-?? - Deserialization Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Deserialization-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Deserialization/)

---

## 📌 Definition (التعريف)

> ثغرة Insecure Deserialization تحدث عندما يقوم التطبيق بتحويل بيانات "مسلسلة" (Serialized) قادمة من المستخدم إلى كائنات برمجية (Objects) دون التحقق من سلامتها. عملية "إلغاء التسلسل" (Deserialization) تعيد بناء الكائن بلغات مثل Java, PHP, Python, .NET. المهاجم يستطيع تعديل البيانات المسلسلة لإنشاء كائنات خبيثة تؤدي إلى Remote Code Execution (RCE)، أو SQL Injection، أو تجاوز الصلاحيات، أو حتى هجمات الحرمان من الخدمة.

---

## 🧩 أنواعها الرئيسية | Main Types

- **تعديل الكائنات المسلسلة (Modifying Serialized Objects)**: تغيير قيم الخصائص داخل الكائن المسلسل (مثل تغيير `isAdmin: false` إلى `true`) للتلاعب بسلوك التطبيق.

- **تعديل أنواع البيانات (Modifying Data Types)**: تغيير نوع البيانات المسلسلة (مثل تحويل String إلى Array) لاستغلال ضعف التحقق من النوع.

- **حقن كائنات عشوائية (Arbitrary Object Injection)**: إنشاء كائنات من كلاسات غير متوقعة تؤدي إلى تنفيذ عمليات خطيرة عند إلغاء التسلسل.

- **استغلال سلاسل الأدوات (Gadget Chains)**: استخدام مجموعة من الكلاسات الموجودة في المكتبات المستخدمة لبناء هجوم متسلسل يؤدي إلى RCE.

- **PHAR Deserialization (PHP)**: استغلال ملفات PHAR في PHP التي تقوم بإلغاء التسلسل تلقائياً عند استخدام دوال الملفات.

- **Java Deserialization مع مكتبات شائعة**: استغلال مكتبات مثل Apache Commons Collections لتنفيذ أوامر عبر Gadget Chains جاهزة.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **لا تثق في المدخلات:** لا تقم بإلغاء تسلسل بيانات من المستخدم أبداً إن أمكن.

- **استخدام صيغ آمنة:** استخدم JSON أو XML بدلاً من Serialization الأصلي للغات البرمجة.

- **التحقق من التوقيع الرقمي:** وقع البيانات المسلسلة رقمياً (HMAC) وتحقق من التوقيع قبل إلغاء التسلسل.

- **تقييد الكلاسات المسموحة:** استخدم القائمة البيضاء (Whitelist) للكلاسات المسموح إلغاء تسلسلها.

- **عزل بيئة إلغاء التسلسل:** قم بتشغيل عملية إلغاء التسلسل في بيئة معزولة (Sandbox) بصلاحيات محدودة.

- **تحديث المكتبات:** استخدم أحدث إصدارات المكتبات وتجنب المكتبات التي تحتوي على Gadget Chains معروفة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Deserialization Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Deserialization-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Modifying serialized objects | Apprentice | [الحل](../../../portswigger-labs/Advanced/Deserialization/01-modifying-objects.md) |
| Modifying serialized data types | Apprentice | [الحل](../../../portswigger-labs/Advanced/Deserialization/02-modifying-types.md) |
| Using application functionality to exploit insecure deserialization | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/03-app-functionality.md) |
| Arbitrary object injection in PHP | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/04-php-injection.md) |
| Exploiting Java deserialization with Apache Commons | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/05-java-commons.md) |
| Exploiting PHP deserialization with a pre-built gadget chain | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/06-php-gadget-chain.md) |
| Exploiting Ruby deserialization using a documented gadget chain | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/07-ruby-gadget-chain.md) |
| Developing a custom gadget chain for Java deserialization | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/08-custom-java-chain.md) |
| Developing a custom gadget chain for PHP deserialization | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/09-custom-php-chain.md) |
| Using PHAR deserialization to deploy a custom gadget chain | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/10-phar-deserialization.md) |
