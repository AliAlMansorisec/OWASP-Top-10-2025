# Server-Side Template Injection (SSTI) | حقن القوالب من جهة السيرفر

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - SSTI Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-SSTI-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SSTI/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يقوم المطور بدمج مدخلات المستخدم مباشرة داخل "قالب" (Template) يتم معالجته في جهة السيرفر، بدلاً من تمريره كبيانات فقط. محركات القوالب تُستخدم لإنشاء صفحات ديناميكية، وإذا استطاع المهاجم وضع كود داخل القالب، فسيقوم السيرفر بتنفيذه.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن أماكن يظهر فيها نصك المدخل بطريقة توحي بوجود معالجة (مثل رسائل الترحيب: "Hello {User}").
- جرب إرسال عمليات حسابية بسيطة داخل أقواس القوالب الشائعة، مثل: `{{7*7}}` أو `${7*7}`.
- إذا ظهرت النتيجة في الصفحة `49` بدلاً من النص كما هو، فأنت أمام ثغرة SSTI.

### 2. تحديد نوع المحرك | Detection

- يجب معرفة أي محرك قوالب يستخدمه السيرفر (هل هو Jinja2 الخاص بـ Python؟ أم Twig الخاص بـ PHP؟).
- استخدم مخطط التدفق الشهير (Decision Tree) عبر إرسال مدخلات مثل `{{7*'7'}}`؛ فإذا كانت النتيجة `7777777` فأنت غالباً في Jinja2، وإذا كانت خطأ فأنت في محرك آخر.

### 3. حقن الكود | Exploitation Payload

- بمجرد معرفة المحرك، ابحث عن Payload مناسب للوصول لملفات النظام أو تنفيذ الأوامر.

**مثال لـ Jinja2 لقراءة ملف الباسوردات:**
```django
{{ self.__init__.__globals__.__specs__['os'].popen('cat /etc/passwd').read() }}
```

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت قراءة ملفات السيرفر أو تنفيذ أمر `whoami` والحصول على نتيجة = تم الاستغلال بنجاح (RCE).

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - SSTI Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-SSTI-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Basic server-side template injection | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SSTI/01-basic.md) |
| Basic SSTI with code context | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SSTI/02-code-context.md) |
| SSTI using document.write | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSTI/03-document-write.md) |
| SSTI in an unknown template engine | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSTI/04-unknown-engine.md) |
| SSTI with information disclosure | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSTI/05-info-disclosure.md) |
| SSTI with custom exploitation | Expert | [الحل](../../../portswigger-labs/Server-Side/SSTI/06-custom-exploitation.md) |

