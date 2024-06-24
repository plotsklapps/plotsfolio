// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:portfolio/state/weather_provider.dart';
//
// // Determine the current position of the device.
// // When the location services are not enabled or permissions
// // are denied the Future will return an error.
// Future<Position> determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future<Position>.error('Location services are disabled.');
//   }
//
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future<Position>.error('Location permissions are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future<Position>.error(
//       '''
// Location permissions are permanently denied, we cannot request permissions.''',
//     );
//   }
//
//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return Geolocator.getCurrentPosition(
//     desiredAccuracy: LocationAccuracy.high,
//   );
// }
//
// class Location {
//   double? latitude;
//   double? longitude;
//
//   Future<void> getCurrentLocation() async {
//     try {
//       // Use Geolocator package and permission sequence to fetch
//       // Position of user.
//       await determinePosition();
//       final Position position = await determinePosition();
//
//       // Use the position of user to retrieve latitude/longitude Position.
//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
// }
//
// class NetworkHelper {
//   NetworkHelper(this.url);
//
//   final String url;
//
//   Future<dynamic> getData() async {
//     final http.Response response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final String data = response.body;
//
//       return jsonDecode(data);
//     } else {
//       if (kDebugMode) {
//         print(response.statusCode);
//       }
//     }
//   }
// }
//
// class WeatherModel {
//   final String apiKey = 'fa5c9b4de78bd4575fb68f2ec0e78b19';
//   final String openWeatherMapURL =
//       'https://api.openweathermap.org/data/2.5/weather';
//
//   Future<dynamic> getCityWeather(String cityName) async {
//     final NetworkHelper networkHelper = NetworkHelper(
//       '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric',
//     );
//
//     sWeatherCityName.value = cityName;
//
//     final dynamic weatherData = await networkHelper.getData();
//     return weatherData;
//   }
//
//   Future<dynamic> getLocationWeather() async {
//     final Location location = Location();
//     await location.getCurrentLocation();
//
//     final NetworkHelper networkHelper = NetworkHelper(
//       '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&'
//           'appid=$apiKey&units=metric',
//     );
//
//     final dynamic weatherData = await networkHelper.getData();
//     return weatherData;
//   }
//
//   IconData getWeatherIcon(int condition) {
//     if (condition < 300) {
//       return FontAwesomeIcons.cloudBolt;
//     } else if (condition < 400) {
//       return FontAwesomeIcons.cloudRain;
//     } else if (condition >= 500 && condition < 511) {
//       return FontAwesomeIcons.cloudShowersHeavy;
//     } else if (condition == 511) {
//       return FontAwesomeIcons.snowflake;
//     } else if (condition > 511 && condition <= 531) {
//       return FontAwesomeIcons.cloudShowersWater;
//     } else if (condition < 700) {
//       return FontAwesomeIcons.snowman;
//     } else if (condition < 800) {
//       return FontAwesomeIcons.smog;
//     } else if (condition == 800) {
//       return FontAwesomeIcons.sun;
//     } else if (condition == 801) {
//       return FontAwesomeIcons.cloud;
//     } else if (condition == 802) {
//       return FontAwesomeIcons.cloudSun;
//     } else if (condition <= 804) {
//       return FontAwesomeIcons.cloudSun;
//     } else {
//       return FontAwesomeIcons.solidCircleQuestion;
//     }
//   }
// }
