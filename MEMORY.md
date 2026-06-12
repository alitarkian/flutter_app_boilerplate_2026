# MEMORY.md

## Project

Name: app_boilerplate

Goal:
Enterprise-grade Flutter Boilerplate using Clean Architecture, Feature First Architecture, Dio, AutoRoute, BLoC/Cubit, GetIt, Injectable and Modular Design.

---

## Architecture

Pattern:
- Clean Architecture
- Feature First
- Repository Pattern
- UseCase Pattern
- Dependency Injection

Layers:
- Presentation
- Domain
- Data

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
- AppButton, AppTextField, AppLoader, AppErrorWidget, AppEmptyState, AppCachedImage, AppLottie, AppFullscreenLoader
- ScreenUtil Integration (AppScreenUtilInit wired into app.dart)

---

### Phase 7a — Theming (Light/Dark)
Status: Completed

Implemented:
- AppTheme.light() / AppTheme.dark() fully implemented and wired in app.dart
- ThemeMode.system active
- Full ColorScheme + Typography + Widgets theming

Minor tech debt:
- checkboxTheme missing braces (lint only)
- surfaceContainerLowest missing in light theme (parity issue)

---

## Current Phase

### Phase 7b — Home Feature Foundation
Status: In Progress

Work in progress:
- Home data layer (datasource, repository impl)
- Home domain layer (entity, repository contract, usecases)
- DI wiring (GetIt / Injectable)
- HomeCubit/Bloc integration with HomePage
- Responsive validation using ScreenUtilInit
- LoginPage refactor using Phase 6 UI kit

---

## Existing Features

### Auth
Status: Completed (core flow)
- Login flow
- Session management
- Token handling
- Profile bootstrap

Pending:
- RegisterPage
- ForgotPasswordPage
- UI refactor using AppButton/AppTextField

---

### Health
Status: Completed
- Health check endpoint
- Splash bootstrap validation
- Repository + UseCase implemented

---

### Splash
Status: Completed
- SplashCubit + SplashState
- App initialization flow
- Auth + Health bootstrap logic
- Route decision system

---

### Home
Status:
- Presentation layer scaffold exists
- Data & Domain layers in progress (Phase 7b)

---

### Settings
Status: Not started

---

## Technical Debt

- RetryInterceptor isolation (needs integration into shared Dio flow)
- Theme minor inconsistencies:
  - checkboxTheme braces cleanup
  - surfaceContainerLowest missing in light theme

---

## API

Base URL:
http://127.0.0.1:8000/api/v1/

Endpoints:
- GET /health