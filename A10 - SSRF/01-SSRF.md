# Server-Side Request Forgery (SSRF) | تزوير الطلبات من جهة السيرفر

> **OWASP Category:** [A10 - Server-Side Request Forgery](../README.md)  
> **Methodology:** [Step-14 - SSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-14-SSRF-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SSRF/)

---

## 📌 Definition (التعريف)

> ثغرة SSRF تحدث عندما يسمح تطبيق الويب للمهاجم بإجبار السيرفر على إرسال طلبات HTTP إلى وجهات يحددها المهاجم. السيرفر يعمل هنا "كوسيط" بين المهاجم والشبكة الداخلية. بدلاً من مهاجمة السيرفر مباشرة، تستخدم السيرفر نفسه لاستهداف خدمات داخلية لا يمكن الوصول إليها من الإنترنت مثل قواعد البيانات، لوحات التحكم، خدمات Metadata السحابية (Cloud Metadata)، أو حتى فحص المنافذ الداخلية.

---

## 🧩 أنواعها الرئيسية | Main Types

- **SSRF عادي (Basic SSRF)**: إجبار السيرفر على طلب عنوان محلي مثل `http://127.0.0.1` أو `http://localhost` والوصول لخدمات داخلية.

- **SSRF لاستهداف الأنظمة الخلفية (Back-End Systems)**: الوصول إلى أنظمة داخلية أخرى عبر الشبكة المحلية مثل `http://192.168.1.1/admin`.

- **SSRF لاستهداف Cloud Metadata**: استهداف خدمات البيانات الوصفية السحابية مثل AWS Metadata (`http://169.254.169.254/latest/meta-data/`) لسرقة مفاتيح الوصول.

- **SSRF مع تجاوز الفلاتر (Filter Bypass)**: تجاوز القوائم السوداء أو البيضاء باستخدام ترميز URL، أو عنوان IP بصيغ مختلفة، أو خدمات DNS خاصة.

- **SSRF أعمى (Blind SSRF)**: إرسال طلبات إلى وجهات خارجية دون رؤية الرد مباشرة، لكن يمكن تأكيدها عبر Out-of-Band (OAST) أو تفاعلات DNS.

- **SSRF مع Shellshock**: استغلال ثغرة Shellshock في الخدمات الداخلية عبر SSRF لتنفيذ أوامر على السيرفر.

---

## 🛡️ How to Prevent (كيف تمنعها)

- **استخدام قائمة بيضاء (Whitelist) للنطاقات المسموحة:** حدد قائمة بالنطاقات التي يمكن للسيرفر الاتصال بها وارفض أي شيء آخر.

- **منع الوصول للعناوين الداخلية:** امنع السيرفر من الوصول لعناوين IP داخلية مثل `127.0.0.1`، `10.0.0.0/8`، `192.168.0.0/16`.

- **تعطيل البروتوكولات غير الضرورية:** اسمح فقط ببروتوكول HTTP/HTLS وامنع بروتوكولات مثل `file://`، `gopher://`، `ftp://`.

- **التحقق من صحة المدخلات:** تأكد من أن الرابط المدخل يبدأ بـ `https://` ويشير إلى نطاق مسموح به فقط.

- **استخدام وسيط (Proxy) للطلبات الخارجية:** استخدم وكيل وسيط للتحكم بالطلبات الصادرة ومراقبتها.

- **تعطيل إعادة التوجيه (Redirects):** امنع السيرفر من متابعة إعادة التوجيه لمنع تجاوز الفلاتر عبر Open Redirect.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - SSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-14-SSRF-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Basic SSRF against the local server | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SSRF/01-basic-local.md) |
| Basic SSRF against another back-end system | Apprentice | [الحل](../../../portswigger-labs/Server-Side/SSRF/02-basic-backend.md) |
| SSRF with blacklist-based input filter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSRF/03-blacklist-filter.md) |
| SSRF with whitelist-based input filter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSRF/04-whitelist-filter.md) |
| SSRF with filter bypass via open redirection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSRF/05-open-redirection.md) |
| Blind SSRF with out-of-band detection | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSRF/06-blind-oast.md) |
| Blind SSRF with Shellshock exploitation | Practitioner | [الحل](../../../portswigger-labs/Server-Side/SSRF/07-shellshock.md) |
