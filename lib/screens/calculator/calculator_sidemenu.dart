import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:url_launcher/link.dart';

class CalculatorSideMenu extends StatelessWidget {
  const CalculatorSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewPortConstraints) {
        return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            dragDevices: <PointerDeviceKind>{
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.stylus,
            },
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewPortConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    Utils.calculatorTitle,
                    style: TextStyle(fontSize: 32, color: Utils.gunMetal),
                  ).animate().fade(delay: 400.ms, duration: 800.ms),
                  const SizedBox(height: 16),
                  const Text(
                    Utils.calculatorDescription,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text('Tiny code example:'),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/calculator/calculatorcodesnippet.png',
                    ).animate().fade(delay: 800.ms, duration: 1200.ms).shimmer(
                          delay: 2000.ms,
                          duration: 2400.ms,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Text('For the full code, visit:'),
                  const SizedBox(height: 8),
                  Link(
                    uri: Uri.parse(
                      'https://github.com/plotsklapps/plotsfolio/blob/master/lib/screens/calculator/calculator_screen.dart',
                    ),
                    builder: (BuildContext context, FollowLink? followLink) {
                      return TextButton(
                        onPressed: followLink,
                        child: const Text('Calculator respository on Github'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
