import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/screens/appdrawer/appdrawer_screen.dart';
import 'package:plotsfolio/screens/homescreen/home_notificationbar.dart';
import 'package:plotsfolio/screens/homescreen/homescreen_background.dart';
import 'package:plotsfolio/utils/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Utils.lightGrey,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // The background image of the home screen.
            const HomeScreenBackground(),
            // The 'notification bar'.
            const HomeScreenNotificationBar(),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigate to the appdrawer screen.
                    showModalBottomSheet<void>(
                      showDragHandle: true,
                      isScrollControlled: true,
                      barrierLabel: 'Appdrawer',
                      barrierColor: Colors.transparent,
                      backgroundColor: Utils.gunMetal.withOpacity(0.4),
                      context: context,
                      builder: (BuildContext context) {
                        return const AppdrawerScreen();
                      },
                    );
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.anglesUp,
                  ).animate().fadeIn(delay: 800.ms, duration: 1000.ms).moveY(
                        delay: 800.ms,
                        duration: 1000.ms,
                        begin: 40,
                        end: 0,
                      ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  HomeScreenIcon(
                    icon: FontAwesomeIcons.chartLine,
                    onPressed: () {
                      // Navigate to the 'portfolio' screen.
                    },
                  ),
                  HomeScreenIcon(
                    icon: FontAwesomeIcons.wallet,
                    onPressed: () {
                      // Navigate to the 'wallet' screen.
                    },
                  ),
                  HomeScreenIcon(
                    icon: FontAwesomeIcons.gear,
                    onPressed: () {
                      // Navigate to the 'settings' screen.
                    },
                  ),
                  HomeScreenIcon(
                    icon: FontAwesomeIcons.user,
                    onPressed: () {
                      // Navigate to the 'profile' screen.
                    },
                  ),
                  HomeScreenIcon(
                    icon: FontAwesomeIcons.bell,
                    onPressed: () {
                      // Navigate to the 'notifications' screen.
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenIcon extends StatelessWidget {
  const HomeScreenIcon({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        color: Utils.lightGrey,
        border: Border.all(
          color: Utils.gunMetal,
          width: 4,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: IconButton(
        icon: FaIcon(
          icon,
          color: Utils.gunMetal,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
