import 'package:go_router/go_router.dart';

import '../detail/habit_detail_screen.dart';
import '../habit_form/habit_form_screen.dart';
import '../home/home_screen.dart';
import '../timer/timer_screen.dart';
import 'app_route.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '${AppRoute.detail.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitDetailScreen(habitId: habitId);
      },
    ),
    GoRoute(
      path: AppRoute.create.path,
      builder: (context, state) => const HabitFormScreen(),
    ),
    GoRoute(
      path: '${AppRoute.edit.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitFormScreen(editingHabitId: habitId);
      },
    ),
    GoRoute(
      path: '${AppRoute.timer.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return TimerScreen(habitId: habitId);
      },
    ),
  ],
);
