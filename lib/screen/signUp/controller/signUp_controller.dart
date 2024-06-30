import 'package:advance_exam/utils/import.dart';

class SignUpController extends GetxController {
  RxBool isValid = false.obs;
  RxString errorMessage = ''.obs;

  bool validatePassword(String password) {
    if (password.length < 6) {
      errorMessage.value =
          '${errorMessage.value} Password must be longer than 6 characters.\n';
      return false;
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      errorMessage.value =
          '• ${errorMessage.value}Uppercase letter is missing.\n';
      return false;
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      errorMessage.value =
          '• ${errorMessage.value}Lowercase letter is missing.\n';
      return false;
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      errorMessage.value = '• ${errorMessage.value}Digit is missing.\n';
      return false;
    }
    if (!RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(password)) {
      errorMessage.value =
          '• ${errorMessage.value}Special character is missing.\n';
      return false;
    }
    return true;
  }
}
