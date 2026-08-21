import 'package:flutter/material.dart';

class HabitListTile extends StatelessWidget {
  const HabitListTile({
    super.key,
    required this.name,
    required this.streakDays,
    required this.isCompleted,
    this.color,
    this.subtitle,
    this.onTap,
    this.onLongPress,
  });

  final String name;
  final int streakDays;
  final bool isCompleted;
  final Color? color;

  /// 習慣名の下に表示するサブタイトル。
  final Widget? subtitle;

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final habitColor = color ?? Colors.grey;

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
                        name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        subtitle!,
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
    if (isCompleted) {
      return Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: habitColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 20,
        ),
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

  Widget _buildStreakBadge(BuildContext context, Color habitColor) {
    final text = '$streakDays日';

    if (isCompleted) {
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
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
    );
  }
}
