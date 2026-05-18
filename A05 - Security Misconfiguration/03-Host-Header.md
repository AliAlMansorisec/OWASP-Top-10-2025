# HTTP Host Header Attacks | هجمات رأس المضيف

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Host Header Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Host-Header-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Host-Header/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يثق السيرفر بشكل أعمى في قيمة رأس الطلب (`Host: example.com`) ويستخدمها في عمليات حساسة مثل إنشاء روابط "استعادة كلمة المرور" أو توجيه المستخدمين. المهاجم يمكنه تغيير هذه القيمة لتوجيه المستخدمين إلى سيرفرات خبيثة أو تسميم الكاش (Cache Poisoning).

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- راقب طلبات الـ HTTP في Burp Suite وابحث عن المواقع التي تعكس قيمة الـ Host في الصفحة أو في الروابط.
- جرب تغيير قيمة الـ Host إلى قيمة عشوائية (مثلاً `Host: attacker.com`) وشاهد هل سيتعطل الموقع أم سيعمل بشكل طبيعي.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم إضافة HTTP Header Check أو قم بالتجربة يدوياً في Repeater.
- جرب تقنيات "حقن الرؤوس المزدوجة" إذا كان الموقع يمنع تغيير الـ Host الأساسي:
    - استخدام `X-Forwarded-Host: attacker.com`
    - إرسال رأسي Host (بعض السيرفرات تأخذ الثاني)

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **Password Reset Poisoning** | اطلب إعادة تعيين كلمة مرور لبريد الضحية، وقم بتغيير الـ Host إلى سيرفرك. إذا استخدم الموقع الـ Host لإنشاء رابط التغيير، سيصل الرابط (الذي يحتوي على التوكن) إلى سيرفرك بدلاً من بريد الضحية |
| **Web Cache Poisoning** | خداع الكاش لتخزين استجابة تحتوي على رابط خبيث (مثل ملف JS من سيرفرك) ليتم عرضه لجميع المستخدمين لاحقاً |
| **Bypassing Authentication** | بعض الأنظمة تسمح بالدخول لصفحات الإدارة إذا كان الـ Host هو `localhost` أو `127.0.0.1` |

### 4. تأكيد الاستغلال | Impact Verification

- إذا استلمت "توكن" استعادة كلمة المرور في سيرفرك، أو استطعت توجيه المستخدمين لموقع خارجي عبر رابط مولد تلقائياً = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Host Header Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Host-Header-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Basic password reset poisoning | Apprentice | [الحل](../../../portswigger-labs/Advanced/Host-Header/01-basic-reset.md) |
| Host header injection in password reset | Practitioner | [الحل](../../../portswigger-labs/Advanced/Host-Header/02-injection-reset.md) |
| Host header injection with cache poisoning | Practitioner | [الحل](../../../portswigger-labs/Advanced/Host-Header/03-cache-poisoning.md) |
| Routing-based SSRF via Host header | Practitioner | [الحل](../../../portswigger-labs/Advanced/Host-Header/04-ssrf.md) |
| Host header authentication bypass | Practitioner | [الحل](../../../portswigger-labs/Advanced/Host-Header/05-auth-bypass.md) |
| Host header with dual headers bypass | Practitioner | [الحل](../../../portswigger-labs/Advanced/Host-Header/06-dual-headers.md) |
