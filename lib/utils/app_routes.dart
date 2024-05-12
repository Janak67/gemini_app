import 'package:advance_exam/screen/home/view/home_screen.dart';
import 'package:advance_exam/screen/like/view/like_screen.dart';
import 'package:advance_exam/screen/login/view/login_screen.dart';
import 'package:advance_exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Map<String, WidgetBuilder> screen_routes = {
  '/': (context) => const SplashScreen(),
  'login': (context) => const LoginScreen(),
  'home': (context) => const HomeScreen(),
  'like': (context) => const LikeScreen(),
};
