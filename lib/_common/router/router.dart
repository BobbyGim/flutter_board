import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/default_shell_layout.dart';
import 'package:flutter_board/board/view/board_screen.dart';
import 'package:flutter_board/home/view/home_screen.dart';
import 'package:flutter_board/login/view/login_screen.dart';
import 'package:flutter_board/profile/view/profile_screen.dart';
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
        GoRoute(path: '/', builder: (context, state) => HomeScreen()),

        GoRoute(path: '/board', builder: (context, state) => BoardScreen()),

        GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      ],
    ),

    GoRoute(
      path: '/login',
      name: "login",
      parentNavigatorKey: _rootNavigatorKey, // 중요한 부분
      builder: (context, state) {
        // final id = state.params['id']!;
        return LoginScreen();
      },
    ),
  ],
);
