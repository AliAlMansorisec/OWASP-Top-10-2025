# OAuth 2.0 Authentication Vulnerabilities | ثغرات مصادقة OAuth 2.0

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-?? - OAuth Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-OAuth-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/OAuth/)

---

## ما هي؟ | What is it?

ثغرات تحدث في عملية التفويض (Authorization) عندما لا يتم التحقق بشكل كافٍ من المعايير أثناء تبادل البيانات بين الموقع (Client) ومزود الخدمة (OAuth Provider). استغلال هذه الثغرات يؤدي غالباً إلى "سرقة الحساب" (Account Takeover) بالكامل دون الحاجة لعرفة كلمة المرور.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن أزرار "تسجيل الدخول باستخدام..." (Google, Facebook, GitHub).
- اعترض الطلب الذي يرسله الموقع لمزود الخدمة، وابحث عن بارامترات مثل:
    - `redirect_uri`: الرابط الذي سيتم إرسال "الكود" إليه بعد تسجيل الدخول
    - `client_id`: معرف التطبيق
    - `scope`: الصلاحيات المطلوبة

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- راقب كيف يتم التحقق من `redirect_uri`.
- حاول تغيير الرابط إلى موقعك الخاص: `redirect_uri=https://evil-attacker.com`
- إذا وافق السيرفر على هذا التغيير، فهذا يعني أن "كود الدخول" سيُرسل إليك بدلاً من الموقع الأصلي.

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **Improper Redirect URI Validation** | التلاعب بالرابط لسرقة الـ `code` أو الـ `access_token` |
| **Flawed CSRF Protection** | غياب بارامتر `state`. إذا لم يوجد هذا البارامتر، يمكنك عمل هجوم "ربط الحساب" (Account Linking) حيث تربط حسابك في جوجل ببروفايل الضحية في الموقع |
| **Leaking Access Tokens** | البحث عن التوكنز في الـ `Referer` header عند الانتقال لروابط خارجية |

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت الحصول على الـ `access_token` الخاص بمستخدم آخر وتسجيل الدخول بحسابه = تم الاستغلال بنجاح (Full Account Takeover).

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - OAuth Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-OAuth-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| OAuth authentication bypass via implicit flow | Practitioner | [الحل](../../../portswigger-labs/Advanced/OAuth/01-implicit-flow.md) |
| OAuth authentication bypass via credential theft | Practitioner | [الحل](../../../portswigger-labs/Advanced/OAuth/02-credential-theft.md) |
| OAuth authentication bypass via CSRF | Practitioner | [الحل](../../../portswigger-labs/Advanced/OAuth/03-csrf.md) |
| OAuth authentication bypass via redirect_uri | Practitioner | [الحل](../../../portswigger-labs/Advanced/OAuth/04-redirect-uri.md) |
| OAuth account linking vulnerability | Practitioner | [الحل](../../../portswigger-labs/Advanced/OAuth/05-account-linking.md) |
| OAuth authentication bypass via code injection | Expert | [الحل](../../../portswigger-labs/Advanced/OAuth/06-code-injection.md) |
