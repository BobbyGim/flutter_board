import 'package:flutter_board/home/model/todo_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoNotifier extends StateNotifier<TodoModel?> {
  TodoNotifier()
    : super(
        TodoModel(
          id: '', // 적절한 기본값 넣기
          title: '',
          description: '',
          isCompleted: false,
        ),
      );

  void setTodo(TodoModel todo) {
    state = todo;
  }

  void update({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    if (state != null) {
      state = state!.copyWith(
        title: title ?? state!.title,
        description: description ?? state!.description,
        isCompleted: isCompleted ?? state!.isCompleted,
      );
    }
  }

  void updateTitle(String newTitle) {
    if (state != null) {
      state = state!.copyWith(title: newTitle);
    }
  }

  void toggleCompleted() {
    if (state != null) {
      state = state!.copyWith(
        isCompleted: !state!.isCompleted,
      );
    }
  }

  void clearTodo() {
    state = null;
  }
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, TodoModel?>(
      (ref) => TodoNotifier(),
    );
