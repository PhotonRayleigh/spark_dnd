import 'package:flutter/material.dart';
import 'package:spark_dnd/app/components/pc_sheet.dart';
import 'package:spark_dnd/app/widgets/attributes_table.dart';

import 'package:spark_lib/spark_di.dart';

typedef PCViewFactory = PCView
    Function(AppNavigator navigator, PCSheetCubit pcSheet, {Key? key});

class PCView extends StatelessWidget {
  const PCView(this.navigator, this.pcSheet, {Key? key}) : super(key: key);
  final AppNavigator navigator;
  final PCSheetCubit pcSheet;

  static PCView factory(AppNavigator navigator, PCSheetCubit pcSheet,
      {Key? key}) {
    return PCView(
      navigator,
      pcSheet,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SparkPage(
      navigator: navigator,
      child: Scaffold(
        appBar: WindowAppBar.build(context,
            navigator: navigator, titleText: pcSheet.state.pcData.name),
        body: Column(
          children: [
            AttributesTable(pcSheet),
          ],
        ),
      ),
    );
  }
}
