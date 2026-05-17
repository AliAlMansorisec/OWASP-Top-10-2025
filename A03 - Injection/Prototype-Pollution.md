# Prototype Pollution | تلويث النموذج الأولي

> **OWASP Category:** [A03 - Injection](../README.md) | [A04 - Insecure Design](../A04-Insecure-Design/README.md)  
> **PortSwigger:** [Prototype Pollution Labs](https://portswigger.net/web-security/prototype-pollution)

---

## 📖 ما هي؟ | What is it?

تحدث هذه الثغرة عندما يقوم التطبيق بدمج (Merge) مدخلات المستخدم في كائن (Object) موجود مسبقاً دون تنظيف المسارات. في الجافا سكريبت، ترث جميع الكائنات خصائصها من "نموذج أولي" يسمى `Object.prototype`. إذا استطاع المهاجم حقن خاصية في هذا الـ prototype (عبر استخدام مفاتيح مثل `__proto__`)، فإن هذه الخاصية ستظهر فوراً في جميع الكائنات داخل بيئة التشغيل.

---

## ⚔️ كيف تستغلها؟ | How to Exploit

### 1. مرحلة الرصد | Enumeration
- ابحث عن وظائف تقوم بدمج الكائنات أو نسخها بشكل عميق (Deep Merge/Clone)، مثل المكتبات الشهيرة (Lodash أو jQuery القديمة).
- راقب البارامترات في الروابط (URL) أو مدخلات الـ JSON التي تتبع نمط المسارات، مثل: `constructor`, `__proto__`.

### 2. التحليل | Analysis
- حاول حقن خاصية عشوائية في الكائن الأساسي عبر الرابط:
  ```
  ?__proto__[polluted]=true
  ```
- في متصفحك (DevTools Console)، جرب كتابة:
  ```js
  ({}).polluted
  ```
  إذا كانت النتيجة `true` بدلاً من `undefined`.. فأنت قد لوثت الكائن بنجاح.

### 3. محاور الهجوم | Attack Vectors

#### Client-Side Prototype Pollution
- تستخدم لتنفيذ DOM-XSS. ابحث عن "Gadget" (قطعة كود برمجية) تستخدم خاصية معينة غير موجودة في الكائن، وقم بحقنها.
- مثال: إذا كان الكود يستخدم `config.transport_url` للتحميل، قم بحقن الرابط الخبيث في `Object.prototype.transport_url`.

#### Server-Side Prototype Pollution (Node.js)
- **تجاوز الصلاحيات:** إذا كان النظام يتحقق من `if (user.isAdmin)`، يمكنك حقن `isAdmin: true` في الكائن الأساسي.
- **تنفيذ أوامر عن بعد:** البحث عن وظائف مثل `child_process.spawn` وتلويث خيارات التشغيل.

### 4. تأكيد الاستغلال | Impact Verification
إذا تغير سلوك التطبيق بمجرد حقن الخاصية في `__proto__` = تم الاستغلال بنجاح.

---

## 🔍 اكتشاف الثغرة | Discovery

📂 [Prototype-Pollution-Testing.md](../../01-Methodology/Phase-3-Vulnerability-Testing/Prototype-Pollution-Testing.md)

---

## 🧪 مختبرات | Labs

| المختبر | الرابط |
|---------|--------|
| DOM XSS via client-side prototype pollution | [PortSwigger](https://portswigger.net/web-security/prototype-pollution/client-side/lab-prototype-pollution-dom-xss-via-client-side-prototype-pollution) |
| DOM XSS via alternative vector | [PortSwigger](https://portswigger.net/web-security/prototype-pollution/client-side/lab-prototype-pollution-dom-xss-via-an-alternative-prototype-pollution-vector) |
| Privilege escalation via server-side | [PortSwigger](https://portswigger.net/web-security/prototype-pollution/server-side/lab-privilege-escalation-via-server-side-prototype-pollution) |
