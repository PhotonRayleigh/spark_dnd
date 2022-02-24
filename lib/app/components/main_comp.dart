import 'package:spark_dnd/app/components/pc_sheet.dart';
import 'package:spark_dnd/app/data/pc_data.dart';
import 'package:spark_lib/events/notifier.dart';

import 'package:spark_lib/spark_di.dart';

class MainComponent with Notifier {
  // Upon initialization, need to load the available
  // character sheets so they can be displayed
  MainComponent(this.navigator);
  // PCSheetCubit pcSheet;
  final AppNavigator navigator;
  final MainCompState state = MainCompState();

  Future<void> findCharacters() async {
    throw UnimplementedError("findCharacters is not implemented.");
    List<PCData> newSheetList = [];

    notify();
  }

  PCSheet loadSheet(PCData sheet) {
    PCSheet cubit = PCSheet();
    cubit.setSheet(sheet);
    return cubit;
  }
}

class MainCompState {
  List<PCData> sheets = [
    PCData()
      ..name = "Rayleigh"
      ..chaScore = 13,
    PCData()..name = "Spark",
    PCData()..name = "Sunstrider",
    PCData()..name = "Jard",
  ];
}
