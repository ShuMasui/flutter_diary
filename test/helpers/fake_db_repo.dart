import 'dart:async';

import 'package:flutter_diary/core/db_repo.dart';
import 'package:flutter_diary/core/diary.dart';

class FakeDbRepo implements DbRepo {
  final List<Diary> _diaries;
  final StreamController<List<Diary>> _controller;

  bool throwOnCreate = false;
  int createCallCount = 0;
  String? lastTitle;
  String? lastContent;
  String? lastPath;

  FakeDbRepo({List<Diary>? initialDiaries})
    : _diaries = List<Diary>.from(initialDiaries ?? <Diary>[]),
      _controller = StreamController<List<Diary>>.broadcast();

  @override
  Future<void> createDiary({
    required String title,
    required String content,
    String? path,
  }) async {
    createCallCount += 1;
    lastTitle = title;
    lastContent = content;
    lastPath = path;

    if (throwOnCreate) {
      throw Exception('create failed');
    }

    _diaries.add(
      Diary(
        id: _diaries.length + 1,
        title: title,
        content: content,
        createdAt: DateTime(2026, 1, 1),
        path: path,
      ),
    );

    _controller.add(List<Diary>.from(_diaries));
  }

  @override
  Future<List<Diary>> loadAllDiaries() async {
    return List<Diary>.from(_diaries);
  }

  @override
  Stream<List<Diary>> watchAllDiaries() {
    return _controller.stream;
  }

  void emit(List<Diary> diaries) {
    _diaries
      ..clear()
      ..addAll(diaries);
    _controller.add(List<Diary>.from(_diaries));
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}