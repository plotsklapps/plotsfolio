import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:plotsfolio/responsive_layout.dart';
import 'package:plotsfolio/screens/homescreen/home_screen.dart';
import 'package:plotsfolio/screens/homescreen/home_sidemenu.dart';
import 'package:plotsfolio/screens/welcomescreen/page_indicator.dart';
import 'package:plotsfolio/state/current_page.dart';
import 'package:plotsfolio/state/page_controller.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:signals/signals_flutter.dart';

// This Welcome Screen is like an onboarding screen. It shows a few slides
// with images and text to introduce plotsklapps to the visitor. It also
// shows a small indicator at the bottom to show the current page.
// Lastly, it has two FAB's, one to go to the next page and one to skip the
// onboarding and go to the HomeScreen.

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDEDEDE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: <Widget>[
            // ScrollConfiguration makes sure that the PageView can be scrolled
            // with touch, mouse, stylus and trackpad. This is needed because
            // as a PWA, the input can be different from mobile.
            ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                scrollbars: false,
                dragDevices: <PointerDeviceKind>{
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: sPageController.watch(context),
                onPageChanged: (int newPage) {
                  sCurrentPage.value = newPage;
                },
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // The nested ternaries handle the different
                      // screen states.
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: index == 0
                            ? Utils.welcomeScreen1Image
                            : index == 1
                                ? Utils.welcomeScreen2Image
                                : Utils.welcomeScreen3Image,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        index == 0
                            ? Utils.welcomeScreen1Title
                            : index == 1
                                ? Utils.welcomeScreen2Title
                                : Utils.welcomeScreen3Title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Utils.gunMetal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        index == 0
                            ? Utils.welcomeScreen1Text
                            : index == 1
                                ? Utils.welcomeScreen2Text
                                : Utils.welcomeScreen3Text,
                        style: const TextStyle(
                          color: Utils.gunMetal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // The nested ternaries handle the different
                  // screen states.
                  PageIndicator(
                    pageIndex: 0,
                    pageController: sPageController.watch(context),
                    currentPage: sCurrentPage.watch(context),
                  ),
                  const SizedBox(width: 8),
                  PageIndicator(
                    pageIndex: 1,
                    pageController: sPageController.watch(context),
                    currentPage: sCurrentPage.watch(context),
                  ),
                  const SizedBox(width: 8),
                  PageIndicator(
                    pageIndex: 2,
                    pageController: sPageController.watch(context),
                    currentPage: sCurrentPage.watch(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (sCurrentPage.watch(context) == 2) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return const ResponsiveLayout(
                    screen: HomeScreen(),
                    sideMenu: HomeScreenSideMenu(),
                  );
                },
              ),
            );
          } else {
            sPageController.watch(context).nextPage(
                  duration: 400.ms,
                  curve: Curves.easeInOut,
                );
          }
        },
        backgroundColor:
            sCurrentPage.watch(context) == 2 ? Utils.flame : Utils.gunMetal,
        child: Icon(
          sCurrentPage.watch(context) == 2
              ? LucideIcons.chevronRight
              : LucideIcons.chevronsRight,
          color:
              sCurrentPage.watch(context) == 2 ? Utils.gunMetal : Utils.flame,
        ),
      ),
    );
  }
}
