import 'package:signals/signals_flutter.dart';

// The current page is used to show the correct indicator at the bottom and
// to determine if the FAB should go to the next page or to the HomeScreen.
final Signal<int> sCurrentPage = signal<int>(
  0,
  debugLabel: 'sCurrentPage',
  autoDispose: true,
);
