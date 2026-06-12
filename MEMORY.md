# MEMORY.md

## Project

Name: app_boilerplate

Goal:

Enterprise-grade Flutter Boilerplate using Clean Architecture, Feature First Architecture, Dio, AutoRoute, BLoC/Cubit, GetIt, Injectable and Modular Design.

---

## Architecture

Pattern:

* Clean Architecture
* Feature First
* Repository Pattern
* UseCase Pattern
* Dependency Injection

Layers:

* Presentation
* Domain
* Data

---

## Completed Phases

### Phase 1 — Foundation
Status: Completed

### Phase 2 — Core Infrastructure
Status: Completed

### Phase 3 — Network & Auth Foundation
Status: Completed

### Phase 4 — Splash & Theme Foundation
Status: Completed

### Phase 5 — Authentication Flow
Status: Completed

### Phase 6 — UI System
Status: Completed

Implemented:

* AppButton, AppTextField, AppLoader, AppErrorWidget, AppEmptyState, AppCachedImage, AppLottie, AppFullscreenLoader
* ScreenUtil Integration (AppScreenUtilInit wired into app.dart)

---

### Phase 7a — Theming (Light/Dark)

Status: Completed (already implemented)

Implemented:

* `AppTheme.light()` and `AppTheme.dark()` — both fully built out (ColorScheme, TextTheme, AppBar, Input, Buttons, Card, Dialog, BottomSheet, Chip, Tabs, etc.)
* `app.dart` wired with `theme: AppTheme.light()`, `darkTheme: AppTheme.dark()`, `themeMode: ThemeMode.system`

Minor cleanup items (non-blocking):

* `checkboxTheme` in `light()` has two `if` blocks without braces (lint: `curly_braces_in_flow_control_structures`) — cosmetic
* Light `ColorScheme` missing `surfaceContainerLowest` (dark has it) — inconsistency, low priority

---

## Current Phase

### Phase 7b — Home Feature Foundation

Status: In Progress

Target:

* Home feature data layer (datasource, repository impl)
* Home feature domain layer (entities, repository contract, usecases)
* Wire Home feature into DI (GetIt/Injectable)
* Connect HomePage to new layers via Cubit/Bloc
* Test responsive layout (AppScreenUtilInit) across screen sizes
* Rebuild/validate LoginPage using Phase 6 widgets (AppButton, AppTextField, AppLoader)

---

## Existing Features

### Auth
Completed: Login, Session Management, Refresh Token Foundation, Profile Bootstrap
Pages: LoginPage
Pending Pages: RegisterPage, ForgotPasswordPage
Pending: Rebuild LoginPage with Phase 6 UI widgets

### Health
Completed: Health Check Endpoint, Repository/DataSource/UseCase, Splash Validation Flow

### Splash
Completed: SplashCubit/SplashState, SplashPage, InitializeAppUseCase, Session+Health bootstrap, route decision logic

### Home
Status: Pending — only presentation/pages (HomePage) scaffolded. Data and Domain layers are the main target of Phase 7b.

### Settings
Status: Not Started — empty cubit/pages/widgets folders only

---

## Technical Debt

### RetryInterceptor
Standalone Dio instance for retries. Future: retry through shared Dio pipeline, integrate with Refresh Token flow.

### Theme (minor)
* Fix missing braces in light() checkboxTheme if-statements
* Add `surfaceContainerLowest` to light ColorScheme for parity with dark

---

## API

Base URL: http://127.0.0.1:8000/api/v1/
Health Endpoint: GET /health

---

## Next Immediate Goal

Phase 7b — Home Feature Foundation

1. Implement Home data layer (datasource + repository impl)
2. Implement Home domain layer (entity, repository contract, usecases)
3. Wire into DI and connect to HomePage via Cubit
4. Responsive testing across screen sizes
5. Rebuild LoginPage using Phase 6 widgets

After that:

* Settings Feature
* Localization
* Testing Foundation
* Production Polish