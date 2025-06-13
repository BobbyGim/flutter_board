// default_shell_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/provider/default_shell_layout_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DefaultShellLayout extends ConsumerWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;

  const DefaultShellLayout({super.key, required this.child, this.appBar});

  static const List<String> _routes = ['/', '/board', '/profile'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      appBar: appBar,
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        selectedFontSize: 12,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
        onTap: (index) {
          if (index != currentIndex) {
            ref.read(bottomNavIndexProvider.notifier).state = index;
            context.push(_routes[index]);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: '게시판'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
    );
  }
}
