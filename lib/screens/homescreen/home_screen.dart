import 'package:flutter/material.dart';
import 'package:plotsfolio/screens/homescreen/home_appdrawer.dart';
import 'package:plotsfolio/screens/homescreen/home_iconrow.dart';
import 'package:plotsfolio/screens/homescreen/home_notificationbar.dart';
import 'package:plotsfolio/screens/homescreen/homescreen_background.dart';
import 'package:plotsfolio/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      // The 'pop' scope is set to false to prevent the app from closing when
      // the user presses the back button.
      canPop: false,
      child: Scaffold(
        backgroundColor: Utils.lightGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // The background image of the home screen.
            HomeScreenBackground(),
            // The 'notification bar'.
            HomeScreenNotificationBar(),
            // The 'camera cutout'.
            HomeScreenCameraCutout(),
            // The 'app drawer' icon.
            HomeScreenAppdrawerIcon(),
            // The homescreen icons.
            HomeScreenIconRow(),
          ],
        ),
      ),
    );
  }
}
