# CHANGELOG.md

## 2026-06-12 (current)

### Added
- Phase 7b officially started (Home Feature Foundation)
- MEMORY updated to reflect Home domain/data layer in progress
- Project state aligned across MEMORY / PHASES / CHANGELOG

### Status Update
- Phase 6: Completed (UI System)
- Phase 7a: Completed (Theming)
- Phase 7b: In Progress (Home Feature Foundation)

### In Progress
- Home data layer:
  - datasource
  - repository implementation
- Home domain layer:
  - entity
  - repository contract
  - usecases
- DI wiring (GetIt / Injectable)
- HomePage → Cubit/Bloc integration
- LoginPage refactor using UI Kit (Phase 6)
- Responsive validation (ScreenUtilInit)

---

## 2026-06-12 (previous snapshot)

### Reviewed
- AppTheme.light() and AppTheme.dark() verified fully implemented and wired in app.dart
- Phase 7 split into:
  - 7a: Theming (Completed)
  - 7b: Home Feature Foundation (Current focus)

### Minor Tech Debt
- checkboxTheme missing braces (lint only)
- surfaceContainerLowest missing in light ColorScheme

---

## 2026-06-11

### Added
- Health feature module (repository + datasource + usecase)
- Splash server availability check
- Session bootstrap + auto login flow
- Profile bootstrap foundation

### Fixed
- Dio interceptor chain issues
- LoggingInterceptor response handling
- ErrorInterceptor propagation bug
- Splash freeze issue resolved