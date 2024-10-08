import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

// Big fat dumpclass to store all the constants and utility functions.
class Utils {
  // Appcolors.
  static const Color lightGrey = Color(0xFFDEDEDE);
  static const Color electricBlue = Color(0xFF526E7F);
  static const Color charCoal = Color(0xFF32434F);
  static const Color gunMetal = Color(0xFF172734);
  static const Color flame = Color(0xFFD35A27);

  // WelcomeScreen constants.
  static SvgPicture welcomeScreen1Image =
      SvgPicture.asset('assets/images/undraw/undraw_flutterdev.svg');
  static const String welcomeScreen1Title = 'How nice of you to drop by!';
  static const String welcomeScreen1Text =
      "I'm Jeremy, a Flutter developer from The Netherlands.\nCreating open "
      'source, free-forever Progressive Web Apps is something I really enjoy '
      'doing. I hope you like this one!';

  static SvgPicture welcomeScreen2Image =
      SvgPicture.asset('assets/images/undraw/undraw_pwa.svg');
  static const String welcomeScreen2Title = 'Giving the internet back to you';
  static const String welcomeScreen2Text = 'Just you and your browser. On any '
      "device. That's the power of PWA: Free from ads and big tech. "
      'How the internet was meant to be.';

  static SvgPicture welcomeScreen3Image =
      SvgPicture.asset('assets/images/undraw/undraw_socials.svg');
  static const String welcomeScreen3Title = 'Check out what I can do!';
  static const String welcomeScreen3Text = 'This portfolio is designed to '
      'resemble how you would use your phone. Every app, every widget inside '
      "the 'phone' is designed by me and could run as a separate PWA.";

  // X constants.
  static final Uri xURL = Uri.parse('https://x.com/plotsklapps');

  static Future<void> launchXURL() async {
    if (!await launchUrl(Utils.xURL)) {
      throw Exception('Could not launch ${Utils.xURL}');
    }
  }

  // Github constants.
  static final Uri githubURL = Uri.parse('https://github.com/plotsklapps');

  static Future<void> launchGithubURL() async {
    if (!await launchUrl(Utils.githubURL)) {
      throw Exception('Could not launch ${Utils.githubURL}');
    }
  }

  // Hashnode constants.
  static final Uri hashnodeURL = Uri.parse('https://hashnode.com/@plotsklapps');

  static Future<void> launchHashnodeURL() async {
    if (!await launchUrl(Utils.hashnodeURL)) {
      throw Exception('Could not launch ${Utils.hashnodeURL}');
    }
  }

  // Calculator constants.
  static final Uri calculatorURL = Uri.parse(
    'https://github.com/plotsklapps/plotsfolio/blob/master/lib/screens/calculator/calculator_screen.dart',
  );

  static Future<void> launchCalculatorURL() async {
    if (!await launchUrl(Utils.calculatorURL)) {
      throw Exception('Could not launch ${Utils.calculatorURL}');
    }
  }

  static const String calculatorTitle = 'Calculator';
  static const String calculatorDescription =
      '''A simple calculator app, written in Flutter. It supports basic arithmetic operations via the math_expressions package and displays the result in real-time via setState. Nothing fancy, but a great way to practice with external packages, texteditingcontrollers and setState.''';

  // Dadjokes constants.
  static final Uri dadjokesURL = Uri.parse(
      'https://github.com/plotsklapps/plotsfolio/blob/master/lib/screens/dadjokes/dadjokes_screen.dart');

  static Future<void> launchDadjokesURL() async {
    if (!await launchUrl(Utils.dadjokesURL)) {
      throw Exception('Could not launch ${Utils.dadjokesURL}');
    }
  }

  static const String dadjokesTitle = 'Dad Jokes';
  static const String dadjokesDescription =
      '''Whenever you need a chuckle, dadjokes API will give you one! This app is written in Flutter and uses the RapidAPI dad-jokes endpoint. Just a neat way to practice with fetching and displaying data from an API.''';
}
