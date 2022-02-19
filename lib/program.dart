import 'package:flutter/material.dart';

import 'package:spark_lib/custom_window/bitsdojo_boilerplate.dart';
import 'package:spark_lib/app/app_system_manager.dart';
import 'package:spark_lib/app/spark_app.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

import 'app/screens/dnd_home.dart';
import 'app/theme/base_theme.dart';

class Program {
  Program(this.app, this.windowData);

  SparkApp app;
  WindowData windowData;

  // Widget tree is built here
  void run() {
    runApp(app.treeRoot);
    initializeBitsdojo(
        initialSize: windowData.initialSize,
        minSize: windowData.minimumSize,
        alignment: windowData.windowAlignment,
        title: windowData.windowTitle);
  }
}

class WindowData {
  Size initialSize = const Size(900, 600);
  Size minimumSize = const Size(200, 200);
  Alignment windowAlignment = Alignment.center;
  String windowTitle = "D&D Character Editor";
}
