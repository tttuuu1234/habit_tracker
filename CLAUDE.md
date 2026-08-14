# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A habit tracker mobile app built with Flutter/Dart. Targets iOS and Android only.

## Development Environment

- **Flutter**: 3.44.8 (managed via FVM)
- **Dart SDK**: ^3.12.2
- **Linting**: flutter_lints

## Commands

```bash
flutter pub get                        # install dependencies
flutter run                            # run on connected device
flutter test                           # run all tests
flutter test test/some_test.dart       # run single test file
flutter analyze                        # static analysis
dart run build_runner build            # code generation (drift, riverpod)
dart run build_runner watch            # code generation (watch mode)
flutter build apk                     # build Android
flutter build ios                     # build iOS
```

## Architecture

Layer-first architecture with clear separation of concerns.

```
lib/
  core/           # shared utilities, constants, theme, extensions
  data/           # data sources, repositories implementation, models (DB/API)
  domain/         # entities, repository interfaces, use cases
  presentation/   # screens, widgets, controllers/notifiers
  main.dart       # entry point, app configuration
```

### Key Technology Choices

- **State management**: Riverpod (use `@riverpod` annotation with code generation)
- **Navigation**: go_router
- **Database**: drift (SQLite) for local persistence
- **No Firebase** — the app is local-only

### Layer Rules

- `domain/` must not depend on `data/` or `presentation/`
- `data/` implements interfaces defined in `domain/`
- `presentation/` must NOT depend on `data/` directly
- `presentation/` accesses data through Riverpod providers backed by repository interfaces or use cases

### Use Cases

- Use cases are placed in `domain/use_cases/`
- Only create a use case when there is **actual business logic** (validation, aggregation, multi-repo coordination, computation)
- For simple CRUD with no logic, `presentation/` may call repository interfaces directly via providers
- Use cases return `Result<T>` to make error handling explicit at the call site

### Error Handling

- Use `Result<T>` (defined with freezed) instead of throwing exceptions for expected errors
- `Result` has `Success<T>` and `Failure<T>` variants — exhaustive switch ensures no unhandled cases
- Exceptions are reserved for truly unexpected/programmer errors only

### Conventions

- Immutable data classes: use `freezed` for domain entities and state objects
- File naming: `snake_case.dart`
- One public class per file
- Tests mirror the `lib/` directory structure under `test/`
