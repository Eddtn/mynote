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
    apiKey: 'AIzaSyBbnhkpKZ3VlNsgfFNMw7BQJvqlRV8sh-Y',
    appId: '1:1027423994013:web:6d5f7d6208fffa0affd474',
    messagingSenderId: '1027423994013',
    projectId: 'myeddnote',
    authDomain: 'myeddnote.firebaseapp.com',
    storageBucket: 'myeddnote.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmJVVkiq-ET2QpOZOyYXxz1LxP7j5gfjA',
    appId: '1:1027423994013:android:984a430edc6c72d7ffd474',
    messagingSenderId: '1027423994013',
    projectId: 'myeddnote',
    storageBucket: 'myeddnote.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeVl8JdQOLnWCebCRvVgN2sj_3rcc5er4',
    appId: '1:1027423994013:ios:00ba00f23f727baeffd474',
    messagingSenderId: '1027423994013',
    projectId: 'myeddnote',
    storageBucket: 'myeddnote.appspot.com',
    iosClientId: '1027423994013-l1dc5agpsp32677qulsnrldcctnd22fs.apps.googleusercontent.com',
    iosBundleId: 'com.example.myNotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeVl8JdQOLnWCebCRvVgN2sj_3rcc5er4',
    appId: '1:1027423994013:ios:00ba00f23f727baeffd474',
    messagingSenderId: '1027423994013',
    projectId: 'myeddnote',
    storageBucket: 'myeddnote.appspot.com',
    iosClientId: '1027423994013-l1dc5agpsp32677qulsnrldcctnd22fs.apps.googleusercontent.com',
    iosBundleId: 'com.example.myNotes',
  );
}
