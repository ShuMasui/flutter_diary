import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './tables.dart';

// *****************************************************************

part 'database.g.dart';

@DriftDatabase(tables: [DiaryItems])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationSupportDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      return NativeDatabase.createInBackground(file, logStatements: true);
    });
  }

  @override
  MigrationStrategy get migration => MigrationStrategy();

  // *****************************************************
  // ここから下は，CRUD処理の実装
  // *****************************************************

  Future<void> createDiary(DiaryItemsCompanion item) async {
    await into(diaryItems).insert(item);
  }

  Future<List<DiaryItem>> loadAllDiaries() async {
    return await select(diaryItems).get();
  }

  Stream<List<DiaryItem>> watchAllDiaries() {
    return select(diaryItems).watch();
  }
}
