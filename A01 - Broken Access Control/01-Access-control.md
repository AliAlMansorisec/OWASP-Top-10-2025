# Access Control Vulnerabilities | ثغرات التحكم في الوصول

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-13 - Access Control & IDOR Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-13-Access-Control-IDOR.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Access-Control/)

---
## 📌 Definition (التعريف)

**هو فشل النظام في التحقق من صلاحيات المستخدم وعدم فرض سياسات الوصول بشكل صحيح، مما يسمح له بالوصول إلى موارد أو تنفيذ وظائف إدارية غير مصرح له بها.**


---

## 🧩 أنواعها الرئيسية | Main Types

- **IDOR (الإشارة المباشرة غير الآمنة)**: تغيير قيمة الـ ID في الرابط أو الطلب للوصول لبيانات مستخدم آخر.
- **Vertical Privilege Escalation (تصعيد الصلاحيات الرأسي)**: من مستخدم عادي (User) إلى مدير (Admin).
- **Horizontal Privilege Escalation (تصعيد الصلاحيات الأفقي)**: من مستخدم إلى مستخدم آخر بنفس المستوى.
- **Forced Browsing (التصفح القسري)**: الوصول المباشر لروابط الإدارة أو الصفحات المخفية (مثل `/admin`) عبر التخمين.
- **Parameter Tampering (التلاعب بالمعاملات)**: تعديل القيم في الطلب (مثل تغيير `role=user` إلى `role=admin`).
- **Missing Access Control (انعدام التحقق)**: غياب كامل لأي نظام فحص للصلاحيات في جهة السيرفر.
- **Method Bypass (تخطي الوسائل)**: تجاوز الحماية بتغيير وسيلة الطلب (مثلاً: استخدام POST بدلاً من GET المحظور).
- **Referer-based Access Control**: الاعتماد على رأس Referer للتحقق من الصلاحيات (يمكن تزويره).
- **Multi-step Process Bypass**: تخطي خطوات في عملية متعددة المراحل (مثل تخطي خطوة التحقق من البريد).

---
## 🛡️ How to Prevent (كيف تمنعها)

- **التحقق في الـ Backend:** التحقق من الصلاحيات في جهة الخادم فقط، وليس إخفاء الأزرار في الواجهة الأمامية.

- **تفعيل الـ Authorization Checks:** استخدم Middleware أو RBAC أو ABAC للتحقق من صلاحية المستخدم قبل تنفيذ أي عملية.

- **انعدام الثقة بالمدخلات:** لا تعتمد على الـ IDs من المستخدم؛ قارنها بالبيانات المخزنة في الـ Session حقه.

- **استخدام معرفات غير قابلة للتخمين (UUIDs):** بدل أرقام متسلسلة مثل ID=123.

- **تسجيل محاولات الوصول غير المصرح بها.**

- **اختبار صلاحيات الوصول بشكل دوري.**



---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Access Control Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-13-Access-Control-IDOR.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| IDOR caused by insecure direct object reference | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Access-Control/01-IDOR.md) |
| Horizontal privilege escalation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/02-horizontal-privilege-escalation.md) |
| Vertical privilege escalation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/03-vertical-privilege-escalation.md) |
| Missing access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/04-missing-access-control.md) |
| Referer-based access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/05-referer-based.md) |
| Method-based access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/06-method-based.md) |
| Multi-step process with no access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/07-multi-step.md) |
