import 'package:drift/drift.dart';

class TodoTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().nullable()();

  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
