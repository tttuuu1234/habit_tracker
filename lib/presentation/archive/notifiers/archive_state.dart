import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/habit/habit_category.dart';

part 'archive_state.freezed.dart';

/// アーカイブ済み習慣の概要。
@freezed
abstract class ArchivedHabit with _$ArchivedHabit {
  const factory ArchivedHabit({
    /// 習慣ID。
    required int id,

    /// 習慣名。
    required String name,

    /// カテゴリ。
    required HabitCategory? category,
  }) = _ArchivedHabit;
}
