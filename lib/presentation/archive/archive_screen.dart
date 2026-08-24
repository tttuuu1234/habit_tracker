import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/app_route.dart';
import 'notifiers/archive_notifier.dart';
import 'notifiers/archive_state.dart';

class ArchiveScreen extends ConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(archiveProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('アーカイブ')),
      body: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('エラー: $error')),
        data: (habits) {
          if (habits.isEmpty) {
            return const Center(
              child: Text('アーカイブされた習慣はありません'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: habits.length,
            itemBuilder: (context, index) {
              final habit = habits[index];
              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : 8,
                  bottom: index == habits.length - 1 ? 16 : 0,
                ),
                child: _ArchivedHabitTile(
                  habit: habit,
                  onTap: () async {
                    await context.push(AppRoute.detail.withId(habit.id));
                    if (!context.mounted) return;
                    ref.invalidate(archiveProvider);
                  },
                  onUnarchive: () => _confirmUnarchive(context, ref, habit),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _confirmUnarchive(
    BuildContext context,
    WidgetRef ref,
    ArchivedHabit habit,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('アーカイブ解除の確認'),
        content: Text('「${habit.name}」のアーカイブを解除しますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('解除'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    ref.read(archiveProvider.notifier).unarchive(habit.id);
  }
}

class _ArchivedHabitTile extends StatelessWidget {
  const _ArchivedHabitTile({
    required this.habit,
    required this.onTap,
    required this.onUnarchive,
  });

  final ArchivedHabit habit;
  final VoidCallback onTap;
  final VoidCallback onUnarchive;

  @override
  Widget build(BuildContext context) {
    final habitColor =
        habit.colorValue != null ? Color(habit.colorValue!) : Colors.grey;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: habitColor, width: 2),
                  ),
                  child: Icon(
                    Icons.archive_outlined,
                    size: 16,
                    color: habitColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    habit.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.unarchive_outlined),
                  onPressed: onUnarchive,
                  tooltip: 'アーカイブ解除',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
