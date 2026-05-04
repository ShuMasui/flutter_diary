import 'package:riverpod_annotation/riverpod_annotation.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import '../../core/providers.dart';

// *****************************************************************

part 'notifier.g.dart';

@riverpod
class EditorNotifier extends _$EditorNotifier {
  @override
  Future<void> build() async {}

  Future<void> addDiary(String title, String content, String? path) async {
    state = AsyncLoading();

    if (title.isEmpty || content.isEmpty) {
      state = AsyncError(Exception('タイトルと内容は必須です'), StackTrace.current);
      return;
    }

    try {
      await ref
          .read(dbProvider)
          .createDiary(title: title, content: content, path: path);
      state = AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }
}
