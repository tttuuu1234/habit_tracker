// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitDetailHash() => r'6e0cf106762be1af820104636567668250a2b862';

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
    extends BuildlessAutoDisposeNotifier<HabitDetailState> {
  late final int habitIndex;

  HabitDetailState build(int habitIndex);
}

/// See also [HabitDetail].
@ProviderFor(HabitDetail)
const habitDetailProvider = HabitDetailFamily();

/// See also [HabitDetail].
class HabitDetailFamily extends Family<HabitDetailState> {
  /// See also [HabitDetail].
  const HabitDetailFamily();

  /// See also [HabitDetail].
  HabitDetailProvider call(int habitIndex) {
    return HabitDetailProvider(habitIndex);
  }

  @override
  HabitDetailProvider getProviderOverride(
    covariant HabitDetailProvider provider,
  ) {
    return call(provider.habitIndex);
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

/// See also [HabitDetail].
class HabitDetailProvider
    extends AutoDisposeNotifierProviderImpl<HabitDetail, HabitDetailState> {
  /// See also [HabitDetail].
  HabitDetailProvider(int habitIndex)
    : this._internal(
        () => HabitDetail()..habitIndex = habitIndex,
        from: habitDetailProvider,
        name: r'habitDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$habitDetailHash,
        dependencies: HabitDetailFamily._dependencies,
        allTransitiveDependencies: HabitDetailFamily._allTransitiveDependencies,
        habitIndex: habitIndex,
      );

  HabitDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitIndex,
  }) : super.internal();

  final int habitIndex;

  @override
  HabitDetailState runNotifierBuild(covariant HabitDetail notifier) {
    return notifier.build(habitIndex);
  }

  @override
  Override overrideWith(HabitDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitDetailProvider._internal(
        () => create()..habitIndex = habitIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitIndex: habitIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HabitDetail, HabitDetailState>
  createElement() {
    return _HabitDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitDetailProvider && other.habitIndex == habitIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HabitDetailRef on AutoDisposeNotifierProviderRef<HabitDetailState> {
  /// The parameter `habitIndex` of this provider.
  int get habitIndex;
}

class _HabitDetailProviderElement
    extends AutoDisposeNotifierProviderElement<HabitDetail, HabitDetailState>
    with HabitDetailRef {
  _HabitDetailProviderElement(super.provider);

  @override
  int get habitIndex => (origin as HabitDetailProvider).habitIndex;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
