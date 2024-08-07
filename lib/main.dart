import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plotsfolio/firebase_options.dart';
import 'package:plotsfolio/responsive_layout.dart';
import 'package:plotsfolio/screens/splashscreen/splash_screen.dart';
import 'package:plotsfolio/screens/splashscreen/splash_sidemenu.dart';
import 'package:plotsfolio/state/font_signal.dart';
import 'package:signals/signals_flutter.dart';

Future<void> main() async {
  // Mandatory.
  WidgetsFlutterBinding.ensureInitialized();

  // When on Android, set the system UI mode to immersive (hides the
  // status bar). This only happens if the PWA is installed to the
  // device.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  // This PWA is hosted via Firebase Hosting. Initialize Firebase with the
  // default options.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Let's go.
  runApp(const MainEntry());
}

class MainEntry extends StatelessWidget {
  const MainEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plotsfolio',
      debugShowCheckedModeBanner: false,

      // Use the font from the sFont signal. In a later stadium, the portfolio
      // visitor will be able to change the font.
      theme: ThemeData(fontFamily: sFont.watch(context)),

      // Use the responsive layout to display the splash screen. Every
      // ResponsiveLayout needs a screen and screens larger than 840 pixels
      // will also show the side menu.
      home: const ResponsiveLayout(
        screen: SplashScreen(),
        sideMenu: SplashScreenSideMenu(),
      ),
    );
  }
}
