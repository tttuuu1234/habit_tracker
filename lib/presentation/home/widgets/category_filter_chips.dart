import 'package:flutter/material.dart';

import '../../../domain/habit/habit_category.dart';

/// カテゴリフィルター用の横スクロールチップ。
class CategoryFilterChips extends StatelessWidget {
  const CategoryFilterChips({
    super.key,
    required this.usedCategories,
    required this.isAllSelected,
    required this.selectedCategory,
    required this.onAllSelected,
    required this.onCategorySelected,
  });

  /// 習慣で使われているカテゴリの集合。
  final Set<HabitCategory?> usedCategories;

  /// 「すべて」が選択中かどうか。
  final bool isAllSelected;

  /// 選択中のカテゴリ。
  final HabitCategory? selectedCategory;

  /// 「すべて」が選択されたときのコールバック。
  final VoidCallback onAllSelected;

  /// カテゴリが選択されたときのコールバック。
  final ValueChanged<HabitCategory?> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildChip(
            context,
            label: 'すべて',
            isSelected: isAllSelected,
            onTap: onAllSelected,
          ),
          const SizedBox(width: 8),
          ...HabitCategory.values
              .where((c) => usedCategories.contains(c))
              .map(
                (category) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _buildChip(
                    context,
                    label: category.label,
                    color: Color(category.colorValue),
                    isSelected: !isAllSelected &&
                        selectedCategory == category,
                    onTap: () => onCategorySelected(category),
                  ),
                ),
              ),
          if (usedCategories.contains(null))
            _buildChip(
              context,
              label: '未分類',
              isSelected: !isAllSelected && selectedCategory == null,
              onTap: () => onCategorySelected(null),
            ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    Color? color,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? theme.colorScheme.primary)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? (color ?? theme.colorScheme.primary)
                : theme.colorScheme.outline,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w600 : null,
          ),
        ),
      ),
    );
  }
}
