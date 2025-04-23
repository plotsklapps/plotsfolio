import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

// The ExpansionTileController is used to control the expansion of the
// ExpansionTile in the NotificationBar. It is a signal so it can be used
// from swiping the homescreen.
final Signal<ExpansibleController> sExpansionTileController =
    signal(ExpansibleController(), debugLabel: 'sExpansionTileController');
