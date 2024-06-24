import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/utils/utils.dart';

class HomeScreenIconRow extends StatelessWidget {
  const HomeScreenIconRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
