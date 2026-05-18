# Access Control Vulnerabilities

> **OWASP Category:** [A01 - Broken Access Control](../README.md)  
> **Methodology:** [Step-13 - Access Control & IDOR Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-13-Access-Control-IDOR.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Access-Control/)

---

## ما هي؟

تحدث هذه الثغرة عندما يفشل التطبيق في التحقق مما إذا كان المستخدم يمتلك الصلاحية الكافية للوصول إلى مورد معين (صفحة، ملف، بيانات مستخدم آخر) أو القيام بفعل معين (تعديل، حذف). ببساطة: "المستخدم (أ) يستطيع رؤية أو تعديل بيانات المستخدم (ب)".

---

## أنواعها الرئيسية:

- **Vertical Privilege Escalation:** مستخدم عادي يصل لصلاحيات "أدمن".
- **Horizontal Privilege Escalation (IDOR):** مستخدم يصل لبيانات مستخدم آخر له نفس المستوى من الصلاحيات.
- **Context-dependent:** استغلال منطق العمل للوصول لموارد في حالة غير مسموح بها.

---

## كيف تستغلها؟ (خطوات مفصلة)

### 1. مرحلة الرصد (Enumeration):

- سجل الدخول بحسابين مختلفين (User A و User B).
- ابحث عن بارامترات في الروابط أو الطلبات تشير إلى معرفات المستخدمين، مثل: user_id=123, account=9876, profile?id=ali.

### 2. التحليل عبر Burp Suite:

- استخدم إضافة Autorize (هذه الأداة هي الأفضل لاختبار Access Control تلقائياً).
- اعترض طلباً يخص User A، ثم قم بتغيير الـ Cookie أو الـ Token لتخص User B وشاهد هل سيظل السيرفر ينفذ الطلب؟
- جرب تغيير المعرف الرقمي: إذا كان حسابك هو id=100 جرب id=101.

### 3. محاور الهجوم (Attack Vectors):

- **IDOR (Insecure Direct Object Reference):** تغيير رقم الطلب أو رقم المستخدم في الرابط للوصول لبيانات شخص آخر.
- **Unprotected Admin Functionality:** محاولة الوصول لروابط حساسة مثل `/admin` أو `/backpanel` دون تسجيل دخول أو بحساب عادي.
- **Parameter Override:** إضافة بارامترات خفية مثل `&admin=true` أو `&role=superadmin` في طلبات التسجيل أو التحديث.
- **Referer-based Access Control:** بعض المواقع تسمح بالدخول إذا كان رأس الطلب Referer قادم من صفحة الأدمن؛ قم بتزويره.

### 4. تأكيد الاستغلال (Impact Verification):

- إذا استطعت قراءة بيانات خاصة لمستخدم آخر، أو حذفت شيئاً لا تملكه، أو رفعت صلاحياتك لصلاحيات مدير = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Access Control Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-13-Access-Control-IDOR.md)

---

## 🧪 مختبرات PortSwigger

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| IDOR caused by insecure direct object reference | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Access-Control/01-IDOR.md) |
| Horizontal privilege escalation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/02-horizontal-privilege-escalation.md) |
| Vertical privilege escalation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/03-vertical-privilege-escalation.md) |
| Missing access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/04-missing-access-control.md) |
| Referer-based access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/05-referer-based.md) |
| Method-based access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/06-method-based.md) |
| Multi-step process with no access control | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Access-Control/07-multi-step.md) |
