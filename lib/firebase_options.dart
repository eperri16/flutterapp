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
    apiKey: 'AIzaSyBFrQAzAUQwroWwRE7FDx6HuY6nt0SGTPs',
    appId: '1:630504885639:web:58342093bf333e3e82d722',
    messagingSenderId: '630504885639',
    projectId: 'flutter-delivery-app-b3d0c',
    authDomain: 'flutter-delivery-app-b3d0c.firebaseapp.com',
    storageBucket: 'flutter-delivery-app-b3d0c.firebasestorage.app',
    measurementId: 'G-8GHGLHCYFR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyUIp172nYyp0GIt9FzuzqU7GAY4st-x8',
    appId: '1:630504885639:android:bf7e75c74f0c85b282d722',
    messagingSenderId: '630504885639',
    projectId: 'flutter-delivery-app-b3d0c',
    storageBucket: 'flutter-delivery-app-b3d0c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvkLvEPQK_tNk6hO1SF_nWHlMa0QEIvVU',
    appId: '1:630504885639:ios:452836aabaf2ddfe82d722',
    messagingSenderId: '630504885639',
    projectId: 'flutter-delivery-app-b3d0c',
    storageBucket: 'flutter-delivery-app-b3d0c.firebasestorage.app',
    iosBundleId: 'com.example.foodappDeliveryExerciceVsaEp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvkLvEPQK_tNk6hO1SF_nWHlMa0QEIvVU',
    appId: '1:630504885639:ios:452836aabaf2ddfe82d722',
    messagingSenderId: '630504885639',
    projectId: 'flutter-delivery-app-b3d0c',
    storageBucket: 'flutter-delivery-app-b3d0c.firebasestorage.app',
    iosBundleId: 'com.example.foodappDeliveryExerciceVsaEp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFrQAzAUQwroWwRE7FDx6HuY6nt0SGTPs',
    appId: '1:630504885639:web:4cc68171370dfb1382d722',
    messagingSenderId: '630504885639',
    projectId: 'flutter-delivery-app-b3d0c',
    authDomain: 'flutter-delivery-app-b3d0c.firebaseapp.com',
    storageBucket: 'flutter-delivery-app-b3d0c.firebasestorage.app',
    measurementId: 'G-3SGTGQ3WJ9',
  );
}
