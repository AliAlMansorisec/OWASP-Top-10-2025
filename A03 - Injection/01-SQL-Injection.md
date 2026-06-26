# SQL Injection (SQLi) | حقن SQL

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-11 - SQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-11-SQL-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SQL-Injection/)

---

## 📌 Definition (التعريف)

> ثغرة SQL Injection تحدث عندما يقوم التطبيق بتمرير مدخلات المستخدم مباشرة إلى استعلامات قاعدة البيانات دون فلترة. المهاجم يستطيع حقن أوامر SQL خبيثة تغير من سلوك الاستعلام الأصلي، مما يسمح له بتجاوز تسجيل الدخول، قراءة بيانات حساسة من قاعدة البيانات، تعديلها، أو حتى حذفها. هذه الثغرة من أقدم الثغرات وأكثرها تأثيراً، ولا تزال مسؤولة عن العديد من اختراقات البيانات الكبيرة حتى اليوم.

---

## 🧩 أنواعها الرئيسية | Main Types

- **حقن مباشر (In-Band SQLi)**: تظهر نتائج الاستعلام مباشرة في الصفحة.
  - **Union-Based**: استخدام `UNION SELECT` لدمج نتائج استعلامات إضافية من جداول أخرى.
  - **Error-Based**: إجبار السيرفر على إظهار أخطاء تحتوي على بيانات قاعدة البيانات.

- **حقن أعمى (Blind SQLi)**: لا تظهر نتائج أو أخطاء مباشرة.
  - **Boolean-Based**: طرح أسئلة بنعم/لا على السيرفر ومراقبة الاختلاف في الاستجابة.
  - **Time-Based**: استخدام `SLEEP()` أو `WAITFOR DELAY` وجعل السيرفر يتأخر إذا تحقق شرط معين.

- **حقن خارج النطاق (Out-of-Band SQLi)**: إجبار السيرفر على الاتصال بخادم خارجي لنقل البيانات.

- **تجاوز تسجيل الدخول (Authentication Bypass)**: استخدام `' OR 1=1 --` لتجاوز صفحة تسجيل الدخول.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام Prepared Statements (Parameterized Queries):** الطريقة الأكثر أماناً. استخدم `?` أو `$1` بدلاً من دمج النصوص مباشرة.

- **إجراءات مخزنة آمنة (Stored Procedures):** استخدمها مع Parameterization وليس مع دمج النصوص.

- **التحقق من المدخلات (Input Validation):** استخدم القائمة البيضاء (Whitelist) للتحقق من نوع البيانات (أرقام، نصوص، إلخ).

- **الهروب من المدخلات (Input Escaping):** اهرب الرموز الخاصة بكل قاعدة بيانات (لكن هذه ليست الحماية الأساسية).

- **استخدام أقل الصلاحيات (Least Privilege):** حساب قاعدة البيانات الذي يتصل به التطبيق يجب أن يملك فقط الصلاحيات التي يحتاجها.

- **تحديث وتصحيح قاعدة البيانات:** استخدم أحدث إصدارات قواعد البيانات مع التصحيحات الأمنية.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - SQL Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-11-SQL-Injection-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| SQL injection UNION attack, determining the number of columns | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/01-union-columns.md) |
| SQL injection UNION attack, finding a column containing text | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/02-union-text.md) |
| SQL injection UNION attack, retrieving data from other tables | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/03-union-retrieve.md) |
| SQL injection UNION attack, retrieving multiple values | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/04-union-multiple.md) |
| SQL injection attack, querying the database type and version | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/05-version.md) |
| SQL injection attack, listing the database contents | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/06-list-contents.md) |
| Blind SQL injection with conditional responses | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/07-blind-conditional.md) |
| Blind SQL injection with conditional errors | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/08-blind-errors.md) |
| Blind SQL injection with time delays | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/09-blind-time.md) |
| Blind SQL injection with time delays and information retrieval | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/10-blind-time-info.md) |
| Blind SQL injection with out-of-band interaction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/11-blind-oast.md) |
| Blind SQL injection with out-of-band data exfiltration | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/12-blind-oast-exfil.md) |
| SQL injection with filter bypass via XML encoding | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/13-xml-encoding.md) |
| Visible error-based SQL injection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/14-visible-error.md) |
| SQL injection with filter bypass via SQL comment sequence | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/15-comment-bypass.md) |
| SQL injection with filter bypass via trigger creation | Expert | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/16-trigger-bypass.md) |
| SQL injection with filter bypass via substring injection | Expert | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/17-substring-bypass.md) |
| SQL injection with filter bypass via Hex encoding | Expert | [الحل](../../../portswigger-labs/Server-Side/SQL-Injection/18-hex-bypass.md) |
