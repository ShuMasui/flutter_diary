import 'package:freezed_annotation/freezed_annotation.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './database.dart';

// *****************************************************************

part 'diary.freezed.dart';
part 'diary.g.dart';

@freezed
abstract class Diary with _$Diary {
  const factory Diary({
    int? id,
    required String title,
    required String content,
    required DateTime createdAt,
    String? path,
  }) = _Diary;

  /// JSON形式からの変換クラス
  ///
  /// JSON => Diary
  factory Diary.fromJson(Map<String, dynamic> json) => _$DiaryFromJson(json);

  /// Driftのテーブルクラスからの変換クラス
  ///
  /// DiaryItem => Diary
  factory Diary.fromDrift(DiaryItem item) => Diary(
    id: item.id,
    title: item.title,
    content: item.content,
    createdAt: item.createdAt,
    path: item.path,
  );
}
