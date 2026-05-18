# File Upload Vulnerabilities | ثغرات رفع الملفات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - File Upload Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-File-Upload-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/File-Upload/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يسمح التطبيق للمستخدمين برفع ملفات إلى السيرفر دون التحقق الكافي من نوعها، اسمها، أو محتواها. إذا استطاع المهاجم رفع ملف "تنفيذي" (مثل سكربت PHP أو ASPX)، فإنه يستطيع تشغيل أوامر على السيرفر والسيطرة عليه.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن أي مكان يسمح برفع الملفات: (تغيير صورة البروفايل، رفع سير الذاتية، رفع مرفقات في تذكرة دعم).
- حدد التقنية المستخدمة في الموقع (هل هو PHP، ASP.NET، Node.js؟) لتعرف نوع السكربت الذي ستحاول رفعه.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض طلب الرفع (Upload Request) وأرسله إلى Repeater.
- لاحظ كيف يتم التحقق: هل يعتمد على الامتداد (`.jpg`)؟ أم على نوع الملف (`Content-Type: image/jpeg`)؟

### 3. محاولة التخطي | Bypass Techniques

| التقنية | الشرح |
|---------|-------|
| **تغيير الامتداد** | جرب رفع ملف `shell.php` كـ `shell.php.jpg` أو `shell.phtml` |
| **تلاعب بالـ Content-Type** | قم بتغيير القيمة من `application/x-php` إلى `image/jpeg` لإيهام السيرفر أنها صورة |
| **استخدام Magic Bytes** | أضف توقيع ملفات الصور (مثل `GIF89a;`) في بداية كود السكربت الخاص بك لتخطي فحص محتوى الملف |

### 4. تأكيد الاستغلال | Impact Verification

- حاول الوصول للملف الذي رفعته عبر المتصفح (مثلاً: `https://example.com/uploads/shell.php`).
- إذا نُفذ الكود وظهرت لك واجهة التحكم بالسيرفر أو استطعت تنفيذ أمر مثل `whoami` = تم الاستغلال بنجاح (RCE).

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
