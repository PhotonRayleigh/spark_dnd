import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spark_dnd/app/components/main_comp.dart';
import 'package:spark_dnd/app/screens/pc_view.dart';
import 'package:spark_lib/spark_di.dart';

import 'data_module.dart';
import '../program.dart';
import 'package:spark_dnd/app/screens/dnd_home.dart';
import 'package:spark_dnd/app/theme/base_theme.dart';
import '../app/components/pc_sheet.dart';
import '../data_manager/json_data_manager.dart';

class SparkDndModule {
  /// Registers Spark D&D classes in GetIt.
  void initialize() {
    // Data backend module
    DataModule().initialize();

    // Program and application mappings
    GetIt.I.registerSingleton<ThemeData>(baseTheme);
    GetIt.I.registerSingleton<WindowData>(WindowData());

    // Navigator definition
    GetIt.I.registerSingleton<AppNavigator>(AppNavigator());

    // Cubits
    GetIt.I.registerSingleton<MainComponent>(MainComponent(
      GetIt.I.get<AppNavigator>(),
    ));

    // App routes
    GetIt.I.registerFactory<DnDHome>(
      () => DnDHome(
        GetIt.I.get<WindowData>(),
        GetIt.I.get<AppNavigator>(),
        GetIt.I.get<MainComponent>(),
        // i.get<PCSheetCubit>(),
        // i.get<PCView>(),
      ),
    );

    GetIt.I.registerSingleton<GlobalKey<AppSystemManagerState>>(
        GlobalKey(debugLabel: "System Manager"));

    SparkDIModule().initialize(
        navigator: GetIt.I.get<AppNavigator>(),
        home: GetIt.I.get<DnDHome>(),
        theme: GetIt.I.get<ThemeData>(),
        sysManagerKey: GetIt.I.get<GlobalKey<AppSystemManagerState>>(),
        title: "D&D App");

    GetIt.I.registerSingleton<Program>(
        Program(GetIt.I.get<SparkApp>(), GetIt.I.get<WindowData>()));

    return;
  }
}
