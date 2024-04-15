import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:advance_exam/utils/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeModel? homeModel;

  Future<void> getData(String question) async {
    HomeModel? h1 = await ApiHelper.apiHelper.apiCall(question);
    homeModel = h1;
    update();
  }
}
