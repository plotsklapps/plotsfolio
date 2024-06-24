import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/screens/appdrawer/appdrawer_screen.dart';
import 'package:plotsfolio/utils/utils.dart';

class HomeScreenAppdrawerIcon extends StatelessWidget {
  const HomeScreenAppdrawerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
