import 'package:advance_exam/utils/import.dart';

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
