import 'package:flutter_simple_dependency_injection/injector.dart';

import 'package:spark_dnd/program.dart';
import 'modules/spark_dnd_module.dart';

void main() {
  final injector = SparkDndModule().initialize(Injector());
  injector.get<Program>().run();
}
