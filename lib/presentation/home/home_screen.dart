import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/date_time_extension.dart';
import 'notifiers/home_notifier.dart';
import 'widgets/habit_list_tile.dart';
import 'widgets/progress_ring.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeProvider);
    final dateText = DateTime.now().toDisplayDate();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await context.push('/create');
              ref.invalidate(homeProvider);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: asyncState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('エラー: $error')),
          data: (state) {
            final habits = state.habits;
            final completedCount =
                habits.where((h) => h.isCompleted).length;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateText,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'お疲れさまです',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ProgressRing(
                    completed: completedCount,
                    total: habits.length,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: habits.isEmpty
                      ? const Center(
                          child: Text('習慣がまだありません\n右上の＋ボタンから追加しましょう',
                              textAlign: TextAlign.center),
                        )
                      : ListView.builder(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: habits.length,
                          itemBuilder: (context, index) {
                            final habit = habits[index];
                            final color = habit.colorValue != null
                                ? Color(habit.colorValue!)
                                : null;
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 0 : 8,
                                bottom:
                                    index == habits.length - 1 ? 16 : 0,
                              ),
                              child: HabitListTile(
                                name: habit.name,
                                streakDays: habit.streakDays,
                                isCompleted: habit.isCompleted,
                                color: color,
                                onTap: () async {
                                  await context
                                      .push('/detail/${habit.id}');
                                  ref.invalidate(homeProvider);
                                },
                                onLongPress: () =>
                                    _onHabitLongPress(
                                      context,
                                      ref,
                                      habit.id,
                                      habit.name,
                                      habit.isCompleted,
                                    ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onHabitLongPress(
    BuildContext context,
    WidgetRef ref,
    int habitId,
    String habitName,
    bool isCompleted,
  ) {
    if (isCompleted) return;

    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('達成確認'),
        content: Text('「$habitName」を達成済みにしますか？'),
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
        ref.read(homeProvider.notifier).toggleCompletion(habitId);
      }
    });
  }
}
