import 'package:flutter/material.dart';

import 'package:spark_lib/custom_window/bitsdojo_boilerplate.dart';

import 'app/app.dart';

void main() {
  runApp(const App());

  initializeBitsdojo(
      initialSize: const Size(900, 600),
      minSize: const Size(200, 200),
      alignment: Alignment.center,
      title: "Data Editor");
}
