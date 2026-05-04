import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import '../../core/diary.dart';
import '../../core/providers.dart';

// *****************************************************************

part 'notifier.g.dart';

/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込む
@riverpod
Stream<List<Diary>> diaryStream(Ref ref) {
  return ref.read(dbProvider).watchAllDiaries();
}

/// Stream型は扱いにくいので，一旦ProviderでRiverpodのエコシステムにぶち込んで，AsyncValueを変換して，元の形に直す
@riverpod
List<Diary> diaryList(Ref ref) {
  final diaries = ref.watch(diaryStreamProvider);
  return diaries.when(data: (d) => d, error: (_, __) => [], loading: () => []);
}

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  List<Diary> build() {
    return ref.watch(diaryListProvider);
  }
}

@riverpod
Diary diaryFamily(Ref ref, String id) {
  final diaries = ref.watch(diaryListProvider);
  return diaries.firstWhere((t) => t.id.toString() == id);
}
