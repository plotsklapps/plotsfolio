import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

final Computed<String> sCurrentTime = computed<String>(
  () {
    final DateTime dateTimeNow = DateTime.now();
    final String formattedTime = DateFormat('HH:mm').format(dateTimeNow);
    return formattedTime;
  },
  debugLabel: 'sCurrentTime',
  autoDispose: true,
);
