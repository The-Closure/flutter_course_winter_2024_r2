import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/core/config/di.dart';
import 'package:something/view/splash_page.dart';

import 'view/home_page.dart';

// late SharedPreferences storage;
void main() async {
  // storage = await SharedPreferences.getInstance();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashPage(),
    );
  }
}
