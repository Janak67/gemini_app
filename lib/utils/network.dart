// import 'package:advance_exam/screen/home/controller/home_controller.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
//
// class NetworkConnection {
//   HomeController controller = Get.put(HomeController());
//   Connectivity networkConnectivity = Connectivity();
//
//   void checkConnection() async {
//     ConnectivityResult result = await networkConnectivity.checkConnectivity();
//     checkStatus(result);
//     networkConnectivity.onConnectivityChanged.listen((event) {
//       checkStatus(event);
//     });
//   }
//
//   void checkStatus(ConnectivityResult result) {
//     if (result.index == 1 || result.index == 3) {
//       controller.changeStatus(true);
//     } else {
//       controller.changeStatus(false);
//     }
//   }
// }
