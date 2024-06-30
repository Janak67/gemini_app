import 'package:advance_exam/utils/import.dart';

class NetworkConnection {
  HomeController controller = Get.put(HomeController());
  Connectivity networkConnectivity = Connectivity();

  void checkConnection() async {
    List<ConnectivityResult> result =
        await networkConnectivity.checkConnectivity();
    checkStatus(result);
    networkConnectivity.onConnectivityChanged.listen((event) {
      checkStatus(event);
    });
  }

  void checkStatus(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      controller.changeStatus(true);
    } else {
      controller.changeStatus(false);
    }
  }
}
