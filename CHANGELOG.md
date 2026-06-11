# CHANGELOG.md

## 2026-06-11

### Added

* Health feature module
* Health repository
* Health datasource
* CheckHealth use case
* Splash server availability check
* Retry action when backend is unavailable
* Session bootstrap during Splash
* Token-based auto login flow
* Profile bootstrap foundation

### Improved

* Splash initialization flow
* Route decision architecture
* Authentication bootstrap sequence

### Fixed

* Dio interceptor chain issue
* LoggingInterceptor response handling bug
* ErrorInterceptor exception propagation
* Health check false-negative behavior
* Splash freeze when backend connection succeeds

### Technical Notes

* LoggingInterceptor refactored to avoid breaking Dio pipeline.
* RetryInterceptor currently uses standalone Dio and will be redesigned during Refresh Token implementation.
