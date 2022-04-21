import 'package:flutter/material.dart';
import 'package:spark_dnd/app/components/main_comp.dart';
import 'package:spark_dnd/app/components/pc_sheet_comp.dart';
import 'package:spark_dnd/app/screens/pc_view.dart';
import 'package:spark_lib/custom_window/window_appbar.dart';
import 'package:spark_lib/custom_window/window_data.dart';

import 'package:spark_lib/events/notifier.dart';
import 'package:spark_lib/navigation/spark_nav.dart';
import 'package:spark_lib/notifications/notifications.dart';
import 'package:spark_lib/filesystem/filesystem_manager.dart';

class DnDHome extends StatefulWidget {
  DnDHome(this.windowData, this.navigator, this.mainComp, {Key? key})
      : super(key: key);
  final WindowData windowData;
  final AppNavigator navigator;
  final MainComp mainComp;
  // final PCView pcView;

  @override
  _DnDHomeState createState() => _DnDHomeState();
}

class _DnDHomeState extends State<DnDHome> {
  late FileSystemManager fsManager;
  String dirText = "";
  @override
  void initState() {
    super.initState();
    // Use mainComp to fetch list of character sheets
    // then display them.

    fsManager = FileSystemManager.I;
  }

  @override
  Widget build(BuildContext context) {
    return SparkPage(
      navigator: widget.navigator,
      child: Scaffold(
        appBar: WindowAppBar.build(context, titleText: "D&D Editor"),
        drawer: drawer,
        body: Column(
          children: [
            StreamBuilder(
              stream: widget.mainComp.stream,
              builder: (context, _) => ListView(
                shrinkWrap: true,
                children: [
                  for (var item in widget.mainComp.state.sheets)
                    ListTile(
                      title: Text(item.name),
                      onTap: () {
                        widget.navigator.navigateTo(PCView(
                          widget.mainComp.loadSheet(item),
                        ));
                      },
                    ),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("New")),
            ElevatedButton(
              child: Text("Get Directory"),
              onPressed: () async {
                var path = await fsManager.getUserPickDirectory();
                setState(() {
                  dirText = path ?? "null";
                });
              },
            ),
            Text(dirText),
          ],
        ),
      ),
    );
  }

  Drawer drawer = Drawer(
    child: Column(children: [
      DrawerHeader(child: Text("Options")),
      Text("Placeholder"),
    ]),
  );
}
