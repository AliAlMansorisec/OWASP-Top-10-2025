# Authentication Vulnerabilities | ثغرات المصادقة

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-12 - Authentication & Session Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-12-Authentication-&-Session-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Authentication/)

---

## ما هي؟ | What is it?

هي عيوب في الآليات التي يستخدمها التطبيق للتأكد من هوية المستخدم الذي يحاول الدخول. لا تقتصر فقط على تخمين كلمة المرور، بل تشمل عيوباً في منطق "تذكرني"، استعادة كلمة المرور، أو حتى كيفية التعامل مع الـ (Multi-Factor Authentication - MFA).

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن صفحات تسجيل الدخول، إنشاء الحساب، واستعادة كلمة المرور.
- راقب استجابات السيرفر عند إدخال مستخدم غير موجود مقابل مستخدم موجود (Username Enumeration)؛ هل يختلف الوقت المستغرق؟ هل تختلف رسالة الخطأ؟

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم Burp Intruder لتنفيذ هجمات التخمين (Brute Force).
- جرب هجوم Credential Stuffing (استخدام تسريبات بيانات من مواقع أخرى).
- راقب الـ HTTP Headers؛ هل توجد معلومات تسرب حالة الحساب؟

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **Brute-force protection bypass** | إذا كان هناك قفل للحساب بعد 3 محاولات، جرب تغيير الـ IP أو استخدام "تخمين كلمات المرور المتعددة لمستخدم واحد" بطريقة بطيئة |
| **2FA Bypass** | حاول الوصول لصفحة الـ Dashboard مباشرة بعد إدخال الباسورد وقبل إدخال كود الـ 2FA، أو حاول تخمين كود الـ 2FA إذا كان مكوناً من 4 أرقام فقط |
| **Password Reset Flaws** | التلاعب برابط استعادة كلمة المرور (كما في Host Header Attack) أو تخمين الـ Token إذا كان ضعيفاً |
| **Stay-logged-in cookies** | تحليل الكوكيز؛ إذا كانت تحتوي على username مشفر بـ Base64 فقط، يمكنك تغييرها لـ admin والدخول |

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت الدخول لحساب مستخدم آخر دون معرفة كلمة مروره، أو تجاوزت طبقة الـ MFA = تم الاستغلال بنجاح.

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

