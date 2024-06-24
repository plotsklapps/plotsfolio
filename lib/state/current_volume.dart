import 'package:signals/signals_flutter.dart';

// The current volume is not used for anything else than the slider in the
// NotificationBar. In the future, it will be a theme slider that will change
// the colors of the app.
final Signal<double> sCurrentVolume = signal<double>(
  24,
  debugLabel: 'sCurrentVolume',
  autoDispose: true,
);
