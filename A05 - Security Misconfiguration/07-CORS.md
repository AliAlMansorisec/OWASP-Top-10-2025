# Cross-Origin Resource Sharing (CORS) | مشاركة الموارد عبر الأصول

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - CORS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CORS-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/CORS/)

---

## ما هي؟ | What is it?

هي ميزة أمنية في المتصفحات تسمح للمواقع بمشاركة الموارد (مثل البيانات) مع مواقع أخرى في نطاقات (Domains) مختلفة. تحدث الثغرة عندما يكون "إعداد" هذه الميزة على السيرفر ضعيفاً جداً، مما يسمح لموقع خبيث بسحب بيانات حساسة من حساب المستخدم في الموقع المصاب.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن الطلبات التي ترسل بيانات حساسة (مثل الإيميل، رقم الهاتف، API Keys).
- ابحث في "رؤوس الطلب" (HTTP Headers) عن رأس يسمى `Origin`.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض الطلب وأرسله إلى Repeater.
- أضف رأس طلب جديد أو عدل الموجود: `Origin: https://evil-attacker.com`
- أرسل الطلب وراقب "رأس الاستجابة" (Response Header).

### 3. التلاعب بالإعدادات | Misconfiguration Check

- إذا ظهر في الاستجابة: `Access-Control-Allow-Origin: https://evil-attacker.com`
- وأيضاً ظهر: `Access-Control-Allow-Credentials: true`
- فهذا يعني أن السيرفر يثق في أي موقع ويسمح له بقراءة بيانات المستخدم بما فيها "الكوكيز".

### 4. تأكيد الاستغلال | Impact Verification

- قم بكتابة كود JavaScript بسيط (Exploit Script) يقوم بطلب البيانات من الموقع المصاب.
- إذا استطاع الكود سحب بياناتك الشخصية وعرضها في موقع المهاجم = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - CORS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CORS-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| CORS with insecure reflection | Apprentice | [الحل](../../../portswigger-labs/Client-Side/CORS/01-insecure-reflection.md) |
| CORS with trusted null origin | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CORS/02-trusted-null.md) |
| CORS with trusted insecure protocols | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CORS/03-insecure-protocols.md) |
