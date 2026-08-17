// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitFormHash() => r'6e299ad6264eee33695a74c2742c11d389d8cd22';

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
    extends BuildlessAutoDisposeAsyncNotifier<HabitFormState> {
  late final int? editingHabitId;

  FutureOr<HabitFormState> build(int? editingHabitId);
}

/// 習慣作成・編集フォームの状態を管理するNotifier。
///
/// Copied from [HabitForm].
@ProviderFor(HabitForm)
const habitFormProvider = HabitFormFamily();

/// 習慣作成・編集フォームの状態を管理するNotifier。
///
/// Copied from [HabitForm].
class HabitFormFamily extends Family<AsyncValue<HabitFormState>> {
  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  const HabitFormFamily();

  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  HabitFormProvider call(int? editingHabitId) {
    return HabitFormProvider(editingHabitId);
  }

  @override
  HabitFormProvider getProviderOverride(covariant HabitFormProvider provider) {
    return call(provider.editingHabitId);
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
    extends AutoDisposeAsyncNotifierProviderImpl<HabitForm, HabitFormState> {
  /// 習慣作成・編集フォームの状態を管理するNotifier。
  ///
  /// Copied from [HabitForm].
  HabitFormProvider(int? editingHabitId)
    : this._internal(
        () => HabitForm()..editingHabitId = editingHabitId,
        from: habitFormProvider,
        name: r'habitFormProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$habitFormHash,
        dependencies: HabitFormFamily._dependencies,
        allTransitiveDependencies: HabitFormFamily._allTransitiveDependencies,
        editingHabitId: editingHabitId,
      );

  HabitFormProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.editingHabitId,
  }) : super.internal();

  final int? editingHabitId;

  @override
  FutureOr<HabitFormState> runNotifierBuild(covariant HabitForm notifier) {
    return notifier.build(editingHabitId);
  }

  @override
  Override overrideWith(HabitForm Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitFormProvider._internal(
        () => create()..editingHabitId = editingHabitId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        editingHabitId: editingHabitId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<HabitForm, HabitFormState>
  createElement() {
    return _HabitFormProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitFormProvider && other.editingHabitId == editingHabitId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, editingHabitId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HabitFormRef on AutoDisposeAsyncNotifierProviderRef<HabitFormState> {
  /// The parameter `editingHabitId` of this provider.
  int? get editingHabitId;
}

class _HabitFormProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<HabitForm, HabitFormState>
    with HabitFormRef {
  _HabitFormProviderElement(super.provider);

  @override
  int? get editingHabitId => (origin as HabitFormProvider).editingHabitId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
