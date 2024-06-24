// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCaX-gP6bt____us4C_HNgcgNrPQaCh_k4',
    appId: '1:194129366559:web:268fc61268f1b46e500f2a',
    messagingSenderId: '194129366559',
    projectId: 'plotsfolio',
    authDomain: 'plotsfolio.firebaseapp.com',
    storageBucket: 'plotsfolio.appspot.com',
    measurementId: 'G-E9L5RJZEDP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPE7YAASrnuCHyA1Gi9JV83IgX3nyqev0',
    appId: '1:194129366559:android:cf94387356673930500f2a',
    messagingSenderId: '194129366559',
    projectId: 'plotsfolio',
    storageBucket: 'plotsfolio.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiEMvwoEObXcylOWr3dktyEzTI2LlUVwE',
    appId: '1:194129366559:ios:0a5993588f65ff3d500f2a',
    messagingSenderId: '194129366559',
    projectId: 'plotsfolio',
    storageBucket: 'plotsfolio.appspot.com',
    iosBundleId: 'dev.plotsklapps.plotsfolio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiEMvwoEObXcylOWr3dktyEzTI2LlUVwE',
    appId: '1:194129366559:ios:0a5993588f65ff3d500f2a',
    messagingSenderId: '194129366559',
    projectId: 'plotsfolio',
    storageBucket: 'plotsfolio.appspot.com',
    iosBundleId: 'dev.plotsklapps.plotsfolio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCaX-gP6bt____us4C_HNgcgNrPQaCh_k4',
    appId: '1:194129366559:web:875c35cee4b33fb9500f2a',
    messagingSenderId: '194129366559',
    projectId: 'plotsfolio',
    authDomain: 'plotsfolio.firebaseapp.com',
    storageBucket: 'plotsfolio.appspot.com',
    measurementId: 'G-JBD2ZQMHPE',
  );

}