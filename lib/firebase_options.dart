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
    apiKey: 'AIzaSyBzf1C5w0mJvurJT-EXYvVewh4-kfQlcyg',
    appId: '1:483871890445:web:25cac8fda8c101bfefc944',
    messagingSenderId: '483871890445',
    projectId: 'fashion-app-1010',
    authDomain: 'fashion-app-1010.firebaseapp.com',
    storageBucket: 'fashion-app-1010.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOjIA-2ME1aBZKo3M7w4F_athQz7GTSmQ',
    appId: '1:483871890445:android:6fae566435ec6607efc944',
    messagingSenderId: '483871890445',
    projectId: 'fashion-app-1010',
    storageBucket: 'fashion-app-1010.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZeTZZFFsSMzfiFCwTru5Vq-_NYXqRDns',
    appId: '1:483871890445:ios:0dca5bcd74ec6701efc944',
    messagingSenderId: '483871890445',
    projectId: 'fashion-app-1010',
    storageBucket: 'fashion-app-1010.appspot.com',
    iosBundleId: 'com.example.fashionApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZeTZZFFsSMzfiFCwTru5Vq-_NYXqRDns',
    appId: '1:483871890445:ios:0dca5bcd74ec6701efc944',
    messagingSenderId: '483871890445',
    projectId: 'fashion-app-1010',
    storageBucket: 'fashion-app-1010.appspot.com',
    iosBundleId: 'com.example.fashionApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBzf1C5w0mJvurJT-EXYvVewh4-kfQlcyg',
    appId: '1:483871890445:web:26aa754d20a69a6fefc944',
    messagingSenderId: '483871890445',
    projectId: 'fashion-app-1010',
    authDomain: 'fashion-app-1010.firebaseapp.com',
    storageBucket: 'fashion-app-1010.appspot.com',
  );
}
