// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'96b544ff7ce456f0fc1edbdafdf332306a9affed';

/// アプリケーションデータベースのインスタンス。
///
/// Copied from [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
String _$habitRepositoryHash() => r'd78359078c4bb19702aa4646e92975602d7c80ec';

/// 習慣リポジトリのインスタンス。
///
/// Copied from [habitRepository].
@ProviderFor(habitRepository)
final habitRepositoryProvider = Provider<HabitRepository>.internal(
  habitRepository,
  name: r'habitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HabitRepositoryRef = ProviderRef<HabitRepository>;
String _$completionRecordRepositoryHash() =>
    r'65ddc3bea28210a4046bc74d04c22b4e26f3a225';

/// 達成記録リポジトリのインスタンス。
///
/// Copied from [completionRecordRepository].
@ProviderFor(completionRecordRepository)
final completionRecordRepositoryProvider =
    Provider<CompletionRecordRepository>.internal(
      completionRecordRepository,
      name: r'completionRecordRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$completionRecordRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompletionRecordRepositoryRef = ProviderRef<CompletionRecordRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
