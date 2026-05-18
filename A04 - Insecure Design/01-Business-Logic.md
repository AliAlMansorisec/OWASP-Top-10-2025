# Business Logic Vulnerabilities | ثغرات منطق الأعمال

> **OWASP Category:** [A04 - Insecure Design](../README.md)  
> **Methodology:** [Step-?? - Business Logic Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Business-Logic-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Business-Logic/)

---

## ما هي؟ | What is it?

هي عيوب في تصميم وتدفق عمل التطبيق تسمح للمهاجم باستغلال القواعد المنطقية للقيام بأفعال غير متوقعة. المطور قد يضع قيوداً في الواجهة الأمامية (Front-end) وينسى حمايتها في الخلفية، أو يفترض أن المستخدم سيتبع خطوات مرتبة (1 ثم 2 ثم 3) بينما يقوم المهاجم بالقفز مباشرة للخطوة 3.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الفهم | Context Gathering

- لا تستخدم أدوات الفحص التلقائي هنا، بل تصفح الموقع كأنك مستخدم عادي.
- افهم كيف تتم العمليات الحساسة: (الشراء، استعادة كلمة المرور، نظام النقاط، الترقية لحساب بريميوم).

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- راقب كل الطلبات (Requests) التي تتم أثناء العملية.
- ابحث عن القيم التي "يفترض" السيرفر أنها صحيحة، مثل: الأسعار، الكميات، معرفات المستخدمين.

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **الأسعار السالبة (Negative Values)** | جرب وضع كمية سالبة في سلة التسوق (`quantity: -1`) لتقليل السعر الإجمالي عند الدفع |
| **تجاوز الخطوات (Step Skipping)** | إذا كانت عملية الشراء تمر بـ 4 مراحل، جرب الانتقال من المرحلة 1 إلى 4 مباشرة (صفحة النجاح) لترى إن كان السيرفر سيتم العملية دون دفع |
| **تغيير المعرفات (Parameter Tampering)** | في نظام النقاط أو الهدايا، جرب تغيير معرف المستخدم لتعبئة نقاط لحسابك من حساب آخر |
| **تجاوز حدود المدخلات** | إرسال نص طويل جداً أو رقم ضخم جداً قد يؤدي لانهيار المنطق الحسابي للسيرفر (Integer Overflow) |

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت شراء منتج بسعر أقل من سعره الحقيقي، أو حصلت على ميزات مدفوعة مجاناً = تم الاستغلال بنجاح.

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
