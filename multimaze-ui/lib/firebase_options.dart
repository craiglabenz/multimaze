// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBlKSwod0vsMsMJmWNl-YXy2jz4nrh9Sh8',
    appId: '1:851612321128:web:e457fdfd53aa4f8c2302dd',
    messagingSenderId: '851612321128',
    projectId: 'ffmultimaze',
    authDomain: 'ffmultimaze.firebaseapp.com',
    databaseURL: 'https://ffmultimaze-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ffmultimaze.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsU3I9zX_ptRluyV6w7lPMN3chb9_URdk',
    appId: '1:851612321128:ios:a4cbaa4d1e420c3a2302dd',
    messagingSenderId: '851612321128',
    projectId: 'ffmultimaze',
    databaseURL: 'https://ffmultimaze-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ffmultimaze.appspot.com',
    iosClientId: '851612321128-dt46f06mu4bustmsgecm5metd6bgki1u.apps.googleusercontent.com',
    iosBundleId: 'com.example.multimaze',
  );
}
