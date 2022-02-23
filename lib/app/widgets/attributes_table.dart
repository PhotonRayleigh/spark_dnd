import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spark_dnd/app/components/pc_sheet.dart';

class AttributesTable extends StatelessWidget {
  AttributesTable(this.pcSheet);

  final PCSheetCubit pcSheet;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PCSheetCubit, PCSheetState>(
      bloc: pcSheet,
      builder: (context, state) {
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
                Text(state.pcData.strScore.toString()),
                Text(state.pcData.strMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Dexterity"),
                Text(state.pcData.dexScore.toString()),
                Text(state.pcData.dexMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Constitution"),
                Text(state.pcData.conScore.toString()),
                Text(state.pcData.conMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Intelligence"),
                Text(state.pcData.intScore.toString()),
                Text(state.pcData.intMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Wisdom"),
                Text(state.pcData.wisScore.toString()),
                Text(state.pcData.wisMod.toString()),
              ],
            ),
            Column(
              children: [
                Text("Charisma"),
                Text(state.pcData.chaScore.toString()),
                Text(state.pcData.chaMod.toString()),
              ],
            ),
          ],
        );
      },
    );
  }
}
