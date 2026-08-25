import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/result.dart';
import 'archive_state.dart';

part 'archive_notifier.g.dart';

/// アーカイブ一覧画面の状態を管理するNotifier。
@riverpod
class Archive extends _$Archive {
  @override
  Future<List<ArchivedHabit>> build() async {
    return _loadArchived();
  }

  /// アーカイブ済み習慣を読み込む。
  Future<List<ArchivedHabit>> _loadArchived() async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final result = await habitRepo.getArchived();

    return switch (result) {
      Success(:final value) =>
        value
            .map(
              (habit) => ArchivedHabit(
                id: habit.id,
                name: habit.name,
                category: habit.category,
              ),
            )
            .toList(),
      Failure() => [],
    };
  }

  /// 習慣のアーカイブを解除する。
  Future<void> unarchive(int habitId) async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final habitResult = await habitRepo.getById(habitId);
    if (habitResult is! Success) return;

    final habit = (habitResult as Success).value;
    await habitRepo.update(habit.copyWith(isArchived: false));
    state = AsyncData(await _loadArchived());
  }
}
