import 'package:flutter/material.dart';

import 'package:spark_lib/events/notifier.dart';
import 'package:spark_dnd/app/components/pc_sheet_lc.dart';

import '../data/pc_data.dart';

class AttributesTable extends StatelessWidget {
  AttributesTable(this.pcSheet);

  final PCSheetLC pcSheet;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PCData>(
      initialData: pcSheet.data,
      stream: pcSheet.stream,
      builder: (context, snap) {
        PCData data = snap.requireData;
        return Row(
          children: [
            Column(
              children: const [
                Text("Attribute"),
                Text("Score"),
                Text("Modifier"),
              ],
            ),
            Column(
              children: [
                Text("Strength"),
                Text(data.strength.score.toString()),
                Text(data.strength.mod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Dexterity"),
                Text(data.dexterity.score.toString()),
                Text(data.dexterity.mod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Constitution"),
                Text(data.constitution.score.toString()),
                Text(data.constitution.mod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Intelligence"),
                Text(data.intelligence.score.toString()),
                Text(data.intelligence.mod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Wisdom"),
                Text(data.wisdom.score.toString()),
                Text(data.wisdom.mod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Charisma"),
                Text(data.charisma.score.toString()),
                Text(data.charisma.mod.toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}
