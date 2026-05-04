import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import '../feature/btm_nav_bar.dart';
import '../feature/home/screen.dart' as home;
import '../feature/home/modal.dart' as modal;
import '../feature/editor/screen.dart' as editor;

// *****************************************************************

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (_, __, state) => BtmNavbar(state: state),
        branches: [
          StatefulShellBranch(
            initialLocation: '/home',
            routes: [
              GoRoute(path: '/home', builder: (_, __) => home.Screen()),
              GoRoute(
                name: 'modal',
                path: '/modal/:id',
                pageBuilder: (_, state) {
                  final id = state.pathParameters['id'] ?? '';
                  return MaterialPage(
                    child: modal.Screen(id: id),
                    fullscreenDialog: true,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            initialLocation: '/editor',
            routes: [
              GoRoute(path: '/editor', builder: (_, __) => editor.Screen()),
            ],
          ),
        ],
      ),
    ],
  );
}
