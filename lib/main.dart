import 'package:advance_exam/firebase_options.dart';
import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/utils/app_routes.dart';
import 'package:advance_exam/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LikeController controller = Get.put(LikeController());
  runApp(
    Obx(
      () {
        controller.changeTheme();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.isLight.value ? lightTheme : darkTheme,
          routes: screen_routes,
          // initialRoute: 'intro',
        );
      },
    ),
  );
}
