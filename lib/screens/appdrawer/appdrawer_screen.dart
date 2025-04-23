import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/responsive_layout.dart';
import 'package:plotsfolio/screens/calculator/calculator_screen.dart';
import 'package:plotsfolio/screens/calculator/calculator_sidemenu.dart';
import 'package:plotsfolio/screens/dadjokes/dadjokes_screen.dart';
import 'package:plotsfolio/screens/dadjokes/dadjokes_sidemenu.dart';
import 'package:plotsfolio/screens/weatherscreen/weather_sidemenu.dart';
import 'package:plotsfolio/screens/weatherscreen/weatherloading_screen.dart';
import 'package:plotsfolio/utils/utils.dart';

class AppdrawerScreen extends StatelessWidget {
  const AppdrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.gunMetal.withValues(alpha: 0.4),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const AppdrawerIcon(
                icon: FontAwesomeIcons.xTwitter,
                onPressed: Utils.launchXURL,
              ),
              const AppdrawerIcon(
                icon: FontAwesomeIcons.github,
                onPressed: Utils.launchGithubURL,
              ),
              const AppdrawerIcon(
                icon: FontAwesomeIcons.hashnode,
                onPressed: Utils.launchHashnodeURL,
              ),
              AppdrawerIcon(
                icon: FontAwesomeIcons.calculator,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ResponsiveLayout(
                          screen: CalculatorScreen(),
                          sideMenu: CalculatorSideMenu(),
                        );
                      },
                    ),
                  );
                },
              ),
              AppdrawerIcon(
                icon: FontAwesomeIcons.cloudSun,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ResponsiveLayout(
                          screen: WeatherLoadingScreen(),
                          sideMenu: WeatherSideMenu(),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AppdrawerIcon(
                icon: FontAwesomeIcons.faceGrinTongueWink,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return const ResponsiveLayout(
                          screen: DadJokesScreen(),
                          sideMenu: DadjokesSidemenu(),
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.hashnode,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.hashnode,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.hashnode,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.hashnode,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const FaIcon(
                    FontAwesomeIcons.hashnode,
                    color: Utils.gunMetal,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
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
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AppdrawerIcon extends StatelessWidget {
  const AppdrawerIcon({
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
