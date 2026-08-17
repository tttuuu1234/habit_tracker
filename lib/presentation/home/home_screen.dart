import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/date_time_extension.dart';
import '../mock_data.dart';
import 'widgets/habit_list_tile.dart';
import 'widgets/progress_ring.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final List<MockHabit> _habits = List.of(mockHabits);

  int get _completedCount => _habits.where((h) => h.isCompleted).length;

  void _onHabitTap(int index) {
    context.push('/detail/$index');
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
          _habits[index] = MockHabit(
            name: habit.name,
            streakDays: habit.streakDays + 1,
            isCompleted: true,
            createdDate: habit.createdDate,
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
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => context.push('/create'),
          ),
        ],
      ),
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
