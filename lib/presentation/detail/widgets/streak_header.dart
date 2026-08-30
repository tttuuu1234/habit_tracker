import 'package:flutter/material.dart';

class StreakHeader extends StatelessWidget {
  const StreakHeader({
    super.key,
    required this.streakDays,
  });

  final int streakDays;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          '$streakDays',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
        ),
        Text(
          '日連続達成中',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
