// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitFormHash() => r'07e39d22c560c3479ad46f21c52393efa15b6fcb';

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

abstract class _$HabitForm
    extends BuildlessAutoDisposeNotifier<HabitFormState> {
  late final int? editingHabitIndex;

  HabitFormState build(int? editingHabitIndex);
}

/// 習慣作成・編集フォームの状態を管理するNotifier。
///
/// Copied from [HabitForm].
@ProviderFor(HabitForm)
const habitFormProvider = HabitFormFamily();

/// 習慣作成・編集フォームの状態を管理するNotifier。
///
/// Copied from [HabitForm].
class HabitFormFamily extends Family<HabitFormState> {
  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  const HabitFormFamily();

  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  HabitFormProvider call(int? editingHabitIndex) {
    return HabitFormProvider(editingHabitIndex);
  }

  @override
  HabitFormProvider getProviderOverride(covariant HabitFormProvider provider) {
    return call(provider.editingHabitIndex);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'habitFormProvider';
}

/// 習慣作成・編集フォームの状態を管理するNotifier。
///
/// Copied from [HabitForm].
class HabitFormProvider
    extends AutoDisposeNotifierProviderImpl<HabitForm, HabitFormState> {
  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  HabitFormProvider(int? editingHabitIndex)
    : this._internal(
        () => HabitForm()..editingHabitIndex = editingHabitIndex,
        from: habitFormProvider,
        name: r'habitFormProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$habitFormHash,
        dependencies: HabitFormFamily._dependencies,
        allTransitiveDependencies: HabitFormFamily._allTransitiveDependencies,
        editingHabitIndex: editingHabitIndex,
      );

  HabitFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.editingHabitIndex,
  }) : super.internal();

  final int? editingHabitIndex;

  @override
  HabitFormState runNotifierBuild(covariant HabitForm notifier) {
    return notifier.build(editingHabitIndex);
  }

  @override
  Override overrideWith(HabitForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitFormProvider._internal(
        () => create()..editingHabitIndex = editingHabitIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        editingHabitIndex: editingHabitIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<HabitForm, HabitFormState>
  createElement() {
    return _HabitFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitFormProvider &&
        other.editingHabitIndex == editingHabitIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, editingHabitIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HabitFormRef on AutoDisposeNotifierProviderRef<HabitFormState> {
  /// The parameter `editingHabitIndex` of this provider.
  int? get editingHabitIndex;
}

class _HabitFormProviderElement
    extends AutoDisposeNotifierProviderElement<HabitForm, HabitFormState>
    with HabitFormRef {
  _HabitFormProviderElement(super.provider);

  @override
  int? get editingHabitIndex => (origin as HabitFormProvider).editingHabitIndex;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
