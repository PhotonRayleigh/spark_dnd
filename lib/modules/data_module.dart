import 'package:get_it/get_it.dart';

import '../db_connectors/sqlite_connector.dart';
import '../data_manager/json_data_manager.dart';

class DataModule {
  void initialize() {
    GetIt.I.registerSingleton<SqliteConnector>(SqliteConnector());
    GetIt.I.registerFactory<JsonDataManager>(() => JsonDataManager());

    return;
  }
}
