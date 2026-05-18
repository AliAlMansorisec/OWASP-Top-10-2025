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
```
https://example.com/#<img src=x onerror=alert(1)>
```

- بما أن البيانات بعد `#` لا تُرسل للسيرفر، فإن الفلاتر التقليدية (WAF) لن تلاحظ الهجوم، وسيتم التنفيذ بالكامل داخل متصفح الضحية.

### 4. تأكيد الاستغلال | Impact Verification

- إذا نُفذ السكربت أو تم توجيه المستخدم لموقع خبيث بمجرد فتح الرابط = تم الاستغلال بنجاح.
- تكمن قوة هذه الثغرة في أنها "صامتة" تماماً بالنسبة للسيرفر.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - DOM-Based Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-DOM-Based-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| DOM XSS in document.write sink | Apprentice | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/01-document-write.md) |
| DOM XSS in innerHTML sink | Apprentice | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/02-innerhtml.md) |
| DOM XSS in jQuery sink | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/03-jquery-sink.md) |
| DOM XSS in AngularJS expression | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/04-angularjs.md) |
| DOM XSS using web messages | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/05-web-messages.md) |
| DOM XSS using web messages and JSON.parse | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/06-web-messages-json.md) |
| DOM XSS via client-side prototype pollution | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/07-prototype-pollution.md) |
