import 'package:advance_exam/utils/import.dart';

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
