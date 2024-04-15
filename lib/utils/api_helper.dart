import 'dart:convert';

import 'package:advance_exam/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<HomeModel?> apiCall(String question) async {
    String apiLink =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyDhOaIQKs9nnzdWh7IEpMUQ97vBLQVS6dY";
    Map<String, String> headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "contents": [
        {
          "parts": [
            {"text": question}
          ]
        }
      ]
    });
    var response =
        await http.post(Uri.parse(apiLink), headers: headers, body: body);
    if (response.statusCode == 200) {
      dynamic json = jsonEncode(response.body);
      HomeModel? homeModel = HomeModel.mapToModel(json);
      return homeModel;
    }
    return null;
  }
}
