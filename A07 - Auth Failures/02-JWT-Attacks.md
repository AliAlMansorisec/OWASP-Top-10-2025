# JWT Attacks | هجمات JSON Web Tokens

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-?? - JWT Attacks Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-JWT-Attacks-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/JWT/)

---

## ما هي؟ | What is it?

الـ JWT هو "توكن" يتكون من ثلاثة أجزاء (Header, Payload, Signature) مفصولة بنقاط. يُستخدم لنقل المعلومات بين العميل والسيرفر بشكل آمن. تحدث الثغرة عندما يفشل السيرفر في التحقق من صحة التوقيع (Signature) أو عندما يستخدم خوارزميات تشفير ضعيفة، مما يسمح للمهاجم بتعديل بياناته (مثل تغيير اسمه من "user" إلى "admin") دون أن يكتشف السيرفر ذلك.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن التوكن في الـ Local Storage أو في الكوكيز أو في رأس الطلب `Authorization: Bearer <TOKEN>`.
- قم بفك تشفير التوكن (هو مجرد Base64) باستخدام موقع jwt.io أو إضافة JWT Editor في Burp Suite لرؤية المحتويات.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم إضافة **JWT Editor** فهي الأداة الأقوى هنا.
- راقب الـ Header؛ هل يستخدم خوارزمية `HS256` (مفتاح سري) أم `RS256` (مفتاح عام/خاص)؟

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **The "None" Algorithm** | بعض السيرفرات تقبل توكنات تم تغيير الخوارزمية فيها إلى `none`. قم بتغيير الـ `alg` في الهيدر إلى `none` وحذف التوقيع تماماً. إذا قبل السيرفر التوكن، يمكنك تعديل الـ Payload كما تشاء |
| **Weak Secret Key Brute Force** | إذا كانت الخوارزمية `HS256` والسيرفر يستخدم كلمة سر ضعيفة (مثل `123456` أو `secret`)، يمكنك استخدام أداة hashcat لتخمين المفتاح السري وتوقيع توكن جديد بنفسك |
| **Header Parameter Injection** | `jwk`: حقن مفتاح عام جديد في الهيدر وإجبار السيرفر على استخدامه للتحقق من التوقيع الذي صنعته أنت. `jku`: توجيه السيرفر لجلب المفتاح العام من رابط خارجي تملكه أنت. `kid`: استغلال هذا البارامتر لتنفيذ Directory Traversal للوصول لملف ثابت على السيرفر واستخدامه كمفتاح (مثلاً `/dev/null`) |
| **Algorithm Confusion** | إجبار السيرفر على استخدام المفتاح العام (Public Key) الخاص بخوارزمية `RS256` كمفتاح سري لخوارزمية `HS256` |

### 4. تأكيد الاستغلال | Impact Verification

- إذا قمت بتعديل حقل `sub` أو `role` إلى `admin` وقبل السيرفر الطلب ومنحك صلاحيات المدير = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - JWT Attacks Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-JWT-Attacks-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| JWT authentication bypass via unverified signature | Apprentice | [الحل](../../../portswigger-labs/Advanced/JWT/01-unverified-signature.md) |
| JWT authentication bypass via flawed signature verification | Apprentice | [الحل](../../../portswigger-labs/Advanced/JWT/02-flawed-signature.md) |
| JWT authentication bypass via weak signing key | Practitioner | [الحل](../../../portswigger-labs/Advanced/JWT/03-weak-key.md) |
| JWT authentication bypass via algorithm confusion | Practitioner | [الحل](../../../portswigger-labs/Advanced/JWT/04-algorithm-confusion.md) |
| JWT authentication bypass via jwk header injection | Practitioner | [الحل](../../../portswigger-labs/Advanced/JWT/05-jwk-injection.md) |
| JWT authentication bypass via jku header injection | Practitioner | [الحل](../../../portswigger-labs/Advanced/JWT/06-jku-injection.md) |
| JWT authentication bypass via kid header path traversal | Practitioner | [الحل](../../../portswigger-labs/Advanced/JWT/07-kid-path-traversal.md) |
| JWT authentication bypass via algorithm confusion with no exposed key | Expert | [الحل](../../../portswigger-labs/Advanced/JWT/08-algorithm-confusion-no-key.md) |
