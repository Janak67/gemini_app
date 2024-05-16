import 'package:advance_exam/screen/home/view/home_screen.dart';
import 'package:advance_exam/screen/intro/view/intro_screen.dart';
import 'package:advance_exam/screen/like/view/like_screen.dart';
import 'package:advance_exam/screen/login/view/login_screen.dart';
import 'package:advance_exam/screen/settings/view/settings_screen.dart';
import 'package:advance_exam/screen/signUp/view/signUp_screen.dart';
import 'package:advance_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'intro': (context) => const IntroScreen(),
  'login': (context) => const LoginScreen(),
  'signUp': (context) => const SignUpScreen(),
  'home': (context) => const HomeScreen(),
  'like': (context) => const LikeScreen(),
  'setting': (context) => const SettingScreen(),
};
