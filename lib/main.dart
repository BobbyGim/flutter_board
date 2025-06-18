import 'package:flutter/material.dart';
import 'package:flutter_board/_common/router/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  runApp(
    ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          fontFamily: 'Pretendard',
          useMaterial3: false,
        ),
      ),
    ),
  );
}
