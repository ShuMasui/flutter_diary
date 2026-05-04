import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './notifier.dart';

// *****************************************************************

class Screen extends ConsumerWidget {
  Screen({required this.id});

  late final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diary = ref.watch(diaryFamilyProvider(id));

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(55),
          topLeft: Radius.circular(55),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('閉じる'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  File(diary.path!).existsSync()
                      ? Image.file(
                          File(diary.path!),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset(
                          'assets/noimage.svg',
                          width: 150,
                          height: 150,
                        ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(diary.title),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Content',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(diary.content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
