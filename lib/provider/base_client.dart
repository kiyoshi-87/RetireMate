import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseClient {
  final baseUrl = "https://retiremate-nodeapi-production.up.railway.app/data/";
  Future<dynamic> get(String endpoint) async {
    var url = Uri.parse(baseUrl + endpoint);
    print(url);
    var response = await http.get(url);
    print(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return throw Exception("cannot get the user data");
    }
  }

  Future<dynamic> post(String endpoint, dynamic object) async {
    var url = Uri.parse(baseUrl + endpoint);
    var data = jsonEncode(object);
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return throw Exception("cannot create or update the user");
    }
  }
}
