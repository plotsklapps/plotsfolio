import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plotsfolio/responsive_layout.dart';
import 'package:plotsfolio/screens/weatherscreen/weather_screen.dart';
import 'package:plotsfolio/screens/weatherscreen/weather_services.dart';
import 'package:plotsfolio/screens/weatherscreen/weather_sidemenu.dart';
import 'package:plotsfolio/utils/utils.dart';

class WeatherLoadingScreen extends StatefulWidget {
  const WeatherLoadingScreen({super.key});

  @override
  WeatherLoadingScreenState createState() {
    return WeatherLoadingScreenState();
  }
}

class WeatherLoadingScreenState extends State<WeatherLoadingScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(getLocationData());
  }

  Future<void> getLocationData() async {
    final WeatherModel weatherModel = WeatherModel();
    final dynamic weatherData = await weatherModel.getLocationWeather();

    if (mounted) {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<Widget>(
          builder: (BuildContext context) {
            return ResponsiveLayout(
              screen: WeatherScreen(
                locationWeather: weatherData,
              ),
              sideMenu: const WeatherSideMenu(),
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                strokeWidth: 6,
                color: Utils.electricBlue,
              ),
            ),
            Text(
              'Fetching your location and requesting permissions...',
              style: TextStyle(
                fontSize: 20,
                color: Utils.gunMetal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
