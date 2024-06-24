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

  static final Uri xURL = Uri.parse('https://x.com/plotsklapps');
  static Future<void> launchXURL() async {
    if (!await launchUrl(Utils.xURL)) {
      throw Exception('Could not launch ${Utils.xURL}');
    }
  }

  static final Uri githubURL = Uri.parse('https://github.com/plotsklapps');
  static Future<void> launchGithubURL() async {
    if (!await launchUrl(Utils.githubURL)) {
      throw Exception('Could not launch ${Utils.githubURL}');
    }
  }

  static final Uri hashnodeURL = Uri.parse('https://hashnode.com/@plotsklapps');
  static Future<void> launchHashnodeURL() async {
    if (!await launchUrl(Utils.hashnodeURL)) {
      throw Exception('Could not launch ${Utils.hashnodeURL}');
    }
  }
}
