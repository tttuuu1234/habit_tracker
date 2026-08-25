import 'package:flutter/material.dart';

import '../../../domain/habit/habit_category.dart';

/// カテゴリ選択パレット。
class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  /// 選択中のカテゴリ。
  final HabitCategory? selectedCategory;

  /// カテゴリが選択されたときのコールバック。
  final ValueChanged<HabitCategory?> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildItem(context, null, '未分類', Colors.grey),
        ...HabitCategory.values.map(
          (category) => _buildItem(
            context,
            category,
            category.label,
            Color(category.colorValue),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(
    BuildContext context,
    HabitCategory? category,
    String label,
    Color color,
  ) {
    final isSelected = selectedCategory == category;

    return GestureDetector(
      onTap: () => onCategorySelected(category),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 14,
              height: 14,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isSelected ? color : null,
                fontWeight: isSelected ? FontWeight.w600 : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
