import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/detault_layout.dart';
import 'package:flutter_board/_common/utils/size_utils.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DetaultLayout(
      title: '홈',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              SizedBox(
                width: SizeUtils.fullWidth(context) / 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Text(
                          '홈 화면',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: SizeUtils.fullWidth(context) / 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Text(
                            '홈 화면',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '홈 화면',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {
              context.push('/weekly');
            },
            child: const Text('Todo 화면으로 이동'),
          ),
        ],
      ),
    );
  }
}
