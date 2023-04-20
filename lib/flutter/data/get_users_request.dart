import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:tic_tac_toe/flutter/core/constants.dart';
import 'package:tic_tac_toe/flutter/model/user.dart';

class GetUsersRequest {
  final url = Uri.parse('$baseUrl/user');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' +
        base64Encode(
          utf8.encode('com.dart.demo:abcd'),
        )
  };

  Future<List<User>?> getUsers() async {
    try {
      final response = await http.get(
        url,
        headers: headers,
      );
      print('status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        print(response.body);
        final jsonList = jsonDecode(response.body) as List;
        List<User> users = jsonList.map((user) => User.fromJson(user)).toList();
        return users;
      } else {
        /// Todo: handle http error
        print('unsuccessful login:  ${jsonDecode(response.body)['error']}');
      }
    } catch (e) {
      /// Todo: handle exceptions
      print('catch exception :$e');
    }
  }
}
