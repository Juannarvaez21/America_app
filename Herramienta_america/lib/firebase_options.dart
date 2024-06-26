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
    apiKey: 'AIzaSyCouqyVv9pDnvuJo9jWN31mUUWYAagUHG8',
    appId: '1:27548206084:web:a56920835ebc62b0792151',
    messagingSenderId: '27548206084',
    projectId: 'americaradio-5135b',
    authDomain: 'americaradio-5135b.firebaseapp.com',
    storageBucket: 'americaradio-5135b.appspot.com',
    measurementId: 'G-NRB9THCS2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxY_WOrSiSGqCVXOg08JVoMprqWVrcIBk',
    appId: '1:27548206084:android:897020d4732c6a93792151',
    messagingSenderId: '27548206084',
    projectId: 'americaradio-5135b',
    storageBucket: 'americaradio-5135b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVe-leaQ5V0h4LLO5EyWYxgni6Cu2Z6-8',
    appId: '1:27548206084:ios:ff0f2351122ad79e792151',
    messagingSenderId: '27548206084',
    projectId: 'americaradio-5135b',
    storageBucket: 'americaradio-5135b.appspot.com',
    iosBundleId: 'com.example.americastereo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVe-leaQ5V0h4LLO5EyWYxgni6Cu2Z6-8',
    appId: '1:27548206084:ios:ff0f2351122ad79e792151',
    messagingSenderId: '27548206084',
    projectId: 'americaradio-5135b',
    storageBucket: 'americaradio-5135b.appspot.com',
    iosBundleId: 'com.example.americastereo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCouqyVv9pDnvuJo9jWN31mUUWYAagUHG8',
    appId: '1:27548206084:web:4703f89bfc09d161792151',
    messagingSenderId: '27548206084',
    projectId: 'americaradio-5135b',
    authDomain: 'americaradio-5135b.firebaseapp.com',
    storageBucket: 'americaradio-5135b.appspot.com',
    measurementId: 'G-BKLWTM8QK7',
  );

}