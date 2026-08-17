import 'package:habit_tracker/domain/habit/frequency_type.dart';
import 'package:habit_tracker/domain/habit/habit.dart';
import 'package:habit_tracker/domain/habit/habit_repository.dart';
import 'package:habit_tracker/domain/result.dart';

/// テスト用の習慣リポジトリ実装。
class FakeHabitRepository implements HabitRepository {
  final List<Habit> _habits = [];
  int _nextId = 1;

  /// テスト用に習慣を直接追加する。
  void addHabit(Habit habit) {
    _habits.add(habit);
  }

  @override
  Future<Result<List<Habit>>> getAll() async {
    return Result.success(List.unmodifiable(_habits));
  }

  @override
  Future<Result<Habit>> getById(int id) async {
    final habit = _habits.where((h) => h.id == id).firstOrNull;
    if (habit == null) {
      return const Result.failure('習慣が見つかりません');
    }
    return Result.success(habit);
  }

  @override
  Future<Result<Habit>> create({
    required String name,
    required DateTime createdDate,
    required int? colorValue,
    required FrequencyType frequencyType,
    required Set<int> weeklyDays,
  }) async {
    final habit = Habit(
      id: _nextId++,
      name: name,
      createdDate:
          DateTime(createdDate.year, createdDate.month, createdDate.day),
      colorValue: colorValue,
      frequencyType: frequencyType,
      weeklyDays: weeklyDays,
    );
    _habits.add(habit);
    return Result.success(habit);
  }

  @override
  Future<Result<void>> update(Habit habit) async {
    final index = _habits.indexWhere((h) => h.id == habit.id);
    if (index == -1) {
      return const Result.failure('習慣が見つかりません');
    }
    _habits[index] = habit;
    return const Result.success(null);
  }

  @override
  Future<Result<void>> delete(int id) async {
    _habits.removeWhere((h) => h.id == id);
    return const Result.success(null);
  }
}
