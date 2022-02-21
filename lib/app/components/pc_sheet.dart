import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/pc_data.dart';
import '../../data_manager/json_data_manager.dart';

// This file actually should not have Flutter references in it.
// It should be able to function even if Flutter was replaced.
// All blocs should be initialized in DI and provided to the UI.

class PCSheetCubit extends Cubit<PCSheetState> {
  // Data manager can be abstracted in the future, probably
  // Not that I plan on having swappable data backends.
  PCSheetCubit(JsonDataManager dataManager) : super(PCSheetState(PCData()));
}

class PCSheetState {
  PCData pcData;

  PCSheetState(this.pcData);
}
