import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
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
  Injector initialize(Injector injector) {
    // Data backend module
    injector = DataModule().initialize(injector);

    // Program and application mappings
    injector.map<ThemeData>((i) => baseTheme);
    injector.map<WindowData>((i) => WindowData(), isSingleton: true);

    // Navigator definition
    injector.map<AppNavigator>((i) => AppNavigator(), isSingleton: true);

    // Cubits
    // injector.map<PCSheetCubit>((i) => PCSheetCubit(),
    //     isSingleton: false);
    injector.map<MainCompCubit>(
        (i) => MainCompCubit(
              i.get<AppNavigator>(),
            ),
        isSingleton: true);

    // App routes
    injector.map<DnDHome>(
      (i) => DnDHome(
        i.get<WindowData>(),
        i.get<AppNavigator>(),
        i.get<MainCompCubit>(),
        // i.get<PCSheetCubit>(),
        // i.get<PCView>(),
      ),
    );
    // injector.map<PCView>(
    //     (i) => PCView(i.get<AppNavigator>(), i.get<PCSheetCubit>()));
    injector.map<PCViewFactory>((i) => PCView.factory);

    injector.map<GlobalKey<AppSystemManagerState>>(
      (i) => GlobalKey(debugLabel: "System Manager"),
      isSingleton: true,
    );

    injector = SparkDIModule().initialize(injector,
        navigator: injector.get<AppNavigator>(),
        home: injector.get<DnDHome>(),
        theme: injector.get<ThemeData>(),
        sysManagerKey: injector.get<GlobalKey<AppSystemManagerState>>(),
        title: "D&D App");

    injector.map<Program>(
        (i) => Program(i.get<SparkApp>(), i.get<WindowData>()),
        isSingleton: true);

    return injector;
  }
}
