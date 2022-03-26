import 'package:get_it/get_it.dart';
import 'package:spark_lib/spark_di.dart';

import 'modules/spark_dnd_module.dart';

void main() {
  SparkDndModule().initialize();
  GetIt.I.get<SparkApp>().run();
}
