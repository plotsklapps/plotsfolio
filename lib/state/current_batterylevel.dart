import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:battery_plus/battery_plus.dart';
import 'package:signals/signals_flutter.dart';

// Create a Battery object (from the battery_plus package).
final Battery _battery = Battery();

// Create a Signal that will hold the current battery level.
final Signal<String> sBatteryLevel = Signal<String>(
  '85%',
  debugLabel: 'cBatteryLevel',
  autoDispose: true,
);

// This function will update the sBatteryLevel Signal with the current
// battery level. If an error occurs, the Signal will be updated with '85%'.
Future<void> updateBatteryLevel() async {
  try {
    final int batteryLevel = await _battery.batteryLevel;
    sBatteryLevel.value = '$batteryLevel%';
  } on Exception catch (e) {
    sBatteryLevel.value = '85%';
    log('$e');
  }
}
