import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/constant/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');

    Timer(const Duration(seconds: 3), () {
      if (email == null) {
        Navigator.of(context).pushReplacementNamed(RoutesName.registerScreen);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(RoutesName.homeScreen, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Center(child: Image.asset("assets/images/Login-image.png")),
    );
  }
}
