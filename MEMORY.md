# MEMORY.md

## Project

Flutter App Boilerplate

Architecture:

* Clean Architecture
* Feature First
* BLoC
* GetIt
* Injectable
* AutoRoute
* Code Generation

---

## Reference Documents

* PROJECT_STRUCTURE.md
* PHASES.md

این دو فایل مرجع اصلی پروژه هستند و هر توسعه جدید باید با آن‌ها سازگار باشد.

---

## Current Progress

### Phase 1 — Bootstrap

Status: COMPLETED

Completed Items:

* GetIt configured
* Injectable configured
* AutoRoute configured
* Splash page created
* App root created
* build_runner configured

---

### Phase 1.5 — Environment Foundation

Status: COMPLETED

Completed Items:

* AppConfig created
* EnvironmentType enum created
* Env singleton created
* bootstrap.dart created
* main_dev.dart created
* main_staging.dart created
* main_prod.dart created

---

## Current Entry Points

* lib/main_dev.dart
* lib/main_staging.dart
* lib/main_prod.dart

Default development entry:

lib/main_dev.dart

---

## Next Phase

Phase 2 — Core Network Layer

Status: COMPLETED

Completed Items:

* dio_client.dart
* api_endpoints.dart
* network_info.dart
* websocket_client.dart
* auth_interceptor.dart
* logging_interceptor.dart
* retry_interceptor.dart
* error_interceptor.dart
* exceptions.dart
* failures.dart
* error_handler.dart

---

## Development Rules

1. Clean Architecture must be preserved.
2. Feature-first structure is mandatory.
3. Dependency Injection only through GetIt.
4. Routing only through AutoRoute.
5. No business logic inside UI.
6. All services must be injectable.
7. All future features must follow the structure defined in PROJECT_STRUCTURE.md.

---

## Notes

Current active phase:
Phase 2

Ready to implement Network Layer.
