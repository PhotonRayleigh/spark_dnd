import 'package:flutter/material.dart';
import 'package:spark_dnd/app/components/main_comp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spark_dnd/app/components/pc_sheet.dart';
import 'package:spark_dnd/app/screens/pc_view.dart';

import 'package:spark_lib/spark_di.dart';
import 'package:spark_lib/notifications/notifications.dart';

import '../../program.dart';

/*
  I'm starting to feel real uncertain about this IoC thing.
  I keep having to fight against it to make my program work.
  It might be worth canning it in favor of service locators.

  Constructor based dependencies is nice, except when you need some
  of your parameters to be dependency injected, and some of them
  to be added at runtime. For the case of Widgets, this isn't possible
  as they are intended by Flutter to be immutable.

  So all the benefit of using DI ends up tossed into the wind if even just
  one constructor parameter is runtime decided.

  So... what should I do then? 
  Service locator. 

  Here's what I'm seeing: DI is great for decoupling and making sure everything
  you need is available up front. But the moment you have mixed requirements
  for a class constructor, it fails. So, that leaves me accessing only real
  singletons from DI, or produce copies that don't change their constructor
  requirements over time.

  Anything that isn't a singleton may as well just get directly instanced,
  unless you are working from interfaces or abstract methods (in which case
  you register a factory to produce what you need).

  So at that point, why am I relying on DI?

  I can use a service locator, GetIt to register my singletons or 
  interface factories just like in DI. And it allows for runtime constructor
  parameters as needed, since the class just asks for the objects itself.
  The drawback to testing is that you need to identify what services the tested class
  wants and register them, but it otherwise works exactly like DI. 
  Coupling is basically the same.

  So, I'm going to do that. I am going to convert my DI based implementation to
  service locator. It will be much more sane to deal with, I think, for Flutter.
  It will work perfectly fine with cubits and everything else.

  I still may replace bloc though. The immutable state really doesn't mean anything
  to me. I think I would rather just use an observer pattern. Bloc does that
  part well though.

  Anyway, to summarize: I am switching to GetIt instead of the dependency injector.
  This gives my singletons a place to live, a way to make interface factory
  functions, and still have usable constructors for my Widget classes.
*/

class DnDHome extends StatefulWidget {
  DnDHome(this.windowData, this.navigator, this.mainComp, {Key? key})
      : super(key: key);
  final WindowData windowData;
  final AppNavigator navigator;
  final MainCompCubit mainComp;
  // final PCView pcView;

  @override
  _DnDHomeState createState() => _DnDHomeState();
}

class _DnDHomeState extends State<DnDHome> {
  @override
  void initState() {
    super.initState();
    // Use mainComp to fetch list of character sheets
    // then display them.
  }

  @override
  Widget build(BuildContext context) {
    return SparkPage(
      navigator: widget.navigator,
      child: Scaffold(
        appBar: WindowAppBar.build(context,
            navigator: widget.navigator, titleText: "D&D Editor"),
        drawer: drawer,
        body: Column(
          children: [
            BlocBuilder<MainCompCubit, MainCompState>(
              bloc: widget.mainComp,
              builder: (context, state) => ListView(
                shrinkWrap: true,
                children: [
                  for (var item in state.sheets)
                    ListTile(
                      title: Text(item.name),
                      onTap: () {
                        widget.navigator.navigateTo(PCView(
                          widget.navigator,
                          widget.mainComp.loadSheet(item),
                        ));
                      },
                    ),
                ],
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("New")),
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
