import 'package:flutter/material.dart';

import '../../core/extensions/date_time_extension.dart';
import 'widgets/habit_list_tile.dart';
import 'widgets/progress_ring.dart';

class _MockHabit {
  const _MockHabit({
    required this.name,
    required this.streakDays,
    required this.isCompleted,
    this.color,
  });

  final String name;
  final int streakDays;
  final bool isCompleted;
  final Color? color;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<_MockHabit> _habits = [
    _MockHabit(
      name: '水を2L飲む',
      streakDays: 12,
      isCompleted: true,
      color: Colors.green.shade700,
    ),
    _MockHabit(
      name: '30分読書',
      streakDays: 7,
      isCompleted: true,
      color: Colors.blue.shade600,
    ),
    _MockHabit(
      name: '日記を書く',
      streakDays: 21,
      isCompleted: true,
      color: Colors.red.shade700,
    ),
    const _MockHabit(name: 'ストレッチ', streakDays: 3, isCompleted: false),
    const _MockHabit(name: '腹筋10回', streakDays: 0, isCompleted: false),
  ];

  int get _completedCount => _habits.where((h) => h.isCompleted).length;

  void _onHabitTap(int index) {
    // TODO: 詳細画面への遷移（別issueで実装）
    debugPrint('Tapped: ${_habits[index].name}');
  }

  void _onHabitLongPress(int index) {
    final habit = _habits[index];
    if (habit.isCompleted) return;

    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('達成確認'),
        content: Text('「${habit.name}」を達成済みにしますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('達成'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) {
        setState(() {
          _habits[index] = _MockHabit(
            name: habit.name,
            streakDays: habit.streakDays + 1,
            isCompleted: true,
            color: Colors.green.shade700,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateText = DateTime.now().toDisplayDate();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateText,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'お疲れさまです',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ProgressRing(
                completed: _completedCount,
                total: _habits.length,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _habits.length,
                itemBuilder: (context, index) {
                  final habit = _habits[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 0 : 8,
                      bottom: index == _habits.length - 1 ? 16 : 0,
                    ),
                    child: HabitListTile(
                      name: habit.name,
                      streakDays: habit.streakDays,
                      isCompleted: habit.isCompleted,
                      color: habit.color,
                      onTap: () => _onHabitTap(index),
                      onLongPress: () => _onHabitLongPress(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
