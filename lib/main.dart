import 'package:spark_dnd/app/components/main_comp.dart';
import 'package:spark_lib/app/spark_app.dart';
import 'package:spark_lib/custom_window/window_data.dart';
import 'package:spark_lib/filesystem/system_paths.dart';
import 'package:spark_lib/filesystem/filesystem_manager.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

import 'app/screens/dnd_home.dart';
import 'app/theme/base_theme.dart';

import 'utility/print_paths.dart';

void main() async {
  // Filesystem access is a bit weird on Mac.
  // I'm going to have to see how to get proper access
  // to the user's file system. It has a permissions system
  // where the user has to grant access.
  // For now, just store data in the app storage
  // directory.
  printPaths(SystemPaths.I);
  FileSystemManager.I.config("D&D App", "Spark Framework");
  var app = SparkApp(
      home: DnDHome(WindowData(windowTitle: "Spark D&D"), AppNavigator.I,
          MainComp(AppNavigator.I, FileSystemManager.I)),
      theme: darkTheme());
  app.run();
}
