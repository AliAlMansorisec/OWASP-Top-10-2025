# Directory Traversal (File Path Traversal) | اجتياز الدليل

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-?? - Path Traversal Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Path-Traversal.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Path-Traversal/)

---

## ما هي؟ | What is it?

ثغرة تمكن المهاجم من قراءة ملفات تعسفية على السيرفر الذي يشغل التطبيق. قد تشمل هذه الملفات كود المصدر (Source Code)، بيانات الاعتماد (Credentials)، أو ملفات النظام الحساسة (مثل /etc/passwd في Linux). تحدث عندما يستخدم التطبيق مدخلات المستخدم للوصول إلى ملف دون التحقق الكافي من المسار.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن بارامترات في الروابط (URL) تقوم بتحميل ملفات أو صور، مثل:
    - `?filename=image.jpg`
    - `?page=contact.html`
    - `?view=report.pdf`

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض الطلب وأرسله إلى Repeater.
- حاول تغيير اسم الملف إلى مسار معروف في النظام باستخدام تسلسل العودة للخلف (`../`).

### 3. محاور الهجوم | Attack Vectors

- **في أنظمة Linux:** حاول قراءة ملف المستخدمين:
    - `filename=../../../etc/passwd`

- **في أنظمة Windows:** حاول قراءة ملف الـ boot أو الـ win.ini:
    - `filename=..\..\..\windows\win.ini`

- **تجاوز الفلاتر (Bypassing):**
    - إذا كان الموقع يحذف `../` تلقائياً، جرب مضاعفتها: `....//....//etc/passwd`
    - استخدم الـ URL Encoding: `%2e%2e%2f` بدلاً من `../`
    - استخدم مسارات كاملة (Absolute Paths) إذا كان التطبيق يسمح بذلك: `filename=/etc/passwd`

### 4. تأكيد الاستغلال | Impact Verification

- إذا ظهر محتوى الملف المطلوب (مثل قائمة المستخدمين في Linux) في الاستجابة (Response) = تم الاستغلال بنجاح.

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
