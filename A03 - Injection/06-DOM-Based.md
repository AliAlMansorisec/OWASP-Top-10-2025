# DOM-based Vulnerabilities | الثغرات المعتمدة على DOM

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - DOM-Based Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-DOM-Based-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/DOM-Based/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرات عندما يحتوي كود الـ JavaScript الخاص بالموقع على "مصدر" (Source) بيانات يمكن للمستخدم التحكم به (مثل الرابط `location.search`)، ويقوم بتمرير هذه البيانات إلى "مصب" (Sink) خطير (مثل وظيفة `eval()` أو `innerHTML`) بطريقة تسمح بتنفيذ كود خبيث.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن الأماكن التي يستخدم فيها الموقع الـ JavaScript لتعديل الصفحة دون تحديثها.
- راقب المتغيرات التي تُؤخذ من الرابط (URL) وتُستخدم مباشرة في الكود، مثل:
    - `window.location.hash` (#)
    - `window.location.search` (?)

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم **DOM Invader** (أداة مدمجة في متصفح Burp) لاكتشاف الـ Sources والـ Sinks تلقائياً.
- ابحث في ملفات الـ JS عن وظائف خطيرة مثل:
    - لـ XSS: `.innerHTML`, `document.write()`
    - لـ التوجيه: `window.location.href`
    - لـ تنفيذ الأوامر: `eval()`, `setTimeout()`

### 3. حقن البيانات | DOM Injection

- قم بصياغة رابط يحتوي على كود خبيث في الـ Fragment (بعد علامة #):
