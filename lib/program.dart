import 'package:flutter/material.dart';

import 'package:spark_lib/custom_window/bitsdojo_boilerplate.dart';
import 'package:spark_lib/spark_di.dart';

import 'app/screens/dnd_home.dart';
import 'app/theme/base_theme.dart';

class Program {
  Program(this.app, this.windowData);

  SparkApp app;
  WindowData windowData;

  // Widget tree is built here
  void run() {
    runApp(app.treeRoot);
    // Why does this work?
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
