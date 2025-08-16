# Binayak Medicine Store

Owner: Suman Sahu

- App name: Binayak Medicine Store
- Package id: com.roshan.binayakstore
- Created by: Roshan

This is a personal medicine store manager with AI-powered billing, inventory predictions, barcode scanning, offline/online sync, and professional Material 3 UI built with Riverpod and Clean Architecture.

## Run
```bash
flutter pub get
cp .env.example .env # set UNIVERSAL_AI_KEY and GEMINI_API_KEY as needed
flutter run -d chrome # or android/ios device
```

## AI routing
- Primary: Universal Key via `UNIVERSAL_AI_KEY`
- Secondary: Google Gemini 2.0 via `GEMINI_API_KEY`
The app prioritizes Primary; it automatically falls back to Gemini.

## Platforms
Android, iOS, Web enabled.

## Quality
- Lints: flutter_lints v6
- Analyzer passes clean.
