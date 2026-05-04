import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './app.dart';
import './core/providers.dart';
import './core/database.dart';
import './core/db_impl.dart';

// *****************************************************************

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();

  debugPrint(
    'Database initialized at ${await getApplicationSupportDirectory()}',
  );

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(database),
        dbProvider.overrideWithValue(DbImpl(database: database)),
      ],
      child: const App(),
    ),
  );
}
