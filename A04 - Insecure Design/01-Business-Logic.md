# Business Logic Vulnerabilities | ثغرات منطق الأعمال

> **OWASP Category:** [A04 - Insecure Design](../README.md)  
> **Methodology:** [Step-?? - Business Logic Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Business-Logic-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Business-Logic/)

---

## 📌 Definition (التعريف)

> هي عيوب في تصميم وتدفق عمل التطبيق تسمح للمهاجم باستغلال القواعد المنطقية للقيام بأفعال غير متوقعة. المطور قد يضع قيوداً في الواجهة الأمامية (Front-end) وينسى حمايتها في الخلفية، أو يفترض أن المستخدم سيتبع خطوات مرتبة (1 ثم 2 ثم 3) بينما يقوم المهاجم بالقفز مباشرة للخطوة 3.

---

## 🧩 أنواعها الرئيسية | Main Types

- **التلاعب بالأسعار والكميات (Price/Quantity Manipulation)**: استخدام قيم سالبة أو صفرية لتغيير السعر الإجمالي.

- **تجاوز تسلسل الخطوات (Workflow Bypass)**: القفز من الخطوة الأولى للأخيرة مباشرة لتخطي التحقق أو الدفع.

- **تغيير المعرفات (Parameter Tampering)**: تغيير معرف المستخدم أو المنتج في الطلب للوصول لبيانات أو مميزات غير مصرح بها.

- **استغلال حدود المدخلات (Input Boundary Abuse)**: إرسال أرقام ضخمة جداً تؤدي إلى Overflow أو أخطاء في الحسابات.

- **عزل ضعيف للنقاط المزدوجة (Weak Dual-Use Endpoints)**: استغلال نقطة نهاية واحدة تقوم بوظيفتين مختلفتين حسب السياق.

- **ضعف في تطبيق القواعد (Flawed Rule Enforcement)**: استغلال عدم اتساق تطبيق القواعد الأمنية عبر جميع مداخل التطبيق.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **التحقق من صحة المنطق في الخلفية (Server-Side Validation):** لا تثق أبداً بالمدخلات القادمة من الواجهة الأمامية، وتحقق من صحة القيم والعمليات في السيرفر.

- **فرض تسلسل العمليات (Workflow Enforcement):** تأكد من أن كل خطوة تتم بالترتيب الصحيح وأنه لا يمكن تخطيها.

- **التحقق من ملكية الموارد (Ownership Verification):** تأكد من أن المستخدم يملك الصلاحية للوصول إلى الموارد التي يطلبها.

- **مراقبة الأنماط غير الطبيعية (Anomaly Detection):** راقب الأنشطة غير الطبيعية مثل تغيير الأسعار أو الكميات بشكل متطرف.

- **اختبار السيناريوهات المنطقية (Logic Testing):** اختبر التطبيق بسيناريوهات غير متوقعة للتأكد من عدم وجود ثغرات منطقية.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Business Logic Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Business-Logic-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Excessive trust in client-side controls | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/01-excessive-trust.md) |
| High-level logic vulnerability | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/02-high-level-logic.md) |
| Low-level logic vulnerability | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/03-low-level-logic.md) |
| Inconsistent handling of exceptional input | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/04-inconsistent-handling.md) |
| Weak isolation on dual-use endpoint | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/05-weak-isolation.md) |
| Insufficient workflow validation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/06-insufficient-workflow.md) |
| Authentication bypass via flawed state machine | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/07-auth-bypass.md) |
| Flawed enforcement of business rules | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/08-flawed-enforcement.md) |
| Infinite money logic flaw | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/09-infinite-money.md) |
| Flawed access control logic | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Business-Logic/10-flawed-access-control.md) |
