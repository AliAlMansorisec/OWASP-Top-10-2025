# GraphQL API Vulnerabilities | ثغرات GraphQL API

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - GraphQL Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-GraphQL-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/GraphQL/)

---

## ما هي؟ | What is it?

GraphQL هي لغة استعلام للـ APIs تسمح للعميل (Client) بطلب "بالضبط" البيانات التي يحتاجها. بدلاً من وجود عشرات الـ Endpoints، يوجد مسار واحد غالباً (مثل `/graphql`). تكمن الخطورة في أن هذا التصميم يمنح المستخدمين أحياناً قدرة "زائدة" على الاستعلام عن بيانات أو تنفيذ عمليات (Mutations) لم تكن مخصصة لهم.

---

## كيف تستغلها؟ (خطوات احترافية) | How to Exploit?

### 1. مرحلة الاستطلاع واكتشاف المخطط | Introspection

- أول خطوة هي محاولة استخراج "الكتالوج" الكامل للـ API.
- أرسل طلب استعلام يحتوي على `__schema`. إذا رد السيرفر بكل الجداول والحقول والعمليات المتاحة، فقد حصلت على "خريطة الكنز".
- **أداة مساعدة:** استخدم إضافة InQL في Burp Suite أو أداة GraphQL Raider.

### 2. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **Insecure Introspection** | الحصول على أسماء حقول حساسة (مثل password, resetToken, isAdmin) لم تكن ظاهرة في الواجهة |
| **GraphQL Injection** | محاولة حقن رموز في بارامترات الاستعلام لتخطي المنطق البرمجي، تشبه إلى حد ما SQLi ولكن في سياق حقول GraphQL |
| **BOLA** | الوصول لبيانات مستخدم آخر عبر تغيير الـ ID في الاستعلام (مثلاً طلب `user(id: 1)` بدلاً من `id: 100`) |
| **Alias Overloading (DoS)** | إرسال استعلام واحد يحتوي على مئات الـ "Aliases" لنفس العملية، مما يجهد المعالج ويؤدي لإسقاط الخدمة |
| **Circular Queries** | إذا كانت الجداول مرتبطة ببعضها بشكل دائري (مثل: User لديه Post، والـ Post لديه Author)، يمكنك إرسال استعلام لا ينتهي |

### 3. تجاوز الحماية | Bypassing

- إذا كان الـ Introspection مغلقاً، جرب تقنية **Field Suggestions**؛ عندما تكتب حقلًا خاطئًا، قد يرد السيرفر بـ: "Did you mean 'admin_password'?".. وهكذا تكتشف الحقول يدوياً.

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت الوصول لبيانات لم تكن موثقة، أو نفذت عمليات "Mutation" (مثل تغيير كلمة مرور) دون صلاحيات كافية = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - GraphQL Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-GraphQL-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| GraphQL API with broken object level authorization | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/01-bola.md) |
| GraphQL API with introspection enabled | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/02-introspection.md) |
| GraphQL API with field suggestions enabled | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/03-field-suggestions.md) |
| GraphQL API with injection vulnerabilities | Practitioner | [الحل](../../../portswigger-labs/Advanced/GraphQL/04-injection.md) |

