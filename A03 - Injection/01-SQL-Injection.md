# SQL Injection (SQLi) | حقن SQL

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-11 - SQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-11-SQL-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SQL-Injection/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يتم إدخال بيانات المستخدم مباشرة في استعلامات قاعدة البيانات دون تنظيف (Sanitization). هذا يسمح للمهاجم بـ "حقن" أوامر SQL خاصة تجعل السيرفر ينفذ استعلامات لم يكن من المفترض تنفيذها، مثل عرض بيانات سرية أو تعديل قاعدة البيانات.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Discovery

- ابحث عن أي بارامتر في الرابط أو في الـ POST Data يتفاعل مع قاعدة البيانات (مثل: id=1, search=apple, category=shoes).
- جرب وضع علامة الاقتباس الفردية `'` أو المزدوجة `"` بعد القيمة. إذا ظهر خطأ في الصفحة (Database Error)، فهذا مؤشر قوي على وجود الثغرة.

### 2. أنواع الحقن | Attack Vectors

#### In-band (Classic) | الحقن المباشر
تظهر النتائج مباشرة في الصفحة.

- **Union-Based:** استخدام أمر `UNION SELECT` لدمج نتائج من جداول أخرى وعرضها.
- **Error-Based:** إجبار السيرفر على إظهار الخطأ الذي يحتوي على المعلومات المطلوبة (مثل اسم قاعدة البيانات).

#### Blind SQLi | الحقن الأعمى (الأكثر شيوعاً حالياً)
لا يظهر أي خطأ أو بيانات في الصفحة، وتعتمد على ملاحظة التغيير في سلوك الموقع:

- **Boolean-based:** تسأل السيرفر سؤالاً (صح/خطأ). إذا كانت الإجابة صحيحة تظهر الصفحة بشكل معين، وإذا خاطئة تظهر بشكل آخر.
- **Time-based:** تطلب من السيرفر التأخر في الرد (مثلاً `SLEEP(10)`) إذا تحقق شرط معين. إذا تأخر السيرفر، فأنت تعلم أن الشرط تحقق.

### 3. الاستغلال المتقدم | Advanced Exploitation

- استخراج أسماء الجداول (`Information_schema.tables`)
- استخراج أسماء الأعمدة (`Information_schema.columns`)
- سحب البيانات (أسماء المستخدمين، كلمات المرور المشفرة)

### 4. تأكيد الاستغلال | Impact Verification

- الحصول على نسخة من قاعدة البيانات أو تجاوز صفحة تسجيل الدخول باستخدام `' OR 1=1 --` = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - SQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-11-SQL-Injection-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| SQL injection vulnerability in WHERE clause | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/01-where-clause.md) |
| Blind SQL injection with conditional responses | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/02-blind-conditional.md) |
| SQL injection with UNION attack | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/03-union-attack.md) |
| Blind SQL injection with time delays | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/04-blind-time-delays.md) |
| SQL injection with filter bypass via XML encoding | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/05-filter-bypass-xml.md) |
| Second-order SQL injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/06-second-order.md) |
