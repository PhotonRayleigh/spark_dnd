import 'package:flutter/material.dart';

import 'package:spark_lib/app/spark_app.dart';

import 'temp_home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SparkApp.build(home: TempHome(), title: "D&D App");
  }
}
