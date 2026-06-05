# File Upload Vulnerabilities | ثغرات رفع الملفات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - File Upload Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-File-Upload-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/File-Upload/)

---

## 📌 Definition (التعريف)

> ثغرة رفع الملفات تحدث عندما يسمح الموقع للمستخدمين برفع ملفات إلى السيرفر دون التحقق الكافي من نوعها أو محتواها أو حجمها. المهاجم يستغل هذه الثغرة لرفع ملفات خبيثة (مثل Web Shell) تمكنه من تنفيذ أوامر على السيرفر عن بعد (RCE)، أو التحكم الكامل في الموقع.

---

## 🧩 أنواعها الرئيسية | Main Types

- **رفع Web Shell مباشر**: رفع ملف خبيث (مثل `shell.php`) وتنفيذه عبر المتصفح للوصول إلى السيرفر.

- **تجاوز التحقق من نوع الملف (Content-Type Bypass)**: تغيير قيمة `Content-Type` في الطلب من `application/x-php` إلى `image/jpeg` لخداع السيرفر.

- **تجاوز القائمة السوداء للامتدادات (Blacklist Bypass)**: استخدام امتدادات بديلة مسموحة مثل `.phtml`، `.php5`، `.shtml` بدلاً من `.php` المحظور.

- **تجاوز التحقق من Magic Bytes**: إضافة توقيع ملفات الصور (مثل `GIF89a;`) في بداية كود السكربت الخبيث لتخطي فحص محتوى الملف.

- **تجاوز الامتداد المزدوج (Double Extension)**: رفع ملف باسم `shell.php.jpg` حيث يتعرف السيرفر على الامتداد الأخير فقط.

- **تجاوز عبر اجتياز المسار (Path Traversal)**: رفع الملف مع مسار مثل `../shell.php` لوضعه في مجلد آخر غير محمي.

- **استغلال Race Condition**: رفع ملف خبيث والوصول إليه قبل أن يقوم السيرفر بحذفه بعد الفحص.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **التحقق من نوع الملف الفعلي:** لا تعتمد فقط على الامتداد أو `Content-Type`؛ افحص محتوى الملف باستخدام Magic Bytes للتحقق من نوعه الحقيقي.

- **استخدام قائمة بيضاء (Whitelist) للامتدادات:** حدد أنواع الملفات المسموح بها (مثل `.jpg`، `.png`، `.pdf`) وارفض أي شيء آخر.

- **تخزين الملفات خارج مجلد الويب:** احفظ الملفات المرفوعة في مجلد خارج `public_html` أو `www` واستخدم سكربت لاسترجاعها عند الحاجة.

- **تغيير اسم الملف:** قم بإعادة تسمية الملفات المرفوعة إلى أسماء عشوائية (مثل UUID) لمنع تنفيذ السكربتات.

- **فحص الملفات بمضاد فيروسات:** استخدم أدوات فحص الفيروسات والملفات الخبيثة قبل قبول الملف.

- **تحديد صلاحيات المجلد:** تأكد من أن مجلد الرفع لا يملك صلاحيات تنفيذ (Execute Permissions).

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - File Upload Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-File-Upload-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Remote code execution via web shell upload | Apprentice | [الحل](../../../portswigger-labs/Server-Side/File-Upload/01-web-shell.md) |
| Web shell upload with content-type bypass | Apprentice | [الحل](../../../portswigger-labs/Server-Side/File-Upload/02-content-type-bypass.md) |
| Web shell upload with blacklist bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/File-Upload/03-blacklist-bypass.md) |
| Web shell upload with magic bytes bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/File-Upload/04-magic-bytes.md) |
| Web shell upload with file extension bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/File-Upload/05-extension-bypass.md) |
| Web shell upload with race condition | Practitioner | [الحل](../../../portswigger-labs/Server-Side/File-Upload/06-race-condition.md) |
| Web shell upload with path traversal | Practitioner | [الحل](../../../portswigger-labs/Server-Side/File-Upload/07-path-traversal.md) |
