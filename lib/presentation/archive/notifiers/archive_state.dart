import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_state.freezed.dart';

/// アーカイブ済み習慣の概要。
@freezed
abstract class ArchivedHabit with _$ArchivedHabit {
  const factory ArchivedHabit({
    /// 習慣ID。
    required int id,

    /// 習慣名。
    required String name,

    /// テーマカラーの値。
    required int? colorValue,
  }) = _ArchivedHabit;
}
