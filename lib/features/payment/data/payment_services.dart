import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:investify/features/user_home/data/entities/user_entity.dart';
import 'package:investify/features/user_home/data/models/user_model/user.dart';

class PaymentServices {
  Future<void> addCoins({required int coins}) async {
    String url = 'https://investpulse.onrender.com/users/charge';
    String token = GetStorage().read('token');
    final body = jsonEncode({
      'amount': coins,
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      print(response);
      print('success');
    } else {
      print(response.statusCode);
    }
  }
}
