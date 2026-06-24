# Race Conditions | ثغرات السباق

> **OWASP Category:** [A08 - Software and Data Integrity Failures](../README.md)  
> **Methodology:** [Step-?? - Race Conditions Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Race-Conditions-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Race-Conditions/)

---

## 📌 Definition (التعريف)

> ثغرة Race Condition تحدث عندما يعالج التطبيق عدة طلبات في نفس الوقت (بشكل متوازي) دون وجود تنسيق صحيح بينها. المهاجم يستغل "نافذة زمنية" صغيرة جداً بين لحظة التحقق من القيمة ولحظة تحديثها في قاعدة البيانات، ليقوم بإرسال طلبات مكررة بسرعة هائلة في تلك الأجزاء من الثانية. هذه الثغرة تستهدف آليات مثل استخدام الكوبونات لمرة واحدة، أو سحب الأرصدة، أو إنشاء الجلسات.

---

## 🧩 أنواعها الرئيسية | Main Types

- **تجاوز الحدود (Limit Overrun)**: استغلال نافذة السباق لتطبيق كود خصم أو استهلاك رصيد أكثر من المسموح به قبل أن يسجل السيرفر الاستخدام.

- **هجمات متعددة الخطوات (Multi-Step Race)**: استهداف عمليات تتطلب عدة خطوات مثل استعادة كلمة المرور، وإرسال طلبات متزامنة لتجاوز التحقق في الخطوات الوسيطة.

- **ثغرات بناء الجلسة (Session Construction)**: استغلال الوقت الذي يستغرقه السيرفر لإنشاء جلسة جديدة، للوصول إليها قبل اكتمال إعدادات الحماية عليها.

- **ثغرات البناء الجزئي (Partial Construction)**: الوصول إلى كائنات أو موارد أثناء بنائها وقبل اكتمال إعدادات الأمان الخاصة بها.

- **استرداد الرموز (Token Redemption)**: استغلال سباق الطلبات لاسترداد أو استخدام نفس الرمز المميز (Token) أكثر من مرة.

- **التلاعب بالبيانات (Data Manipulation)**: استغلال السباق لتعديل بيانات في قاعدة البيانات قبل أن تكتمل عملية التحقق منها.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام أقفال قاعدة البيانات (Database Locking):** استخدم أقفال الصفوف (Row Locking) أو الأقفال المتفائلة (Optimistic Locking) لمنع التعديل المتزامن.

- **استخدام العمليات الذرية (Atomic Operations):** تأكد من أن عمليات التحقق والتحديث تتم في خطوة واحدة ذرية (مثل `UPDATE ... WHERE` مع شرط الرصيد).

- **فرض التسلسل (Serialization):** عالج الطلبات المتشابهة من نفس المستخدم بشكل متسلسل وليس متوازي.

- **استخدام معرّفات فريدة (Idempotency Keys):** أضف مفتاح فريد لكل عملية لمنع تنفيذها أكثر من مرة.

- **تسجيل ومراقبة التزامن:** سجل محاولات السباق وراقب الأنماط غير الطبيعية للطلبات المتزامنة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Race Conditions Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Race-Conditions-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Race condition with limit overrun | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/01-limit-overrun.md) |
| Race condition with multi-step process | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/02-multi-step.md) |
| Race condition with session construction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/03-session-construction.md) |
| Race condition with partial construction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/04-partial-construction.md) |
| Race condition with token redemption | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/05-token-redemption.md) |
| Race condition with data manipulation | Expert | [الحل](../../../portswigger-labs/Server-Side/Race-Conditions/06-data-manipulation.md) |
