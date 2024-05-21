import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/user_model/user.dart';

class UserServices {
  Future<UserEntity> getUserInfo({required String id}) async {
    String url = 'https://investpulse.onrender.com/users/$id';
    String token = GetStorage().read('token');
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    UserEntity userEntity =
        UserEntity(userName: '', email: '', phone: '', coins: 0);
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // childEntity = UserChildModel.fromJson(responseData['user']);
      userEntity = User.fromJson(jsonData['user']);
      print(jsonData);
    } else {
      print(response.statusCode);
    }

    return userEntity;
  }
}
