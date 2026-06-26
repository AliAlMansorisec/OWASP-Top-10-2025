# WebSockets Vulnerabilities | ثغرات WebSockets

> **OWASP Category:** [A07 - Identification and Authentication Failures](../README.md)  
> **Methodology:** [Step-?? - WebSockets Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-WebSockets-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/WebSockets/)

---

## 📌 Definition (التعريف)

> ثغرات WebSockets تحدث عندما يقوم التطبيق بإنشاء قناة اتصال دائمة (Persistent Channel) بين المتصفح والسيرفر دون حماية كافية. WebSockets تسمح بتبادل البيانات في الوقت الفعلي (Real-Time)، لكنها قد تكون عرضة لهجمات مثل XSS عبر الرسائل المتبادلة، أو اختطاف الاتصال عبر Cross-Site WebSocket Hijacking (CSWSH) الذي يشبه هجمات CSRF. المهاجم يستغل ضعف المصادقة أو التحقق من صحة الرسائل للوصول إلى بيانات المستخدمين أو تنفيذ أكواد خبيثة.

---

## 🧩 أنواعها الرئيسية | Main Types

- **التلاعب برسائل WebSocket (Message Manipulation)**: تعديل محتوى الرسائل المتبادلة بين العميل والسيرفر للوصول لبيانات غير مصرح بها أو تنفيذ عمليات غير متوقعة.

- **Cross-Site WebSocket Hijacking (CSWSH)**: هجوم يشبه CSRF حيث يقوم المهاجم بإنشاء موقع خبيث يفتح اتصال WebSocket مع الموقع المستهدف باستخدام كوكيز الضحية، مما يسمح بقراءة وكتابة البيانات نيابة عن الضحية.

- **WebSocket XSS**: حقن سكربتات خبيثة في رسائل WebSocket التي يتم عرضها لمستخدمين آخرين (مثل تطبيقات الشات أو الإشعارات الفورية).

- **ضعف المصادقة (Authentication Failures)**: فتح اتصال WebSocket دون التحقق من صلاحية المستخدم أو عدم تجديد التوكنات.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **التحقق من Origin:** تأكد من أن طلبات WebSocket قادمة من نطاقك الموثوق فقط عبر فحص رأس `Origin`.

- **استخدام توكنات المصادقة:** أضف توكنات مصادقة عشوائية في طلب الاتصال الأولي (Handshake) للتحقق من هوية المستخدم.

- **تعقيم الرسائل:** نظف جميع البيانات المستقبلة عبر WebSocket قبل عرضها للمستخدمين.

- **استخدام wss://:** استخدم بروتوكول WebSocket الآمن (WSS) بدلاً من WS غير المشفر.

- **تحديد مهلة الاتصال (Timeout):** أغلق اتصالات WebSocket الخاملة تلقائياً لمنع اختطاف الجلسات.

- **تجنب SameSite=None:** استخدم `SameSite=Lax` أو `SameSite=Strict` للكوكيز لمنع CSWSH.

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
