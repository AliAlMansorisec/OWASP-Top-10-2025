# Cross-Origin Resource Sharing (CORS) | مشاركة الموارد عبر الأصول

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - CORS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CORS-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/CORS/)

---

## 📌 Definition (التعريف)

> ثغرة CORS تحدث عندما يقوم السيرفر بتهيئة سياسة مشاركة الموارد عبر الأصول (CORS) بشكل غير آمن. آلية CORS تسمح للسيرفر بالتحكم في أي المواقع الخارجية يمكنها قراءة استجاباته. عندما يكون التكوين ضعيفاً (مثل السماح لأي Origin أو الثقة في Origin برتوكولات غير آمنة)، يستطيع المهاجم إنشاء موقع خبيث يقرأ البيانات الحساسة للمستخدم المسجل دخوله عبر متصفحه.

---

## 🧩 أنواعها الرئيسية | Main Types

- **انعكاس غير آمن لـ Origin (Insecure Reflection)**: السيرفر يعكس أي قيمة Origin يستقبلها في رأس `Access-Control-Allow-Origin`، مما يسمح لأي موقع بقراءة البيانات.

- **الثقة في Origin بقيمة null (Trusted Null Origin)**: السيرفر يسمح بـ Origin قيمتها `null`، ويمكن للمهاجم توليد طلبات بهذه القيمة عبر iframes أو sandboxed documents.

- **الثقة في بروتوكولات غير آمنة (Trusted Insecure Protocols)**: السيرفر يثق في Origins تستخدم HTTP بدلاً من HTTPS، مما يسمح للمهاجم بعمل Man-in-the-Middle للتلاعب بالطلبات.

- **CORS مع Cookies (Access-Control-Allow-Credentials: true)**: السيرفر يسمح بإرسال الكوكيز مع الطلبات من Origins خارجية، مما يزيد خطورة تسريب البيانات الحساسة.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام قائمة بيضاء (Whitelist) صارمة:** حدد قائمة بالمواقع المسموح لها فقط، ولا تستخدم `*` أو تعكس الـ Origin تلقائياً.

- **تجنب `Access-Control-Allow-Credentials: true`:** لا تسمح بإرسال الكوكيز مع طلبات CORS إلا للضرورة القصوى، ومع Origins محددة وموثوقة فقط.

- **استخدام HTTPS فقط:** تأكد من أن كل Origins الموثوقة تستخدم HTTPS.

- **التحقق من صحة Origin:** تأكد من أن الـ Origin المطلوب موجود في القائمة البيضاء بدقة، ولا تثق في أي قيمة مرسلة.

- **تعطيل CORS للـ API الحساسة:** إذا كانت الـ API للاستخدام الداخلي فقط، لا تفعل CORS عليها.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - CORS Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-CORS-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| CORS with insecure reflection | Apprentice | [الحل](../../../portswigger-labs/Client-Side/CORS/01-insecure-reflection.md) |
| CORS with trusted null origin | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CORS/02-trusted-null.md) |
| CORS with trusted insecure protocols | Practitioner | [الحل](../../../portswigger-labs/Client-Side/CORS/03-insecure-protocols.md) |
