import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'notifiers/timer_notifier.dart';
import 'notifiers/timer_state.dart';

class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({super.key, required this.habitId});

  final int habitId;

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(
      onStateChange: _onStateChange,
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  void _onStateChange(AppLifecycleState state) {
    final notifier = ref.read(habitTimerProvider(widget.habitId).notifier);
    switch (state) {
      case AppLifecycleState.hidden || AppLifecycleState.paused:
        notifier.onBackground();
      case AppLifecycleState.resumed:
        notifier.onForeground();
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(habitTimerProvider(widget.habitId));

    return Scaffold(
      appBar: AppBar(title: const Text('タイマー')),
      body: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('エラー: $error')),
        data: (state) => _TimerBody(
          state: state,
          onStart: () =>
              ref.read(habitTimerProvider(widget.habitId).notifier).start(),
          onPause: () =>
              ref.read(habitTimerProvider(widget.habitId).notifier).pause(),
          onFinish: () {
            ref.invalidate(habitTimerProvider(widget.habitId));
            context.pop();
          },
        ),
      ),
    );
  }
}

class _TimerBody extends StatelessWidget {
  const _TimerBody({
    required this.state,
    required this.onStart,
    required this.onPause,
    required this.onFinish,
  });

  final TimerState state;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.habitName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _buildProgressRing(context),
              const SizedBox(height: 48),
              _buildControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressRing(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 240,
            height: 240,
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: state.progress),
              duration: const Duration(milliseconds: 900),
              builder: (context, animatedProgress, child) {
                return CircularProgressIndicator(
                  value: animatedProgress,
                  strokeWidth: 12,
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  color: state.isCompleted ? Colors.green : colorScheme.primary,
                  strokeCap: StrokeCap.round,
                );
              },
            ),
          ),
          if (state.isCompleted)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, size: 48, color: Colors.green),
                const SizedBox(height: 8),
                Text(
                  '達成！',
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          else
            Text(
              state.displayTime,
              style: theme.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w300,
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildControls() {
    if (state.isCompleted) {
      return FilledButton.icon(
        onPressed: onFinish,
        icon: const Icon(Icons.home),
        label: const Text('ホームに戻る'),
      );
    }

    if (state.isRunning) {
      return FilledButton.tonalIcon(
        onPressed: onPause,
        icon: const Icon(Icons.pause),
        label: const Text('一時停止'),
      );
    }

    return FilledButton.icon(
      onPressed: onStart,
      icon: const Icon(Icons.play_arrow),
      label: Text(state.remainingSeconds < state.targetSeconds ? '再開' : '開始'),
    );
  }
}
