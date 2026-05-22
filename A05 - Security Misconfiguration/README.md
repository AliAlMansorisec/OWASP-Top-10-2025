# ⚙️ A05: Security Misconfiguration

---

## 📌 1. Definition (التعريف)

> **هو فشل النظام في ضبط الإعدادات الأمنية بشكل صحيح، او ترك الإعدادات الافتراضية كما هي، أو تشغيل خاصية التصحيح (Debug) في بيئة الإنتاج، أو تفعيل ميزات غير ضرورية تفتح أبواباً للمخترقين، مما يسهل على المهاجم استغلالها.**
---

## 🧩 2. Types (أنواع الثغرة)

- **الإعدادات الافتراضية (Default Configurations)**: ترك أسماء المستخدمين وكلمات المرور الافتراضية كما هي (مثل `admin/admin`).
    
- **تفعيل خاصية التصحيح (Debug Mode Enabled)**: تشغيل وضع Debug في بيئة الإنتاج مما يعرض أخطاء تفصيلية ومعلومات حساسة.
    
- **تفعيل ميزات غير ضرورية (Unnecessary Features Enabled)**: ترك خدمات أو ميزات غير مستخدمة نشطة مما يزيد سطح الهجوم.
    
- **عدم تحديث الإعدادات بعد الترقية (Not Updating Configurations After Upgrade)**: بقاء إعدادات قديمة بعد ترقية النظام أو تغيير البيئة.
    
- **رؤوس أمان مفقودة (Missing Security Headers)**: عدم إضافة رؤوس مثل `X-Frame-Options` أو `CSP` أو `HSTS` للحماية من هجمات معروفة.
    
- **رسائل خطأ مفصلة للمستخدم (Verbose Error Messages)**: ظهور أخطار تفصيلية للمستخدم تكشف مسارات الملفات أو إصدارات المكتبات.
    
- **صلاحيات ملفات غير آمنة (Insecure File Permissions)**: صلاحيات ملفات أو مجلدات تسمح بالقراءة أو الكتابة من قبل أي شخص.
---

## 🛡️ 4. How to Prevent (كيف تمنعها)

- **تغيير الإعدادات الافتراضية:** لا تترك أسماء المستخدمين أو كلمات المرور الافتراضية كما هي (مثل `admin/admin`)، وقم بتغييرها فور تثبيت النظام.
    
- **تعطيل خاصية Debug في بيئة الإنتاج:** تأكد من أن وضع Debug أو Development معطل تماماً في السيرفر الحي، لأنه يعرض معلومات حساسة.
    
- **إزالة الميزات غير الضرورية:** قم بتعطيل أي خدمات أو ميزات أو صفحات تجريبية غير مستخدمة (مثل `/phpinfo.php` أو `/backup.zip`).
    
- **تفعيل رؤوس الأمان (Security Headers):** أضف رؤوس مثل `X-Frame-Options`، `CSP`، `HSTS`، `X-Content-Type-Options` لمنع هجمات معروفة.
    
- **تحديث الإعدادات بعد كل ترقية:** بعد تحديث النظام أو تغيير البيئة، تأكد من أن الإعدادات الأمنية لم ترجع إلى الوضع الافتراضي.
    
- **استخدام أدوات المسح الآلي:** استخدم أدوات مثل `Nikto` أو `Nmap` بشكل دوري لاكتشاف أي إعدادات خاطئة أو خدمات غير ضرورية.
    
- **صلاحيات الملفات والمجلدات:** تأكد من أن الملفات الحساسة مثل `.env` أو `config.php` لا يمكن قراءتها من قبل أي مستخدم خارجي.
---

## 🧠 Attacker Mindset (كيف تفكر كمخترق؟)

- **هل فيه صفحات معروفة موجودة زي `/admin` أو `/phpinfo.php` أو `/robots.txt`؟** كيف القاها؟
- **هل الـ Debug شغال في بيئة الإنتاج؟** كيف أجرب `?debug=true` عشان أشوف الأخطاء التفصيلية؟
- **هل فيه رؤوس أمان مفقودة زي CSP أو HSTS؟** كيف أستغل ضعفها؟
---
### 🔀 Sub-Vulnerabilities (ثغرات متفرعة ضمن هذا التصنيف)

| الثغرة | الملف | الشرح |
|--------|-------|-------|
| **Web Cache Deception** | [📄 10-Cache-Deception.md](./A05-Security-Misconfiguration/10-Cache-Deception.md) | خداع نظام التخزين المؤقت لعرض معلومات حساسة |
| **Clickjacking** | [📄 06-Clickjacking.md](./A05-Security-Misconfiguration/06-Clickjacking.md) | خداع المستخدم للنقر على شيء غير ما يراه |
| **HTTP Host Header Attack** | [📄 08-Host-Header.md](./A05-Security-Misconfiguration/08-Host-Header.md) | التلاعب برأس Host لخداع السيرفر |
| **HTTP Request Smuggling** | [📄 09-Request-Smuggling.md](./A05-Security-Misconfiguration/09-Request-Smuggling.md) | تهريب طلبات HTTP لتجاوز الأمان |
| **Information Disclosure** | [📄 04-Info-Disclosure.md](./A05-Security-Misconfiguration/04-Info-Disclosure.md) | كشف معلومات حساسة من السيرفر |
| **File Upload Vulnerabilities** | [📄 05-File-Upload.md](./A05-Security-Misconfiguration/05-File-Upload.md) | رفع ملفات ضارة إلى السيرفر |
| **CORS Misconfiguration** | [📄 07-CORS.md](./A05-Security-Misconfiguration/07-CORS.md) | إعدادات خاطئة لمشاركة الموارد عبر المواقع |
| **Web Cache Poisoning** | [📄 11-Cache-Poisoning.md](./A05-Security-Misconfiguration/11-Cache-Poisoning.md) | تسميم التخزين المؤقت لعرض محتوى ضار |



