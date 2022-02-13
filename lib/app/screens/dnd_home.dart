import 'package:flutter/material.dart';

import 'package:spark_lib/custom_window/window_appbar.dart';
import 'package:spark_lib/navigation/spark_nav.dart';
import 'package:spark_lib/notifications/notifications.dart';

import '../../program.dart';

class DnDHome extends StatefulWidget {
  const DnDHome({Key? key}) : super(key: key);

  @override
  _DnDHomeState createState() => _DnDHomeState();
}

class _DnDHomeState extends State<DnDHome> {
  @override
  Widget build(BuildContext context) {
    return SparkPage(
      child: Scaffold(
        appBar: WindowAppBar.build(context, titleText: "D&D Editor"),
        drawer: null,
        body: Center(
          child: ListView(
            children: [
              Text("Seamonkies!"),
              ElevatedButton(
                child: Text("Test"),
                onPressed: () {
                  showSnackBar(context,
                      message: "App name: " + program.windowTitle);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
