import 'package:flutter/material.dart';

class MockHabit {
  const MockHabit({
    required this.name,
    required this.streakDays,
    required this.isCompleted,
    required this.createdDate,
    this.color,
  });

  final String name;
  final int streakDays;
  final bool isCompleted;
  final DateTime createdDate;
  final Color? color;
}

final List<MockHabit> mockHabits = [
  MockHabit(
    name: '水を2L飲む',
    streakDays: 12,
    isCompleted: true,
    createdDate: DateTime(2025, 7, 1),
    color: Colors.green.shade700,
  ),
  MockHabit(
    name: '30分読書',
    streakDays: 7,
    isCompleted: true,
    createdDate: DateTime(2025, 7, 15),
    color: Colors.blue.shade600,
  ),
  MockHabit(
    name: '日記を書く',
    streakDays: 21,
    isCompleted: true,
    createdDate: DateTime(2025, 6, 1),
    color: Colors.red.shade700,
  ),
  MockHabit(
    name: 'ストレッチ',
    streakDays: 3,
    isCompleted: false,
    createdDate: DateTime(2025, 8, 1),
  ),
  MockHabit(
    name: '腹筋10回',
    streakDays: 0,
    isCompleted: false,
    createdDate: DateTime(2025, 8, 10),
  ),
];

/// 各習慣の達成記録（達成した日付のセット）
final Map<int, Set<DateTime>> mockCompletionRecords = {
  0: _generateCompletionDates(
    createdDate: DateTime(2025, 7, 1),
    streakDays: 12,
    scatteredDates: [
      DateTime(2025, 7, 3),
      DateTime(2025, 7, 5),
      DateTime(2025, 7, 8),
      DateTime(2025, 7, 10),
      DateTime(2025, 7, 14),
      DateTime(2025, 7, 15),
      DateTime(2025, 7, 16),
      DateTime(2025, 7, 17),
      DateTime(2025, 7, 18),
      DateTime(2025, 7, 22),
      DateTime(2025, 7, 25),
      DateTime(2025, 7, 28),
      DateTime(2025, 7, 30),
    ],
  ),
  1: _generateCompletionDates(
    createdDate: DateTime(2025, 7, 15),
    streakDays: 7,
    scatteredDates: [
      DateTime(2025, 7, 16),
      DateTime(2025, 7, 18),
      DateTime(2025, 7, 20),
      DateTime(2025, 7, 23),
      DateTime(2025, 7, 27),
      DateTime(2025, 7, 30),
    ],
  ),
  2: _generateCompletionDates(
    createdDate: DateTime(2025, 6, 1),
    streakDays: 21,
    scatteredDates: [
      DateTime(2025, 6, 2),
      DateTime(2025, 6, 3),
      DateTime(2025, 6, 4),
      DateTime(2025, 6, 5),
      DateTime(2025, 6, 6),
      DateTime(2025, 6, 7),
      DateTime(2025, 6, 10),
      DateTime(2025, 6, 12),
      DateTime(2025, 6, 15),
      DateTime(2025, 6, 18),
      DateTime(2025, 6, 20),
      DateTime(2025, 6, 22),
      DateTime(2025, 6, 25),
      DateTime(2025, 6, 28),
      DateTime(2025, 7, 1),
      DateTime(2025, 7, 3),
      DateTime(2025, 7, 5),
      DateTime(2025, 7, 8),
      DateTime(2025, 7, 12),
      DateTime(2025, 7, 15),
      DateTime(2025, 7, 20),
      DateTime(2025, 7, 25),
    ],
  ),
  3: _generateCompletionDates(
    createdDate: DateTime(2025, 8, 1),
    streakDays: 3,
    scatteredDates: [
      DateTime(2025, 8, 2),
      DateTime(2025, 8, 5),
    ],
  ),
  4: <DateTime>{},
};

Set<DateTime> _generateCompletionDates({
  required DateTime createdDate,
  required int streakDays,
  required List<DateTime> scatteredDates,
}) {
  final dates = <DateTime>{};

  // 散在する達成日を追加
  for (final date in scatteredDates) {
    dates.add(DateTime(date.year, date.month, date.day));
  }

  // 直近の連続達成日を追加
  final today = DateTime.now();
  for (var i = 0; i < streakDays; i++) {
    final date = today.subtract(Duration(days: i));
    dates.add(DateTime(date.year, date.month, date.day));
  }

  return dates;
}
