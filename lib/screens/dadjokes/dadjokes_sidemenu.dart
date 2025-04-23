import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/utils/utils.dart';

class DadjokesSidemenu extends StatelessWidget {
  const DadjokesSidemenu({super.key});

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
                    Utils.dadjokesTitle,
                    style: TextStyle(fontSize: 32, color: Utils.gunMetal),
                  ).animate().fade(delay: 400.ms, duration: 800.ms),
                  const SizedBox(height: 16),
                  const Text(
                    Utils.dadjokesDescription,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text('Tiny code example:'),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const Placeholder().animate().fade(delay: 800.ms, duration: 1200.ms,).shimmer(
                          delay: 2000.ms,
                          duration: 2400.ms,
                        ),
                  ),
                  const SizedBox(height: 16),
                  const Text('For the full code, visit:'),
                  const SizedBox(height: 8),
                  const InkWell(
                    onTap: Utils.launchCalculatorURL,
                    child: Text(
                      'Calculator repository on GitHub',
                      style: TextStyle(color: Colors.blue),
                    ),
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
