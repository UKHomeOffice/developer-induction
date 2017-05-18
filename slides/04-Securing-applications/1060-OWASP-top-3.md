## OWASP Top 3

1. Injection
2. Broken Authentication and Session Management
3. Cross-site Scripting (XSS)

note:

1. Injection flaws, such as SQL, OS, and LDAP injection occur when untrusted data is sent to an interpreter as part of the command or query. The attacker's hostile data can trick the interpreter into excecuting unintended commands or accessing data without proper authorization.
2. Application functions related to authentication and session management are often not implemented correctly, allowing attackers to compromise passwords, keys, or session tokens, or to exploit other implementation flaws to assume users' identities.
3. XSS flaws occur when an application takes untrusted data and sends it to a web browser without proper validation or escaping. XSS allows attackers to execute scripts in the victim's browser which can hijack user sessions, deface web sites, or redirect the user to malicious sites. 