import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class AuthServices {
  Future<bool> register(
      {required String username,
      required String email,
      required String password,
      required String phone}) async {
    String url = 'https://investpulse.onrender.com/auth/register';
    var data = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
      'role': 'user',
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: data,
    );
    // ignore: unused_local_variable
    String jsonData = response.body;
    if (response.statusCode == 200) {
      // print('sucssses');
      // print(jsonData);
      return true;
    } else {
      // print(response.statusCode);
      // print(jsonData);
      return false;
    }
  }

  Future<bool> logIn({
    required String email,
    required String password,
  }) async {
    String url = 'https://investpulse.onrender.com/auth/login';
    var data = jsonEncode({
      'email': email,
      'password': password,
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: data,
    );
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      String token = jsonData['token'];
      String id = jsonData['user']['_id'];
      final box = GetStorage();
      box.write('token', token);
      box.write('id', id);
      print(box.read('id'));
      print(token);
      return true;
    } else {
      print(response.statusCode);
      print(jsonData);
      return false;
    }
  }
}
