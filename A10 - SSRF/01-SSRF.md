# Server-Side Request Forgery (SSRF) | تزوير الطلبات من جهة السيرفر

> **OWASP Category:** [A10 - Server-Side Request Forgery](../README.md)  
> **Methodology:** [Step-14 - SSRF Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-14-SSRF-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/SSRF/)

---

## ما هي؟ | What is it?

ثغرة تسمح للمهاجم بإجبار السيرفر (Server) على إرسال طلبات HTTP إلى وجهات لا يقصدها المطور. غالباً ما تُستخدم لاستهداف الخدمات الداخلية الموجودة خلف جدار الحماية (مثل قواعد البيانات، أو لوحات تحكم Cloud Metadata) أو حتى لاستطلاع الشبكة الداخلية.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن ميزات تتطلب من السيرفر جلب بيانات من رابط خارجي، مثل:
    - استيراد صورة عبر رابط (Import Image via URL)
    - معاينة الروابط (Link Preview)
    - تحديثات البريد أو جلب ملفات من سيرفرات أخرى
- راقب البارامترات التي تحتوي على روابط مثل: `?url=https://example.com/api`

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض الطلب وأرسله إلى Repeater.
- حاول تغيير الرابط الخارجي إلى عنوان محلي: `url=http://127.0.0.1` أو `url=http://localhost`
- إذا رد السيرفر بمحتوى صفحة داخلية أو استجاب بـ `200 OK` بدلاً من خطأ، فالسيرفر مصاب.

### 3. محاور الهجوم | Attack Vectors

| الهجوم | الشرح |
|--------|-------|
| **الوصول للخدمات الداخلية** | حاول الوصول لخدمات مثل `http://192.168.1.1` أو منافذ معينة مثل `http://localhost:8080` (مثل لوحة تحكم Jenkins أو Redis) |
| **Cloud Metadata** | إذا كان الموقع مستضافاً على AWS أو Google Cloud، جرب جلب مفاتيح الوصول الحساسة: لـ AWS: `http://169.254.169.254/latest/meta-data/` |
| **Bypassing Firewalls** | تجاوز الفلاتر باستخدام ترميز مختلف (URL Encoding) أو استخدام خدمات مثل `nip.io` لتجاوز منع الـ IPs المحلية |

### 4. تأكيد الاستغلال | Impact Verification

- إذا استطعت قراءة بيانات من سيرفر داخلي غير متاح للعامة، أو حصلت على مفاتيح الـ Cloud = تم الاستغلال بنجاح.

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
