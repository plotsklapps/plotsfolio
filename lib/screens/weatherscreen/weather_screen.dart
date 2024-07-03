// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plotsfolio/screens/weatherscreen/weather_services.dart';
import 'package:plotsfolio/state/weather_signals.dart';
import 'package:plotsfolio/utils/utils.dart';
import 'package:signals/signals_flutter.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
    this.locationWeather,
  });

  final dynamic locationWeather;

  @override
  WeatherScreenState createState() {
    return WeatherScreenState();
  }
}

class WeatherScreenState extends State<WeatherScreen> {
  // Set up some variables. Make them 'late', because I will initialize them
  // in the initState().
  late double temperature;
  late int condition;
  late IconData weatherIcon;
  late double tempMin;
  late double tempMax;
  late String cityName;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding.blabla to avoid changing state while building the UI
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // The variables created are being filled with their respective
      // state.
      temperature = sWeatherTemp.value;
      condition = sWeatherCondition.value;
      weatherIcon = sWeatherIcon.value;
      tempMin = sWeatherTempMin.value;
      tempMax = sWeatherTempMax.value;
      cityName = sWeatherCityName.value;
      // Call the updateUI method, see below.
      updateUI(widget.locationWeather);
    });
  }

  // UpdateUI method fetches the latest weatherData for the current location
  // or cityName provided by the user. Each JSON data piece is stored in
  // their respective provider.
  void updateUI(dynamic weatherData) {
    sWeatherTemp.value = weatherData['main']['temp'] as double;
    sWeatherCondition.value = weatherData['weather'][0]['id'] as int;
    sWeatherIcon.value = weatherModel.getWeatherIcon(sWeatherCondition.value);
    sWeatherTempMin.value = weatherData['main']['temp_min'] as double;
    sWeatherTempMax.value = weatherData['main']['temp_max'] as double;
    sWeatherCityName.value = weatherData['name'] as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.lightGrey,
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(
                  // The icon shown is based on the condition provided by the
                  // weatherModel.
                  sWeatherIcon.watch(context),
                  size: 300,
                  color: Utils.flame,
                ),
                const Text(
                  'Use current location',
                  style: TextStyle(
                    color: Utils.gunMetal,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // Asynchronous method, FIRST store the new
                    // weather data in variable weatherData, then
                    // call updateUI with the new data.
                    final dynamic weatherData =
                        await weatherModel.getLocationWeather();
                    updateUI(weatherData);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.locationDot,
                    size: 32,
                    color: Utils.flame,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 8),
                const Text('Check the weather in another city'),
                const SizedBox(height: 8),
                TextField(
                  onChanged: (String value) {
                    // Purposely NOT updating the signal here
                    // since that will change the UI on the fly,
                    // instead of after the button press.
                    cityName = value;
                  },
                  decoration: InputDecoration(
                    label: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Text>[
                        Text(
                          'Enter city name',
                        ),
                      ],
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: FaIcon(
                        FontAwesomeIcons.city,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        // Asynchronous method, FIRST store the new
                        // weather data in variable weatherData, then
                        // call updateUI with the new data.
                        final dynamic weatherData =
                            await weatherModel.getCityWeather(
                          cityName,
                        );
                        updateUI(weatherData);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.circleArrowRight,
                        color: Utils.flame,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  cursorColor: Utils.gunMetal,
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          // Directly display the contents of the provider.
                          '${sWeatherTemp.watch(context).toStringAsFixed(1)}°C',
                          style: const TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Utils.gunMetal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      // Directly display the contents of the provider.
                      '''Current minimum: ${sWeatherTempMin.watch(context).toStringAsFixed(1)} °C''',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      // Directly display the contents of the provider.
                      '''Current maximum: ${sWeatherTempMax.watch(context).toStringAsFixed(1)} °C''',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  // Directly display the contents of the provider.
                  sWeatherCityName.watch(context),
                  style: const TextStyle(
                    fontSize: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
