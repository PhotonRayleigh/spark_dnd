import 'package:flutter/material.dart';
import 'package:spark_dnd/app/components/pc_sheet_comp.dart';
import 'package:spark_dnd/app/data/pc_data.dart';
import 'package:spark_dnd/app/widgets/attributes_table.dart';

import 'package:spark_dnd/data_manager/json_data_manager.dart';
import 'package:spark_lib/custom_window/window_appbar.dart';
import 'package:spark_lib/filesystem/system_paths.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

class PCView extends StatelessWidget {
  PCView(this.pcSheet, {Key? key}) : super(key: key);
  final AppNavigator navigator = AppNavigator.I;
  final PCSheetComp pcSheet;
  late final JsonDataManager jsonManager = JsonDataManager();

  @override
  Widget build(BuildContext context) {
    return SparkPage(
      navigator: navigator,
      child: Scaffold(
        appBar: WindowAppBar.build(context, titleText: pcSheet.data.name),
        body: Column(
          children: [
            AttributesTable(pcSheet),
            ElevatedButton(
              child: Text("Increment Strength"),
              onPressed: () {
                pcSheet.updateAttribute(
                    pcSheet.data.strength, pcSheet.data.strength.score + 1);
                pcSheet.updateAttribute(
                    pcSheet.data.dexterity, pcSheet.data.dexterity.score - 1);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  jsonManager.saveJsonCharacterFile(
                      jsonManager.serializePCData(pcSheet.data),
                      pcSheet.data.name);
                },
                child: Text("Save to Json")),
            ElevatedButton(
                onPressed: () {
                  print(SystemPaths.I.applicationStorage);
                },
                child: Text("Debug Print")),
          ],
        ),
      ),
    );
  }
}
