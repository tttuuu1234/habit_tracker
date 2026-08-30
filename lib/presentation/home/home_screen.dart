import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/extensions/date_time_extension.dart';
import '../../domain/habit/habit_category.dart';
import '../router/app_route.dart';
import '../timer/notifiers/timer_notifier.dart';
import 'notifiers/habit_summary.dart';
import 'notifiers/home_notifier.dart';
import 'widgets/category_filter_chips.dart';
import 'widgets/habit_list_tile.dart';
import 'widgets/progress_ring.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late final AnimationController _removeController;
  late final Animation<double> _removeOpacity;
  late final Animation<double> _removeSizeFactor;

  late final AnimationController _completeController;
  late final Animation<double> _completeOpacity;
  late final Animation<double> _completeSizeFactor;

  late final AnimationController _appearController;
  late final Animation<double> _appearOpacity;
  late final Animation<double> _appearSizeFactor;

  /// 削除アニメーション中の習慣ID。
  int? _deletingHabitId;

  /// 達成アニメーション中の習慣ID。
  int? _completingHabitId;

  /// タイマー経由の達成アニメーションかどうか。
  bool _isTimerCompletion = false;

  /// 達成直後で出現アニメーション対象の習慣ID。
  int? _justCompletedHabitId;

  /// 選択中のカテゴリフィルター（nullですべて）。
  /// _isCategoryFilterAll が true の場合は「すべて」を意味する。
  HabitCategory? _filterCategory;
  bool _isFilterAll = true;

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

    _completeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _completeOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _completeController, curve: Curves.easeOut),
    );
    _completeSizeFactor = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _completeController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );
    _completeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        final habitId = _completingHabitId;
        final isTimer = _isTimerCompletion;
        _completingHabitId = null;
        _isTimerCompletion = false;
        _completeController.reset();
        if (habitId != null) {
          _appearController.value = 0;
          setState(() {
            _justCompletedHabitId = habitId;
          });
          if (isTimer) {
            // タイマー完了時はDBに既に記録済みなのでリロードのみ
            ref.invalidate(homeProvider);
          } else {
            ref.read(homeProvider.notifier).toggleCompletion(habitId);
          }
        }
      }
    });

    _appearController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _appearOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _appearController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
      ),
    );
    _appearSizeFactor = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _appearController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    _appearController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _justCompletedHabitId = null;
        });
      }
    });
  }

  @override
  void dispose() {
    _removeController.dispose();
    _completeController.dispose();
    _appearController.dispose();
    super.dispose();
  }

  void _startDeleteAnimation(int habitId) {
    setState(() {
      _deletingHabitId = habitId;
    });
    _removeController.forward(from: 0);
  }

  void _startCompleteAnimation(int habitId) {
    setState(() {
      _completingHabitId = habitId;
      _isTimerCompletion = false;
    });
    _completeController.forward(from: 0);
  }

  void _startTimerCompleteAnimation(int habitId) {
    setState(() {
      _completingHabitId = habitId;
      _isTimerCompletion = true;
    });
    _completeController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final asyncState = ref.watch(homeProvider);
    final dateText = DateTime.now().toDisplayDate();

    // 達成後のリビルドで出現アニメーションを開始する
    if (_justCompletedHabitId != null) {
      final habits = asyncState.valueOrNull?.habits ?? [];
      final isInCompleted = habits.any(
        (h) => h.id == _justCompletedHabitId && h.isCompleted,
      );
      if (isInCompleted && !_appearController.isAnimating) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _appearController.forward(from: 0);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.archive_outlined),
            onPressed: () async {
              await context.push(AppRoute.archive.path);
              if (!mounted) return;
              ref.invalidate(homeProvider);
            },
          ),
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
            final allHabits = state.habits;

            // 使われているカテゴリを収集する
            final usedCategories = <HabitCategory?>{};
            for (final h in allHabits) {
              usedCategories.add(h.category);
            }

            // フィルタリング
            final habits = _isFilterAll
                ? allHabits
                : allHabits
                      .where((h) => h.category == _filterCategory)
                      .toList();

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
                            ?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
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
                if (usedCategories.length > 1 ||
                    (usedCategories.length == 1 &&
                        !usedCategories.contains(null))) ...[
                  const SizedBox(height: 16),
                  CategoryFilterChips(
                    usedCategories: usedCategories,
                    isAllSelected: _isFilterAll,
                    selectedCategory: _filterCategory,
                    onAllSelected: () {
                      setState(() {
                        _isFilterAll = true;
                        _filterCategory = null;
                      });
                    },
                    onCategorySelected: (category) {
                      setState(() {
                        _isFilterAll = false;
                        _filterCategory = category;
                      });
                    },
                  ),
                ],
                const SizedBox(height: 16),
                Expanded(
                  child: habits.isEmpty
                      ? const Center(
                          child: Text('習慣がまだありません\n右上の＋ボタンから追加しましょう',
                              textAlign: TextAlign.center),
                        )
                      : _SectionedHabitList(
                          habits: habits,
                          isCompletedSectionCollapsed:
                              state.isCompletedSectionCollapsed,
                          deletingHabitId: _deletingHabitId,
                          removeSizeFactor: _removeSizeFactor,
                          removeOpacity: _removeOpacity,
                          completingHabitId: _completingHabitId,
                          completeSizeFactor: _completeSizeFactor,
                          completeOpacity: _completeOpacity,
                          justCompletedHabitId: _justCompletedHabitId,
                          appearSizeFactor: _appearSizeFactor,
                          appearOpacity: _appearOpacity,
                          onTap: _onHabitTap,
                          onLongPress: (habit) => _onHabitLongPress(habit),
                          onTimerCompleted: _startTimerCompleteAnimation,
                          onToggleCompletedSection: () => ref
                              .read(homeProvider.notifier)
                              .toggleCompletedSection(),
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

    if (habit is TimeHabitSummary) {
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
      _startCompleteAnimation(habit.id);
    }
  }
}

class _SectionedHabitList extends ConsumerWidget {
  const _SectionedHabitList({
    required this.habits,
    required this.isCompletedSectionCollapsed,
    required this.deletingHabitId,
    required this.removeSizeFactor,
    required this.removeOpacity,
    required this.completingHabitId,
    required this.completeSizeFactor,
    required this.completeOpacity,
    required this.justCompletedHabitId,
    required this.appearSizeFactor,
    required this.appearOpacity,
    required this.onTap,
    required this.onLongPress,
    required this.onTimerCompleted,
    required this.onToggleCompletedSection,
  });

  final List<HabitSummary> habits;
  final bool isCompletedSectionCollapsed;
  final int? deletingHabitId;
  final Animation<double> removeSizeFactor;
  final Animation<double> removeOpacity;
  final int? completingHabitId;
  final Animation<double> completeSizeFactor;
  final Animation<double> completeOpacity;
  final int? justCompletedHabitId;
  final Animation<double> appearSizeFactor;
  final Animation<double> appearOpacity;
  final void Function(int habitId) onTap;
  final void Function(HabitSummary habit) onLongPress;
  final void Function(int habitId) onTimerCompleted;
  final VoidCallback onToggleCompletedSection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // タイマー完了時にホーム画面の達成状態を更新する
    for (final habit in habits) {
      if (habit is! TimeHabitSummary || habit.isCompleted) continue;
      final provider = habitTimerProvider(habit.id);
      if (!ref.exists(provider)) continue;
      ref.listen(provider, (prev, next) {
        if (prev?.valueOrNull?.isCompleted != true &&
            next.valueOrNull?.isCompleted == true) {
          onTimerCompleted(habit.id);
        }
      });
    }

    final incompleteHabits =
        habits.where((h) => h.isCompleted == false).toList();
    final completedHabits =
        habits.where((h) => h.isCompleted == true).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        ...incompleteHabits.map((habit) {
          final isAnimating = habit.id == deletingHabitId ||
              habit.id == completingHabitId;

          final tile = Padding(
            padding: EdgeInsets.only(
              top: incompleteHabits.first == habit ? 0 : 8,
            ),
            child: HabitListTile(
              habit: habit,
              subtitle: _buildTimerSubtitle(context, ref, habit),
              onTap: isAnimating ? null : () => onTap(habit.id),
              onLongPress: isAnimating ? null : () => onLongPress(habit),
            ),
          );

          if (habit.id == deletingHabitId) {
            return SizeTransition(
              sizeFactor: removeSizeFactor,
              child: FadeTransition(opacity: removeOpacity, child: tile),
            );
          }

          if (habit.id == completingHabitId) {
            return SizeTransition(
              sizeFactor: completeSizeFactor,
              child: FadeTransition(opacity: completeOpacity, child: tile),
            );
          }

          return tile;
        }),
        if (completedHabits.isNotEmpty) ...[
          const SizedBox(height: 16),
          _CompletedSectionHeader(
            count: completedHabits.length,
            isCollapsed: isCompletedSectionCollapsed,
            onToggle: onToggleCompletedSection,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: isCompletedSectionCollapsed
                ? const SizedBox.shrink()
                : Column(
                    children: completedHabits.map((habit) {
                      final isDeleting = habit.id == deletingHabitId;
                      final isAppearing = habit.id == justCompletedHabitId;

                      final tile = Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: HabitListTile(
                          habit: habit,
                          onTap:
                              isDeleting ? null : () => onTap(habit.id),
                          onLongPress:
                              isDeleting ? null : () => onLongPress(habit),
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

                      if (isAppearing) {
                        return SizeTransition(
                          sizeFactor: appearSizeFactor,
                          child: FadeTransition(
                            opacity: appearOpacity,
                            child: tile,
                          ),
                        );
                      }

                      return tile;
                    }).toList(),
                  ),
          ),
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  /// 時間方式の習慣でタイマーが動作中の場合、残り時間のサブタイトルを返す。
  Widget? _buildTimerSubtitle(
    BuildContext context,
    WidgetRef ref,
    HabitSummary habit,
  ) {
    if (habit is! TimeHabitSummary) return null;
    if (habit.isCompleted) return null;

    final provider = habitTimerProvider(habit.id);
    if (!ref.exists(provider)) return null;

    final asyncState = ref.watch(provider);
    final timerState = asyncState.valueOrNull;
    if (timerState == null || timerState.isCompleted) return null;

    final colorScheme = Theme.of(context).colorScheme;

    if (timerState.isRunning) {
      return Text(
        '残り ${timerState.displayTime}',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      );
    }

    // 未開始（残り時間が目標時間と同じ）の場合は表示しない
    if (timerState.remainingSeconds >= timerState.targetSeconds) return null;

    // 一時停止中（開始済みだが実行中でない）
    return Text(
      '一時停止中 ${timerState.displayTime}',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
    );
  }
}

class _CompletedSectionHeader extends StatelessWidget {
  const _CompletedSectionHeader({
    required this.count,
    required this.isCollapsed,
    required this.onToggle,
  });

  final int count;
  final bool isCollapsed;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onToggle,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            AnimatedRotation(
              turns: isCollapsed ? -0.25 : 0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              '達成済み ($count)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
