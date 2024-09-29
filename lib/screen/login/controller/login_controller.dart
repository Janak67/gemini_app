import 'package:advance_exam/utils/import.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;
  var isLoading = false.obs;

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    update();
  }

  // Start loading process
  void startLoading() {
    isLoading.value = true;
  }

  // Stop loading process
  void stopLoading() {
    isLoading.value = false;
  }
}
