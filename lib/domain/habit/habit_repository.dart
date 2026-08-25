import '../result.dart';
import 'frequency_type.dart';
import 'habit.dart';
import 'habit_category.dart';
import 'habit_type.dart';

/// 習慣データのリポジトリインターフェース。
abstract class HabitRepository {
  /// すべての習慣を取得する。
  Future<Result<List<Habit>>> getAll();

  /// アーカイブされていない習慣を取得する。
  Future<Result<List<Habit>>> getActive();

  /// アーカイブ済みの習慣を取得する。
  Future<Result<List<Habit>>> getArchived();

  /// IDで習慣を1件取得する。
  Future<Result<Habit>> getById(int id);

  /// 習慣を新規作成し、作成された習慣を返す。
  Future<Result<Habit>> create({
    required String name,
    required DateTime createdDate,
    required HabitCategory? category,
    required FrequencyType frequencyType,
    required Set<int> weeklyDays,
    required HabitType habitType,
    required int? targetTime,
  });

  /// 習慣を更新する。
  Future<Result<void>> update(Habit habit);

  /// 習慣を削除する。
  Future<Result<void>> delete(int id);
}
