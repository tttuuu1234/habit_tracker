import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyCalendar extends StatelessWidget {
  const MonthlyCalendar({
    super.key,
    required this.displayMonth,
    required this.completedDates,
    required this.habitCreatedDate,
    required this.canGoBack,
    required this.canGoForward,
    required this.onPreviousMonth,
    required this.onNextMonth,
  });

  final DateTime displayMonth;
  final Set<DateTime> completedDates;
  final DateTime habitCreatedDate;
  final bool canGoBack;
  final bool canGoForward;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMonthNavigation(context),
        const SizedBox(height: 12),
        _buildWeekdayHeaders(context),
        const SizedBox(height: 8),
        _buildCalendarGrid(context),
      ],
    );
  }

  Widget _buildMonthNavigation(BuildContext context) {
    final monthText = DateFormat('yyyy年M月', 'ja').format(displayMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: canGoBack ? onPreviousMonth : null,
          icon: const Icon(Icons.chevron_left),
        ),
        Text(
          monthText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        IconButton(
          onPressed: canGoForward ? onNextMonth : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _buildWeekdayHeaders(BuildContext context) {
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];

    return Row(
      children: weekdays
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    final cells = _buildCalendarCells();
    final rows = <Widget>[];

    for (var i = 0; i < cells.length; i += 7) {
      final end = i + 7 > cells.length ? cells.length : i + 7;
      final rowCells = cells.sublist(i, end);

      // 末尾の行が7セル未満なら空セルで埋める
      while (rowCells.length < 7) {
        rowCells.add(const Expanded(child: SizedBox(height: 40)));
      }

      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(children: rowCells),
        ),
      );
    }

    return Column(children: rows);
  }

  List<Widget> _buildCalendarCells() {
    final year = displayMonth.year;
    final month = displayMonth.month;
    final firstDayOfMonth = DateTime(year, month, 1);
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final normalizedCreatedDate = DateTime(
      habitCreatedDate.year,
      habitCreatedDate.month,
      habitCreatedDate.day,
    );

    // 月曜始まり: DateTime.monday == 1
    final leadingEmptyCells = firstDayOfMonth.weekday - 1;

    final cells = <Widget>[];

    // 先頭の空セル
    for (var i = 0; i < leadingEmptyCells; i++) {
      cells.add(const Expanded(child: SizedBox(height: 40)));
    }

    // 各日のセル
    for (var day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(year, month, day);

      // 習慣登録日より前: 空白セル
      if (date.isBefore(normalizedCreatedDate)) {
        cells.add(const Expanded(child: SizedBox(height: 40)));
        continue;
      }

      // 未来の日: 破線の枠のみ
      if (date.isAfter(normalizedToday)) {
        cells.add(
          Expanded(child: _CalendarCell(day: day, type: _CellType.future)),
        );
        continue;
      }

      // 達成済みの日: 緑で塗りつぶし
      if (completedDates.contains(date)) {
        cells.add(
          Expanded(child: _CalendarCell(day: day, type: _CellType.completed)),
        );
        continue;
      }

      // 未達成の日（過去・今日）: グレーで塗りつぶし
      cells.add(
        Expanded(child: _CalendarCell(day: day, type: _CellType.missed)),
      );
    }

    return cells;
  }
}

enum _CellType {
  completed,
  missed,
  future,
}

class _CalendarCell extends StatelessWidget {
  const _CalendarCell({
    required this.day,
    required this.type,
  });

  final int day;
  final _CellType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Container(
          width: 32,
          height: 32,
          decoration: _buildDecoration(),
          child: Center(
            child: Text(
              '$day',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: _textColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    switch (type) {
      case _CellType.completed:
        return BoxDecoration(
          color: Colors.green.shade600,
          shape: BoxShape.circle,
        );
      case _CellType.missed:
        return BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        );
      case _CellType.future:
        return BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade400,
            style: BorderStyle.solid,
            width: 1,
          ),
        );
    }
  }

  Color get _textColor {
    switch (type) {
      case _CellType.completed:
        return Colors.white;
      case _CellType.missed:
        return Colors.grey.shade700;
      case _CellType.future:
        return Colors.grey.shade500;
    }
  }
}
