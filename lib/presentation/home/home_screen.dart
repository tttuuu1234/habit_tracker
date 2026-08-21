import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/date_time_extension.dart';
import '../../domain/habit/habit_type.dart';
import '../router/app_route.dart';
import 'notifiers/habit_summary.dart';
import 'notifiers/home_notifier.dart';
import 'widgets/habit_list_tile.dart';
import 'widgets/progress_ring.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _removeController;
  late final Animation<double> _removeOpacity;
  late final Animation<double> _removeSizeFactor;

  /// 削除アニメーション中の習慣ID。
  int? _deletingHabitId;

  @override
  void initState() {
    super.initState();
    _removeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _removeOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _removeController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _removeSizeFactor = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _removeController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );
    _removeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _deletingHabitId = null;
        _removeController.reset();
        ref.invalidate(homeProvider);
      }
    });
  }

  @override
  void dispose() {
    _removeController.dispose();
    super.dispose();
  }

  void _startDeleteAnimation(int habitId) {
    setState(() {
      _deletingHabitId = habitId;
    });
    _removeController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(homeProvider);
    final dateText = DateTime.now().toDisplayDate();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await context.push(AppRoute.create.path);
              if (!mounted) return;
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
                      : _HabitListView(
                          habits: habits,
                          deletingHabitId: _deletingHabitId,
                          removeSizeFactor: _removeSizeFactor,
                          removeOpacity: _removeOpacity,
                          onTap: _onHabitTap,
                          onLongPress: (habit) => _onHabitLongPress(habit),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _onHabitTap(int habitId) async {
    final deletedId = await context.push<int?>(
      AppRoute.detail.withId(habitId),
    );
    if (!mounted) return;
    if (deletedId != null) {
      _startDeleteAnimation(deletedId);
      return;
    }
    ref.invalidate(homeProvider);
  }

  Future<void> _onHabitLongPress(HabitSummary habit) async {
    if (habit.isCompleted) return;

    if (habit.habitType == HabitType.time) {
      await context.push(AppRoute.timer.withId(habit.id));
      if (!mounted) return;
      ref.invalidate(homeProvider);
      return;
    }

    final confirmed = await showDialog<bool>(
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
    );
    if (confirmed == true) {
      ref.read(homeProvider.notifier).toggleCompletion(habit.id);
    }
  }
}

class _HabitListView extends StatelessWidget {
  const _HabitListView({
    required this.habits,
    required this.deletingHabitId,
    required this.removeSizeFactor,
    required this.removeOpacity,
    required this.onTap,
    required this.onLongPress,
  });

  final List<HabitSummary> habits;
  final int? deletingHabitId;
  final Animation<double> removeSizeFactor;
  final Animation<double> removeOpacity;
  final void Function(int habitId) onTap;
  final void Function(HabitSummary habit) onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        final isDeleting = habit.id == deletingHabitId;
        final color =
            habit.colorValue != null ? Color(habit.colorValue!) : null;

        final tile = Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 0 : 8,
            bottom: index == habits.length - 1 ? 16 : 0,
          ),
          child: HabitListTile(
            name: habit.name,
            streakDays: habit.streakDays,
            isCompleted: habit.isCompleted,
            color: color,
            onTap: isDeleting ? null : () => onTap(habit.id),
            onLongPress: isDeleting
                ? null
                : () => onLongPress(habit),
          ),
        );

        if (isDeleting) {
          return SizeTransition(
            sizeFactor: removeSizeFactor,
            child: FadeTransition(
              opacity: removeOpacity,
              child: tile,
            ),
          );
        }

        return tile;
      },
    );
  }
}
