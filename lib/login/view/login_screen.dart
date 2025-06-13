// login_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 로그인 성공 후 이전 화면으로 복귀
            context.pop(); // 또는 context.go('/') 로 강제 이동
          },
          child: const Text('로그인'),
        ),
      ),
    );
  }
}
