import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/obd_signup.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DermAI',
      theme: AppTheme.lightTheme,
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
