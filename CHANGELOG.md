# CHANGELOG.md

## 2026-06-12 (cont.)

### Reviewed

* `AppTheme.light()` and `AppTheme.dark()` reviewed — both already fully implemented and wired in `app.dart` (`theme`, `darkTheme`, `themeMode: ThemeMode.system`). Theming portion of Phase 7 closed without additional work needed.

### Found (minor, non-blocking)

* `light()` checkboxTheme: two `if` statements without braces (lint warning only)
* Light `ColorScheme` missing `surfaceContainerLowest` (present in dark) — parity gap noted as tech debt

### Status

* Phase 7 split into 7a (Theming — Completed) and 7b (Home Feature Foundation — In Progress, current focus)

---

## 2026-06-12

### Added

* AppButton, AppTextField, AppLoader, AppErrorWidget, AppEmptyState, AppCachedImage, AppLottie, AppFullscreenLoader
* AppScreenUtilInit wired into app.dart

### Fixed

* AppLoader size/strokeWidth now functional
* AppButton dead code removed
* AppErrorWidget/AppEmptyState import paths unified
* AppCachedImage callback signatures made SDK-safe

### Status

* Phase 6 (UI System) marked as Completed.

---

## 2026-06-11

### Added

* Health feature module, repository, datasource, CheckHealth usecase
* Splash server availability check + retry action
* Session bootstrap during Splash
* Token-based auto login flow
* Profile bootstrap foundation

### Fixed

* Dio interceptor chain issue
* LoggingInterceptor response handling bug
* ErrorInterceptor exception propagation
* Health check false-negative behavior
* Splash freeze when backend connection succeeds