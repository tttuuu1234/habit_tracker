import 'package:drift/drift.dart';

import '../../domain/habit/frequency_type.dart';
import '../../domain/habit/habit.dart' as domain;
import '../../domain/habit/habit_category.dart';
import '../../domain/habit/habit_repository.dart';
import '../../domain/habit/habit_type.dart';
import '../../domain/result.dart';
import '../database/app_database.dart';
import '../database/daos/habit_dao.dart';

/// driftを使用した習慣リポジトリの実装。
class DriftHabitRepository implements HabitRepository {
  DriftHabitRepository(this._habitDao);

  final HabitDao _habitDao;

  @override
  Future<Result<List<domain.Habit>>> getAll() async {
    try {
      final rows = await _habitDao.getAll();
      final habits = rows.map(_toDomain).toList();
      return Result.success(habits);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<domain.Habit>>> getActive() async {
    try {
      final rows = await _habitDao.getActive();
      final habits = rows.map(_toDomain).toList();
      return Result.success(habits);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<List<domain.Habit>>> getArchived() async {
    try {
      final rows = await _habitDao.getArchived();
      final habits = rows.map(_toDomain).toList();
      return Result.success(habits);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<domain.Habit>> getById(int id) async {
    try {
      final row = await _habitDao.getById(id);
      if (row == null) {
        return const Result.failure('習慣が見つかりません');
      }
      return Result.success(_toDomain(row));
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<domain.Habit>> create({
    required String name,
    required DateTime createdDate,
    required HabitCategory? category,
    required FrequencyType frequencyType,
    required Set<int> weeklyDays,
    required HabitType habitType,
    required int? targetTime,
  }) async {
    try {
      final normalizedDate = _normalizeDate(createdDate);
      final entry = HabitsCompanion.insert(
        name: name,
        createdDate: normalizedDate,
        frequencyType: frequencyType,
        weeklyDays: weeklyDays,
        habitType: Value(habitType),
        targetTime: Value(targetTime),
        category: Value(category),
      );
      final row = await _habitDao.insert_(entry);
      return Result.success(_toDomain(row));
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> update(domain.Habit habit) async {
    try {
      final entry = HabitsCompanion(
        id: Value(habit.id),
        name: Value(habit.name),
        createdDate: Value(_normalizeDate(habit.createdDate)),
        frequencyType: Value(habit.frequencyType),
        weeklyDays: Value(habit.weeklyDays),
        habitType: Value(habit.habitType),
        targetTime: Value(habit.targetTime),
        isArchived: Value(habit.isArchived),
        category: Value(habit.category),
      );
      await _habitDao.update_(entry);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> delete(int id) async {
    try {
      await _habitDao.delete_(id);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  domain.Habit _toDomain(Habit row) {
    return domain.Habit(
      id: row.id,
      name: row.name,
      createdDate: _normalizeDate(row.createdDate),
      category: row.category,
      frequencyType: row.frequencyType,
      weeklyDays: row.weeklyDays,
      habitType: row.habitType,
      targetTime: row.targetTime,
      isArchived: row.isArchived,
    );
  }

  DateTime _normalizeDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
