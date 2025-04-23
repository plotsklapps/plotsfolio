import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:plotsfolio/phone_frame.dart';
import 'package:plotsfolio/state/sidemenu_open.dart';
import 'package:plotsfolio/utils/utils.dart';

// The ResponsiveLayout class is a stateless widget that takes a screen widget
// as a parameter and returns a layout based on the screen width.
// For screens larger than 840 pixels, it returns a scaffold with a side menu
// and the screen widget inside a phone frame (see phone_frame.dart).
// For screens smaller than 840 pixels, it returns just the screen widget.

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.screen,
    required this.sideMenu,
    super.key,
  });

  final Widget screen;
  final Widget sideMenu;

  @override
  Widget build(BuildContext context) {
    // Fetch the screen width.
    final double screenWidth = MediaQuery.sizeOf(context).width;
    // Fetch the screen height.
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        // If the screen width is less than 840 pixels, return only the
        // screen widget.
        if (constraints.maxWidth < 840) {
          // Set the signal to false.
          sSideMenu.value = false;
          return screen;
        } else {
          // Set the signal to true.
          sSideMenu.value = true;

          // If the screen width is 840 pixels or more, return a scaffold
          // with a side menu and the screen widget inside a phone frame.
          return Scaffold(
            backgroundColor: const Color(0xFF32434F),
            body: Row(
              children: <Widget>[
                // Side menu, fades/slides in from the left (800.ms).
                Row(
                  children: <Widget>[
                    // Container that holds the side menu, that will be
                    // unique on every screen.
                    Container(
                      decoration: const BoxDecoration(
                        color: Utils.lightGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          width: screenWidth * 0.24,
                          child: sideMenu,
                        ),
                      ),
                    ),

                    // Divider with a short vertical animation (800.ms) after
                    // a delay of 800.ms.
                    Container(
                      width: 8,
                      color: Utils.flame,
                    ).animate().moveY(
                          delay: 800.ms,
                          duration: 800.ms,
                          begin: -screenHeight,
                        ),
                  ],
                ).animate().fade(duration: 400.ms).moveX(
                      duration: 800.ms,
                      begin: -screenWidth,
                    ),

                // Phone frame with screen widget.
                Expanded(child: PhoneFrame(child: screen)),
              ],
            ),
          );
        }
      },
    );
  }
}
