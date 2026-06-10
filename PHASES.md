# 🚀 Flutter Boilerplate — فازبندی ساخت

> هدف: ساخت تدریجی — هر فاز مستقل و قابل تست

---

## Phase 1 — Project Bootstrap
**هدف:** پروژه اجرا بشه، DI و routing کار کنه

### فایل‌ها
- `pubspec.yaml` — همه dependencies
- `build.yaml` — تنظیمات code generation
- `lib/main.dart`
- `lib/app/app.dart`
- `lib/core/di/injection.dart`
- `lib/core/di/injection.config.dart` ← generated
- `lib/core/router/app_router.dart`
- `lib/core/router/app_router.gr.dart` ← generated

### وظایف
- [ ] نصب و تنظیم همه پکیج‌ها
- [ ] راه‌اندازی GetIt + Injectable
- [ ] راه‌اندازی AutoRoute
- [ ] اجرای `build_runner` اول بار
- [ ] تست: `flutter run` بدون خطا

---

## Phase 2 — Core Network Layer
**هدف:** Dio + Retrofit + WebSocket + Interceptorها آماده بشن

### فایل‌ها
- `lib/core/network/dio_client.dart`
- `lib/core/network/api_endpoints.dart`
- `lib/core/network/network_info.dart`
- `lib/core/network/websocket_client.dart`
- `lib/core/network/interceptors/auth_interceptor.dart`
- `lib/core/network/interceptors/logging_interceptor.dart`
- `lib/core/network/interceptors/retry_interceptor.dart`
- `lib/core/network/interceptors/error_interceptor.dart`
- `lib/core/error/exceptions.dart`
- `lib/core/error/failures.dart`
- `lib/core/error/error_handler.dart`

### وظایف
- [ ] ساخت Dio instance با base options
- [ ] اضافه کردن interceptorها به ترتیب صحیح
- [ ] تعریف Exception و Failure typeها
- [ ] پیاده‌سازی WebSocket wrapper
- [ ] ثبت همه در GetIt

---

## Phase 3 — Storage Layer
**هدف:** Hive، SecureStorage و SharedPreferences آماده بشن

### فایل‌ها
- `lib/core/storage/hive/hive_service.dart`
- `lib/core/storage/hive/adapters/` ← generated با `hive_generator`
- `lib/core/storage/secure_storage/secure_storage_service.dart`
- `lib/core/storage/preferences/preferences_service.dart`

### وظایف
- [ ] init Hive در `main.dart`
- [ ] تعریف Box typeها و register adapters
- [ ] ساخت CRUD wrapper برای Hive
- [ ] ساخت wrapper برای FlutterSecureStorage
- [ ] ساخت wrapper برای SharedPreferences
- [ ] ثبت همه در GetIt به صورت singleton

---

## Phase 4 — Firebase Suite
**هدف:** همه سرویس‌های Firebase وصل و injectable بشن

### فایل‌ها
- `lib/core/firebase/firebase_options.dart` ← `flutterfire configure`
- `lib/core/firebase/fcm_service.dart`
- `lib/core/firebase/analytics_service.dart`
- `lib/core/firebase/crashlytics_service.dart`
- `lib/core/firebase/remote_config_service.dart`

### وظایف
- [ ] اجرای `flutterfire configure`
- [ ] init Firebase در `main.dart`
- [ ] پیاده‌سازی FCM (foreground + background handler)
- [ ] پیاده‌سازی Crashlytics (catch Flutter errors)
- [ ] پیاده‌سازی RemoteConfig با default values
- [ ] ثبت همه در GetIt

---

## Phase 5 — Device Integration
**هدف:** Camera، GPS، Maps و Permissions کار کنن

### فایل‌ها
- `lib/core/permissions/permission_handler.dart`
- `lib/core/permissions/permission_type.dart`
- `lib/core/device/camera_service.dart`
- `lib/core/device/location_service.dart`
- `lib/core/device/device_info_service.dart`

### وظایف
- [ ] تعریف enum برای permission typeها
- [ ] ساخت permission request/check wrapper
- [ ] ساخت camera + gallery picker wrapper
- [ ] ساخت location stream wrapper
- [ ] اضافه کردن Google Maps API key (android/ios)
- [ ] ثبت همه در GetIt

---

## Phase 6 — UI System
**هدف:** Theme، ScreenUtil، انیمیشن‌ها و reusable widgetها

### فایل‌ها
- `lib/core/ui/theme/app_colors.dart`
- `lib/core/ui/theme/app_text_styles.dart`
- `lib/core/ui/theme/app_theme.dart`
- `lib/core/ui/theme/app_dimensions.dart`
- `lib/core/ui/widgets/app_button.dart`
- `lib/core/ui/widgets/app_text_field.dart`
- `lib/core/ui/widgets/app_loader.dart`
- `lib/core/ui/widgets/app_cached_image.dart`
- `lib/core/ui/widgets/app_lottie.dart`
- `lib/core/ui/widgets/app_error_widget.dart`
- `lib/core/ui/widgets/app_empty_state.dart`
- `lib/core/ui/widgets/responsive/screen_util_init.dart`
- `assets/animations/*.json`

### وظایف
- [ ] تعریف color palette و typography
- [ ] init ScreenUtil در app root
- [ ] ساخت reusable button با حالت‌های loading/disabled
- [ ] ساخت shimmer loader wrapper
- [ ] ساخت CachedNetworkImage wrapper
- [ ] ساخت Lottie animation wrapper
- [ ] تست responsive روی سایزهای مختلف

---

## Phase 7 — Localization
**هدف:** پشتیبانی از فارسی و انگلیسی

### فایل‌ها
- `assets/translations/en.json`
- `assets/translations/fa.json`
- `lib/core/localization/l10n.dart`
- `lib/core/localization/locale_keys.g.dart` ← generated

### وظایف
- [ ] تعریف همه کلیدهای ترجمه
- [ ] تنظیم EasyLocalization در `main.dart`
- [ ] پشتیبانی از RTL برای فارسی
- [ ] تست switch زبان در runtime

---

## Phase 8 — Auth Feature (نمونه Feature کامل)
**هدف:** یک feature end-to-end با Clean Architecture پیاده بشه

### فایل‌ها

**Data Layer**
- `lib/features/auth/data/datasources/auth_remote_datasource.dart`
- `lib/features/auth/data/datasources/auth_local_datasource.dart`
- `lib/features/auth/data/models/user_model.dart`
- `lib/features/auth/data/models/user_model.g.dart` ← generated
- `lib/features/auth/data/repositories/auth_repository_impl.dart`

**Domain Layer**
- `lib/features/auth/domain/entities/user_entity.dart`
- `lib/features/auth/domain/repositories/auth_repository.dart`
- `lib/features/auth/domain/usecases/login_usecase.dart`
- `lib/features/auth/domain/usecases/logout_usecase.dart`
- `lib/features/auth/domain/usecases/register_usecase.dart`

**Presentation Layer**
- `lib/features/auth/presentation/bloc/auth_bloc.dart`
- `lib/features/auth/presentation/bloc/auth_event.dart`
- `lib/features/auth/presentation/bloc/auth_state.dart`
- `lib/features/auth/presentation/pages/login_page.dart`
- `lib/features/auth/presentation/pages/register_page.dart`
- `lib/features/auth/presentation/widgets/auth_form_widget.dart`

### وظایف
- [ ] تعریف UserEntity (pure Dart)
- [ ] ساخت UserModel + json_serializable
- [ ] پیاده‌سازی abstract repository
- [ ] پیاده‌سازی usecaseها با `Either<Failure, T>`
- [ ] ساخت AuthBloc با state‌های loading/success/error
- [ ] اتصال Firebase Auth در datasource
- [ ] ساخت Login و Register UI
- [ ] ثبت همه در GetIt

---

## Phase 9 — Testing
**هدف:** پوشش تست برای core و auth feature

### فایل‌ها
- `test/core/network/dio_client_test.dart`
- `test/core/storage/hive_service_test.dart`
- `test/features/auth/data/auth_repository_impl_test.dart`
- `test/features/auth/domain/login_usecase_test.dart`
- `test/features/auth/presentation/auth_bloc_test.dart`
- `test/helpers/test_helpers.dart`
- `test/helpers/mock_data.dart`

### وظایف
- [ ] نوشتن mock‌ها با `mocktail`
- [ ] تست repository با fake datasource
- [ ] تست usecase با mock repository
- [ ] تست BLoC با `bloc_test`
- [ ] تست interceptorها

---

## Phase 10 — Final Wiring & Polish
**هدف:** همه چیز به هم وصل بشه، پروژه production-ready بشه

### فایل‌ها
- `lib/core/router/guards/auth_guard.dart`
- `lib/core/router/guards/onboarding_guard.dart`
- `lib/main_dev.dart`
- `lib/main_staging.dart`
- `README.md`

### وظایف
- [ ] اضافه کردن route guard برای auth
- [ ] تنظیم flavors (dev / staging / prod)
- [ ] بررسی نهایی `build_runner` خروجی‌ها
- [ ] تست روی Android و iOS
- [ ] نوشتن README

---

## 📊 خلاصه فازها

| فاز | موضوع | خروجی کلیدی |
|-----|-------|-------------|
| 1 | Bootstrap | پروژه اجرا می‌شه |
| 2 | Network | Dio + Retrofit آماده |
| 3 | Storage | Hive + Secure + Prefs |
| 4 | Firebase | Auth + FCM + Analytics |
| 5 | Device | Camera + GPS + Maps |
| 6 | UI System | Theme + Components |
| 7 | Localization | FA + EN آماده |
| 8 | Auth Feature | نمونه Clean Architecture |
| 9 | Testing | تست‌های core + feature |
| 10 | Polish | Production-ready |
