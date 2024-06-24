import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plotsfolio/responsive_layout.dart';
import 'package:plotsfolio/screens/welcomescreen/welcome_screen.dart';
import 'package:plotsfolio/screens/welcomescreen/welcome_sidemenu.dart';
import 'package:plotsfolio/utils/utils.dart';

// This is the main splash screen. It will be shown when the app is started.
// If the screen is >840 pixels wide, the SplashScreenSideMenu will be shown
// as well. The Timer is used to navigate to the WelcomeScreen after 3 seconds.

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  // Declare a Timer variable (used in the initState method).
  late final Timer timer;

  @override
  void initState() {
    super.initState();

    // Initialize the Timer variable with a duration of 3 seconds.
    // When the timer expires, navigate to the WelcomeScreen.
    timer = Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return const ResponsiveLayout(
              screen: WelcomeScreen(),
              sideMenu: WelcomeScreenSideMenu(),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a Scaffold with a background color of DEDEDE (light gray) and
    // the plotsklapps logo in the center of the screen with a giant
    // CircularProgressIndicator in the back, to the right of it.
    return Scaffold(
      backgroundColor: const Color(0xFFDEDEDE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 32),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 6,
                    color: Utils.electricBlue,
                  ),
                ),
              ),
            ),
            Center(child: Image.asset('assets/images/plotsklappsLogoH.png')),
          ],
        ),
      ),
    );
  }
}
