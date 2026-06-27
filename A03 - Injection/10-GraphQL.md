# GraphQL API Vulnerabilities | ثغرات GraphQL API

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - GraphQL Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-GraphQL-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/GraphQL/)

---

## 📌 Definition (التعريف)

> ثغرات GraphQL API تحدث عندما يتم تكوين واجهة GraphQL بشكل غير آمن، مما يسمح للمهاجم باستغلال ميزات مثل Introspection لاستخراج مخطط قاعدة البيانات بالكامل، أو تجاوز صلاحيات الوصول إلى الكائنات (BOLA)، أو تنفيذ هجمات حقن عبر المدخلات، أو حتى تنفيذ هجمات حجب الخدمة (DoS) عبر استعلامات دائرية أو Alias Overloading. GraphQL يعطي للمستخدم مرونة كبيرة في طلب البيانات، وهذه المرونة قد تصبح سلاحاً إذا لم تقيد بشكل صحيح.

---

## 🧩 أنواعها الرئيسية | Main Types

- **Introspection غير آمن (Insecure Introspection)**: تفعيل ميزة Introspection التي تسمح للمهاجم باستخراج المخطط الكامل للـ API بما فيه الحقول الحساسة.

- **تجاوز صلاحيات الكائنات (Broken Object Level Authorization - BOLA)**: الوصول إلى بيانات مستخدمين آخرين عبر تغيير المعرفات في استعلامات GraphQL.

- **حقن GraphQL (GraphQL Injection)**: حقن رموز خبيثة في بارامترات الاستعلام لتجاوز المنطق البرمجي أو الوصول لبيانات غير مصرح بها.

- **اقتراحات الحقول (Field Suggestions)**: استغلال ميزة اقتراح الحقول (التي تقترح أسماء الحقول عند كتابة اسم خاطئ) لاكتشاف الحقول الحساسة يدوياً حتى مع تعطيل Introspection.

- **Alias Overloading (DoS)**: إرسال استعلام واحد يحتوي على مئات الأسماء المستعارة (Aliases) لنفس العملية لإجهاد السيرفر.

- **الاستعلامات الدائرية (Circular Queries)**: استغلال العلاقات الدائرية بين الجداول لإنشاء استعلامات لا نهائية تستهلك موارد السيرفر.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تعطيل Introspection في بيئة الإنتاج:** تأكد من تعطيل ميزة Introspection وField Suggestions لمنع استخراج المخطط.

- **تحديد عمق الاستعلامات (Query Depth Limiting):** حدد أقصى عمق للاستعلامات المتداخلة لمنع الاستعلامات الدائرية.

- **تحديد تعقيد الاستعلامات (Query Complexity Analysis):** احسب "تكلفة" كل استعلام وارفض الاستعلامات ذات التكلفة العالية.

- **تحديد معدل الطلبات (Rate Limiting):** فرض حدود على عدد الطلبات لمنع هجمات Alias Overloading وDoS.

- **التحقق من الصلاحيات لكل حقل:** لا تعتمد على الواجهة الأمامية؛ تحقق من صلاحيات المستخدم عند كل حقل وكل عملية.

- **استخدام قائمة بيضاء للحقول:** حدد الحقول المسموح بها في الاستعلامات وارفض أي حقول غير معروفة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - GraphQL Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-GraphQL-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| GraphQL API with broken object level authorization | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/01-bola.md) |
| GraphQL API with introspection enabled | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/02-introspection.md) |
| GraphQL API with field suggestions enabled | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/03-field-suggestions.md) |
| GraphQL API with injection vulnerabilities | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/04-injection.md) |
