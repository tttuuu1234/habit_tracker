import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/graph_notifier.dart';
import 'notifiers/graph_state.dart';

/// カテゴリ別円グラフ画面。
class GraphScreen extends ConsumerWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(graphProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('カテゴリ別グラフ')),
      body: _buildBody(asyncState),
    );
  }

  Widget _buildBody(AsyncValue<GraphState> asyncState) {
    // 初回ロード中
    if (asyncState is AsyncLoading && !asyncState.hasValue) {
      return const Center(child: CircularProgressIndicator());
    }

    // エラー（前回データなし）
    if (asyncState is AsyncError && !asyncState.hasValue) {
      return Center(child: Text('エラー: ${asyncState.error}'));
    }

    final state = asyncState.requireValue;

    if (state.habitCountData.isEmpty && state.achievementCountData.isEmpty) {
      return const Center(child: Text('表示するデータがありません'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (state.habitCountData.isNotEmpty) ...[
            _ChartSection(title: '習慣数の割合', data: state.habitCountData),
            const SizedBox(height: 32),
          ],
          if (state.achievementCountData.isNotEmpty)
            _ChartSection(
              title: '達成回数の割合',
              data: state.achievementCountData,
            ),
        ],
      ),
    );
  }
}

class _ChartSection extends StatelessWidget {
  const _ChartSection({required this.title, required this.data});

  final String title;
  final List<CategoryChartData> data;

  @override
  Widget build(BuildContext context) {
    final total = data.fold<int>(0, (sum, d) => sum + d.count);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: PieChart(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            PieChartData(
              sections: data.map((d) {
                final percentage = total > 0
                    ? (d.count / total * 100).round()
                    : 0;
                return PieChartSectionData(
                  value: d.count.toDouble(),
                  color: Color(d.colorValue),
                  title: '$percentage%',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  radius: 80,
                );
              }).toList(),
              sectionsSpace: 2,
              centerSpaceRadius: 20,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _Legend(data: data),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.data});

  final List<CategoryChartData> data;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: data.map((d) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Color(d.colorValue),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${d.label}（${d.count}）',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      }).toList(),
    );
  }
}
