import 'package:advance_exam/utils/import.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    update();
  }
}
