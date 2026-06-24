# Authentication Vulnerabilities | ثغرات المصادقة

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-12 - Authentication & Session Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-12-Authentication-&-Session-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Authentication/)

---

## 📌 Definition (التعريف)

> ثغرات المصادقة هي نقاط ضعف في آلية التحقق من هوية المستخدم. تحدث عندما يفشل التطبيق في حماية عملية تسجيل الدخول بشكل صحيح، مما يسمح للمهاجم بتجاوز كلمة المرور، أو انتحال شخصية مستخدم آخر، أو الوصول إلى حسابات بدون صلاحيات. تشمل هذه الثغرات آليات ضعيفة مثل كلمات مرور قابلة للتخمين، نقص الحماية من هجمات القوة العمياء (Brute Force)، وثغرات في المصادقة متعددة العوامل (MFA/2FA).

---

## 🧩 أنواعها الرئيسية | Main Types

- **تعداد أسماء المستخدمين (Username Enumeration)**: اكتشاف المستخدمين المسجلين عبر رسائل خطأ مختلفة، أو استجابات متباينة، أو اختلاف زمن الاستجابة.

- **هجمات القوة العمياء (Brute Force)**: تجربة كلمات مرور متعددة بشكل آلي حتى الوصول للحساب، وقد تشمل Bypass لآليات الحظر.

- **تجاوز المصادقة متعددة العوامل (2FA/MFA Bypass)**: الوصول للجلسة مباشرة بعد كلمة المرور قبل إدخال كود 2FA، أو تخمين الكود إذا كان ضعيفاً.

- **ثغرات استعادة كلمة المرور (Password Reset Flaws)**: التلاعب برابط إعادة التعيين، أو تسميم الـ Host Header، أو تخمين رمز إعادة التعيين (Reset Token).

- **استغلال كوكيز "تذكرني" (Stay-Logged-In Cookie)**: تحليل الكوكيز؛ إذا كانت محتوية على بيانات مشفرة بطريقة ضعيفة (مثل Base64) يمكن التلاعب بها.

- **تجاوز قفل الحساب (Account Lockout Bypass)**: استخدام تقنيات لتجاوز عدد المحاولات المسموحة مثل تغيير الـ IP أو استخدام قائمة كلمات مرور مع مستخدم واحد.

- **كسر كلمات المرور بدون اتصال (Offline Password Cracking)**: الحصول على هاش كلمات المرور (مثل الـ Stay-Logged-In Cookie) ومحاولة كسرها محلياً.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام رسائل خطأ موحدة:** لا تكشف إذا كان اسم المستخدم موجوداً أم لا؛ استخدم رسالة عامة مثل "اسم المستخدم أو كلمة المرور غير صحيحة".

- **تفعيل حماية من هجمات القوة العمياء:** حدد عدد المحاولات الفاشلة، واستخدم Captcha، وتأخير متزايد بين المحاولات.

- **تأمين المصادقة متعددة العوامل:** تأكد من أن الـ 2FA يتم التحقق منه بشكل صحيح ولا يمكن تخطيه، واستخدم أكواد طويلة وآمنة.

- **تأمين آلية استعادة كلمة المرور:** استخدم رموز إعادة تعيين عشوائية طويلة مع وقت انتهاء صلاحية، ولا تعتمد على Host Header.

- **تأمين كوكيز الجلسة:** استخدم تشفير قوي (AES) للكوكيز الدائمة، مع توقيع رقمي لمنع التلاعب.

- **تسجيل ومراقبة المحاولات:** سجل محاولات تسجيل الدخول الفاشلة وراقب الأنماط المشبوهة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Authentication Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-12-Authentication-&-Session-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Username enumeration via different responses | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Authentication/01-username-enumeration.md) |
| 2FA simple bypass | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Authentication/02-2fa-bypass.md) |
| Password reset poisoning via Host header | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/03-password-reset-poisoning.md) |
| Brute-forcing a stay-logged-in cookie | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/04-stay-logged-in.md) |
| Offline password cracking | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/05-offline-cracking.md) |
| 2FA broken logic | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/06-2fa-broken-logic.md) |
| Brute-forcing via account lockout bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/07-account-lockout.md) |
| Username enumeration via account lockout | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/08-username-lockout.md) |
| Multi-factor authentication bypass | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Authentication/09-mfa-bypass.md) |
