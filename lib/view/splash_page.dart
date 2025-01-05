import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:something/core/config/di.dart';
import 'package:something/view/home_page.dart';
import 'package:something/view/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      // sl.get<SharedPreferences>().clear();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return sl.get<SharedPreferences>().getString('token') != null
              ? const HomePage()
              : const LoginPage();
        },
      ));
    });
    return Scaffold(
      backgroundColor: const Color(0xff1b2c5a),
      body: Center(
        child: Image.asset('assets/images/app_logo.jpg'),
      ),
    );
  }
}
