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
      path: '/detail/:habitIndex',
      builder: (context, state) {
        final habitIndex = int.parse(state.pathParameters['habitIndex']!);
        return HabitDetailScreen(habitIndex: habitIndex);
      },
    ),
    GoRoute(
      path: '/create',
      builder: (context, state) => const HabitFormScreen(),
    ),
    GoRoute(
      path: '/edit/:habitIndex',
      builder: (context, state) {
        final habitIndex = int.parse(state.pathParameters['habitIndex']!);
        return HabitFormScreen(editingHabitIndex: habitIndex);
      },
    ),
  ],
);
