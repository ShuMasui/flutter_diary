// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './diary.dart';

// *****************************************************************

abstract class DbRepo {
  /// Diaryクラスの内容を使って，データベースに日記を登録する
  ///
  /// 日記の作成が途中で止まった場合は[Error(日記保存に失敗しました)]を投げる
  Future<void> createDiary({
    required String title,
    required String content,
    String? path,
  });

  /// データベースに保存されている日記を全て読み出す
  ///
  /// return [List<Diary>]
  Future<List<Diary>> loadAllDiaries();

  /// データベースに保存されている日記の状態監視を行う
  ///
  /// 追加などが起これば，リストが更新される
  Stream<List<Diary>> watchAllDiaries();
}
