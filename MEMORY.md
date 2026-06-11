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
* Logging Interceptor
* Auth Interceptor
* API Error Handling
* Retrofit Setup

Auth:

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

Pending:

* Auto Login
* Auth Guard
* Profile Bootstrap
* Permission Bootstrap
* Logout Flow

---

## API

Base URL:

http://127.0.0.1:8000/api/v1/

Health Endpoint:

http://127.0.0.1:8000/health

---

## Auth Endpoints

POST /auth/login

POST /auth/refresh

GET /auth/me

---

## Next Step

Implement Auth Guard and Auto Login Flow.
