# 🛡️ OWASP Top 10 2025 | دليل اختبار الاختراق

> **Complete OWASP Top 10 2025 reference. Structured methodology, deep vulnerability analysis, and PortSwigger lab solutions. Enterprise-grade security assessment skills aligned with industry standards.**

---

## 📖 عن المستودع | About

مرجع تقني متكامل لأهم عشر ثغرات في أمان تطبيقات الويب وفق تصنيف OWASP Top 10 2025.  
يشمل هذا المستودع:

- ✅ شرح مفصل لكل ثغرة مع أمثلة عملية
- ✅ منهجية اختبار اختراق منظمة خطوة بخطوة
- ✅ تحليل معمق لأساليب الاستغلال والتجاوز
- ✅ حلول عملية لمختبرات PortSwigger
- ✅ روابط مباشرة بين الثغرات والمنهجية والمختبرات

---

## 🔥 What's Inside Each Vulnerability Folder?

Each category contains structured notes covering:

| # | Section | Description |
|---|---------|-------------|
| 🧠 | **Real-World Analogies** | Simple explanations to understand the vulnerability from a practical perspective |
| 📌 | **Professional Definition** | Technical explanation of the vulnerability and its security impact |
| 🔥 | **Why It's Dangerous** | Understanding real attack consequences and exploitation impact |
| 🧩 | **Common Vulnerability Types** | Most common attack patterns and real-world cases |
| 🧠 | **Attacker Mindset** | How professional attackers think when targeting the vulnerability |
| 🛠️ | **Practical Discovery** | Practical testing methodology and discovery workflow |
| 🛡️ | **Remediation & Hardening** | Professional mitigation and security best practices |

---

## 📂 هيكل المستودع | Repository Structure

```
owasp-top-10-2025/
│
├── README.md
│
├── A01-Broken-Access-Control/
│   ├── README.md              # ثغرات التحكم في الوصول (IDOR, Privilege Escalation)
│   ├── 05-Path-Traversal.md
│   └── 06-CSRF.md
│
├── A02-Cryptographic-Failures/
│   └── README.md
│
├── A03-Injection/
│   ├── 01-SQL-Injection.md
│   ├── 02-NoSQL-Injection.md
│   ├── 03-Command-Injection.md
│   ├── 04-Prototype-Pollution.md
│   ├── 06-XSS.md
│   ├── 07-DOM-Based.md
│   ├── 08-SSTI.md
│   ├── 09-XXE.md
│   ├── 10-Web-LLM.md
│   └── 11-GraphQL.md
│
├── A04-Insecure-Design/
│   └── 01-Business-Logic.md
│
├── A05-Security-Misconfiguration/
│   ├── 04-Web-Cache-Deception.md
│   ├── 05-Clickjacking.md
│   ├── 06-Host-Header.md
│   ├── 07-Request-Smuggling.md
│   ├── 08-Info-Disclosure.md
│   ├── 09-File-Upload.md
│   ├── 10-CORS.md
│   └── 11-Web-Cache-Poisoning.md
│
├── A06-Vulnerable-Components/
│   └── README.md
│
├── A07-Auth-Failures/
│   ├── README.md              # Authentication vulnerabilities
│   ├── 04-JWT-Attacks.md
│   ├── 05-WebSockets.md
│   └── 06-OAuth.md
│
├── A08-Data-Integrity/
│   ├── 02-Insecure-Deserialization.md
│   └── 03-Race-Conditions.md
│
├── A09-Logging-Monitoring/
│   └── README.md
│
└── A10-SSRF/
    └── README.md
```

---

## 📊 جدول الثغرات | Vulnerabilities Table

| # | Vulnerability | Category | File |
|---|---------------|----------|------|
| A01 | Broken Access Control | IDOR, Path Traversal, CSRF | [📁](A01-Broken-Access-Control/) |
| A02 | Cryptographic Failures | Weak Crypto, TLS Issues | [📁](A02-Cryptographic-Failures/) |
| A03 | Injection | SQL, NoSQL, Command, XSS, SSTI, XXE, GraphQL | [📁](A03-Injection/) |
| A04 | Insecure Design | Business Logic | [📁](A04-Insecure-Design/) |
| A05 | Security Misconfiguration | Cache, CORS, File Upload, Headers | [📁](A05-Security-Misconfiguration/) |
| A06 | Vulnerable Components | Outdated Libraries, CVEs | [📁](A06-Vulnerable-Components/) |
| A07 | Auth Failures | Authentication, JWT, WebSockets, OAuth | [📁](A07-Auth-Failures/) |
| A08 | Data Integrity | Deserialization, Race Conditions | [📁](A08-Data-Integrity/) |
| A09 | Logging & Monitoring | Insufficient Logging | [📁](A09-Logging-Monitoring/) |
| A10 | SSRF | Server-Side Request Forgery | [📁](A10-SSRF/) |

---

## 🧪 PortSwigger Labs Coverage

| Category | Labs Solved | Total Labs |
|----------|-------------|------------|
| SQL Injection | ✅ | 18 |
| Authentication | ✅ | 14 |
| Access Control | ✅ | 13 |
| XSS | ✅ | 30 |
| CSRF | ✅ | 12 |
| SSRF | ✅ | 7 |
| SSTI | ✅ | 7 |
| XXE | ✅ | 9 |
| Command Injection | ✅ | 5 |
| Path Traversal | ✅ | 6 |
| Business Logic | ✅ | 11 |
| Information Disclosure | ✅ | 5 |
| File Upload | ✅ | 7 |
| Race Conditions | ✅ | 6 |
| JWT Attacks | ✅ | 8 |
| OAuth | ✅ | 6 |
| Web Cache Poisoning | ✅ | 6 |
| HTTP Request Smuggling | ✅ | 8 |

---

## 🔗 روابط ذات صلة | Related Repositories

| Repository | Description |
|------------|-------------|
| [OWASP-API-Top-10](https://github.com/AliAlMansorisec/OWASP-API-Top-10) | OWASP API Security Top 10 |
| [Web-Pentest-Methodology](https://github.com/AliAlMansorisec/web-pentest-methodology) | Structured pentesting methodology |
| [PortSwigger-Labs](https://github.com/AliAlMansorisec/portswigger-labs) | Solutions to all PortSwigger labs |
| [Pentest-Scripts](https://github.com/AliAlMansorisec/pentest-scripts) | Automation and custom tools |

---

## 👨‍💻 المطور | Author

**Ali Al-Mansori**  
Security Researcher & Penetration Tester

[![GitHub](https://img.shields.io/badge/GitHub-AliAlMansorisec-black)](https://github.com/AliAlMansorisec)
[![Twitter](https://img.shields.io/badge/Twitter-@AliAlMansori-blue)](https://twitter.com/AliAlMansori)

---

## 📄 الترخيص | License

This repository is for educational and professional security research purposes only.

---

**Built for bug bounty hunters, penetration testers, and security professionals.** 🚀
