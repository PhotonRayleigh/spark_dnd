import 'package:spark_dnd/app/components/pc_sheet_loc.dart';
import 'package:spark_dnd/app/data/pc_data.dart';
import 'package:spark_lib/events/notifier.dart';

import 'package:spark_lib/spark_di.dart';

class MainLoC with StreamNotifier<void> {
  // Upon initialization, need to load the available
  // character sheets so they can be displayed
  MainLoC(this.navigator);
  // PCSheetCubit pcSheet;
  final AppNavigator navigator;
  final MainCompState state = MainCompState();

  Future<void> findCharacters() async {
    throw UnimplementedError("findCharacters is not implemented.");
    List<PCData> newSheetList = [];

    notify(null);
  }

  PCSheetLC loadSheet(PCData sheet) {
    PCSheetLC cubit = PCSheetLC();
    cubit.data = sheet;
    return cubit;
  }
}

class MainCompState {
  List<PCData> sheets = [
    PCData()
      ..name = "Rayleigh"
      ..charisma.score = 13,
    PCData()..name = "Spark",
    PCData()..name = "Sunstrider",
    PCData()..name = "Jard",
  ];
}
