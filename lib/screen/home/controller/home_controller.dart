import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/utils/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rxn<HomeModel> homeModel = Rxn<HomeModel>();
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  Rxn<List<HomeModel>> chatList = Rxn<List<HomeModel>>();

  Future<void> getData(String question) async {
    isLoading.value = true;
    HomeModel? h1 = await ApiHelper.apiHelper.apiCall(question);
    homeModel.value = h1!;
    isLoading.value = false;
    update();
  }
}
