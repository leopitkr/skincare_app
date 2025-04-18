import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Firebase 앱에서 사용할 기본 [FirebaseOptions]입니다.
///
/// 예시:
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
          'Windows 플랫폼에 대한 DefaultFirebaseOptions가 구성되지 않았습니다 - '
          'FlutterFire CLI를 다시 실행하여 재구성할 수 있습니다.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'Linux 플랫폼에 대한 DefaultFirebaseOptions가 구성되지 않았습니다 - '
          'FlutterFire CLI를 다시 실행하여 재구성할 수 있습니다.',
        );
      default:
        throw UnsupportedError(
          '이 플랫폼은 DefaultFirebaseOptions를 지원하지 않습니다.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCq4OgxHSxMGlXIKNgbG76_oJlui4Cz4rM',
    appId: '1:920722403443:web:14a5a27a6686fdcfc7ba06',
    messagingSenderId: '920722403443',
    projectId: 'dermdbmac',
    authDomain: 'dermdbmac.firebaseapp.com',
    storageBucket: 'dermdbmac.firebasestorage.app',
    measurementId: 'G-YX985B46ZW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq4OgxHSxMGlXIKNgbG76_oJlui4Cz4rM',
    appId: '1:920722403443:android:14a5a27a6686fdcfc7ba06',
    messagingSenderId: '920722403443',
    projectId: 'dermdbmac',
    storageBucket: 'dermdbmac.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCq4OgxHSxMGlXIKNgbG76_oJlui4Cz4rM',
    appId: '1:920722403443:ios:14a5a27a6686fdcfc7ba06',
    messagingSenderId: '920722403443',
    projectId: 'dermdbmac',
    storageBucket: 'dermdbmac.firebasestorage.app',
    iosClientId: '920722403443-abcdefghijklmnopqrstuvwxyz.apps.googleusercontent.com',
    iosBundleId: 'com.example.skincareApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCq4OgxHSxMGlXIKNgbG76_oJlui4Cz4rM',
    appId: '1:920722403443:macos:14a5a27a6686fdcfc7ba06',
    messagingSenderId: '920722403443',
    projectId: 'dermdbmac',
    storageBucket: 'dermdbmac.firebasestorage.app',
    iosClientId: '920722403443-abcdefghijklmnopqrstuvwxyz.apps.googleusercontent.com',
    iosBundleId: 'com.example.skincareApp',
  );
} 