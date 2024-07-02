import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/utils/utils.dart';

class WeatherSideMenu extends StatelessWidget {
  const WeatherSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Portfolio PWA by',
          style: TextStyle(fontSize: 32, color: Utils.gunMetal),
        ).animate().fade(delay: 400.ms, duration: 800.ms),
        const SizedBox(height: 16),
        Image.asset('assets/images/plotsklappsLogoV.png')
            .animate()
            .fade(delay: 1200.ms, duration: 800.ms)
            .flipV(delay: 1200.ms, duration: 800.ms),
      ],
    );
  }
}
