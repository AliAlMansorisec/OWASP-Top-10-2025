# Clickjacking (UI Redressing) | اختطاف النقرات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Clickjacking Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Clickjacking-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/Clickjacking/)

---

## 📌 Definition (التعريف)

> ثغرة Clickjacking تحدث عندما يقوم المهاجم بوضع الموقع المستهدف داخل إطار شفاف (iframe) فوق صفحة خبيثة. المستخدم يظن أنه ينقر على أزرار بريئة (مثل "اربح جائزة" أو "شاهد الفيديو")، لكنه في الحقيقة ينقر على عناصر مخفية من الموقع الحساس (مثل زر "حذف الحساب" أو "تأكيد الشراء"). هذه الثغرة تستغل عدم وجود حماية تمنع عرض الموقع داخل إطارات خارجية.

---

## 🧩 أنواعها الرئيسية | Main Types

- **Clickjacking بدون حماية (No Defenses)**: الموقع لا يستخدم أي رؤوس حماية مثل `X-Frame-Options` أو CSP `frame-ancestors`.

- **تجاوز X-Frame-Options**: استغلال ثغرات في المتصفح أو السيرفر لتجاوز قيود `X-Frame-Options`.

- **تجاوز CSP frame-ancestors**: استغلال تكوين ضعيف في Content-Security-Policy لتجاوز تعليمات `frame-ancestors`.

- **Clickjacking متعدد الخطوات (Multi-Step)**: إجبار المستخدم على القيام بعدة نقرات في أماكن محددة لإتمام عملية معقدة (مثل تغيير الإعدادات ثم تأكيدها).

- **Clickjacking مع التلاعب بالإدخال (Form Input Manipulation)**: خداع المستخدم لإدخال بيانات (مثل كلمة المرور) في حقول مخفية داخل iframe.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام X-Frame-Options:** أضف الرأس `X-Frame-Options: DENY` لمنع عرض الموقع في أي iframe، أو `SAMEORIGIN` للسماح فقط من نفس النطاق.

- **استخدام CSP frame-ancestors:** أضف `Content-Security-Policy: frame-ancestors 'self'` للتحكم في النطاقات المسموح لها بوضع موقعك في إطار.

- **تطبيق SameSite Cookies:** استخدم `SameSite=Lax` أو `SameSite=Strict` لمنع إرسال الكوكيز مع الطلبات من iframes خارجية.

- **استخدام JavaScript Frame Busting (كطبقة إضافية):** أضف كود JavaScript يمنع تحميل الصفحة داخل iframe (رغم أنها ليست حماية كاملة).

- **توعية المستخدمين:** حذر المستخدمين من النقر على روابط مشبوهة أو صفحات غير موثوقة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Clickjacking Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Clickjacking-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Basic clickjacking with no defenses | Apprentice | [الحل](../../../portswigger-labs/Client-Side/Clickjacking/01-basic.md) |
| Clickjacking with X-Frame-Options bypass | Practitioner | [الحل](../../../portswigger-labs/Client-Side/Clickjacking/02-xfo-bypass.md) |
| Clickjacking with CSP frame-ancestors bypass | Practitioner | [الحل](../../../portswigger-labs/Client-Side/Clickjacking/03-csp-bypass.md) |
| Multi-step clickjacking | Practitioner | [الحل](../../../portswigger-labs/Client-Side/Clickjacking/04-multi-step.md) |
| Clickjacking with form input manipulation | Practitioner | [الحل](../../../portswigger-labs/Client-Side/Clickjacking/05-form-input.md) |
