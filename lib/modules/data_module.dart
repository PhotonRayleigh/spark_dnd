import 'package:flutter_simple_dependency_injection/injector.dart';

import '../db_connectors/sqlite_connector.dart';

class DataModule {
  Injector initialize(Injector injector) {
    injector.map<SqliteConnector>((i) => SqliteConnector(), isSingleton: true);

    return injector;
  }
}
