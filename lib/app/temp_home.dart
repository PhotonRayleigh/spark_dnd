import 'package:flutter/material.dart';
import 'package:spark_lib/custom_window/window_appbar.dart';
import 'package:spark_lib/navigation/spark_nav.dart';

class TempHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SparkPage(
        child: Scaffold(
      appBar: WindowAppBar.build(context, titleText: "Hello"),
    ));
  }
}
