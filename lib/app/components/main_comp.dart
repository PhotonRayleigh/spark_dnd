import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_dnd/app/components/pc_sheet.dart';
import 'package:spark_dnd/app/data/pc_data.dart';

import 'package:spark_lib/spark_di.dart';

class MainCompCubit extends Cubit<MainCompState> {
  // Upon initialization, need to load the available
  // character sheets so they can be displayed
  MainCompCubit(this.navigator) : super(MainCompState());
  // PCSheetCubit pcSheet;
  final AppNavigator navigator;

  Future<void> findCharacters() async {
    throw UnimplementedError("findCharacters is not implemented.");
    List<PCData> newSheetList = [];

    emit(state);
  }

  PCSheetCubit loadSheet(PCData sheet) {
    return PCSheetCubit()..setSheet(sheet);
  }
}

class MainCompState {
  List<PCData> sheets = [
    PCData()..name = "Rayleigh",
    PCData()..name = "Spark",
    PCData()..name = "Sunstrider",
    PCData()..name = "Jard",
  ];
}
