import 'package:path/path.dart' as p;
import 'dart:io';

import 'package:spark_dnd/app/components/pc_sheet_comp.dart';
import 'package:spark_dnd/app/data/pc_data.dart';
import 'package:spark_lib/events/notifier.dart';

import 'package:spark_lib/filesystem/filesystem_manager.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

class MainComp with StreamNotifier<void> {
  // Upon initialization, need to load the available
  // character sheets so they can be displayed
  MainComp(this.navigator, this.fsManager);
  // PCSheetCubit pcSheet;
  final AppNavigator navigator;
  final FileSystemManager fsManager;
  final MainCompState state = MainCompState();

  Future<void> findCharacters() async {
    String appDataPath = await fsManager.applicationFilesPath;
    String charactersPath = p.join(appDataPath, 'characters');
    Directory charactersDir = Directory(charactersPath);

    if (!(await charactersDir.exists())) {
      await charactersDir.create();
    }

    List<String> sheetDirectories = [];
    await for (var dir in charactersDir.list()) {
      sheetDirectories.add(p.basename(dir.path));
    }

    // Crawl the files that exist and load them from sembast.

    notify(null);
  }

  PCSheetComp loadSheet(PCData sheet) {
    PCSheetComp cubit = PCSheetComp();
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
