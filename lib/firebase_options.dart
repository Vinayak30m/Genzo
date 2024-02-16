// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC5GDr747Hq6KSx1XaRN4rb1ACutyGh4Og',
    appId: '1:45199565954:web:27035d02a97385b47b809b',
    messagingSenderId: '45199565954',
    projectId: 'genzo-c7d06',
    authDomain: 'genzo-c7d06.firebaseapp.com',
    storageBucket: 'genzo-c7d06.appspot.com',
    measurementId: 'G-9WEW6LZMYZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqd7xsLBaF1akuAXbMzcjk9WjiqqQ_DyU',
    appId: '1:45199565954:android:2fc0e96c9137d1a37b809b',
    messagingSenderId: '45199565954',
    projectId: 'genzo-c7d06',
    storageBucket: 'genzo-c7d06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApHUsXgUFpYAFm1ldtCLp_Pw4ZtjLtjVM',
    appId: '1:45199565954:ios:63762345afaacb6c7b809b',
    messagingSenderId: '45199565954',
    projectId: 'genzo-c7d06',
    storageBucket: 'genzo-c7d06.appspot.com',
    iosBundleId: 'com.example.genzo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyApHUsXgUFpYAFm1ldtCLp_Pw4ZtjLtjVM',
    appId: '1:45199565954:ios:b87f4a44abb1d0d87b809b',
    messagingSenderId: '45199565954',
    projectId: 'genzo-c7d06',
    storageBucket: 'genzo-c7d06.appspot.com',
    iosBundleId: 'com.example.genzo.RunnerTests',
  );
}
