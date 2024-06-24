// This is the side menu that will be shown when the screen is >840 pixels wide.
// It has a short animation that fades in the text and flips the logo
// vertically.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/utils/utils.dart';

class WelcomeScreenSideMenu extends StatelessWidget {
  const WelcomeScreenSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Text(
          "You've reached my portfolio PWA! Thanks for visiting, but this "
          'is a work in progress for now, please come back later!',
          style: TextStyle(fontSize: 24, color: Utils.gunMetal),
        ).animate().fade(delay: 400.ms, duration: 800.ms),
        const SizedBox(height: 32),
        Image.asset('assets/images/plotsklappsHi.gif')
            .animate()
            .fade(delay: 1200.ms, duration: 800.ms)
            .flipV(delay: 1200.ms, duration: 800.ms),
      ],
    );
  }
}
