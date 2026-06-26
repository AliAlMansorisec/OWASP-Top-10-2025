# Cross-Site Request Forgery (CSRF) | التزوير عبر المواقع

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-?? - CSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CSRF-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/CSRF/)

---

## 📌 Definition (التعريف)

> ثغرة CSRF تحدث عندما يقوم المهاجم بخداع متصفح الضحية لإرسال طلب غير مصرح به إلى موقع يثق به (يكون المستخدم مسجل دخوله فيه). بما أن المتصفح يرسل الكوكيز تلقائياً مع كل طلب، فإن السيرفر يعتقد أن الضحية هو من قام بالإجراء. هذه الثغرة تستهدف العمليات الحساسة مثل تغيير البريد الإلكتروني، تحويل الأموال، أو حذف الحسابات.

---

## 🧩 أنواعها الرئيسية | Main Types

- **CSRF بدون حماية (No Protection)**: الطلب لا يحتوي على أي توكن حماية، يعتمد فقط على Session Cookie.

- **CSRF مع توكن ولكن التحقق يعتمد على طريقة الطلب (Token by Method)**: التوكن موجود لكن السيرفر لا يتحقق منه إذا تم تغيير الطريقة من POST إلى GET.

- **CSRF مع توكن غير مرتبط بجلسة المستخدم (Token Not Tied to Session)**: التوكن صحيح لكن السيرفر لا يتحقق أنه خاص بهذا المستخدم، فيمكن استخدام توكن من حساب آخر.

- **CSRF مع توكن مرتبط بـ Cookie غير الجلسة (Token Tied to Non-Session Cookie)**: التوكن مرتبط بـ Cookie آخر يمكن التحكم فيه أو التلاعب به.

- **CSRF مع التحقق عبر Referer (معطل أو ضعيف)**: السيرفر يعتمد على رأس Referer للتحقق، لكنه إما معطل أو يمكن التلاعب به عبر حذفه أو تزويره.

- **CSRF مع SameSite Cookie Bypass**: استغلال إعدادات SameSite الضعيفة (مثل `None` بدون `Secure`) لتجاوز الحماية.

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
| CSRF where token is not tied to user session | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/01-token-not-tied.md) |
| CSRF where token validation depends on request method | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/02-request-method.md) |
| CSRF where token validation depends on token being present | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/03-token-present.md) |
| CSRF where token is tied to non-session cookie | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/04-non-session-cookie.md) |
| CSRF where token is duplicated in cookie | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/05-token-duplicated.md) |
| CSRF with broken Referer validation | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/06-broken-referer.md) |
| CSRF with token bypass via session cookie | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/07-session-cookie.md) |
| CSRF with SameSite Strict bypass via sibling domain | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/08-samesite-strict-bypass.md) |
| CSRF with SameSite Lax bypass via method override | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/09-samesite-lax-bypass.md) |
| CSRF with SameSite Strict bypass via client-side redirect | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/10-samesite-strict-redirect.md) |
| CSRF with SameSite Lax bypass via cookie refresh | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/11-samesite-lax-refresh.md) |
| CSRF with broken Referer validation (alternate) | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CSRF/12-broken-referer-alt.md) |
