import 'package:advance_exam/utils/import.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<HomeModel?> apiCall(String question) async {
    String apiLink =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDQ5zRRIdUv3k5aNoHDOVIu5WoThiKYeM4";
    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": question}
          ]
        }
      ]
    });
    var response = await http.post(Uri.parse(apiLink),
        headers: {"Content-Type": "application/json"}, body: body);
    if (response.statusCode == 200) {
      dynamic json = jsonDecode(response.body);
      HomeModel? homeModel = HomeModel.mapToModel(json);
      return homeModel;
    }
    return null;
  }
}
