import 'package:signals/signals.dart';

// The sFont signal is used to change the font of the application.
// In main.dart this signal is watched by sFont.watch(context). This feature
// is not yet implemented.
final Signal<String> sFont = signal<String>('Teko', debugLabel: 'sFont');
