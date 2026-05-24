# Directory Traversal (File Path Traversal) | اجتياز الدليل

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-?? - Path Traversal Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Path-Traversal.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Path-Traversal/)

---
## 📌 Definition (التعريف)

> هي ثغرة تحدث عندما يطلب منك الموقع تحديد اسم ملف لعرضه (مثل صورة أو ملف نصي)، ولكن بدلاً من إعطائه اسم الملف، تقوم بإعطائه أوامر للرجوع إلى الخلف في مجلدات السيرفر (باستخدام ../). هذا الرمز يخبر السيرفر: "اخرج من مجلد الموقع الحالي، وخذني إلى مجلدات النظام الداخلية الحساسة" مثل ملف كلمات المرور أو إعدادات السيرفر..


---

## 🧩 أنواعها الرئيسية | Main Types

- **Path Traversal بسيط**: استخدام `../../../etc/passwd` مباشرة.

- **Path Traversal بمسارات كاملة (Absolute Path)**: استخدام `/etc/passwd` مباشرة بدون `../`.

- **Path Traversal مع حذف التسلسلات (Stripped Sequences)**: إذا كان النظام يحذف `../`، جرب `....//....//etc/passwd`.

- **Path Traversal مع ترميز (Encoding)**: استخدام `%2e%2e%2f` بدلاً من `../`.

- **Path Traversal مع ترميز مزدوج (Double Encoding)**: استخدام `%252e%252e%252f` لتجاوز الفلاتر.

- **Path Traversal مع تجاوز التحقق (Validation Bypass)**: استخدام مسارات بديلة مثل `....//` أو `..;/`.

---
## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام قائمة بيضاء (Whitelist) للملفات المسموحة:** حدد أسماء الملفات المسموح بها بدلاً من استخدام مسارات ديناميكية.

- **تنقية المدخلات (Input Validation):** ارفض أي مدخلات تحتوي على `../` أو `..\` أو `%2e%2e`.

- **استخدام مسارات ثابتة (Fixed Paths):** لا تسمح للمستخدم بتحديد اسم الملف كاملاً؛ استخدم معرفات رقمية مرتبطة بمسارات ثابتة.

- **تهيئة السيرفر بشكل آمن:** قم بتعطيل الوصول إلى الملفات الحساسة عبر إعدادات السيرفر (مثل `.htaccess` أو `web.config`).

- **تشغيل التطبيق بصلاحيات محدودة:** لا تشغل السيرفر بصلاحيات `root` أو `Administrator`.

---

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Path Traversal Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Path-Traversal.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| File path traversal, simple case | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/01-simple-case.md) |
| Traversal with absolute path | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/02-absolute-path.md) |
| Traversal with stripped sequences | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/03-stripped-sequences.md) |
| Traversal with encoding | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/04-encoding.md) |
| Traversal with validation bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/05-validation-bypass.md) |
| Traversal with double encoding | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Path-Traversal/06-double-encoding.md) |
