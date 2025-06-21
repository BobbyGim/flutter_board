import 'package:flutter/material.dart';
import 'package:flutter_board/_common/layout/view/detault_layout.dart';
import 'package:flutter_board/_common/utils/size_utils.dart';
import 'package:flutter_board/home/components/input.dart';
import 'package:flutter_board/home/provider/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider);
    final notifier = ref.read(todoProvider.notifier);

    return DetaultLayout(
      title: '홈',

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: SizeUtils.fullWidth(context),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor:
                    Colors.transparent, // 필요 시 transparent
                builder: (BuildContext context) {
                  return Container(
                    height:
                        SizeUtils.fullHeight(context) *
                        0.6, // ★ 높이 제한
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors
                          .transparent, // 여기서 또 white 주면 중복되니 transparent
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              '오늘 할 일',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(
                                        8.0,
                                      ),
                                ),
                              ),
                              onSubmitted: (value) {},
                            ),
                          ],
                        ),
                      ),
                      bottomNavigationBar: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: SizeUtils.fullWidth(
                            context,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                      8.0,
                                    ),
                              ),
                            ),
                            onPressed: () =>
                                Navigator.pop(context),
                            child: const Text('닫기'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text(
              '오늘 할 일 ',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FieldEditor(
            label: '제목',
            value: todo?.title ?? '',
            onChanged: (v) {
              notifier.update(title: v);
              print(todo?.title);
            },
          ),
          FieldEditor(
            label: '설명',
            value: todo?.description ?? '',
            onChanged: (v) {
              notifier.update(description: v);
              print(todo?.description);
            },
          ),
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
        ],
      ),
    );
  }
}
