# Web Cache Poisoning | تسميم الكاش

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Web Cache Poisoning Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Poisoning-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Web-Cache-Poisoning/)

---

## 📌 Definition (التعريف)

> ثغرة Web Cache Poisoning تحدث عندما يقوم المهاجم باستغلال خادم الكاش (مثل CDN أو Varnish أو Nginx) لتخزين نسخة "ملغومة" من صفحة ويب. عن طريق التلاعب برؤوس HTTP غير مفتاحية (Unkeyed Headers) أو بارامترات لا تغير مفتاح الكاش، يستطيع المهاجم حقن محتوى خبيث في الاستجابة المخزنة. كل مستخدم يزور الصفحة بعد ذلك سيحصل على النسخة المسمومة من الكاش، مما يحول هذا الهجوم إلى XSS شامل يصيب جميع زوار الموقع.

---

## 🧩 أنواعها الرئيسية | Main Types

- **تسميم عبر رأس غير مفتاحي (Unkeyed Header)**: استغلال رؤوس HTTP مثل `X-Forwarded-Host` أو `X-Forwarded-Scheme` التي تؤثر على محتوى الاستجابة لكن لا تشكل جزءاً من مفتاح الكاش.

- **تسميم عبر X-Forwarded-Host**: توجيه روابط JavaScript أو CSS إلى سيرفر المهاجم عبر التلاعب بقيمة `X-Forwarded-Host`، مما يؤدي لتنفيذ JavaScript خبيث عند كل الزوار.

- **تسميم عبر رؤوس متعددة (Multi-Header Injection)**: استخدام أكثر من رأس مخصص معاً لتجاوز الفلاتر أو إنشاء سيناريوهات تسميم معقدة.

- **حقن مفتاح الكاش (Cache Key Injection)**: التلاعب بمفتاح الكاش نفسه لإجباره على تخزين استجابة تحت مفتاح مختلف يمكن الوصول إليه لاحقاً.

- **تسميم مع إعادة توجيه JavaScript**: استغلال دوال JavaScript التي تستخدم قيماً من الكاش لإعادة توجيه المستخدمين لمواقع خبيثة.

- **إخفاء البارامترات (Parameter Cloaking)**: استغلال الاختلاف في تفسير البارامترات بين خادم الكاش والسيرفر الأساسي لتهريب Payloads خبيثة.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تحديد الرؤوس المفتاحية بدقة:** تأكد من أن جميع الرؤوس والبارامترات التي تؤثر على محتوى الاستجابة مدرجة في مفتاح الكاش.

- **تعطيل انعكاس الرؤوس غير الموثوقة:** لا تعكس قيم رؤوس مثل `X-Forwarded-Host` في محتوى الصفحة.

- **استخدام قائمة بيضاء للنطاقات:** إذا كنت بحاجة لاستخدام `X-Forwarded-Host`، تأكد من أنه يشير إلى نطاقك الموثوق فقط.

- **تكوين الكاش بشكل آمن:** راجع إعدادات خادم الكاش وتأكد من أنه لا يخزن استجابات تحتوي على رؤوس غير موثوقة.

- **استخدام CSP:** Content-Security-Policy يمكن أن يخفف من تأثير تسميم الكاش عن طريق منع تحميل السكربتات من مصادر غير موثوقة.

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
