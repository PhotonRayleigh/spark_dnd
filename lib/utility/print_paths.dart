import 'package:spark_lib/filesystem/system_paths.dart';

void printPaths(SystemPaths systemPaths) async {
  await systemPaths.ready;
  print("App storage: ${systemPaths.applicationStorage}");
  print("Documents: ${systemPaths.documentsDirectory}");
  MacOSPaths paths = systemPaths as MacOSPaths;
  print("Temp: ${paths.tempDirectory}");
  print("Home: ${paths.userDirectory}");
}
