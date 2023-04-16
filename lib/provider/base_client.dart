import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseClient {
  final baseUrl = "http://34.131.146.238:3000/data/";
  Future<dynamic> get(String endpoint) async {
    var url = Uri.parse(baseUrl + endpoint);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return throw Exception("cannot get the user data");
    }
  }

  Future<dynamic> post(String endpoint, dynamic object) async {
    var url = Uri.parse(baseUrl + endpoint);
    // var data = jsonEncode(object);
    // print(data);
    var response = await http.post(url, body: object);
    // print(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return throw Exception("cannot create or update the user");
    }
  }
}
