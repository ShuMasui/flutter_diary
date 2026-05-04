import 'package:flutter_riverpod/flutter_riverpod.dart';

// *****************************************************************
// ここから下は，自作パッケージ
// *****************************************************************

import './database.dart';
import './db_repo.dart';

// *****************************************************************

final databaseProvider = Provider<Database>(
  (ref) => throw UnimplementedError('databaseProvider is not implemented'),
);

final dbProvider = Provider<DbRepo>(
  (ref) => throw UnimplementedError('dbProvider is not implemented'),
);
