import 'package:flutter/material.dart';

import 'package:spark_lib/events/notifier.dart';
import 'package:spark_dnd/app/components/pc_sheet_lc.dart';

class AttributesTable extends StatelessWidget {
  AttributesTable(this.pcSheet);

  final PCSheetLC pcSheet;

  @override
  Widget build(BuildContext context) {
    return NotifierBuilder(
      notifier: pcSheet,
      builder: (context) {
        return Row(
          children: [
            Column(
              children: const [
                Text("Attribute"),
                Text("Score"),
                Text("Modifier"),
              ],
            ),
            NotifierBuilder(
                notifier: pcSheet.strNotifier,
                builder: (context) {
                  return Column(
                    children: [
                      Text("Strength"),
                      Text(pcSheet.data.strScore.toString()),
                      Text(pcSheet.data.strMod.toString()),
                    ],
                  );
                }),
            NotifierBuilder(
                notifier: pcSheet.dexNotifier,
                builder: (context) {
                  return Column(
                    children: [
                      Text("Dexterity"),
                      Text(pcSheet.data.dexScore.toString()),
                      Text(pcSheet.data.dexMod.toString()),
                    ],
                  );
                }),
            Column(
              children: [
                Text("Constitution"),
                Text(pcSheet.data.conScore.toString()),
                Text(pcSheet.data.conMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Intelligence"),
                Text(pcSheet.data.intScore.toString()),
                Text(pcSheet.data.intMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Wisdom"),
                Text(pcSheet.data.wisScore.toString()),
                Text(pcSheet.data.wisMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Charisma"),
                Text(pcSheet.data.chaScore.toString()),
                Text(pcSheet.data.chaMod.toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}
