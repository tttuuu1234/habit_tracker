import '../result.dart';
import 'frequency_type.dart';
import 'habit.dart';

/// 習慣データのリポジトリインターフェース。
abstract class HabitRepository {
  /// すべての習慣を取得する。
  Future<Result<List<Habit>>> getAll();

  /// IDで習慣を1件取得する。
  Future<Result<Habit>> getById(int id);

  /// 習慣を新規作成し、作成された習慣を返す。
  Future<Result<Habit>> create({
    required String name,
    required DateTime createdDate,
    required int? colorValue,
    required FrequencyType frequencyType,
    required Set<int> weeklyDays,
  });

  /// 習慣を更新する。
  Future<Result<void>> update(Habit habit);

  /// 習慣を削除する。
  Future<Result<void>> delete(int id);
}
