# Server-Side Template Injection (SSTI) | حقن القوالب من جهة السيرفر

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - SSTI Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-SSTI-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SSTI/)

---

## 📌 Definition (التعريف)

> ثغرة Server-Side Template Injection (SSTI) تحدث عندما يقوم التطبيق بدمج مدخلات المستخدم مباشرة في قوالب السيرفر (Templates) دون فلترة. محركات القوالب مثل Jinja2 (Python)، Twig (PHP)، Freemarker (Java)، و ERB (Ruby) تستخدم لإنشاء صفحات HTML ديناميكية. عندما يتم حقن كود القالب بدلاً من النص العادي، يقوم المحرك بتنفيذه على السيرفر، مما قد يؤدي إلى قراءة ملفات النظام، تنفيذ أوامر (RCE)، أو الوصول الكامل للسيرفر.

---

## 🧩 أنواعها الرئيسية | Main Types

- **SSTI أساسي (Basic SSTI)**: حقن تعبيرات القوالب مباشرة مثل `{{7*7}}` واستقبال النتيجة `49` في الصفحة.

- **SSTI في سياق الكود (Code Context)**: استغلال القالب عندما يكون المدخل داخل كود برمجي وليس مجرد نص، مما يتطلب صياغة خاصة للـ Payload.

- **SSTI مع document.write**: استغلال دوال JavaScript التي تكتب مباشرة في الصفحة مع بيانات القالب.

- **SSTI في محرك غير معروف (Unknown Engine)**: استخدام تقنيات تحديد المحرك ثم بناء Payload مناسب لنوع المحرك المستخدم.

- **SSTI مع تسريب المعلومات (Information Disclosure)**: استخدام القوالب لاستخراج معلومات حساسة مثل متغيرات البيئة أو ملفات الإعدادات.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **عدم دمج مدخلات المستخدم في القوالب:** تجنب تمرير مدخلات المستخدم مباشرة إلى محرك القوالب.

- **استخدام محرك قوالب بدون منطق (Logic-less Templates):** استخدم محركات مثل Mustache التي لا تسمح بتنفيذ الأكواد البرمجية.

- **تعقيم المدخلات:** نظف مدخلات المستخدم من رموز القوالب مثل `{{ }}` و `${ }` و `<%= %>`.

- **استخدام بيئة معزولة (Sandbox):** شغل محرك القوالب في بيئة معزولة تمنع الوصول إلى دوال النظام الخطيرة.

- **تحديث محركات القوالب:** استخدم أحدث إصدارات محركات القوالب مع إعدادات الأمان الافتراضية.

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
