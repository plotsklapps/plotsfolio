// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:portfolio/screens/eduprojects/weather/weather_services.dart';
// import 'package:portfolio/state/weather_provider.dart';
// import 'package:portfolio/utils/utils.dart';
// import 'package:signals/signals_flutter.dart';
//
// class WeatherScreenMobile extends StatefulWidget {
//   const WeatherScreenMobile({
//     super.key,
//     this.locationWeather,
//   });
//   final dynamic locationWeather;
//
//   @override
//   WeatherScreenMobileState createState() {
//     return WeatherScreenMobileState();
//   }
// }
//
// class WeatherScreenMobileState extends State<WeatherScreenMobile> {
//   // Set up some variables. Make them 'late', because I will initialize them
//   // in the initState().
//   late double temperature;
//   late int condition;
//   late IconData weatherIcon;
//   late double tempMin;
//   late double tempMax;
//   late String cityName;
//   WeatherModel weatherModel = WeatherModel();
//
//   @override
//   void initState() {
//     super.initState();
//     // Use WidgetsBinding.blabla to avoid changing state while building the UI
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // The variables created are being filled with their respective
//       // state.
//       temperature = sWeatherTemp.value;
//       condition = sWeatherCondition.value;
//       weatherIcon = sWeatherIcon.value;
//       tempMin = sWeatherTempMin.value;
//       tempMax = sWeatherTempMax.value;
//       cityName = sWeatherCityName.value;
//       // Call the updateUI method, see below.
//       updateUI(widget.locationWeather);
//     });
//   }
//
//   // UpdateUI method fetches the latest weatherData for the current location
//   // or cityName provided by the user. Each JSON data piece is stored in
//   // their respective provider.
//   void updateUI(dynamic weatherData) {
//     sWeatherTemp.value = weatherData['main']['temp'] as double;
//     sWeatherCondition.value = weatherData['weather'][0]['id'] as int;
//     sWeatherIcon.value = weatherModel.getWeatherIcon(sWeatherCondition.value);
//     sWeatherTempMin.value = weatherData['main']['temp_min'] as double;
//     sWeatherTempMax.value = weatherData['main']['temp_max'] as double;
//     sWeatherCityName.value = weatherData['name'] as String;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weather App'),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: <Widget>[
//             Positioned(
//               bottom: 50,
//               left: 100,
//               child: Icon(
//                 sWeatherIcon.watch(context),
//                 size: 300,
//                 color: Utils.kFlame,
//               ),
//             ).animate().fadeIn(
//               duration: const Duration(milliseconds: 2000),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           const Text('Use current location'),
//                           IconButton(
//                             onPressed: () async {
//                               // Asynchronous method, FIRST store the new
//                               // weather data in variable weatherData, then
//                               // call updateUI with the new data.
//                               final dynamic weatherData =
//                               await weatherModel.getLocationWeather();
//                               updateUI(weatherData);
//                             },
//                             icon: const Icon(
//                               FontAwesomeIcons.locationDot,
//                               size: 36,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       const Text('Check the weather in another city'),
//                       const SizedBox(height: 16),
//                       Padding(
//                         padding: const EdgeInsets.all(8),
//                         child: TextField(
//                           onChanged: (String value) {
//                             // Purposely NOT updating the signal here
//                             // since that will change the UI on the fly,
//                             // instead of after the button press.
//                             cityName = value;
//                           },
//                           decoration: const InputDecoration(
//                             label: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Text>[
//                                 Text(
//                                   'Enter city name',
//                                 ),
//                               ],
//                             ),
//                             icon: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: Icon(FontAwesomeIcons.city),
//                             ),
//                           ),
//                           keyboardType: TextInputType.text,
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () async {
//                           // Asynchronous method, FIRST store the new
//                           // weather data in variable weatherData, then call
//                           // updateUI with the new data.
//                           final dynamic weatherData =
//                           await weatherModel.getCityWeather(
//                             cityName,
//                           );
//                           updateUI(weatherData);
//                         },
//                         child: const Text(
//                           'Get Weather',
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               // Directly display the contents of the provider.
//                               '${sWeatherTemp.watch(context)
//                                   .toStringAsFixed(1)}°C',
//                               style: const TextStyle(
//                                 fontSize: 80,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Text(
//                           // Directly display the contents of the provider.
//                           '''Current minimum: ${sWeatherTempMin.watch(context).toStringAsFixed(1)} °C''',
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           // Directly display the contents of the provider.
//                           '''Current maximum: ${sWeatherTempMax.watch(context).toStringAsFixed(1)} °C''',
//                           style: const TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Flexible(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         // Directly display the contents of the provider.
//                         sWeatherCityName.watch(context),
//                         style: const TextStyle(
//                           fontSize: 36,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
