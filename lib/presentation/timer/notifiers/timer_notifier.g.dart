// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitTimerHash() => r'75978fb1f019549d6d57ba0d125a6675c803e936';

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

abstract class _$HabitTimer extends BuildlessAsyncNotifier<TimerState> {
  late final int habitId;

  FutureOr<TimerState> build(int habitId);
}

/// タイマー画面の状態を管理するNotifier。
///
/// Copied from [HabitTimer].
@ProviderFor(HabitTimer)
const habitTimerProvider = HabitTimerFamily();

/// タイマー画面の状態を管理するNotifier。
///
/// Copied from [HabitTimer].
class HabitTimerFamily extends Family<AsyncValue<TimerState>> {
  /// タイマー画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitTimer].
  const HabitTimerFamily();

  /// タイマー画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitTimer].
  HabitTimerProvider call(int habitId) {
    return HabitTimerProvider(habitId);
  }

  @override
  HabitTimerProvider getProviderOverride(
    covariant HabitTimerProvider provider,
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
  String? get name => r'habitTimerProvider';
}

/// タイマー画面の状態を管理するNotifier。
///
/// Copied from [HabitTimer].
class HabitTimerProvider
    extends AsyncNotifierProviderImpl<HabitTimer, TimerState> {
  /// タイマー画面の状態を管理するNotifier。
  ///
  /// Copied from [HabitTimer].
  HabitTimerProvider(int habitId)
    : this._internal(
        () => HabitTimer()..habitId = habitId,
        from: habitTimerProvider,
        name: r'habitTimerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$habitTimerHash,
        dependencies: HabitTimerFamily._dependencies,
        allTransitiveDependencies: HabitTimerFamily._allTransitiveDependencies,
        habitId: habitId,
      );

  HabitTimerProvider._internal(
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
  FutureOr<TimerState> runNotifierBuild(covariant HabitTimer notifier) {
    return notifier.build(habitId);
  }

  @override
  Override overrideWith(HabitTimer Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitTimerProvider._internal(
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
  AsyncNotifierProviderElement<HabitTimer, TimerState> createElement() {
    return _HabitTimerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitTimerProvider && other.habitId == habitId;
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
mixin HabitTimerRef on AsyncNotifierProviderRef<TimerState> {
  /// The parameter `habitId` of this provider.
  int get habitId;
}

class _HabitTimerProviderElement
    extends AsyncNotifierProviderElement<HabitTimer, TimerState>
    with HabitTimerRef {
  _HabitTimerProviderElement(super.provider);

  @override
  int get habitId => (origin as HabitTimerProvider).habitId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
