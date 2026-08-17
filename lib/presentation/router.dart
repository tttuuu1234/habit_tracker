import 'package:go_router/go_router.dart';

import 'detail/habit_detail_screen.dart';
import 'habit_form/habit_form_screen.dart';
import 'home/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detail/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitDetailScreen(habitId: habitId);
      },
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const HabitFormScreen(),
    ),
    GoRoute(
      path: '/edit/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitFormScreen(editingHabitId: habitId);
      },
    ),
  ],
);
