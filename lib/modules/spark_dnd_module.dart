import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:spark_lib/app/app_system_manager.dart';
import 'package:spark_lib/app/spark_app.dart';

import 'data_module.dart';
import '../program.dart';
import 'package:spark_dnd/app/screens/dnd_home.dart';
import 'package:spark_dnd/app/theme/base_theme.dart';

class SparkDndModule {
  Injector initialize(Injector injector) {
    // Add mappings here
    injector = DataModule().initialize(injector);
    // Program and application mappings
    injector.map<ThemeData>((i) => baseTheme);
    injector.map<WindowData>((i) => WindowData(), isSingleton: true);
    injector.map<DnDHome>(
      (i) => DnDHome(i.get<WindowData>()),
    );
    injector.map<GlobalKey<AppSystemManagerState>>(
        (i) => GlobalKey(debugLabel: "System Manager"),
        isSingleton: true,
        key: "System Manager");
    injector.map<SparkApp>(
      (i) => SparkApp(
          home: i.get<DnDHome>(),
          title: "D&D App",
          sysManagerKey:
              i.get<GlobalKey<AppSystemManagerState>>(key: "System Manager"),
          theme: i.get<ThemeData>()),
      isSingleton: true,
    );
    injector.map<Program>(
        (i) => Program(i.get<SparkApp>(), i.get<WindowData>()),
        isSingleton: true);

    return injector;
  }
}
