# Access Control Vulnerabilities | ثغرات التحكم في الوصول

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-13 - Access Control & IDOR Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-13-Access-Control-IDOR.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Access-Control/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يفشل التطبيق في التحقق مما إذا كان المستخدم يمتلك الصلاحية الكافية للوصول إلى مورد معين (صفحة، ملف، بيانات مستخدم آخر) أو القيام بفعل معين (تعديل، حذف). ببساطة: "المستخدم (أ) يستطيع رؤية أو تعديل بيانات المستخدم (ب)".

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
