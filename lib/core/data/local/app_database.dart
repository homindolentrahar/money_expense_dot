import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Categories, Expenses])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

@DataClassName("CategoryEntity")
class Categories extends Table {
  TextColumn get icon => text()();
  TextColumn get outIcon => text()();
  TextColumn get slug => text()();
  TextColumn get name => text()();

  @override
  Set<Column<Object>>? get primaryKey => {slug};
}

@DataClassName("ExpenseEntity")
class Expenses extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text().references(Categories, #slug)();
  RealColumn get amount => real()();
  DateTimeColumn get expensedAt => dateTime()();
}
