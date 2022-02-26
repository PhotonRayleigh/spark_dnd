import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:spark_dnd/app/components/pc_sheet_lc.dart';
import 'package:spark_dnd/app/widgets/attributes_table.dart';

import 'package:spark_lib/spark_di.dart';

class PCView extends StatelessWidget {
  PCView(this.pcSheet, {Key? key}) : super(key: key);
  final AppNavigator navigator = GetIt.I.get<AppNavigator>();
  final PCSheetLC pcSheet;

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
          ],
        ),
      ),
    );
  }
}
