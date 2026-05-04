// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import 'package:drift/drift.dart';

import './diary.dart';
import './database.dart';
import './db_repo.dart';

// *****************************************************************

class DbImpl extends DbRepo {
  DbImpl({required Database database}) : _database = database;

  late final Database _database;

  @override
  Future<void> createDiary({
    required String title,
    required String content,
    String? path,
  }) async {
    await _database.createDiary(
      DiaryItemsCompanion.insert(
        title: title,
        content: content,
        createdAt: Value(DateTime.now()),
        path: Value(path),
      ),
    );
  }

  @override
  Future<List<Diary>> loadAllDiaries() async {
    final diaryItems = await _database.loadAllDiaries();
    return diaryItems.map(Diary.fromDrift).toList();
  }

  @override
  Stream<List<Diary>> watchAllDiaries() {
    return _database.watchAllDiaries().map(
      (diaryItems) => diaryItems.map(Diary.fromDrift).toList(),
    );
  }
}
