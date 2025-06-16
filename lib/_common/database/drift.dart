import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_board/_common/database/model/todo_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [TodoTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<TodoTableData>> geTodoList() =>
      select(todoTable).get();

  Future<int> insertTodo(TodoTableCompanion todo) =>
      into(todoTable).insert(todo);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFile = await getApplicationDocumentsDirectory();

    final file = File(p.join(dbFile.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = await getTemporaryDirectory();

    sqlite3.tempDirectory = cachebase.path;

    return NativeDatabase.createBackgroundConnection(file);
  });
}
