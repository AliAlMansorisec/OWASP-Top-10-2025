# XXE Injection (XML External Entity) | حقن الكيانات الخارجية XML

> **OWASP Category:** [A03 - Injection](../README.md)  
> **Methodology:** [Step-?? - XXE Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-XXE-Testing.md)  
> **PortSwigger Labs:** [Solutions](../../../portswigger-labs/Server-Side/XXE/)

---

## ما هي؟ | What is it?

ثغرة تحدث عندما يقوم محلل XML (XML Parser) في التطبيق بمعالجة مدخلات تحتوي على مراجع لكيانات خارجية (External Entities) دون تثبيت الإعدادات الأمنية. ببساطة، المهاجم يرسل كود XML "ملغوم" يجبر السيرفر على قراءة ملفات من جهازه أو الاتصال بمواقع أخرى.

---

## كيف تستغلها؟ (خطوات مفصلة) | How to Exploit?

### 1. مرحلة الرصد | Enumeration

- ابحث عن أي طلب (Request) يرسل بيانات بتنسيق XML إلى السيرفر. غالباً ما تظهر في:
    - تطبيقات الـ API التي تدعم XML
    - ميزات "رفع ملفات" تقبل صيغ مثل (SVG أو DOCX) لأنها تعتمد داخلياً على XML
- راقب الـ Content-Type في Burp Suite؛ إذا كان `application/xml` أو `text/xml`

### 2. التحليل عبر Burp Suite | Analysis via Burp Suite

- اعترض الطلب وأرسله إلى Repeater.
- حاول تعديل قيمة بسيطة في الـ XML للتأكد من أن السيرفر يعالجها ويعيد عرضها.

### 3. حقن الكيان الخارجي | Exploitation Payload

- قم بإضافة تعريف DOCTYPE في بداية الطلب لتعريف كيان خارجي يشير لملف في النظام:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE test [ <!ENTITY xxe SYSTEM "file:///etc/passwd"> ]>
<user>
  <username>&xxe;</username>
  <password>password</password>
</user>
```

> هنا قمنا بتعريف كيان اسمه `&xxe;` وطلبنا منه جلب محتوى ملف الباسوردات.

### 4. تأكيد الاستغلال | Impact Verification

- افحص استجابة السيرفر (Response):
    - إذا ظهرت محتويات ملف `/etc/passwd` في مكان اسم المستخدم = تم الاستغلال بنجاح.
    - إذا لم تظهر نتيجة مباشرة، قد تكون الثغرة من نوع Blind XXE، وهنا ستحتاج لإجبار السيرفر على الاتصال بـ Burp Collaborator.

---

## 🔍 كيفية اكتشافها في منهجيتي | How to Find in My Methodology

> 📂 **راجع ملف المنهجية التفصيلي:**  
> [Web-Pentest-Methodology - Phase 3 - XXE Testing](../../../web-pentest-methodology/Phase-3-Vulnerability-Testing/Step-??-XXE-Testing.md)

---

## 🧪 مختبرات PortSwigger | PortSwigger Labs

| المختبر | الصعوبة | الحل |
|---------|--------|------|
| Exploiting XXE to retrieve files | Apprentice | [الحل](../../../portswigger-labs/Server-Side/XXE/01-retrieve-files.md) |
| Exploiting XXE to perform SSRF attacks | Apprentice | [الحل](../../../portswigger-labs/Server-Side/XXE/02-ssrf.md) |
| Blind XXE with out-of-band interaction | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/03-blind-oast.md) |
| Blind XXE with parameter entities | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/04-blind-parameter-entities.md) |
| Exploiting XXE via image file upload | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/05-image-upload.md) |
| Exploiting XXE to read files using error messages | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/06-error-messages.md) |
| Exploiting XInclude to retrieve files | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/07-xinclude.md) |
| Exploiting XXE via SVG file upload | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/08-svg-upload.md) |
| Exploiting XXE via SOAP parameter | Practitioner | [الحل](../../../portswigger-labs/Server-Side/XXE/09-soap.md) |
