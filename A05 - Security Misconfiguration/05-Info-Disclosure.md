# Information Disclosure | تسريب المعلومات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Information Disclosure Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Info-Disclosure-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Information-Disclosure/)

---

## ما هي؟ | What is it?

هي ثغرة تحدث عندما يقوم التطبيق "بغير قصد" بتسريب معلومات حساسة للمستخدمين، مثل تفاصيل تقنية عن السيرفر، بيانات مستخدمين آخرين، أو ملفات الأكواد البرمجية. هذه المعلومات بحد ذاتها قد لا تمنح دخولاً مباشراً، لكنها تعتبر "منجم ذهب" للمخترق لتجهيز هجومه القادم.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن الملفات الشائعة التي تُنسى غالباً:
    - `/robots.txt`: قد يكشف مسارات مخفية
    - `/.git`: قد يسرب الكود المصدري بالكامل
    - `/.env`: ملف يحتوي على كلمات مرور قاعدة البيانات ومفاتيح الـ API

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- راقب ردود أفعال السيرفر عند إرسال بيانات خاطئة.
- افحص "رؤوس الاستجابة" (Response Headers) مثل `Server` أو `X-Powered-By` لمعرفة أنواع وإصدارات البرامج المستخدمة.

### 3. إثارة الأخطاء | Error Triggering

- قم بإرسال مدخلات غير متوقعة (رموز مثل `'` أو `"` أو مصفوفات `[]`) لإجبار التطبيق على إظهار "رسائل خطأ مفصلة" (Verbose Error Messages).
- رسائل الخطأ قد تسرب مسارات الملفات على السيرفر (Full Path Disclosure) أو أجزاء من كود SQL.

### 4. تأكيد الاستغلال | Impact Verification

- افحص المعلومات المسربة:
    - إذا حصلت على نسخة من الكود، أو إعدادات قاعدة البيانات، أو إصدارات برمجية مصابة بثغرات معروفة = تم الاستغلال بنجاح.
    - قارن بين المعلومات التي حصلت عليها وبين ما يفترض أن يظهر للمستخدم العادي.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Information Disclosure Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Info-Disclosure-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Information disclosure in error messages | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Information-Disclosure/01-error-messages.md) |
| Information disclosure in version control history | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Information-Disclosure/02-version-control.md) |
| Information disclosure in debug pages | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Information-Disclosure/03-debug-pages.md) |
| Information disclosure in source code comments | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Information-Disclosure/04-source-comments.md) |
| Information disclosure via backup files | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Information-Disclosure/05-backup-files.md) |
\
