import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:spark_lib/events/notifier.dart';

import '../data/pc_data.dart';
import '../../data_manager/json_data_manager.dart';

// This file actually should not have Flutter references in it.
// It should be able to function even if Flutter was replaced.
// All blocs should be initialized in DI and provided to the UI.

class PCSheetLC with StreamNotifier<PCData> {
  // Data manager can be abstracted in the future, probably
  // Not that I plan on having swappable data backends.
  PCSheetLC();
  PCData _data = PCData();
  PCData get data => _data;
  set data(PCData pcData) {
    _data = pcData;
    notify(data);
  }

  Map<Attribute, Notifier> attributeNotifierMap = {};

  void updateAttribute(Attribute attribute, int score) {
    attribute.score = score;
    notify(data);
  }
}

// Separate data from API (no wrappers on data)
