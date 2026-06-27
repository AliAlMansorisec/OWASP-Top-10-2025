# Web LLM Attacks | الهجمات على نماذج اللغة الضخمة

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - Web LLM Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-LLM-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Advanced/Web-LLM/)

---

## 📌 Definition (التعريف)

> ثغرات Web LLM هي هجمات تستهدف تطبيقات الويب المدمجة مع نماذج اللغة الضخمة (Large Language Models). المهاجم يستغل ضعف التعليمات البرمجية (Prompt Injection) لخداع النموذج لتنفيذ إجراءات غير مصرح بها، أو استخراج بيانات حساسة من قاعدة المعرفة (RAG)، أو التلاعب بمخرجات النموذج التي يتم تنفيذها مباشرة في المتصفح. مع انتشار تطبيقات ChatGPT APIs و AI Assistants، أصبحت هذه الثغرات من أخطر التهديدات الناشئة.

---

## 🧩 أنواعها الرئيسية | Main Types

- **الحقن المباشر (Direct Prompt Injection)**: إرسال تعليمات مباشرة للنموذج تطالبه بتجاهل تعليمات المطور الأصلية وتنفيذ أوامر المهاجم.

- **الحقن غير المباشر (Indirect Prompt Injection)**: وضع تعليمات خبيثة مخفية في محتوى صفحات ويب أو مستندات يقوم النموذج بقراءتها، مما يجعله "مصاباً" وينفذ التعليمات ضد المستخدمين الآخرين.

- **كسر الحماية (Jailbreaking)**: استخدام أساليب لغوية أو سيناريوهات افتراضية لتجاوز سياسات الأمان والقيود المفروضة على النموذج.

- **تسريب البيانات (Data Leakage)**: استدراج النموذج للكشف عن تعليمات النظام المخفية (System Prompt) أو بيانات من قواعد المعرفة المرتبطة به.

- **معالجة المخرجات غير الآمنة (Insecure Output Handling)**: استغلال مخرجات النموذج التي يتم تمريرها مباشرة إلى دوال خطيرة في المتصفح (مثل `eval` أو `innerHTML`) مما يؤدي إلى XSS.

- **الهجمات عبر الإضافات (Plugin Interactions)**: استغلال الأدوات والوظائف الممنوحة للنموذج (مثل إرسال بريد، تنفيذ SQL، استدعاء APIs) لتنفيذ عمليات ضارة.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تعقيم المدخلات والمخرجات:** نظف جميع البيانات التي تدخل إلى النموذج أو تخرج منه قبل استخدامها في التطبيق.

- **تحديد صلاحيات النموذج:** لا تمنح النموذج صلاحيات أكثر مما يحتاج؛ استخدم مبدأ Least Privilege.

- **فصل التعليمات عن المدخلات:** استخدم بنية طلب واضحة تفصل بين System Prompt ومدخلات المستخدم لمنع الحقن.

- **تعقيم مخرجات HTML:** استخدم مكتبات مثل DOMPurify لتنظيف مخرجات النموذج قبل عرضها في المتصفح.

- **مراقبة المخرجات:** راقب مخرجات النموذج لاكتشاف أي سلوك غير طبيعي أو تسريب للبيانات.

- **توعية المستخدمين:** حذر المستخدمين من الثقة العمياء بمخرجات نماذج الذكاء الاصطناعي.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - Web LLM Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-Web-LLM-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Exploiting LLM APIs with prompt injection | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-LLM/01-prompt-injection.md) |
| Exploiting LLM APIs via indirect prompt injection | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-LLM/02-indirect-prompt-injection.md) |
| Exploiting LLM APIs with insecure output handling | Practitioner | [الحل](../../../portswigger-labs/Advanced/Web-LLM/03-insecure-output.md) |
| Exploiting LLM APIs with plugin interactions | Expert | [الحل](../../../portswigger-labs/Advanced/Web-LLM/04-plugin-interactions.md) |
