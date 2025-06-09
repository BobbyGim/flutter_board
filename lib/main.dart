import 'package:flutter/material.dart';
import 'package:flutter_board/_common/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(fontFamily: 'Pretendard'),
      ),
    ),
  );
}
