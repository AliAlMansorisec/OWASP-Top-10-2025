# Information Disclosure | تسريب المعلومات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Information Disclosure Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Info-Disclosure-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Information-Disclosure/)

---

## 📌 Definition (التعريف)

> ثغرة Information Disclosure تحدث عندما يقوم التطبيق "بغير قصد" بتسريب معلومات تقنية أو حساسة للمستخدمين العاديين، مثل تفاصيل السيرفر الداخلية، أو ملفات الأكواد البرمجية، أو رسائل الخطأ المفصلة لقواعد البيانات. هذه المعلومات بحد ذاتها قد لا تمنح المهاجم دخولاً مباشراً للنظام، لكنها تعتبر "منجم ذهب" يكشف له خريطة الموقع وثغرات الإصدارات المستخدمة لتجهيز هجومه القادم بدقة.

---

## 🧩 أنواعها الرئيسية | Main Types

- **تسريب معلومات عبر رسائل الخطأ (Verbose Error Messages)**: إجبار التطبيق على إظهار أخطاء تفصيلية تكشف مسارات السيرفر أو استعلامات قاعدة البيانات.

- **تسريب معلومات من ملفات النظام (System File Exposure)**: الوصول لملفات حساسة مثل `.env`، `.git/config`، أو ملفات النسخ الاحتياطي (`.bak`).

- **تسريب معلومات في الكود المصدري (Source Code Disclosure)**: ظهور تعليقات المطورين، مسارات داخلية، أو مفاتيح API داخل صفحات الويب أو ملفات JavaScript.

- **تسريب معلومات عبر رؤوس الاستجابة (Response Headers)**: كشف إصدارات السيرفر والتقنيات المستخدمة عبر رؤوس مثل `Server` و`X-Powered-By`.

- **تسريب معلومات عبر صفحات التصحيح (Debug Pages)**: ترك صفحات تصحيح الأخطاء (Debug Mode) متاحة للعامة وتظهر تفاصيل حالة التطبيق.

- **تسريب معلومات عبر ملفات غير محمية (Unprotected Files)**: الوصول لملفات `robots.txt`، `sitemap.xml`، أو سجلات (Logs) تكشف هيكل الموقع.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تعطيل رسائل الخطأ التفصيلية:** لا تظهر رسائل خطأ مفصلة للمستخدمين؛ استخدم رسائل خطأ عامة وسجل التفاصيل في السيرفر فقط.

- **إخفاء رؤوس السيرفر:** قم بإزالة أو تعتيم رؤوس الاستجابة التي تكشف معلومات عن التقنيات والإصدارات المستخدمة.

- **تأمين ملفات النظام:** تأكد من أن ملفات مثل `.env` و`.git` غير قابلة للوصول عبر المتصفح باستخدام إعدادات السيرفر (مثل `.htaccess` أو `web.config`).

- **فحص الكود قبل النشر:** تأكد من إزالة التعليقات والمعلومات الحساسة من الأكواد قبل رفعها لبيئة الإنتاج.

- **إغلاق صفحات التصحيح:** تأكد من تعطيل Debug Mode في بيئة الإنتاج.

- **استخدام سياسة أمان المحتوى (CSP):** لمنع تسريب المعلومات عبر هجمات XSS وغيرها.

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
