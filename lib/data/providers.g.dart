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
String _$habitsTableChangedHash() =>
    r'29884687c46c70bfd6a64441b1eaaea1371bbec2';

/// 習慣テーブルの変更を監視するストリーム。
///
/// Copied from [habitsTableChanged].
@ProviderFor(habitsTableChanged)
final habitsTableChangedProvider = AutoDisposeStreamProvider<void>.internal(
  habitsTableChanged,
  name: r'habitsTableChangedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$habitsTableChangedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HabitsTableChangedRef = AutoDisposeStreamProviderRef<void>;
String _$completionRecordsTableChangedHash() =>
    r'1bc1e799419c28d62ba1d3ffbfd4d178c5e19f8d';

/// 達成記録テーブルの変更を監視するストリーム。
///
/// Copied from [completionRecordsTableChanged].
@ProviderFor(completionRecordsTableChanged)
final completionRecordsTableChangedProvider =
    AutoDisposeStreamProvider<void>.internal(
      completionRecordsTableChanged,
      name: r'completionRecordsTableChangedProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$completionRecordsTableChangedHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompletionRecordsTableChangedRef = AutoDisposeStreamProviderRef<void>;
String _$getCategoryStatisticsUseCaseHash() =>
    r'e77c33e3ee3f5f752c0a50e6a89469af2339ed15';

/// カテゴリ別統計ユースケースのインスタンス。
///
/// Copied from [getCategoryStatisticsUseCase].
@ProviderFor(getCategoryStatisticsUseCase)
final getCategoryStatisticsUseCaseProvider =
    AutoDisposeProvider<GetCategoryStatisticsUseCase>.internal(
      getCategoryStatisticsUseCase,
      name: r'getCategoryStatisticsUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getCategoryStatisticsUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCategoryStatisticsUseCaseRef =
    AutoDisposeProviderRef<GetCategoryStatisticsUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
