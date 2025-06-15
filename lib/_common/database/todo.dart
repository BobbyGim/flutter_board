import 'package:drift/drift.dart';

class TodoDataBase extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title =>
      text().withLength(min: 1, max: 200)();

  TextColumn get content => text().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();
}
