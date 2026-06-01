# Cross-Site Request Forgery (CSRF) | التزوير عبر المواقع

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-?? - CSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CSRF-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/CSRF/)

---
## 📌 Definition (التعريف)

> **ثغرة تحدث عندما يكون المستخدم مسجلاً الدخول في موقع ما (مثل حسابه في البنك أو بريده الإلكتروني)، ثم يفتح رابط خبيث من المهاجم دون أن يدري. هذا الرابط يخدع المتصفح ليقوم بإرسال طلب نيابة عن المستخدم (مثل تحويل أموال أو تغيير كلمة المرور) دون علمه أو موافقته، لأن المتصفح يرسل تلقائياً كوكيز الجلسة الخاصة بالمستخدم مع الطلب.**

---

## 🧩 أنواعها الرئيسية | Main Types

- **CSRF بدون حماية**: الطلب لا يحتوي على أي توكن حماية، فقط Session Cookie.

- **CSRF مع توكن ولكن التحقق يعتمد على طريقة الطلب**: التوكن موجود لكن السيرفر لا يتحقق منه إذا كانت الطريقة GET بدل POST.

- **CSRF مع توكن غير مرتبط بجلسة المستخدم**: التوكن صحيح لكن السيرفر لا يتحقق أنه خاص بهذا المستخدم.

- **CSRF مع توكن مرتبط بـ Cookie غير الجلسة**: التوكن مرتبط بـ Cookie آخر يمكن التحكم فيه.

- **CSRF مع التحقق عبر Referer (معطل أو ضعيف)**: السيرفر يعتمد على رأس Referer لكن التحقق فيه ثغرة.
---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام CSRF Tokens فريدة لكل جلسة:** توكن عشوائي طويل يتم التحقق منه في كل طلب حساس.

- **تفعيل SameSite Cookies:** استخدم `SameSite=Lax` أو `SameSite=Strict` لمنع إرسال الكوكيز مع الطلبات من مواقع خارجية.

- **التحقق من رأس Referer أو Origin:** تأكد أن الطلب قادم من نطاقك أنت فقط.

- **استخدام Custom Headers:** مثل `X-Requested-With: XMLHttpRequest` (الطلبات العادية لا ترسله تلقائياً).

- **طلب إعادة المصادقة للعمليات الحساسة جداً:** مثل طلب إدخال كلمة المرور مرة أخرى قبل تغيير البريد أو تحويل الأموال.

- **استخدام SameSite=None فقط مع Secure:** لا تستخدمه إلا إذا كنت تحتاجه، واشترط `Secure`.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - CSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CSRF-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| CSRF vulnerability with no defenses | Apprentice | [الحل](../../../portswigger-labs/Client-Side/CSRF/01-no-defenses.md) |
| CSRF where token validation depends on request method | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/02-token-validation-method.md) |
| CSRF where token is not tied to user session | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/03-token-not-tied-to-session.md) |
| CSRF where token is tied to non-session cookie | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/04-token-tied-to-non-session-cookie.md) |
| CSRF where Referer header is required and validation is broken | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/05-referer-validation-broken.md) |
