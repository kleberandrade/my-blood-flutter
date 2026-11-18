# Integration boundary and synthetic fixture contract

No backend is connected, deployed or emulated by the running app. No Firebase keys, accounts, real donation campaigns, notifications or patient data are needed. `CampaignRepository` is the replaceable boundary:

```dart
abstract interface class CampaignRepository {
  Future<DemoData> load();
  Future<void> save(DemoData data);
  Future<void> clear();
}
```

`LocalCampaignRepository` implements the contract using `SharedPreferencesAsync`. It stores a complete JSON record under `my_blood_demo_v1`. The shape is executable through `DemoData.toMap/fromMap` and `Campaign.toMap/fromMap`; tests exercise the actual local adapter with an in-memory platform backend. `MemoryRepository` in the widget tests injects read/write failures.

Example version 1 record (fictional, not a remote API response):

```json
{
  "version": 1,
  "english": false,
  "saved": ["local-example"],
  "campaigns": [{
    "id": "local-example",
    "title": "Campanha de exemplo",
    "city": "Campinas",
    "state": "SP",
    "blood": "O+",
    "locationId": "campinas",
    "description": "Uma mobilização inteiramente fictícia para estudo.",
    "local": true
  }]
}
```

The city/state must match the known fictional location; type must be one of eight ABO/Rh labels; trimmed titles have 5–80 characters and descriptions 10–500. IDs must be nonempty and unique in a record, and saved IDs must resolve. Blood type is an exact display filter, not clinical compatibility. Campaigns have no stock levels, eligibility status or real urgency claims.

A future remote adapter must preserve validation and distinguish unavailable service from an empty result. It needs actual authenticated ownership and authorization checks; the client-side `local` flag is not an authorization mechanism. Do not reuse the whole-record save for multi-user updates: define per-campaign operations and conflict handling first. `clear` means local demonstration reset only; a remote adapter must not interpret it as deleting production data.

For an independently authorized Firebase follow-up, use a dedicated `demo-*` project, Auth/Firestore emulators on loopback, synthetic fixtures, deny-by-default rules and automated ownership tests. No emulator or remote adapter is claimed as implemented or validated here. Keep production initialization out of the default entry point and fail closed if emulator hosts are missing.

Known concurrency limit: one active editing tab. Storage is browser-origin scoped and last writer wins across tabs; this is not offline synchronization or durable backup. Corrupt/unknown schemas are preserved and shown as an error; only an explicit reset deletes them.
