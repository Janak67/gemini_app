import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxBool isHidden = true.obs;

  void togglePasswordView() {
    isHidden.value = !isHidden.value;
    update();
  }
}
