import 'package:flutter/material.dart';

import 'package:spark_lib/spark_di.dart';
import 'package:spark_lib/notifications/notifications.dart';

import '../../program.dart';

class DnDHome extends StatefulWidget {
  DnDHome(this.windowData, this.navigator, {Key? key}) : super(key: key);
  final WindowData windowData;
  final AppNavigator navigator;

  @override
  _DnDHomeState createState() => _DnDHomeState();
}

class _DnDHomeState extends State<DnDHome> {
  @override
  Widget build(BuildContext context) {
    return SparkPage(
      navigator: widget.navigator,
      child: Scaffold(
        appBar: WindowAppBar.build(context,
            navigator: widget.navigator, titleText: "D&D Editor"),
        drawer: null,
        body: Center(
          child: ListView(
            children: [
              Text("Name: "),
              Text("Class: "),
              Text("Level: "),
              Column(
                children: [
                  Text("Strength: "),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
