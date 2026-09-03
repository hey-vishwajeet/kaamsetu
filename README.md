# KaamSetu

KaamSetu is a Flutter prototype that connects construction workers with suitable local jobs. This worker-facing milestone uses mock data held in memory; it has no backend, Firebase integration, database, API keys, or environment setup.

## Features

- Phone and prototype OTP authentication
- Worker registration and profile review
- Skill selection and a short assessment
- Searchable job recommendations and job details
- In-memory job applications and application status
- Local notifications
- Authenticated bottom navigation for Home, Applications, Notifications, and Profile
- Shared responsive theme and reusable UI components
- Central route generation with safe invalid-route handling

See [PAGES.md](PAGES.md) for a detailed visual and behavior reference for every page.

## Prerequisites

- Git
- Flutter SDK on the stable channel with Dart 3.12.2 or later
- Android Studio and Android SDK
- An Android emulator or a physical Android device with USB debugging enabled

Check the environment before setup:

```bash
flutter --version
flutter doctor
```

Resolve any Android toolchain warnings from `flutter doctor` before running the application.

## Setup

The Flutter project lives directly in the repository root:

```bash
git clone https://github.com/hey-vishwajeet/kaamsetu.git
cd kaamsetu
flutter pub get
```

No `.env` file or external service is required.

## Run

Start an emulator or connect a device, then run:

```bash
flutter devices
flutter run
```

To target a specific device:

```bash
flutter run -d <device-id>
```

Prototype credentials:

- Mobile number: any valid 10-digit Indian mobile number beginning with 6, 7, 8, or 9
- OTP: `123456`

## Navigation

First-time worker flow:

```text
Splash
  → Login
  → OTP
  → Registration
  → Profile Review
  → Skill Selection
  → Skill Assessment
  → Home / Recommendations
  → Job Details
  → Apply
  → Application Status
```

The authenticated area uses four persistent bottom destinations:

- **Home** — job recommendations and job search
- **Applications** — submitted applications and their status
- **Notifications** — local account and application updates
- **Profile** — worker details, skills, editing, and logout

Onboarding clears obsolete authentication screens after verification and clears the onboarding stack when entering Home. Detail pages are pushed normally, so Android back navigation returns to the correct tab without duplicating screens. Pressing back from another bottom tab returns to Home first. Invalid route names or arguments show a recoverable “Page not found” screen.

## Project structure

```text
KaamSetu/
├── android/                  # Android host project
├── lib/
│   ├── mock_data/            # Local prototype jobs and options
│   ├── models/               # Worker, job, application, notification models
│   ├── navigation/           # Stateful authenticated app shell
│   ├── routes/               # Route names, typed arguments, route factory
│   ├── screens/              # Screens grouped by feature
│   │   ├── applications/
│   │   ├── auth/
│   │   ├── error/
│   │   ├── home/
│   │   ├── jobs/
│   │   ├── notifications/
│   │   ├── profile/
│   │   └── skills/
│   ├── theme/                # Shared colors, spacing, and Material theme
│   ├── widgets/              # Buttons, fields, cards, states, app bars, nav
│   ├── app.dart              # Root MaterialApp
│   └── main.dart             # Application entry point
├── test/                     # Widget and navigation tests
├── .gitignore
├── analysis_options.yaml
└── pubspec.yaml
```

## Quality checks

Run the same checks used during integration:

```bash
flutter pub get
dart format .
flutter analyze
flutter test
```

## Development notes

- Application, notification, and profile changes reset when the app restarts or the user logs out.
- Assessment scoring and match percentages are fixed prototype values, not professional certification or production matching logic.
- `.gitignore` excludes build output, Dart caches, local IDE state, environment files, signing keys, and machine-specific Android configuration.
- Keep the existing Git remote and use normal feature commits. Do not force-push shared branches.
