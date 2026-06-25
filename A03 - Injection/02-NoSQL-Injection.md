# NoSQL Injection | حقن NoSQL

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - NoSQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-NoSQL-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/NoSQL-Injection/)

---

## 📌 Definition (التعريف)

> ثغرة NoSQL Injection تحدث عندما يقوم التطبيق بتمرير مدخلات المستخدم مباشرة إلى استعلامات قواعد البيانات غير العلائقية (مثل MongoDB) دون فلترة. على عكس SQL التقليدية، يستخدم NoSQL عوامل تشغيل خاصة مثل `$ne`, `$gt`, `$regex` ضمن صيغة JSON. المهاجم يستطيع حقن هذه العوامل لتجاوز التحقق من كلمة المرور، أو استخراج جميع البيانات من قاعدة البيانات، أو حتى تنفيذ أوامر JavaScript على السيرفر في بعض الحالات.

---

## 🧩 أنواعها الرئيسية | Main Types

- **حقن عوامل التشغيل (Operator Injection)**: استخدام عوامل MongoDB مثل `$ne` (لا يساوي) أو `$gt` (أكبر من) لتجاوز شروط الاستعلام الأصلي.

- **تجاوز تسجيل الدخول (Authentication Bypass)**: حقن عوامل تشغيل في بارامترات JSON الخاصة باسم المستخدم وكلمة المرور للدخول بدون بيانات صحيحة.

- **استخراج البيانات عبر Regex (Data Extraction)**: استخدام عامل `$regex` لاختبار الأحرف واحداً تلو الآخر واستخراج كلمات المرور أو البيانات الحساسة.

- **حقن النصوص (String Injection)**: استغلال تحويل النصوص في استعلامات NoSQL لحقن شروط إضافية.

- **حقن بصيغة مشوهة (Malformed Syntax)**: إرسال مدخلات JSON غير صحيحة الشكل لاستغلال أخطاء التحليل في قاعدة البيانات.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تنقية المدخلات:** ارفض أي مدخلات تحتوي على عوامل تشغيل MongoDB مثل `$ne`, `$gt`, `$regex` إلخ، أو قم بإزالتها قبل تمريرها للاستعلام.

- **استخدام مكتبات آمنة:** استخدم مكتبات ODM/ORM مثل Mongoose التي تقوم بالتحقق من نوع البيانات وفلترة المدخلات تلقائياً.

- **تحديد نوع البيانات (Type Casting):** تأكد من أن المدخلات تعامل كنصوص (String) وليس ككائنات (Object)، لأن حقن العوامل يعتمد على تمرير كائنات JSON.

- **استخدام قائمة بيضاء (Whitelist):** حدد الحقول المسموح بها في الاستعلامات وارفض أي حقول إضافية.

- **تحديث قواعد البيانات:** استخدم أحدث إصدارات MongoDB وNoSQL مع تفعيل إعدادات الأمان الافتراضية.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - NoSQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-NoSQL-Injection-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| NoSQL injection (basic) | Apprentice | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/01-basic.md) |
| NoSQL injection with operator injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/02-operator-injection.md) |
| NoSQL injection with string injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/03-string-injection.md) |
| NoSQL injection using malformed syntax | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/04-malformed-syntax.md) |
