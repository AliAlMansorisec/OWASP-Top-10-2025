
# 🔐 A01: Broken Access Control

> **خلل أمني يحدث عندما يفشل التطبيق في فرض قيود صارمة على ما يمكن للمستخدم المُصادق عليه فعله، مما يسمح للمهاجم بالوصول إلى وظائف أو بيانات غير مصرح بها.**

![OWASP](https://img.shields.io/badge/OWASP-Top_10_2021-blue)
![Category](https://img.shields.io/badge/Category-Access_Control-red)

---

## 📖 جدول المحتويات

- [📌 التعريف التقني](#-definition-التعريف-التقني)
- [🧩 أنواع الثغرة](#-types-أنواع-الثغرة)
- [🧠 عقلية المخترق](#-attacker-mindset-عقلية-المخترق)
- [🛡️ كيفية المنع](#️-how-to-prevent-كيفية-المنع)
- [🧪 كيفية الاختبار العملي](#-how-to-test-كيفية-الاختبار-العملي)
- [✅ التحقق من الإصلاح](#-remediation-verification-التحقق-من-الإصلاح)
- [🔀 ثغرات متفرعة](#-sub-vulnerabilities-ثغرات-متفرعة)
- [📚 المراجع](#-references-المراجع)

---

## 📌 Definition (التعريف التقني)

> **Broken Access Control** is a security flaw that occurs when an application fails to properly enforce restrictions on what authenticated users are allowed to do. This allows attackers to access unauthorized functionality or data.

**الخلاصة بالعربي:** المستخدم يثبت هويته (Authentication ✓)، ولكن النظام لا يحدد بشكل صحيح ما المسموح له بفعله (Authorization ✗).

---

## 🧩 Types (أنواع الثغرة)

| # | النوع | الشرح العملي | مثال |
|---|:------|:-------------|:-----|
| 1 | **IDOR** | التلاعب المباشر بمعرّف المورد في الرابط أو الطلب | تغيير `user_id=100` إلى `user_id=101` |
| 2 | **Privilege Escalation (رأسي)** | مستخدم عادي يصبح مدير (Vertical) | تغيير `role=user` إلى `role=admin` |
| 3 | **Privilege Escalation (أفقي)** | مستخدم يصل لبيانات مستخدم آخر (Horizontal) | تغيير `profile?id=10` إلى `profile?id=11` |
| 4 | **Forced Browsing** | الوصول المباشر لصفحات مخفية بدون صلاحيات | تخمين `/admin` أو `/backup` وفتحها |
| 5 | **Parameter Tampering** | تعديل قيم في الطلب لتغيير المنطق | تغيير `price=100` إلى `price=1` |
| 6 | **Missing Access Control** | غياب كامل لفحص الصلاحيات على السيرفر | API لا يتحقق من هوية المستخدم إطلاقاً |
| 7 | **Method Bypass** | تجاوز الحماية بتغيير نوع طلب HTTP | حماية على `GET` ولكن `POST` يعمل |

---

## 🧠 Attacker Mindset (عقلية المخترق)

```

🕵️ كيف يفكر المخترق؟

• "هل يوجد ID في الرابط؟" ← جرب أغيره لأشوف بيانات غيري (IDOR)
• "هل توجد صفحات إدارية مخفية؟" ← جرب /admin، /config، /api/debug
• "هل الحماية على الواجهة فقط؟" ← جرب أنادي API مباشرة بدون واجهة
• "هل الصلاحيات تفحص من السيرفر؟" ← جرب أغير role=user إلى role=admin
• "هل طريقة الطلب محمية؟" ← جرب أحول GET إلى POST أو العكس
• "هل يوجد JWT؟" ← جرب أفك تشفيره وأغير الـ Role أو أسرق JWT أدمن

```

---

## 🛡️ How to Prevent (كيفية المنع)

| الإجراء | التفاصيل |
|:--------|:---------|
| 🔒 **Server-Side Only** | كل فحص صلاحيات يجب أن يكون على السيرفر، وليس على المتصفح أبداً |
| 🚫 **Deny by Default** | امنع كل شيء افتراضياً، ثم اسمح فقط بالحد الأدنى من الصلاحيات لكل دور |
| 👤 **RBAC/ABAC** | استخدم Middleware يفحص الصلاحيات قبل كل عملية حساسة |
| 🎲 **UUIDs** | استخدم معرفات عشوائية غير قابلة للتخمين بدل الأرقام التسلسلية |
| 📝 **Log & Monitor** | سجل كل محاولات الوصول غير المصرح (403/401) وراقبها باستمرار |
| 🔑 **JWT Best Practices** | لا تخزن الصلاحيات في JWT فقط؛ تحقق من قاعدة البيانات في كل طلب حساس |

---

## 🧪 How to Test (كيفية الاختبار العملي)

### 🔹 أ. اختبار IDOR و Parameter Tampering

```

السيناريو: تطبيق فيه صفحة ملف شخصي
الهدف: الوصول لبيانات مستخدم آخر

```

1. سجل دخول بمستخدمين مختلفين (User A و User B)
2. من متصفح User A، افتح صفحة الملف الشخصي:
   ```http
   GET /api/profile/100 HTTP/1.1
   Host: target.com
   Cookie: session=UserA_token
```

3. امسك الطلب في Burp Suite وغيّر الـ ID:
   ```http
   GET /api/profile/101 HTTP/1.1
   Host: target.com
   Cookie: session=UserA_token
   ```
4. ✅ ثغرة موجودة إذا رجعت بيانات User B
5. جرب تصعيد رأسي: في طلب تعديل الملف أضف:
   ```json
   {"name": "hacker", "role": "admin"}
   ```

🔹 ب. اختبار Forced Browsing

```bash
# استخدام GoBuster لاكتشاف المسارات المخفية
gobuster dir -u https://target.com -w /usr/share/wordlists/dirb/common.txt -x php,html,js

# استخدام Dirsearch
dirsearch -u https://target.com -e php,html,js,json
```

```
🖐️ جرب يدوياً:
  • /admin          • /backup        • /api/admin
  • /config         • /console       • /swagger-ui.html
  • /graphql        • /.env          • /debug
```

✅ ثغرة موجودة إذا فتحت صفحة حساسة وأنت مسجل كمستخدم عادي

🔹 ج. اختبار Method Bypass

```http
# الطلب الأصلي ممنوع
POST /api/delete-user HTTP/1.1
→ 403 Forbidden

# جرب تغيير الطريقة
GET /api/delete-user HTTP/1.1
→ 200 OK ✅ ثغرة موجودة

# جرب طرق أخرى
PUT /api/delete-user HTTP/1.1
PATCH /api/delete-user HTTP/1.1
```

---

✅ Remediation Verification (التحقق من الإصلاح)

الثغرة الاختبار النتيجة المتوقعة بعد الإصلاح
IDOR غيّر الـ ID في الطلب 403 Forbidden أو 401 Unauthorized أو رسالة خطأ عامة
Forced Browsing حاول فتح /admin 404 Not Found أو إعادة توجيه لصفحة تسجيل الدخول
Parameter Tampering أرسل role=admin في طلب التعديل عدم تغيير الصلاحيات + تسجيل محاولة الاختراق
Method Bypass جرّب كل طرق HTTP 405 Method Not Allowed بشكل ثابت لجميع الطرق غير المسموحة

---

🔀 Sub-Vulnerabilities (ثغرات متفرعة)

الثغرة الملف الشرح المختصر
🗂️ Path Traversal Path-Traversal.md تجاوز مجلد الموقع للوصول لملفات النظام مثل /etc/passwd. يصنف هنا لأنه وصول غير مصرح لموارد السيرفر
🎭 CSRF CSRF.md إجبار متصفح الضحية على تنفيذ طلب غير مرغوب فيه. يصنف هنا لأنه يتجاوز سياسة "الطلبات من مصادر موثوقة فقط"

---

📚 References (المراجع)

· OWASP Top 10 - A01: Broken Access Control
· PortSwigger - Access Control Vulnerabilities
· HackTricks - Privilege Escalation

---

📝 تم التوثيق بواسطة: @yourusername
📅 آخر تحديث: 2026
⚠️ للأغراض التعليمية والأمنية فقط

```

---

بالتوفيق، وأي ثغرة ثانية تحتاج توثيقها بنفس الأسلوب، أنا موجود.
