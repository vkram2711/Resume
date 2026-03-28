# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter run                  # Run on connected device/emulator
flutter build web            # Build for web deployment
flutter analyze              # Run static analysis
flutter test                 # Run tests
```

CI/CD deploys automatically: PR previews via Firebase Hosting, production on push to `master`.

## Architecture

**Purpose:** Single-page responsive portfolio/resume web app with mobile support.

**Responsive breakpoint:** 1050×750px
- **Web layout** (`web_screen.dart`): Vertical `PageView` with side tab bars and page indicators
- **Mobile layout** (`mobile_screen.dart`): Vertical `ListView` with horizontal tab navigation
- `app_body.dart` selects between layouts; `main.dart` sets up routing

**Routing:** Two modes via URL — `/` (normal) and `/u` (Upwork mode, hides Contact page)

**State management:** InheritedWidget only (no external packages)
- `ResumeInherited` — shares `PageController` and `isWeb` flag
- `UpworkInherited` — shares `upworkMode` boolean

**Pages (5):** `IntroPage` → `AboutPage` → `WorkPage` → `PortfolioPage` → `ContactPage`
- `WorkPage` and `PortfolioPage` use tabbed interfaces for their items
- `ProjectDetailsPage` — modal that renders project markdown files from `assets/markdown/`

**Styling:** Dark theme (black bg, white text, yellow-600 accent). Custom ProximaNova font. Shared text styles live in `lib/resources/styles.dart`. Widget-level text components are in `lib/widgets/text/`.

**Key packages:** `flutter_svg`, `url_launcher`, `flutter_markdown`, `hexcolor`
