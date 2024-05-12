import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/screen/like/model/db_model.dart';
import 'package:advance_exam/utils/helper/api_helper.dart';
import 'package:advance_exam/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeModel = Rxn<HomeModel>();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  RxList<DbModel> chatList = <DbModel>[].obs;
  RxList<DbModel> list = <DbModel>[].obs;
  RxBool isOnline = false.obs;

  Future<void> getData(String question) async {
    isLoading.value = true;
    HomeModel? h1 = await ApiHelper.apiHelper.apiCall(question);
    homeModel.value = h1!;
    DbModel db = DbModel(
        result: homeModel.value!.candidates![0].content!.parts![0].text!,
        status: 1);
    // chatList.add(db);
    list.add(db);
    DbHelper.dbHelper.insertData(db);
    chatList.value = await DbHelper.dbHelper.readData();
    // chatList.add(homeModel.value!.candidates![0].content!.parts![0].text!);
    isLoading.value = false;

    list
        .map((element) => print("${element.result} ${element.status}"))
        .toList();
  }

  void dbData() async {
    chatList.value = await DbHelper.dbHelper.readData();
    // List<DbModel> favorite = await DbHelper.dbHelper.readData();
    // searchList.value = favorite;
  }

  void changeStatus(bool status) {
    isOnline.value = status;
  }
}
