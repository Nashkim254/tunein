import 'package:tunein/components/bottomPanel.dart';
import 'package:tunein/components/playing.dart';
import 'package:tunein/globals.dart';
import 'package:tunein/plugins/nano.dart';
import 'package:tunein/root.dart';
import 'package:tunein/services/layout.dart';
import 'package:tunein/services/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

Nano nano = Nano();

void main() async {
  await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
  setupLocator();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final layoutService = locator<LayoutService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Root(),
            ),
            Container(
              height: 60,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  final Widget child;
  Wrapper({Key key, this.child}) : super(key: key);

  final layoutService = locator<LayoutService>();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: NowPlayingScreen(),
      controller: layoutService.globalPanelController,
      minHeight: 60,
      maxHeight: MediaQuery.of(context).size.height,
      backdropEnabled: true,
      backdropOpacity: 0.5,
      parallaxEnabled: true,
      collapsed: Material(
        child: BottomPanel(),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
      ),
    );
  }
}