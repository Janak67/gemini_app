import 'package:advance_exam/screen/like/controller/like_controller.dart';
import 'package:advance_exam/utils/app_routes.dart';
import 'package:advance_exam/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  LikeController controller = Get.put(LikeController());
  runApp(
    Obx(
      () {
        controller.changeTheme();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: controller.isLight.value ? lightTheme : darkTheme,
          routes: screen_routes,
        );
      },
    ),
  );
}
