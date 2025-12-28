### Web Server
nginx 1.20.0

### Cloud / Hosting
Amazon Web Services (AWS)
CDN and load-balanced infrastructure

## Security Headers Observed

The following HTTP security headers were identified across multiple responses:
 **X-Frame-Options: SAMEORIGIN**  
  Protects against clickjacking attacks by restricting iframe usage.
 **X-XSS-Protection: 1; mode=block**  
  Enables browser-based XSS protection.
 **X-Content-Type-Options: nosniff**  
  Prevents MIME-type sniffing.
 **X-Download-Options: noopen**  
  Prevents automatic execution of downloaded files.
 **X-Permitted-Cross-Domain-Policies**  
  Restricts cross-domain policy access.


## HTTP Status Codes Observed

**200 OK** – Successful requests
**401 Unauthorized** – Access restricted resources
