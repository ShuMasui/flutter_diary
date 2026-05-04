import 'package:flutter_diary/core/providers.dart';
import 'package:flutter_diary/feature/editor/notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fake_db_repo.dart';

void main() {
  group('EditorNotifier', () {
    test('returns error when title is empty', () async {
      final fakeRepo = FakeDbRepo();
      final container = ProviderContainer(
        overrides: [dbProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);
      addTearDown(fakeRepo.dispose);

      final sub = container.listen(editorProvider, (_, __) {});
      addTearDown(sub.close);

      await container
          .read(editorProvider.notifier)
          .addDiary('', 'content', null);

      final state = container.read(editorProvider);
      expect(state.hasError, isTrue);
      expect(fakeRepo.createCallCount, 0);
    });

    test('creates diary and sets AsyncData on success', () async {
      final fakeRepo = FakeDbRepo();
      final container = ProviderContainer(
        overrides: [dbProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);
      addTearDown(fakeRepo.dispose);

      final sub = container.listen(editorProvider, (_, __) {});
      addTearDown(sub.close);

      await container
          .read(editorProvider.notifier)
          .addDiary('title', 'content', '/tmp/hello.png');

      final state = container.read(editorProvider);
      expect(state.hasError, isFalse);
      expect(state, const AsyncData<void>(null));
      expect(fakeRepo.createCallCount, 1);
      expect(fakeRepo.lastTitle, 'title');
      expect(fakeRepo.lastContent, 'content');
      expect(fakeRepo.lastPath, '/tmp/hello.png');
    });

    test('sets AsyncError when repository throws', () async {
      final fakeRepo = FakeDbRepo()..throwOnCreate = true;
      final container = ProviderContainer(
        overrides: [dbProvider.overrideWithValue(fakeRepo)],
      );
      addTearDown(container.dispose);
      addTearDown(fakeRepo.dispose);

      final sub = container.listen(editorProvider, (_, __) {});
      addTearDown(sub.close);

      await container
          .read(editorProvider.notifier)
          .addDiary('title', 'content', null);

      final state = container.read(editorProvider);
      expect(state.hasError, isTrue);
      expect(fakeRepo.createCallCount, 1);
    });
  });
}
