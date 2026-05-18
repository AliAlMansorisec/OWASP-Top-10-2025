# Prototype Pollution | تلويث النموذج الأولي

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - Prototype Pollution Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Prototype-Pollution-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/DOM-XSS/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يقوم التطبيق بدمج (Merge) مدخلات المستخدم في كائن (Object) موجود مسبقاً دون تنظيف المسارات. في الجافا سكريبت، ترث جميع الكائنات خصائصها من "نموذج أولي" يسمى `Object.prototype`. إذا استطاع المهاجم حقن خاصية في هذا الـ prototype (عبر استخدام مفاتيح مثل `__proto__`)، فإن هذه الخاصية ستظهر فوراً في جميع الكائنات داخل بيئة التشغيل.

---

## كيف تستغلها؟ (خطوات تفصيلية) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن وظائف تقوم بدمج الكائنات أو نسخها بشكل عميق (Deep Merge/Clone)، مثل المكتبات الشهيرة (Lodash أو jQuery القديمة).
- راقب البارامترات في الروابط (URL) أو مدخلات الـ JSON التي تتبع نمط المسارات، مثل: `constructor`, `__proto__`.

### 2. التحليل عبر Burp Suite والـ Console | Analysis

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

#### Client-Side Prototype Pollution | جهة العميل
- تستخدم لتنفيذ DOM-XSS. ابحث عن "Gadget" (قطعة كود برمجية) تستخدم خاصية معينة غير موجودة في الكائن، وقم بحقنها.
- مثال: إذا كان الكود يستخدم `config.transport_url` للتحميل، قم بحقن الرابط الخبيث في `Object.prototype.transport_url`.

#### Server-Side Prototype Pollution (Node.js) | جهة السيرفر
- **Bypassing Auth:** إذا كان النظام يتحقق من `if (user.isAdmin)`، يمكنك حقن `isAdmin: true` في الكائن الأساسي لتصبح كل الحسابات "أدمن".
- **Remote Code Execution (RCE):** البحث عن وظائف تقوم بتشغيل أوامر (مثل `child_process.spawn`) وتلويث خيارات التشغيل (Options) لإجبار السيرفر على تشغيل أمر خبيث.

### 4. تأكيد الاستغلال | Impact Verification

- إذا تغير سلوك التطبيق (ظهور نافذة alert أو تجاوز صلاحيات أو تنفيذ أمر نظام) بمجرد حقن الخاصية في الـ `__proto__` = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Prototype Pollution Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Prototype-Pollution-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Detecting client-side prototype pollution | Apprentice | [الحل](../../../portswigger-labs/Client-Side/DOM-XSS/00-prototype-pollution-detection.md) |
| DOM XSS via client-side prototype pollution | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-XSS/01-prototype-pollution-client.md) |
| DOM XSS via alternative vector | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-XSS/02-prototype-pollution-alternative.md) |
| Privilege escalation via server-side prototype pollution | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Deserialization/03-prototype-pollution-server.md) |

