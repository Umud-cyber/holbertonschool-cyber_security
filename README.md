1. SQL Injection (SQLi)

This occurs when an attacker inserts malicious SQL code into an input field (like a login form). If the website isn't properly secured, the database might execute this code, allowing the attacker to view, modify, or delete sensitive data.
2. Cross-Site Scripting (XSS)

In an XSS attack, the hacker injects malicious scripts (usually JavaScript) into a web page that other users view. When a victim visits that page, the script runs in their browser, potentially stealing their login cookies or session tokens.
3. Broken Access Control

This is a flaw where a website fails to properly check a user's permissions. For example, a regular user might be able to access an admin page just by changing the URL (e.g., changing /user/profile to /admin/dashboard).
4. Cross-Site Request Forgery (CSRF)

CSRF is an attack that tricks a logged-in user into performing actions they didn't intend to. For instance, while you are logged into your bank, a malicious site could trigger a hidden request to transfer money from your account w
