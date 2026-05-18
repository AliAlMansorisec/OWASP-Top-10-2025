# NoSQL Injection | حقن NoSQL

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - NoSQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-NoSQL-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/NoSQL-Injection/)

---

## ما هي؟ | What is it?

ثغرة تحدث عندما يقوم التطبيق بدمج مدخلات المستخدم في استعلامات قواعد البيانات NoSQL بطريقة غير آمنة. بدلاً من حقن أكواد SQL التقليدية، يقوم المهاجم بحقن "عوامل تشغيل" (Operators) خاصة بقاعدة البيانات (مثل `$gt`, `$ne`) لتغيير منطق الاستعلام والوصول لبيانات غير مصرح بها.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن التطبيقات التي تستخدم (Node.js, MongoDB, CouchDB).
- ركز على نماذج تسجيل الدخول (Login) أو البحث التي ترسل بيانات بتنسيق JSON.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض طلب تسجيل الدخول الذي يرسل JSON:

```json
{"username": "ali", "password": "123"}
```

- أرسله إلى Repeater.

### 3. حقن عوامل التشغيل | Operator Injection

- **تجاوز تسجيل الدخول:** جرب حقن عامل التشغيل `$ne` (بمعنى "لا يساوي"):

```json
{"username": {"$ne": "invalid"}, "password": {"$ne": "invalid"}}
```

> هنا السيرفر سيبحث عن مستخدم لا يساوي اسمه "invalid" وباسورد لا تساوي "invalid"، مما يؤدي غالباً للدخول بأول مستخدم في قاعدة البيانات (الأدمن).

- **تخمين البيانات:** جرب استخدام `$regex` لتخمين كلمة المرور حرفاً بحرف.

### 4. تأكيد الاستغلال | Impact Verification

- افحص الاستجابة:
    - إذا نجحت في الدخول دون معرفة الباسورد الحقيقية = تم الاستغلال بنجاح.
    - إذا حصلت على استجابات مختلفة عند تغيير الأحرف في الـ Regex (مثلاً: `{"$regex": "^a"}`)، فهذا يعني أنك تستطيع سحب البيانات بالكامل.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - NoSQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-NoSQL-Injection-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| NoSQL injection (basic) | Apprentice | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/01-basic.md) |
| NoSQL injection with operator injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/02-operator-injection.md) |
| NoSQL injection with string injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/03-string-injection.md) |
| NoSQL injection using malformed syntax | Practitioner | [الحل](../../../portswigger-labs/Server-Side/NoSQL-Injection/04-malformed-syntax.md) |
