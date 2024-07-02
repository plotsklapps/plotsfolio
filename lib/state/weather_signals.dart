import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signals/signals_flutter.dart';

late double temperature;
late int condition;
late IconData weatherIcon;
late double tempMin;
late double tempMax;
late String cityName;

final Signal<double> sWeatherTemp = Signal<double>(0);

final Signal<int> sWeatherCondition = Signal<int>(0);

final Signal<IconData> sWeatherIcon =
    Signal<IconData>(FontAwesomeIcons.exclamation);

final Signal<double> sWeatherTempMin = Signal<double>(0);

final Signal<double> sWeatherTempMax = Signal<double>(0);

final Signal<String> sWeatherCityName = Signal<String>('');
