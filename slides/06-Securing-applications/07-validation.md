## Validation

- Server-side validation of all inputs, including headers, cookies, redirects​
- Prefer to accept known good input rather than reject known bad input​
- Always re-validate previously entered form data in case it has been surreptitiously altered; hidden fields should be validated too​
- All validation failures should result in ​input rejection with an appropriate ​message to the user​
