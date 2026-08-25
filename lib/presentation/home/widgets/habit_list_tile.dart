import 'package:flutter/material.dart';

import '../notifiers/habit_summary.dart';

class HabitListTile extends StatelessWidget {
  const HabitListTile({
    super.key,
    required this.habit,
    this.subtitle,
    this.onTap,
    this.onLongPress,
  });

  /// 表示する習慣サマリー。
  final HabitSummary habit;

  /// 習慣名の下に表示するサブタイトル（タイマー残り時間など）。
  final Widget? subtitle;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final habitColor = habit.category != null
        ? Color(habit.category!.colorValue)
        : Colors.grey;

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
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                _buildCheckIcon(habitColor),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        habit.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        subtitle!,
                      ] else if (habit is TimeHabitSummary) ...[
                        const SizedBox(height: 2),
                        _buildTargetTimeLabel(
                          context,
                          (habit as TimeHabitSummary).targetTime,
                        ),
                      ],
                    ],
                  ),
                ),
                _buildStreakBadge(context, habitColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckIcon(Color habitColor) {
    if (habit.isCompleted) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(color: habitColor, shape: BoxShape.circle),
        child: const Icon(Icons.check, color: Colors.white, size: 20),
      );
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 2),
      ),
    );
  }

  Widget _buildTargetTimeLabel(BuildContext context, int targetTime) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_outlined, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(
          '$targetTime分',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildStreakBadge(BuildContext context, Color habitColor) {
    final text = '${habit.streakDays}日';

    if (habit.isCompleted) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: habitColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: habitColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: Colors.grey),
    );
  }
}
