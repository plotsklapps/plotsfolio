import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plotsfolio/state/expansiontile_controller.dart';
import 'package:signals/signals_flutter.dart';

class HomeScreenBackground extends StatelessWidget {
  const HomeScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // ScrollConfiguration is used to have swipable en tappable areas for
    // non-touch devices.
    return Positioned.fill(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          scrollbars: false,
          dragDevices: <PointerDeviceKind>{
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.trackpad,
          },
        ),
        child: GestureDetector(
          onTap: () {
            // Collapse the 'notification bar' only when it's expanded.
            if (sExpansionTileController.watch(context).isExpanded) {
              sExpansionTileController.watch(context).collapse();
            }
          },
          onVerticalDragDown: (DragDownDetails details) {
            // Expand the 'notification bar' only when it's collapsed.
            if (!sExpansionTileController.watch(context).isExpanded) {
              sExpansionTileController.watch(context).expand();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Opacity(
              // The background image is a bit transparent.
              opacity: 0.4,
              child: Image.asset(
                'assets/images/plotsklappsLogoH.png',
                // The image is stretched to fit the width of the screen.
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
