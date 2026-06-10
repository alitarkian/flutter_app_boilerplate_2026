# 📁 Flutter App Boilerplate — Project Structure

> **Stack:** Clean Architecture · Feature-first · Code Generation  
> **Last Updated:** 2024

---

## 🗂️ Root Structure

```
app_boilerplate/
├── android/
├── ios/
├── web/
├── assets/
│   ├── animations/          # Lottie JSON files
│   ├── fonts/
│   ├── icons/
│   ├── images/
│   └── translations/        # Localization files
│       ├── en.json
│       └── fa.json
├── lib/
│   ├── main.dart
│   ├── app/
│   ├── core/
│   └── features/
├── test/
│   ├── core/
│   ├── features/
│   └── helpers/
├── build.yaml
├── pubspec.yaml
└── pubspec.lock
```

---

## 📦 lib/ — Full Structure

```
lib/
├── main.dart                          # Entry point
├── main_dev.dart                      # Dev flavor entry
├── main_staging.dart                  # Staging flavor entry
│
├── app/
│   ├── app.dart                       # Root App widget
│   ├── app_router.dart                # Global route definitions
│   └── app_theme.dart                 # Global theme config
│
├── core/
│   ├── di/
│   │   ├── injection.dart             # GetIt setup
│   │   └── injection.config.dart      # @injectable generated file
│   │
│   ├── network/
│   │   ├── dio_client.dart            # Dio instance factory
│   │   ├── api_endpoints.dart         # Base URLs / endpoint constants
│   │   ├── network_info.dart          # Connectivity checker
│   │   ├── websocket_client.dart      # WebSocket wrapper
│   │   └── interceptors/
│   │       ├── auth_interceptor.dart
│   │       ├── logging_interceptor.dart
│   │       ├── retry_interceptor.dart
│   │       └── error_interceptor.dart
│   │
│   ├── error/
│   │   ├── exceptions.dart            # App exception types
│   │   ├── failures.dart              # Failure sealed classes
│   │   └── error_handler.dart         # Global error mapper
│   │
│   ├── storage/
│   │   ├── hive/
│   │   │   ├── hive_service.dart      # Hive init & box registry
│   │   │   └── adapters/              # Generated TypeAdapters
│   │   ├── secure_storage/
│   │   │   └── secure_storage_service.dart
│   │   └── preferences/
│   │       └── preferences_service.dart
│   │
│   ├── firebase/
│   │   ├── firebase_options.dart      # FlutterFire generated
│   │   ├── fcm_service.dart           # Cloud Messaging
│   │   ├── analytics_service.dart     # Analytics
│   │   ├── crashlytics_service.dart   # Crashlytics
│   │   └── remote_config_service.dart # Remote Config
│   │
│   ├── permissions/
│   │   ├── permission_handler.dart    # permission_handler wrapper
│   │   └── permission_type.dart       # Enum of used permissions
│   │
│   ├── device/
│   │   ├── device_info_service.dart   # device_info_plus wrapper
│   │   ├── camera_service.dart        # Camera / Gallery
│   │   └── location_service.dart      # Geolocator wrapper
│   │
│   ├── localization/
│   │   ├── l10n.dart                  # easy_localization helpers
│   │   └── locale_keys.g.dart         # Generated locale keys
│   │
│   ├── router/
│   │   ├── app_router.dart
│   │   └── guards/
│   │       ├── auth_guard.dart
│   │       └── onboarding_guard.dart
│   │
│   ├── usecases/
│   │   └── use_case.dart              # Abstract UseCase base class
│   │
│   ├── utils/
│   │   ├── constants.dart
│   │   ├── date_utils.dart
│   │   ├── validators.dart
│   │   └── extensions/
│   │       ├── context_ext.dart
│   │       ├── string_ext.dart
│   │       └── widget_ext.dart
│   │
│   └── ui/
│       ├── theme/
│       │   ├── app_colors.dart
│       │   ├── app_text_styles.dart
│       │   ├── app_theme.dart
│       │   └── app_dimensions.dart
│       └── widgets/
│           ├── app_button.dart
│           ├── app_text_field.dart
│           ├── app_loader.dart         # Shimmer / circular
│           ├── app_cached_image.dart   # CachedNetworkImage wrapper
│           ├── app_lottie.dart         # Lottie widget wrapper
│           ├── app_error_widget.dart
│           ├── app_empty_state.dart
│           └── responsive/
│               ├── responsive_builder.dart
│               └── screen_util_init.dart
│
└── features/
    ├── auth/
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   ├── auth_remote_datasource.dart
    │   │   │   └── auth_local_datasource.dart
    │   │   ├── models/
    │   │   │   ├── user_model.dart
    │   │   │   └── user_model.g.dart    # json_serializable generated
    │   │   └── repositories/
    │   │       └── auth_repository_impl.dart
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── user_entity.dart
    │   │   ├── repositories/
    │   │   │   └── auth_repository.dart
    │   │   └── usecases/
    │   │       ├── login_usecase.dart
    │   │       ├── logout_usecase.dart
    │   │       └── register_usecase.dart
    │   └── presentation/
    │       ├── bloc/
    │       │   ├── auth_bloc.dart
    │       │   ├── auth_event.dart
    │       │   └── auth_state.dart
    │       ├── pages/
    │       │   ├── login_page.dart
    │       │   └── register_page.dart
    │       └── widgets/
    │           └── auth_form_widget.dart
    │
    ├── home/
    │   ├── data/
    │   │   ├── datasources/
    │   │   ├── models/
    │   │   └── repositories/
    │   ├── domain/
    │   │   ├── entities/
    │   │   ├── repositories/
    │   │   └── usecases/
    │   └── presentation/
    │       ├── bloc/
    │       ├── pages/
    │       └── widgets/
    │
    ├── profile/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    ├── notifications/
    │   ├── data/
    │   ├── domain/
    │   └── presentation/
    │
    └── map/
        ├── data/
        ├── domain/
        └── presentation/
```

---

## 🌍 assets/translations/

```
assets/translations/
├── en.json
└── fa.json
```

**en.json sample:**
```json
{
  "common": {
    "ok": "OK",
    "cancel": "Cancel",
    "loading": "Loading..."
  },
  "auth": {
    "login": "Login",
    "register": "Register",
    "logout": "Logout"
  }
}
```

---

## 🔧 Code Generation Files

| فایل | ابزار | توضیح |
|------|-------|-------|
| `injection.config.dart` | `injectable` + `get_it` | DI graph |
| `*.g.dart` | `json_serializable` | JSON serialization |
| `*.g.dart` | `hive_generator` | Hive TypeAdapters |
| `*.freezed.dart` | `freezed` | Immutable models / unions |
| `locale_keys.g.dart` | `easy_localization` | Type-safe locale keys |
| `app_router.gr.dart` | `auto_route` | Type-safe routing |

---

## 🧪 test/ Structure

```
test/
├── core/
│   ├── network/
│   │   └── dio_client_test.dart
│   └── storage/
│       └── hive_service_test.dart
├── features/
│   └── auth/
│       ├── data/
│       │   └── auth_repository_impl_test.dart
│       ├── domain/
│       │   └── login_usecase_test.dart
│       └── presentation/
│           └── auth_bloc_test.dart
└── helpers/
    ├── test_helpers.dart
    └── mock_data.dart
```

---

## 📌 Feature Layer Rules

هر Feature از **۳ لایه مجزا** تشکیل می‌شود:

```
feature/
├── data/           ← پیاده‌سازی واقعی (API، DB، Cache)
│   ├── datasources/
│   ├── models/     ← DTO + json_serializable
│   └── repositories/
│
├── domain/         ← قوانین کسب‌وکار (بدون وابستگی به Flutter)
│   ├── entities/   ← Pure Dart objects
│   ├── repositories/ ← abstract contracts
│   └── usecases/   ← Single-responsibility business logic
│
└── presentation/   ← UI + State Management (BLoC)
    ├── bloc/
    ├── pages/
    └── widgets/
```

---

## 📋 pubspec.yaml — Dependencies Overview

```yaml
dependencies:
  # DI
  get_it:
  injectable:

  # Network
  dio:
  retrofit:
  web_socket_channel:

  # Storage
  hive_flutter:
  flutter_secure_storage:
  shared_preferences:

  # Firebase
  firebase_core:
  firebase_auth:
  firebase_messaging:
  firebase_analytics:
  firebase_crashlytics:
  firebase_remote_config:

  # UI
  flutter_animate:
  lottie:
  shimmer:
  cached_network_image:
  flutter_screenutil:

  # State Management
  flutter_bloc:
  freezed_annotation:

  # Routing
  auto_route:

  # Localization
  easy_localization:

  # Device
  camera:
  image_picker:
  geolocator:
  google_maps_flutter:
  permission_handler:
  device_info_plus:

  # Utils
  dartz:              # Functional programming (Either)
  connectivity_plus:
  equatable:
  json_annotation:

dev_dependencies:
  # Code Generation
  build_runner:
  injectable_generator:
  retrofit_generator:
  json_serializable:
  hive_generator:
  freezed:
  auto_route_generator:
```

---

## ⚡ build.yaml

```yaml
targets:
  $default:
    builders:
      injectable_generator:injectable_builder:
        options:
          auto_register: true
      json_serializable:
        options:
          explicit_to_json: true
          field_rename: snake_case
```

---

## 🚀 Code Generation Commands

```bash
# Run all generators
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

---

*این ساختار برای پروژه‌های Medium تا Large-scale طراحی شده است.*  
*هر Feature کاملاً مستقل و قابل جداسازی (modular) می‌باشد.*
