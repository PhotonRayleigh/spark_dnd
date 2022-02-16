import 'package:flutter_simple_dependency_injection/injector.dart';

import '../program.dart';

class SparkDndModule {
  Injector initialize(Injector injector) {
    // Add mappings here
    injector.map<Program>((i) => Program(), isSingleton: true);
    return injector;
  }
}
