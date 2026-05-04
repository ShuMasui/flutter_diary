import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './core/router.dart';

// *****************************************************************

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildWithScope(context, ref);
  }

  ProviderScope _buildWithScope(BuildContext context, WidgetRef ref) {
    final overrides = [];

    return ProviderScope(child: _build(context, ref));
  }

  MaterialApp _build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Diary',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
