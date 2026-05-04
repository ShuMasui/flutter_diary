import 'package:flutter_diary/core/database.dart';
import 'package:flutter_diary/core/diary.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Diary', () {
    test('fromDrift converts DiaryItem to Diary', () {
      final createdAt = DateTime(2026, 5, 4, 10, 30);
      final item = DiaryItem(
        id: 42,
        title: 'title',
        content: 'content',
        createdAt: createdAt,
        path: '/tmp/image.png',
      );

      final diary = Diary.fromDrift(item);

      expect(diary.id, 42);
      expect(diary.title, 'title');
      expect(diary.content, 'content');
      expect(diary.createdAt, createdAt);
      expect(diary.path, '/tmp/image.png');
    });

    test('fromJson restores fields correctly', () {
      final json = {
        'id': 7,
        'title': 'json title',
        'content': 'json content',
        'createdAt': '2026-05-04T01:02:03.000',
        'path': null,
      };

      final diary = Diary.fromJson(json);

      expect(diary.id, 7);
      expect(diary.title, 'json title');
      expect(diary.content, 'json content');
      expect(diary.createdAt, DateTime.parse('2026-05-04T01:02:03.000'));
      expect(diary.path, isNull);
    });
  });
}