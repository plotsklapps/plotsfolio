import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/utils/utils.dart';

class CalculatorSideMenu extends StatelessWidget {
  const CalculatorSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Calculator PWA',
          style: TextStyle(fontSize: 32, color: Utils.gunMetal),
        ).animate().fade(delay: 400.ms, duration: 800.ms),
        const SizedBox(height: 16),
        const Text(''),
      ],
    );
  }
}
