# Cross-Site Scripting (XSS) | اختراق المواقع عبر السكربتات

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-10 - XSS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-10-XSS-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/XSS/)

---

## 📌 Definition (التعريف)

> ثغرة XSS تحدث عندما يتمكن المهاجم من حقن سكربتات خبيثة (غالباً JavaScript) في صفحات الويب التي يشاهدها مستخدمون آخرون. بدلاً من استهداف السيرفر مباشرة، تستهدف هذه الثغرة "متصفح الضحية" لسرقة الكوكيز (Cookies)، أو جلسات الدخول (Sessions)، أو القيام بأفعال نيابة عن المستخدم. تعتبر XSS من أخطر الثغرات وأكثرها انتشاراً، خاصة عند استخدامها كجزء من سلسلة هجمات أوسع.

---

## 🧩 أنواعها الرئيسية | Main Types

- **Reflected XSS (انعكاسي)**: يتم حقن السكربت عبر رابط (URL) ويتم تنفيذه فوراً في المتصفح عند فتح الرابط. يستهدف الضحية مباشرة عبر إرسال الرابط الملغم.

- **Stored XSS (مخزن)**: يتم تخزين السكربت في قاعدة بيانات السيرفر (مثل التعليقات أو الملفات الشخصية) وينفذ عند كل من يزور الصفحة المصابة.

- **DOM-based XSS**: يتم تنفيذ السكربت عبر التلاعب بالـ DOM في المتصفح دون الحاجة للتفاعل مع السيرفر، وغالباً تستهدف دوال JavaScript مثل `document.write` و `innerHTML`.

- **Blind XSS (أعمى)**: يتم حقن السكربت في منطقة لا يراها المهاجم مباشرة (مثل لوحة تحكم الأدمن أو سجلات الدعم الفني).

- **تجاوز الفلاتر (Filter Bypass)**: استخدام تقنيات مختلفة مثل ترميز HTML، أو SVG tags، أو event handlers لتجاوز فلاتر الحماية.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تعقيم المدخلات (Input Sanitization):** نظف جميع المدخلات من الرموز الخطيرة قبل تخزينها أو عرضها.

- **ترميز المخرجات (Output Encoding):** استخدم HTML Entity Encoding عند عرض بيانات المستخدم في الصفحة.

- **استخدام سياسة أمان المحتوى (CSP):** طبق Content Security Policy لمنع تنفيذ السكربتات غير المصرح بها.

- **تجنب الدوال الخطيرة:** لا تستخدم `innerHTML`، `document.write`، `eval` مع بيانات المستخدم.

- **استخدام الكوكيز الآمنة:** استخدم علامة `HttpOnly` لمنع وصول JavaScript للكوكيز.

- **التحقق من نوع البيانات:** تأكد من نوع المدخلات (أرقام، نصوص) وارفض أي شيء غير متوقع.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - XSS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-10-XSS-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Reflected XSS into HTML context | Apprentice | [الحل](../../../portswigger-labs/Client-Side/XSS/01-reflected-html.md) |
| Stored XSS into HTML context | Apprentice | [الحل](../../../portswigger-labs/Client-Side/XSS/02-stored-html.md) |
| DOM XSS in document.write sink | Apprentice | [الحل](../../../portswigger-labs/Client-Side/XSS/03-dom-document-write.md) |
| Reflected XSS with event handlers | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/04-reflected-event-handlers.md) |
| Reflected XSS with some SVG tags | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/05-reflected-svg.md) |
| Stored XSS into onclick event | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/06-stored-onclick.md) |
| Reflected XSS with AngularJS sandbox escape | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/07-angularjs-sandbox.md) |
| Reflected XSS with encoded tags | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/08-reflected-encoded.md) |
| DOM XSS using web messages | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/09-dom-web-messages.md) |
| DOM XSS via localStorage | Practitioner | [الحل](../../../portswigger-labs/Client-Side/XSS/10-dom-localstorage.md) |
