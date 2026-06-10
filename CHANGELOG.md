# CHANGELOG.md

All notable changes to this project will be documented in this file.

The format is inspired by Keep a Changelog.

---

## [Unreleased]

### Planned

* Phase 2 — Core Network Layer
* Phase 3 — Storage Layer
* Phase 4 — Firebase Suite
* Phase 5 — Device Integration
* Phase 6 — UI System
* Phase 7 — Localization
* Phase 8 — Auth Feature
* Phase 9 — Testing
* Phase 10 — Final Wiring & Polish

---

## [0.1.0] - 2026-06-10

### Added

#### Project Bootstrap

* Initial Flutter Boilerplate structure created
* Clean Architecture foundation established
* Feature-first architecture adopted
* AutoRoute integrated
* GetIt integrated
* Injectable integrated
* build_runner configured

#### Routing

* Root router created
* Splash page added
* Initial navigation flow configured

#### Dependency Injection

* Dependency injection container configured
* Injectable code generation configured

#### Environment Foundation

* AppConfig created
* EnvironmentType enum added
* Env global configuration holder added
* bootstrap.dart created
* main_dev.dart created
* main_staging.dart created
* main_prod.dart created

#### Development Standards

* Multi-environment architecture prepared
* Production-ready project foundation established
* Phase-based implementation workflow adopted

## Known Warnings

### Injectable AppConfig Warning

Status: Pending

Description:
Injectable generator cannot resolve AppConfig because it is registered manually during bootstrap.

Impact:
No runtime impact.
Application starts correctly.

Planned Fix:
Environment-aware ConfigModule in Phase 6.