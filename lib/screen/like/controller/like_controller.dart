import 'package:advance_exam/screen/like/model/db_model.dart';
import 'package:advance_exam/utils/db_helper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  RxList<DbModel> searchList = <DbModel>[].obs;

  Future<void> getData() async {
    List<DbModel> favorite = await DbHelper.dbHelper.readData();
    searchList.value = favorite;
  }

  void copyToClipboard(String data) {
    Clipboard.setData(
      ClipboardData(text: data),
    );
  }
}
