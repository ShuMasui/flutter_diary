import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './notifier.dart';

// *****************************************************************

class Screen extends ConsumerWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diaries = ref.watch(diaryListProvider);

    return Container(
      child: diaries.isEmpty
          ? Center(child: Text('No diaries'))
          : ListView.builder(
              itemCount: diaries.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                late final img;
                if (File(diaries[index].path!).existsSync()) {
                  img = Image.file(
                    File(diaries[index].path!),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                } else {
                  img = SvgPicture.asset(
                    'assets/noimage.svg',
                    width: 100,
                    height: 100,
                  );
                }

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(
                      'modal',
                      pathParameters: {'id': diaries[index].id.toString()},
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: img,
                        title: diaries[index].content.length > 9
                            ? Text(
                                '${diaries[index].title.substring(0, 10)}...',
                              )
                            : Text(diaries[index].title),
                        subtitle: diaries[index].content.length > 11
                            ? Text(
                                '${diaries[index].content.substring(0, 12)}...',
                              )
                            : Text(diaries[index].content),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
