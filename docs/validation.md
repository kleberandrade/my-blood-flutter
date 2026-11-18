# Validation record

Local validation date: **17 November 2026**, America/Sao_Paulo.

## Environment

Flutter 3.50.0, framework revision `ab2912035e`, Dart 3.14.0. The local SDK reports channel `[user-branch]`; this record preserves that exact output rather than claiming a separately installed stable-channel checkout. A filesystem copy of the existing 3.50.0 toolchain and a separate Pub cache were used under `/Users/kleber/Projects/.toolchains/my-blood/`; the shared SDK was not modified. `DASH__SUPPRESS_ANALYTICS=true` and a project-specific `XDG_CONFIG_HOME` avoid shared configuration writes. Flutter test processes require a local loopback socket.

## Passed locally

- `dart format --output=none --set-exit-if-changed lib test`.
- `flutter analyze --no-pub`: no issues.
- `flutter test --no-pub`: **12 tests passed**. Domain filters/validation, serialization, actual local repository adapter with in-memory storage, corruption/schema rejection, creation/editing, mobile bookmarks, failed saves, retry, language preservation, intercepted official links, intercepted clipboard copy, labeled 48-pixel touch targets, and 1.6× text at 390×844.
- `flutter build web --release --no-pub --no-web-resources-cdn`: release JavaScript build. The SDK's Wasm dry run passed; a deployed Wasm application was not tested.
- Online `flutter pub outdated`: direct/development packages current. The SDK holds material_color_utilities 0.13.0 and test_api 0.7.14 below catalog latest. No overrides.

## Real browser checks

The release files were served only on `127.0.0.1:8743`. The in-app browser was inspected at 1440×1100 and 390×844:

- Created the synthetic “Conexões de demonstração” campaign; verified a fifth catalog entry.
- Bookmarked it and reloaded; both campaign and bookmark remained.
- Switched to English and reloaded; English UI, Portuguese authored content and saved marker remained.
- Searched for a nonexistent city, observed a descriptive zero-result state and cleared the search.
- Inspected campaign detail and sharing preview. No real message was dispatched; clipboard writes and official links are exercised in isolated tests.
- Confirmed local reset, restoring four initial examples and Portuguese. No personal/browser data outside this demo origin was changed.
- Inspected mobile header, filters, card layout and bottom navigation. The amplified-text test exposed and fixed a header overflow; browser inspection exposed and fixed duplicate language semantics and missing preview text semantics.

Captures in `docs/screenshots` show the running app. `persistence-en.jpg` records the synthetic browser test campaign; the default catalog/mobile captures were taken after reset. `cover.svg` is conceptual illustration, not a screenshot.

## Unverified / excluded

Android/iOS builds, native plugin execution, physical devices, a complete assistive-technology audit, Firebase/emulators, remote authorization, production deployment, store distribution and offline-first installation were not tested. Modern native support files are preparation only. No SDK license agreement was accepted. The repository contract is not a backend implementation.

No original Medium lesson URL/editor was identified. No Medium changes or newsletters were sent; the concrete proposed lesson is `docs/lesson-revision.pt-BR.md` with exactly five exercises. Native/store and hosting publication require separate authorization.

Specialized crapper/dryer/mutator tools were not available in the tool inventory; no automated complexity, duplication-score or mutation-testing result is claimed. Flutter's analyzer and behavioral tests supplied the available automated checks.

The GitHub Verify badge reflects the actual workflow status, not a hard-coded success claim. Remote run results are reported separately after pushing.
