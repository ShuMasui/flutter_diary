import 'package:flutter_diary/core/diary.dart';
import 'package:flutter_diary/core/providers.dart';
import 'package:flutter_diary/feature/home/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_db_repo.dart';

void main() {
  group('Home providers', () {
    test('diaryListProvider returns empty list while loading', () {
      final fakeRepo = FakeDbRepo();
      final container = ProviderContainer(
        overrides: [dbProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);
      addTearDown(fakeRepo.dispose);

      final sub = container.listen(diaryListProvider, (_, __) {});
      addTearDown(sub.close);

      expect(container.read(diaryListProvider), isEmpty);
    });

    test('diaryFamilyProvider returns matching diary by id string', () {
      final diary = Diary(
        id: 10,
        title: 'title',
        content: 'content',
        createdAt: DateTime(2026, 5, 4),
      );

      final container = ProviderContainer(
        overrides: [diaryListProvider.overrideWithValue([diary])],
      );
      addTearDown(container.dispose);

      final found = container.read(diaryFamilyProvider('10'));
      expect(found, diary);
    });

    test('homeProvider mirrors diaryListProvider values', () {
      final diaries = [
        Diary(
          id: 1,
          title: 't1',
          content: 'c1',
          createdAt: DateTime(2026, 5, 4),
        ),
        Diary(
          id: 2,
          title: 't2',
          content: 'c2',
          createdAt: DateTime(2026, 5, 5),
        ),
      ];

      final container = ProviderContainer(
        overrides: [diaryListProvider.overrideWithValue(diaries)],
      );
      addTearDown(container.dispose);

      final sub = container.listen(homeProvider, (_, __) {});
      addTearDown(sub.close);

      expect(container.read(homeProvider).value, diaries);
    });
  });
}