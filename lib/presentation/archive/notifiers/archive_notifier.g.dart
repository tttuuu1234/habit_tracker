// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$archiveHash() => r'e864d275400383b0e4b6e5d948ff179ee869845a';

/// アーカイブ一覧画面の状態を管理するNotifier。
///
/// Copied from [Archive].
@ProviderFor(Archive)
final archiveProvider =
    AutoDisposeAsyncNotifierProvider<Archive, List<ArchivedHabit>>.internal(
      Archive.new,
      name: r'archiveProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$archiveHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Archive = AutoDisposeAsyncNotifier<List<ArchivedHabit>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
