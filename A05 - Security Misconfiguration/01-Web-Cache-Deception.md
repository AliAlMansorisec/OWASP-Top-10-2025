# Web Cache Deception | خداع الكاش

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Web Cache Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Web-Cache-Deception/)

---

## ما هي؟ | What is it?

ثغرة تحدث عندما يتم خداع "خادم الكاش" (Cache Server) ليقوم بتخزين صفحة تحتوي على بيانات حساسة وخاصة بمستخدم معين، ثم إتاحة هذه الصفحة للعامة. المهاجم يدفع الضحية لزيارة رابط يبدو كأنه ملف ثابت (مثل صورة أو ملف CSS)، لكن السيرفر يعيد محتوى صفحة الحساب الخاصة بالضحية.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن صفحات تحتوي على بيانات حساسة (مثل `/account/settings`).
- تأكد من وجود نظام كاش (مثل Cloudflare أو Nginx) يعمل أمام السيرفر الأساسي.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض طلب صفحة الإعدادات وأرسله إلى Repeater.
- قم بإضافة امتداد وهمي لنهاية الرابط، مثل: `/account/settings/test.jpg`

### 3. التلاعب بالمسار | Path Manipulation

- إذا قام السيرفر بتجاهل الجزء الأخير (`/test.jpg`) وعرض لك صفحة الإعدادات، فهذا أول مؤشر.
- خادم الكاش قد يعتقد أن هذا "صورة" (بسبب الامتداد) ويقوم بتخزين الاستجابة لديه ليسرع الوصول إليها لاحقاً.

### 4. تأكيد الاستغلال | Impact Verification

- أرسل الرابط الملغم للضحية: `https://example.com/account/settings/test.jpg`
- بعد أن يفتحه الضحية وهو مسجل دخول، قم أنت بفتح نفس الرابط من متصفح "مخفي" (Incognito).
- إذا ظهرت لك بيانات الضحية (لأن الكاش خزنها كصورة) = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Web Cache Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Web cache deception with unkeyed query parameter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/01-unkeyed-query.md) |
| Web cache deception with path manipulation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/02-path-manipulation.md) |
| Web cache deception with cache key injection | Expert | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/03-cache-key-injection.md) |
