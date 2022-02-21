import 'package:flutter_simple_dependency_injection/injector.dart';

import '../db_connectors/sqlite_connector.dart';
import '../data_manager/json_data_manager.dart';

class DataModule {
  Injector initialize(Injector injector) {
    injector.map<SqliteConnector>((i) => SqliteConnector(), isSingleton: true);
    injector.map<JsonDataManager>((i) => JsonDataManager());

    return injector;
  }
}
