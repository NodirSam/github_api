import 'dart:convert';
import 'package:http/http.dart';
import '../model/users.dart';

class Network {
  static String BASE = "api.github.com";
  static Map<String,String> headers = {'Content-Type':'application/json; charset=UTF-8'};

  /* Http Apis */

  static String API_LIST = "/users/NodirSam";

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null!;
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Users parseUsers(String body){
    dynamic json = jsonDecode(body);
    var data = Users.fromJson(json);
    return data;
  }

}