import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/detault_layout.dart';
import 'package:go_router/go_router.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetaultLayout(
      title: '게시판',
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('로그인 화면으로 이동'),
        ),
      ),
    );
  }
}
