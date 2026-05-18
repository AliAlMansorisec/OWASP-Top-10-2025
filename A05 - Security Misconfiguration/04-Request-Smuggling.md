# HTTP Request Smuggling | تهريب طلبات HTTP

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Request Smuggling Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Request-Smuggling-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/HTTP-Smuggling/)

---

## ما هي؟ | What is it?

ثغرة تحدث بسبب اختلاف الطريقة التي يحدد بها السيرفر الأمامي (مثل Nginx أو F5) والسيرفر الخلفي (مثل Apache أو Tomcat) "نهاية الطلب". المهاجم يقوم بإرسال طلب "مزدوج" بحيث يعتقد السيرفر الأمامي أنه طلب واحد، بينما يراه السيرفر الخلفي كطلبين، مما يؤدي إلى "تهريب" طلب غير مصرح به وتدخله في طلب المستخدم التالي.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن المواقع التي تستخدم أنظمة "سيرفرات متتابعة" (Front-end and Back-end).
- تحقق من دعم السيرفر لرؤوس الطلب (Headers) الخاصة بتحديد حجم البيانات:
    - `Content-Length` (CL)
    - `Transfer-Encoding: chunked` (TE)

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم إضافة **HTTP Request Smuggler** لتسهيل عملية الاكتشاف.
- أرسل طلباً يحتوي على الرأسين معاً (CL و TE) وراقب سلوك السيرفر (هل يتأخر في الرد؟ هل تظهر أخطاء Timeout؟).

### 3. أنواع التصادم | Desynchronization Types

| النوع | الشرح |
|-------|-------|
| **CL.TE** | السيرفر الأمامي يستخدم Content-Length والخلفي يستخدم Transfer-Encoding |
| **TE.CL** | السيرفر الأمامي يستخدم Transfer-Encoding والخلفي يستخدم Content-Length |
| **TE.TE** | كلاهما يستخدم Transfer-Encoding ولكن يمكن خداع أحدهما بتعديل بسيط في الرأس |

### 4. تأكيد الاستغلال | Impact Verification

- حاول "تسميم" الطلب التالي بحيث تجبر السيرفر على عرض بيانات مستخدم آخر، أو تحويل طلب المستخدم التالي إلى صفحة يسيطر عليها المهاجم.
- إذا استطعت تجاوز جدار الحماية (WAF) أو سرقة الكوكيز الخاصة بالمستخدم الذي قام بإرسال طلب "بعدك" مباشرة = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Request Smuggling Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Request-Smuggling-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| HTTP request smuggling (CL.TE) | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/01-cl-te.md) |
| HTTP request smuggling (TE.CL) | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/02-te-cl.md) |
| HTTP request smuggling (TE.TE) | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/03-te-te.md) |
| Exploiting request smuggling to bypass front-end security | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/04-bypass-frontend.md) |
| Exploiting request smuggling to capture users' requests | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/05-capture-requests.md) |
| Exploiting request smuggling to deliver reflected XSS | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/06-reflected-xss.md) |
| Exploiting request smuggling to perform web cache poisoning | Practitioner | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/07-cache-poisoning.md) |
| Exploiting request smuggling to perform SSRF | Expert | [الحل](../../../portswigger-labs/Advanced/HTTP-Smuggling/08-ssrf.md) |
