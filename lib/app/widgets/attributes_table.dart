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
            for (Attribute att in data.attributes)
              Column(
                children: [
                  Text(att.name),
                  Text(att.score.toString()),
                  Text(att.mod.toString()),
                ],
              ),
          ],
        );
      },
    );
  }
}
