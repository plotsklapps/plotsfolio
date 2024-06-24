import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

// The PageController is used to control the PageView on the WelcomeScreen.
// It is used to animate to the next page when the FAB is pressed.
final Signal<PageController> sPageController = signal<PageController>(
  PageController(),
  debugLabel: 'sPageController',
  autoDispose: true,
);
