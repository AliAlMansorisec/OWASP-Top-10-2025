# WebSockets Vulnerabilities | ثغرات WebSockets

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-?? - WebSockets Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-WebSockets-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/WebSockets/)

---

## ما هي؟ | What is it?

تحدث هذه الثغرات عندما يعتمد التطبيق على بروتوكول WebSocket لنقل البيانات الحساسة دون تطبيق نفس معايير الأمان المستخدمة في طلبات HTTP التقليدية. بما أن الاتصال يبقى مفتوحاً، فقد ينسى المطورون فحص المدخلات في كل رسالة مرسلة، مما يفتح الباب لثغرات مثل XSS أو الـ Injection.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- افتح التبويب الخاص بـ WebSockets في Burp Suite (داخل Proxy).
- راقب الرسائل المتبادلة (Messages)؛ عادة ما تبدأ بطلب HTTP يحتوي على Header يسمى `Upgrade: websocket`.
- حدد نوع البيانات المرسلة (غالباً ما تكون JSON أو نصوصاً بسيطة).

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض رسالة WebSocket مرسلة من المتصفح إلى السيرفر.
- أرسلها إلى Burp Repeater.
- لاحظ أنك تستطيع "إعادة إرسال" الرسالة وتعديل محتواها يدوياً دون الحاجة لإعادة تحميل الصفحة.

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **WebSocket XSS** | حاول حقن كود `<script>alert(1)</script>` في الرسائل التي يتم عرضها لمستخدمين آخرين (مثل رسائل الشات) |
| **Insecure IDOR** | جرب تغيير المعرفات (IDs) داخل الرسالة للوصول لبيانات مستخدم آخر |
| **Cross-Site WebSocket Hijacking (CSWSH)** | وهي تشبه CSRF؛ حيث يقوم المهاجم بإغراء الضحية لزيارة موقع خبيث يقوم بفتح اتصال WebSocket مع الموقع المصاب باستخدام كوكيز الضحية لسحب بياناته |

### 4. تأكيد الاستغلال | Impact Verification

- إذا نُفذ الكود في متصفح مستخدم آخر، أو استطعت سحب بيانات خاصة عبر الرسائل المتبادلة = تم الاستغلال بنجاح.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - WebSockets Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-WebSockets-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Manipulating WebSocket messages | Apprentice | [الحل](../../../portswigger-labs/Server-Side/WebSockets/01-manipulating-messages.md) |
| Cross-site WebSocket hijacking | Practitioner | [الحل](../../../portswigger-labs/Server-Side/WebSockets/02-cswsh.md) |
| WebSocket XSS | Practitioner | [الحل](../../../portswigger-labs/Server-Side/WebSockets/03-xss.md) |
