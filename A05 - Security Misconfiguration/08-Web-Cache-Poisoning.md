# Web Cache Poisoning | تسميم الكاش

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Web Cache Poisoning Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Poisoning-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/)

---

## ما هي؟ | What is it?

تستخدم المواقع "مخدّمات كاش" (Cache Servers) لتخزين نسخ من الصفحات بهدف تسريع التصفح وتخفيف العبء عن السيرفر الأصلي. تحدث الثغرة عندما يتمكن المهاجم من إرسال طلب يحتوي على "مدخلات غير مفتاحية" (Unkeyed Inputs) —وهي قيم في الـ Headers لا تدخل في حساب الـ Cache Key— ويقوم السيرفر بعكس هذه القيم داخل الصفحة. إذا تم تخزين هذه الاستجابة "المسمومة" في الكاش، سيستلم كل مستخدم يطلب الصفحة نفس المحتوى الخبيث.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن الرؤوس (Headers) التي تؤثر على استجابة الصفحة ولكنها لا تغير الـ URL، مثل:
    - `X-Forwarded-Host`
    - `X-Forwarded-Scheme`
    - `X-Host`

- **أداة مساعدة:** استخدم إضافة **Param Miner** في Burp Suite؛ هي الأداة الأفضل لاكتشاف الـ Unkeyed Headers تلقائياً.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- أرسل طلباً وأضف إليه رأساً مخصصاً: `X-Forwarded-Host: attacker.com`
- ابحث في الاستجابة (Response)؛ هل تم استخدام `attacker.com` داخل كود الصفحة (مثلاً في رابط ملف JavaScript أو CSS)؟
- تحقق من رؤوس الكاش في الاستجابة:
    - `X-Cache: hit` → تعني أنك تشاهد نسخة مخزنة
    - `X-Cache: miss` → تعني أنها نسخة جديدة

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **تسميم الـ JavaScript** | إذا كان الموقع يستخدم `X-Forwarded-Host` لجلب ملف JS، يمكنك توجيهه لملف خبيث على سيرفرك. النتيجة: كل مستخدم يزور الصفحة سيقوم متصفحه بتنفيذ الـ JS الخاص بك (هجوم XSS شامل) |
| **تسميم الكوكيز (Cookie Poisoning)** | إذا كان السيرفر يعكس قيمة كوكيز معينة في الصفحة ويقوم بتخزينها في الكاش |
| **تسميم الـ DOM** | استغلال قيم مخزنة في الكاش لتنفيذ DOM-XSS |

### 4. تأكيد الاستغلال | Impact Verification

- بمجرد أن ترى `X-Cache: hit` والاستجابة تحتوي على قيمتك الخبيثة، افتح المتصفح (أو متصفح خفي) وادخل للموقع؛ إذا نُفذ الكود دون أن ترسل أنت أي رؤوس مخصصة = تم تسميم الكاش بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Web Cache Poisoning Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Poisoning-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Web cache poisoning with unkeyed header | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/01-unkeyed-header.md) |
| Web cache poisoning using X-Forwarded-Host | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/02-x-forwarded-host.md) |
| Web cache poisoning with multi-header injection | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/03-multi-header.md) |
| Web cache poisoning with cache key injection | Expert | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/04-cache-key-injection.md) |
| Web cache poisoning with JavaScript redirect | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/05-js-redirect.md) |
| Web cache poisoning with parameter cloaking | Expert | [الحل](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/06-parameter-cloaking.md) |

