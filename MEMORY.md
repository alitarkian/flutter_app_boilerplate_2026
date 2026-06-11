# MEMORY.md

## Project

Name: app_boilerplate

Goal:
Enterprise-grade Flutter Boilerplate using Clean Architecture, Feature First Structure, Dio, AutoRoute, BLoC, GetIt, Injectable and Modular Design.

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
* Dev environment bootstrap

---

### Phase 2 — Core Infrastructure

Status: Completed

Implemented:

* GetIt
* Injectable
* Dependency Injection setup
* Secure Storage
* Shared Preferences

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

Auth APIs:

* Login API
* Refresh Token API
* Auth Me API

Entities:

* SessionEntity
* AuthMeEntity

---

### Phase 4 — Splash & Design System

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

Pending:

* Native Splash Branding
* Dark Theme

---

### Phase 5 — Authentication Flow

Status: In Progress

Completed:

* LoginCubit
* LoginState
* LoginPage
* LoginUseCase
* Session Persistence
* Splash Authentication Bootstrap
* Auto Login (Token Based)
* Profile Bootstrap Foundation

Pending:

* Route Auth Guard
* Refresh Token Flow
* Permission Bootstrap
* Logout Flow

---

## Health Check

Endpoint:

GET /health

Behavior:

* Executed during Splash initialization
* Detects server availability
* Supports Retry Action
* Blocks application bootstrap if backend is unavailable

---

## Technical Debt

RetryInterceptor:

Current implementation retries requests using a standalone Dio instance.

Future improvement:

* Retry through shared Dio pipeline
* Integrate with Refresh Token Flow
* Avoid duplicated networking stack

---

## API

Base URL:

http://127.0.0.1:8000/api/v1/

Health Endpoint:

/health

---

## Next Step

Implement Route Auth Guard and Logout Flow.
