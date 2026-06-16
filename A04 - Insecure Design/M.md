تمام، هذا الملف الكامل بصيغة Markdown جاهز للنشر على GitHub، مع إضافة قسم الثغرات المتفرعة من PortSwigger مثل ما طلبت:

```markdown
# 🧩 A04: Insecure Design

> **هو فشل النظام في مرحلة التصميم نفسه، حيث يتم بناء النظام بدون تفكير أمني من البداية، مما يؤدي إلى ثغرات لا يمكن إصلاحها بمجرد التعديل على الكود بل تحتاج إعادة تصميم النظام لأن المشكلة أصلها في التصميم نفسه.**

![OWASP](https://img.shields.io/badge/OWASP-Top_10_2021-blue)
![Category](https://img.shields.io/badge/Category-Insecure_Design-orange)

---

## 📖 جدول المحتويات

- [📌 التعريف التقني](#-definition-التعريف-التقني)
- [🧩 أنواع الثغرة](#-types-أنواع-الثغرة)
- [🧠 عقلية المخترق](#-attacker-mindset-عقلية-المخترق)
- [🛡️ كيفية المنع](#️-how-to-prevent-كيفية-المنع)
- [🔀 ثغرات متفرعة](#-sub-vulnerabilities-ثغرات-متفرعة-ضمن-هذا-التصنيف)
- [📚 المراجع](#-references-المراجع)

---

## 📌 Definition (التعريف التقني)

> **Insecure Design** is a category of vulnerabilities that stem from missing or ineffective security controls in the design phase of the application. Unlike implementation flaws, these issues cannot be fixed by simply patching code — they require a fundamental redesign of the system's logic.

**الخلاصة بالعربي:** المشكلة مو في الكود، المشكلة في التصميم نفسه من البداية. لو التصميم فيه خلل، الكود الكامل ما راح ينفع.

---

## 🧩 Types (أنواع الثغرة)

| # | النوع | الشرح العملي |
|---|:------|:-------------|
| 1 | **Missing Threat Modeling** | بناء النظام بدون دراسة التهديدات المتوقعة مسبقاً |
| 2 | **Trusting User Input by Design** | تصميم يفترض أن المستخدم أمين بدون وضع حدود للمدخلات |
| 3 | **Ignoring Zero Trust Principle** | الثقة بجميع الطلبات الداخلية بدون فحص |
| 4 | **No Rate Limiting or Quotas** | السماح بتجربة كلمات مرور أو إعادة تعيينها بدون حدود |
| 5 | **Security by Obscurity** | الاعتماد على إخفاء الثغرات بدلاً من تصميمها بشكل آمن |
| 6 | **Missing Secure Failure Paths** | ظهور معلومات داخلية في رسائل الخطأ بدلاً من رسالة عامة |

---

## 🧠 Attacker Mindset (عقلية المخترق)

```

🕵️ كيف يفكر المخترق؟

• "هل النظام يسمح لي بتخطي خطوات معينة؟" ← جرب أروح على خطوة 3 بدون خطوة 1
• "هل فيه حدود للطلبات؟" ← جرب أرسل 100 طلب لإعادة تعيين كلمة المرور
• "هل رسائل الخطأ تفضح معلومات؟" ← جرب أستخرج مسار الملفات أو إصدارات المكتبات
• "هل التصميم يثق فيّ زيادة عن اللزوم؟" ← جرب أتلاعب بالمنطق الداخلي للتطبيق
• "هل فيه ميزة مخفية؟" ← جرب أوصل لصفحات المفروض ما تظهر لي

```

---

## 🛡️ How to Prevent (كيفية المنع)

| الإجراء | التفاصيل |
|:--------|:---------|
| 🎯 **Threat Modeling** | حلل التهديدات المتوقعة أثناء مرحلة التصميم، قبل كتابة أي كود |
| 🔒 **Zero Trust** | لا تثق بأي طلب سواء داخلي أو خارجي، افحص كل عملية حساسة |
| ⏱️ **Rate Limiting** | حدد عدد المحاولات للعمليات الحساسة مثل إعادة تعيين كلمة المرور |
| 🚫 **Secure Failure Paths** | عند الخطأ، اعرض رسالة عامة فقط بدون تفاصيل داخلية |
| 👁️ **No Security by Obscurity** | لا تعتمد على إخفاء الصفحات أو الروابط كوسيلة حماية |
| 👥 **Security Review** | راجع التصميم من قبل فريق أمني قبل البدء في التطوير |

---

### 🔀 Sub-Vulnerabilities (ثغرات متفرعة ضمن هذا التصنيف)

| الثغرة | الملف | الشرح |
|--------|-------|-------|
| **Business Logic Vulnerabilities** | [📄 01-Business-Logic.md](./A04-Insecure-Design/01-Business-Logic.md) | استغلال طريقة عمل التطبيق بشكل غير متوقع، مثل شراء منتج بسعر سالب أو تخطي خطوات الدفع |

---

### 🌐 ثغرات متفرعة حسب تصنيف PortSwigger

| # | الثغرة | الوصف المختصر |
|---|--------|---------------|
| 1 | **Excessive Trust in Client-Side Controls** | ثقة عمياء في التحكمات المنفذة على جهة العميل فقط بدون تحقق سيرفر |
| 2 | **High-Logic Flaw** | ثغرات في منطق الأعمال المعقد مثل تجاوز حدود مشتريات أو تحويل أموال |
| 3 | **Low-Logic Flaw** | ثغرات في منطق الأعمال البسيط مثل تخطي خطوة تأكيد أو التحقق من صحة إدخال |
| 4 | **Inconsistent Handling of Exceptional Input** | معالجة غير متناسقة للمدخلات غير الطبيعية تؤدي لسلوك غير متوقع |
| 5 | **Weak Isolation on Shared Endpoint** | ضعف عزل المستخدمين على نفس نقطة النهاية مما يسمح بتسريب بيانات |
| 6 | **Insufficient Workflow Validation** | عدم التحقق من صحة تسلسل الخطوات في عملية متعددة المراحل |
| 7 | **Flawed Enforcement of Business Rules** | خلل في تطبيق القواعد التجارية مثل تجاوز حدود الخصم أو استخدام كوبون منتهي |
| 8 | **Infinite Money Flow** | خلل في تصميم المعاملات المالية يسمح بتكرار الرصيد أو استرداد مزدوج |
| 9 | **Authentication Bypass via Encryption Oracle** | تجاوز المصادقة عبر استغلال خلل في تصميم نظام التشفير |



---

## 📚 References (المراجع)

- [OWASP Top 10 - A04: Insecure Design](https://owasp.org/Top10/A04_2021-Insecure_Design/)
- [PortSwigger - Business Logic Vulnerabilities](https://portswigger.net/web-security/logic-flaws)
- [PortSwigger - Insecure Design Labs](https://portswigger.net/web-security/all-labs#insecure-design)

--
