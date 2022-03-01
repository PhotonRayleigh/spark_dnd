import 'dart:io';
import 'dart:collection';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:spark_lib/filesystem/file_paths.dart';
import 'package:spark_lib/extensions.dart';

import '../app/data/pc_data.dart';

class JsonDataManager {
  late SystemPaths systemPaths = GetIt.I.get<SystemPaths>();

  Future<void> saveJsonCharacterFile(String jsonString, String fileName) async {
    await systemPaths.ready;
    String appDataPath = systemPaths.applicationStorage;
    File targetFile = File(p.join(appDataPath, fileName + ".json"));
    if (await targetFile.exists() == false) {
      targetFile.create();
    }
    await targetFile.writeAsString(jsonString);
    print("Wrote file '" + fileName + ".json' to " + appDataPath + ".");
  }

  Future<String> loadJsonCharacterFile(String filePath) async {
    await systemPaths.ready;
    File targetFile = File(filePath);
    String output;
    if (await targetFile.exists()) {
      output = await targetFile.readAsString();
    } else {
      print("Error loading file: " + filePath + "\nFile not found.");
      output = "";
    }
    return output;
  }

  String serializePCData(PCData data) {
    return jsonEncode(PCData.json.toJsonMap(data));
  }

  PCData deserializePCData(String jsonPCData) {
    return PCData.json.fromJsonMap(jsonDecode(jsonPCData));
  }
}
