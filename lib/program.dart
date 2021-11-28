import 'package:flutter/material.dart';

import 'package:spark_lib/custom_window/bitsdojo_boilerplate.dart';
import 'package:spark_lib/app/app_system_manager.dart';
import 'package:spark_lib/app/spark_app.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

import 'app/screens/dnd_home.dart';
import 'app/theme/base_theme.dart';

final Program program = Program();

class Program {
  GlobalKey<AppSystemManagerState> appManagerKey =
      GlobalKey(debugLabel: "System Manager");

  AppSystemManagerState get appManager {
    var state = appManagerKey.currentState;
    if (state == null) throw "AppSystemManager has not been initialized.";
    return state;
  }

  late SparkApp app = SparkApp(
      home: home,
      title: "D&D App",
      sysManagerKey: appManagerKey,
      theme: baseTheme);

  // Screens
  var home = const DnDHome();

  // Window props
  Size initialSize = const Size(900, 600);
  Size minimumSize = const Size(200, 200);
  Alignment windowAlignment = Alignment.center;
  String windowTitle = "D&D Character Editor";

  // Widget tree is built here
  void run() {
    runApp(app.treeRoot);
    initializeBitsdojo(
        initialSize: initialSize,
        minSize: minimumSize,
        alignment: windowAlignment,
        title: windowTitle);
  }
}

/*
  Application structure:

  Singletons ➡ Top level ambient services, off-main logic
  ↕
  Application Classes
    Contains:
      ➡ Main application logic
      ➡ App data
      ➡ Widget tree
        ➡ Controllers
        ➡ UI Data
        ➡ UI Actions
      ➡ Controllers
      ➡ Initialize service locators

  The key here is it gets me out of the Widget tree for application logic.
  Flutter naturally pushes users to make everything widgets, which isn't good
  for all parts of the program. Encapsulating the widget tree in a
  Flutter-independent object gives me non-Widget space to store things.

  I could explain it better, but that's as good as I've got for now.
*/
