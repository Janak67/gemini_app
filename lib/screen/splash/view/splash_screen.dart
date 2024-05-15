import 'package:advance_exam/utils/helper/fire_helper.dart';
import 'package:advance_exam/utils/helper/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  bool? status;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    animation = Tween<double>(begin: 1.0, end: 1.2).animate(controller!);
    // bool isLogin = FireHelper.fireHelper.checkUser();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAllNamed('intro');
        // Get.offAllNamed(status == false || status == null
        //     ? 'intro'
        //     : isLogin == false
        //         ? 'login'
        //         : 'home');
      },
    );
    // createIntro();
  }

  // Future<void> createIntro() async {
  //   status = await ShareHelper.shareHelper.getIntro();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: AnimatedBuilder(
            animation: animation!,
            builder: (context, child) {
              return Transform.scale(
                scale: animation!.value,
                child: Image.asset('assets/img/gemini.jpg'),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
