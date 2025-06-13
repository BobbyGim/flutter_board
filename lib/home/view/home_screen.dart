import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/detault_layout.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetaultLayout(
      title: '홈',
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('안녕 화면으로 이동'),
        ),
      ),
    );
  }
}
