// lib/main.dart

import 'package:appdemo/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
