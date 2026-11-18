# Contributing

Use Flutter **3.50.0** / Dart **3.14.0** and the committed lockfile. Run `flutter pub get --enforce-lockfile`, `dart format lib test`, `flutter analyze`, `flutter test`, and `flutter build web --release` before submitting a change. The workflow runs these checks sequentially.

Keep domain rules in `lib/domain`, persistence behind `CampaignRepository` in `lib/data`, and UI in `lib/ui`. Add behavior tests before changing filters, validation or storage. Use only synthetic fixtures. Never add credentials, patient information, personal contact details, clinical eligibility calculations or actual campaign messages. Both language interfaces must preserve authored campaign data. Keep touch targets at least 48 logical pixels and check narrow layouts and text scaling.

Include why the change is needed, user-visible behavior, tests and any platform limits in each pull request. Preserve the original authors and MIT notice. Update screenshots after visual changes and update the schema version intentionally when changing persistent data. Never silently overwrite corrupt data or introduce production network access into the local demo.

The current integration boundary is a repository contract, not a Firebase implementation. See [integration contract](docs/integration.md) before adding a remote adapter.
