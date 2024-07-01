import 'package:signals/signals_flutter.dart';

final Signal<bool> isSideMenuOpen =
    signal<bool>(false, debugLabel: 'isSideMenuOpen');
