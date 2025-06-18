import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/default_shell_layout.dart';
import 'package:flutter_board/_common/router/fade_transition_router.dart';
import 'package:flutter_board/daily/view/daily_screen.dart';
import 'package:flutter_board/monthly/view/monthly_page.dart';
import 'package:flutter_board/weekly/view/weekly_page.dart';
import 'package:go_router/go_router.dart';

// navigator key 생성
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey, // 여기!
      builder: (context, state, child) {
        return DefaultShellLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder:
              (BuildContext context, GoRouterState state) =>
                  FadeTransitionRouter(
                    child: DailyScreen(),
                  ),
        ),

        GoRoute(
          path: '/weekly',
          pageBuilder:
              (BuildContext context, GoRouterState state) =>
                  FadeTransitionRouter(child: WeeklyPage()),
        ),

        GoRoute(
          path: '/monthly',
          pageBuilder:
              (BuildContext context, GoRouterState state) =>
                  FadeTransitionRouter(
                    child: MonthlyPage(),
                  ),
        ),
      ],
    ),
  ],
);
