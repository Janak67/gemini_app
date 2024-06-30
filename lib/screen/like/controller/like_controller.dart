import 'package:advance_exam/utils/import.dart';

class LikeController extends GetxController {
  // RxList<DbModel> searchList = <DbModel>[].obs;

  // Future<void> getData() async {
  //   List<DbModel> favorite = await DbHelper.dbHelper.readData();
  //   searchList.value = favorite;
  // }
  RxBool isLight = true.obs;

  void copyToClipboard(String data) {
    Clipboard.setData(
      ClipboardData(text: data),
    );
  }

  void changeTheme() async {
    bool? isTheme = await ShareHelper.shareHelper.getTheme();
    isLight.value = isTheme ?? false;
  }
}
