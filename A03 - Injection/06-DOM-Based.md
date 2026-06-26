# DOM-based Vulnerabilities | الثغرات المعتمدة على DOM

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - DOM-Based Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-DOM-Based-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Client-Side/DOM-Based/)

---

## 📌 Definition (التعريف)

> ثغرات DOM-based تحدث عندما يتم التلاعب بـ Document Object Model (DOM) في متصفح الضحية عبر مدخلات غير موثوقة. على عكس الثغرات التقليدية التي تحدث في السيرفر، هذه الثغرات تحدث بالكامل في جانب العميل (Client-Side). الكود الخبيث يصل إلى "Source" (مصدر بيانات يتحكم فيه المهاجم، مثل URL Fragment) ويتدفق إلى "Sink" (دالة JavaScript خطيرة مثل `innerHTML` أو `eval`) دون فلترة، مما يسمح بتنفيذ JavaScript أو عمليات تلاعب أخرى.

---

## 🧩 أنواعها الرئيسية | Main Types

- **DOM XSS via innerHTML**: استخدام `innerHTML` مع مدخلات غير موثوقة لحقن HTML وJavaScript.

- **DOM XSS via document.write**: استخدام `document.write` لكتابة مدخلات غير موثوقة مباشرة في الصفحة.

- **DOM XSS via jQuery sinks**: استغلال دوال jQuery مثل `html()` أو `append()` التي تقبل مدخلات غير موثوقة.

- **DOM XSS via AngularJS expressions**: استغلال تعبيرات AngularJS {{ }} لحقن وتنفيذ JavaScript.

- **DOM XSS via Web Messages**: استغلال `postMessage` API مع مستمعين (Listeners) غير آمنين لاستقبال وتنفيذ بيانات خبيثة.

- **DOM XSS via Web Messages + JSON.parse**: استغلال مستمعي Web Messages الذين يستخدمون `JSON.parse` دون التحقق من صحة البيانات.

- **DOM XSS via Client-Side Prototype Pollution**: استغلال تلويث النموذج الأولي في JavaScript لتنفيذ XSS عبر DOM.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **تجنب الدوال الخطيرة:** لا تستخدم `innerHTML`، `document.write`، `eval`، `setTimeout(string)` مع مدخلات المستخدم.

- **استخدام دوال آمنة:** استخدم `textContent` بدلاً من `innerHTML`، و `JSON.parse` بدلاً من `eval`.

- **تعقيم المدخلات:** استخدم مكتبات مثل DOMPurify لتنظيف HTML قبل إدخاله في DOM.

- **التحقق من Web Messages:** تحقق من `origin` في مستمعي `postMessage`، وصحة البيانات قبل استخدامها.

- **استخدام CSP:** طبق Content-Security-Policy صارمة تمنع inline scripts وتحدد مصادر JavaScript المسموحة.

- **تجنب Prototype Pollution:** جمد النموذج الأولي باستخدام `Object.freeze(Object.prototype)` أو تجنب عمليات الدمج غير الآمنة.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - DOM-Based Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-DOM-Based-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| DOM XSS in document.write sink | Apprentice | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/01-document-write.md) |
| DOM XSS in innerHTML sink | Apprentice | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/02-innerhtml.md) |
| DOM XSS in jQuery sink | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/03-jquery-sink.md) |
| DOM XSS in AngularJS expression | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/04-angularjs.md) |
| DOM XSS using web messages | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/05-web-messages.md) |
| DOM XSS using web messages and JSON.parse | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/06-web-messages-json.md) |
| DOM XSS via client-side prototype pollution | Practitioner | [الحل](../../../portswigger-labs/Client-Side/DOM-Based/07-prototype-pollution.md) |
