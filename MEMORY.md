# MEMORY.md

## Project

Name: app_boilerplate

Goal:

Enterprise-grade Flutter Boilerplate using Clean Architecture, Feature First Architecture, Dio, AutoRoute, BLoC, GetIt, Injectable and Modular Design.

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

Implemented:

* Flutter project structure
* Environment configuration
* AppConfig
* Main entrypoints
* Bootstrap architecture
* Dev / Staging / Production entrypoints

---

### Phase 2 — Core Infrastructure

Status: Completed

Implemented:

* GetIt
* Injectable
* Dependency Injection setup
* Secure Storage
* Register Modules
* Network Modules
* Storage Modules

---

### Phase 3 — Network & Auth Foundation

Status: Completed

Implemented:

* Dio Client
* Auth Interceptor
* Retry Interceptor
* Error Interceptor
* Logging Interceptor
* API Error Handling
* WebSocket Wrapper
* Network Info

Auth APIs:

* Login API
* Refresh Token API
* Auth Me API

Entities:

* SessionEntity
* AuthMeEntity
* TokenEntity
* UserEntity

---

### Phase 4 — Splash & Theme Foundation

Status: Completed

Implemented:

* Animated Splash Screen
* Session Check
* Health Check Bootstrap
* Server Availability Detection
* Retry Action
* Route Decision Structure
* Theme Foundation
* Color Palette
* Typography
* Radius System
* Spacing System
* Shadows System

Pending:

* Native Splash Branding
* Dark Theme

---

### Phase 5 — Authentication Flow

Status: Completed

Implemented:

* LoginCubit
* LoginState
* LoginPage
* LoginUseCase
* LogoutUseCase
* RefreshTokenUseCase
* GetProfileUseCase
* Session Persistence
* Splash Authentication Bootstrap
* Auto Login
* Auth Session Cubit
* Auth Guard
* Profile Bootstrap Foundation

---

## Current Phase

### Phase 6 — UI System

Status: In Progress

Target:

* AppButton
* AppTextField
* AppLoader
* AppErrorWidget
* AppEmptyState
* AppCachedImage
* AppLottie
* ScreenUtil Integration

---

## Existing Features

### Auth

Completed:

* Login
* Session Management
* Refresh Token Foundation
* Profile Bootstrap

Pages:

* LoginPage
* RegisterPage
* ForgotPasswordPage

---

### Health

Completed:

* Health Check Endpoint
* Splash Validation Flow

---

## Technical Debt

### RetryInterceptor

Current implementation retries requests using a standalone Dio instance.

Future improvements:

* Retry through shared Dio pipeline
* Integrate with Refresh Token Flow
* Avoid duplicated networking stack

---

## API

Base URL:

http://127.0.0.1:8000/api/v1/

Health Endpoint:

GET /health

---

## Next Immediate Goal

Phase 6 — UI System

Build reusable widgets:

* AppButton
* AppTextField
* AppLoader
* AppErrorWidget
* AppEmptyState

After that:

* Dark Theme
* Localization
* Testing Foundation
* Production Polish
