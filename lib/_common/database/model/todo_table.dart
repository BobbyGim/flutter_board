import 'package:drift/drift.dart';

enum TodoType { daily, weekly, monthly }

class TodoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().nullable()();

  TextColumn get content => text().nullable()();

  TextColumn get type => textEnum<TodoType>()();

  BoolColumn get isCompleted =>
      boolean().clientDefault(() => false)();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
