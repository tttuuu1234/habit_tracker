import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../archive/archive_screen.dart';
import '../detail/habit_detail_screen.dart';
import '../graph/graph_screen.dart';
import '../habit_form/habit_form_screen.dart';
import '../home/home_screen.dart';
import '../shell/app_shell.dart';
import '../timer/timer_screen.dart';
import 'app_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.home.path,
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.graph.path,
              builder: (context, state) => const GraphScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '${AppRoute.detail.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitDetailScreen(habitId: habitId);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.create.path,
      builder: (context, state) => const HabitFormScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '${AppRoute.edit.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return HabitFormScreen(editingHabitId: habitId);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '${AppRoute.timer.path}/:habitId',
      builder: (context, state) {
        final habitId = int.parse(state.pathParameters['habitId']!);
        return TimerScreen(habitId: habitId);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoute.archive.path,
      builder: (context, state) => const ArchiveScreen(),
    ),
  ],
);
