// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitDetailHash() => r'f262d0237f51e6e5648f4e06d5e9e308722e0f4e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$HabitDetail
    extends BuildlessAutoDisposeAsyncNotifier<HabitDetailState> {
  late final int habitId;

  FutureOr<HabitDetailState> build(int habitId);
}

/// 習慣詳細画面の状態を管理するNotifier。
///
/// Copied from [HabitDetail].
@ProviderFor(HabitDetail)
const habitDetailProvider = HabitDetailFamily();

/// 習慣詳細画面の状態を管理するNotifier。
///
/// Copied from [HabitDetail].
class HabitDetailFamily extends Family<AsyncValue<HabitDetailState>> {
  /// 習慣詳細画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitDetail].
  const HabitDetailFamily();

  /// 習慣詳細画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitDetail].
  HabitDetailProvider call(int habitId) {
    return HabitDetailProvider(habitId);
  }

  @override
  HabitDetailProvider getProviderOverride(
    covariant HabitDetailProvider provider,
  ) {
    return call(provider.habitId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'habitDetailProvider';
}

/// 習慣詳細画面の状態を管理するNotifier。
///
/// Copied from [HabitDetail].
class HabitDetailProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<HabitDetail, HabitDetailState> {
  /// 習慣詳細画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitDetail].
  HabitDetailProvider(int habitId)
    : this._internal(
        () => HabitDetail()..habitId = habitId,
        from: habitDetailProvider,
        name: r'habitDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$habitDetailHash,
        dependencies: HabitDetailFamily._dependencies,
        allTransitiveDependencies: HabitDetailFamily._allTransitiveDependencies,
        habitId: habitId,
      );

  HabitDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitId,
  }) : super.internal();

  final int habitId;

  @override
  FutureOr<HabitDetailState> runNotifierBuild(covariant HabitDetail notifier) {
    return notifier.build(habitId);
  }

  @override
  Override overrideWith(HabitDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitDetailProvider._internal(
        () => create()..habitId = habitId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitId: habitId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<HabitDetail, HabitDetailState>
  createElement() {
    return _HabitDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitDetailProvider && other.habitId == habitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HabitDetailRef on AutoDisposeAsyncNotifierProviderRef<HabitDetailState> {
  /// The parameter `habitId` of this provider.
  int get habitId;
}

class _HabitDetailProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<HabitDetail, HabitDetailState>
    with HabitDetailRef {
  _HabitDetailProviderElement(super.provider);

  @override
  int get habitId => (origin as HabitDetailProvider).habitId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
