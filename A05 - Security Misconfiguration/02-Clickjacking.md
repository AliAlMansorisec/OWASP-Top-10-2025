# Clickjacking (UI Redressing) | اختطاف النقرات

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Clickjacking Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Clickjacking-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/Clickjacking/)

---

## ما هي؟ | What is it?

ثغرة تعتمد على "خداع" المستخدم بصرياً لجعله ينقر على زر أو رابط في موقع مصاب وهو يعتقد أنه ينقر على شيء آخر في موقع مختلف تماماً. يتم ذلك عن طريق وضع الموقع المصاب داخل إطار شفاف (`<iframe>`) فوق صفحة المهاجم، مما يؤدي لتنفيذ إجراءات غير مقصودة (مثل حذف حساب، أو الإعجاب بصفحة).

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن صفحات حساسة تحتوي على أزرار "بنقرة واحدة" (مثل: زر "حذف الحساب"، "شراء الآن"، "تغيير الإعدادات").
- تحقق مما إذا كان الموقع يسمح بوضعه داخل إطار (Frame) عبر فحص الـ Headers:
    - إذا كان الرأس `X-Frame-Options` مفقوداً أو غير مضبوط على `DENY` أو `SAMEORIGIN`
    - أو إذا كانت سياسة `Content-Security-Policy` (CSP) تفتقر لتعليمات `frame-ancestors`

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم أداة **Clickjacking PoC** الموجودة داخل Burp Suite (في قائمة Engagement tools).
- ستقوم الأداة بإنشاء صفحة HTML تضع الموقع المستهدف في iframe.

### 3. تصميم صفحة الاستغلال | Crafting the Overlay

- يتم ضبط الشفافية (opacity) للموقع المستهدف لتكون `0` (مخفي تماماً).
- يضع المهاجم فوقه عناصر "جذابة" (مثل: "اضغط هنا لتربح جائزة") بحيث ينطبق مكان زر "الجائزة" تماماً فوق مكان زر "حذف الحساب" في الموقع المخفي.

### 4. تأكيد الاستغلال | Impact Verification

- عندما يضغط المستخدم على زر "الجائزة"، فإنه في الحقيقة يضغط على زر "حذف الحساب" في الموقع الآخر.
- إذا نُفذ الإجراء بنجاح دون علم المستخدم = تم الاستغلال بنجاح.

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
