# Privacy and demonstration limits

My Blood 1.0 is an educational, local-first demonstration. All bundled campaigns, facility names and street addresses are fictional. No patient, donor or donation record exists. Do not enter real personal or health information.

What is stored: campaign title/description, selected fictional location and blood label, saved campaign IDs and UI language. One versioned JSON record is saved using browser-origin local storage on Web. There is no account, authentication, analytics, cloud upload, notification, background sync, geolocation, camera or contact permission. This is not encrypted storage and is unsuitable for sensitive information.

The application updates the screen only after storage confirms a write; a failure keeps prior in-memory data and shows a message. Browser cleanup, private browsing and storage eviction can erase data. Persistence is not a backup. Concurrent tabs can overwrite each other; use one editing tab.

“Sharing” opens a selectable preview. Copying requires a separate button and writes explicitly marked DEMO text to the clipboard. It does not open a messenger or send content. There are no public campaign URLs or patient links. External official-source buttons contact the Ministry of Health website; that site's privacy policy then applies. The Flutter Web renderer may load SDK resources at startup; the release build uses local renderer assets.

Use **My space → Clear my local data**, confirm, and the app removes the local record and restores synthetic examples. This also resets bookmarks and language. No real-world donation is registered and no appointment is booked.

This app does not determine donor eligibility, diagnose, triage or calculate transfusion compatibility. Always confirm current guidance, opening hours and individual requirements directly with an actual blood service. Official sources reviewed on 17 November 2026:

- [Ministry of Health — Blood donation](https://www.gov.br/saude/pt-br/composicao/saes/doacao-de-sangue/doacao-de-sangue/)
- [Ministry of Health — FAQ](https://www.gov.br/saude/pt-br/composicao/saes/doacao-de-sangue/faq)

No legal, medical or production-security compliance certification is claimed.
