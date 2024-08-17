import 'package:flutter/material.dart';
import 'package:task_kafel_company/constant/my_theme.dart';
import 'package:task_kafel_company/constant/routes.dart';
import 'package:task_kafel_company/view/screens/auth/login/login_screen.dart';
import 'package:task_kafel_company/view/screens/auth/register/register_screen.dart';
import 'package:task_kafel_company/view/screens/auth/register/second_register_screen.dart';
import 'package:task_kafel_company/view/screens/home/home_screen.dart';
import 'package:task_kafel_company/view/screens/home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightMode,
      initialRoute: RoutesName.splachScreen,
      routes: {
        RoutesName.loginScreen: (context) => const LoginScreen(),
        RoutesName.registerScreen: (context) => const RegisterScreen(),
        RoutesName.secondRegisterScreen: (context) =>
            const SecondRegisterScreen(),
        RoutesName.homeScreen: (context) => const HomeScreen(),
        RoutesName.splachScreen: (context) => const SplashScreen(),
      },
    );
  }
}
