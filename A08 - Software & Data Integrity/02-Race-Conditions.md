# Race Conditions | ثغرات السباق

> **OWASP Category:** [A08 - Software and Data Integrity Failures](../README.md)  
> **Methodology:** [Step-?? - Race Conditions Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Race-Conditions-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Race-Conditions/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يعالج التطبيق عدة طلبات في نفس الوقت (بشكل متوازي) دون وجود تنسيق صحيح بينها. المهاجم يستغل "نافذة زمنية" صغيرة جداً بين لحظة التحقق من القيمة ولحظة تحديثها في قاعدة البيانات، ليقوم بإرسال طلبات مكررة بسرعة هائلة في تلك الأجزاء من الثانية.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن عمليات محدودة بـ "مرة واحدة" أو "رصيد محدد"، مثل:
    - استخدام كود خصم (Coupon) لمرة واحدة فقط
    - سحب رصيد من المحفظة (Wallet)
    - التصويت في مسابقة
    - تحويل نقاط

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

> **الأداة الأهم هنا**

- اعترض الطلب (مثل طلب تطبيق كود الخصم).
- أرسل الطلب إلى Repeater.
- أنشئ "مجموعة" (Group) تحتوي على 20 أو 30 طلباً من نفس النوع.
- استخدم ميزة **Send group in parallel (single-packet attack)**؛ هذه الميزة في Burp تجعل كل الطلبات تصل للسيرفر في نفس اللحظة تقريباً.

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **Limit Overrun** | استخدام كود خصم 50% عشر مرات في نفس الثانية لشراء منتج مجاناً، قبل أن يلحق السيرفر بتسجيل أن الكود قد استُخدم |
| **Multi-step Race** | في أنظمة استعادة كلمة المرور، إرسال عدة طلبات لتغيير البريد في وقت واحد لتجاوز التحقق |
| **Partial Construction** | استغلال الوقت الذي يستغرقه السيرفر لإنشاء جلسة (Session) جديدة للوصول إليها قبل اكتمال إعدادات الحماية عليها |

### 4. تأكيد الاستغلال | Impact Verification

- إذا نجحت العملية أكثر من المرة المسموح بها (مثلاً تم خصم المبلغ مرتين أو استُخدم الكود مرتين) = تم الاستغلال بنجاح.

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

