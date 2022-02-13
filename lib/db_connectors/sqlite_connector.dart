import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import 'package:spark_lib/database/sqlite_manager.dart';
import 'package:spark_lib/filesystem/file_paths.dart';

_SqliteConnector sqliteConnector = _SqliteConnector();

class _SqliteConnector {
  static const String dbName = "characterDB";
  Database? characterDB;
  late Future<void> initialized;

  _SqliteConnector() {
    initialized = Future<void>(() async => characterDB =
        await SqliteManager.getInstance().openDB(
            p.join(systemPaths.applicationStorage, "database", dbName)));
  }

  // Need to initialize DB with proper tables and schemas.
}
