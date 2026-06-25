# Web Cache Deception | خداع الكاش

> **OWASP Category:** [A05 - Security Misconfiguration](../README.md)  
> **Methodology:** [Step-?? - Web Cache Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/Web-Cache-Deception/)

---

## 📌 Definition (التعريف)

> ثغرة Web Cache Deception تحدث عندما يقوم خادم الكاش (مثل Cloudflare أو Nginx) بتخزين صفحات حساسة عن طريق الخطأ، بسبب طريقة تفسير المسار (Path) من قبل السيرفر الأساسي مقابل خادم الكاش. المهاجم يخدع الكاش ليعتقد أن الصفحة الحساسة هي ملف ثابت (مثل صورة JPG)، فيقوم الكاش بتخزين محتوى الصفحة بمعلومات الضحية. عندما يزور المهاجم نفس الرابط لاحقاً، يحصل على البيانات الحساسة المخزنة في الكاش.

---

## 🧩 أنواعها الرئيسية | Main Types

- **التلاعب بالمسار (Path Manipulation)**: إضافة امتداد وهمي لنهاية رابط صفحة حساسة (مثل `/account/settings/nonexistent.jpg`) لخداع الكاش بأنه ملف صورة.

- **استغلال بارامترات غير مفتاحية (Unkeyed Query Parameters)**: استخدام بارامترات لا تؤثر على مفتاح الكاش (Cache Key) ولكن تغير كيفية تفسير السيرفر للطلب.

- **حقن مفتاح الكاش (Cache Key Injection)**: التلاعب برؤوس الطلب أو البارامترات لإجبار الكاش على تخزين استجابة تحت مفتاح مختلف يمكن للمهاجم الوصول إليه لاحقاً.

- **فصل المسار (Path Delimiter Confusion)**: استغلال الاختلاف في تفسير محددات المسار بين السيرفر الأساسي وخادم الكاش (مثل `;` أو `%2f`).

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام رأس Cache-Control الصحيح:** أضف رأس `Cache-Control: no-store` للصفحات التي تحتوي على بيانات حساسة.

- **تكوين خادم الكاش بشكل صحيح:** تأكد من أن قواعد الكاش لا تخزن أي استجابة تحتوي على بيانات مستخدمين (مثل الكوكيز).

- **توحيد تفسير المسار:** تأكد من أن السيرفر الأساسي وخادم الكاش يفسران المسارات بنفس الطريقة لتجنب الاختلافات.

- **استخدام بارامترات مفتاحية:** تأكد من أن جميع بارامترات URL التي تؤثر على المحتوى مدرجة في مفتاح الكاش (Cache Key).

- **فحص تكوين الكاش:** راجع قواعد الكاش بانتظام للتأكد من عدم وجود صفحات حساسة قابلة للتخزين.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Web Cache Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-Cache-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Web cache deception with unkeyed query parameter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/01-unkeyed-query.md) |
| Web cache deception with path manipulation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/02-path-manipulation.md) |
| Web cache deception with cache key injection | Expert | [الحل](../../../portswigger-labs/Server-Side/Web-Cache-Deception/03-cache-key-injection.md) |
