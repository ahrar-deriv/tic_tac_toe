import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tic_tac_toe/flutter/core/constants.dart';
import 'package:tic_tac_toe/flutter/core/pref.dart';
import 'package:tic_tac_toe/flutter/model/sign_up/sign_up_request_model.dart';
import 'package:tic_tac_toe/flutter/model/sign_up/sign_up_response_model.dart';

class SignUpRequest {
  final url = Uri.parse('$baseUrl/user');
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ' +
        base64Encode(
          utf8.encode('com.dart.demo:abcd'),
        )
  };

  Future<SignUpResponseModel?> signUp(SignUpRequestModel body) async {
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      print('status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        print(response.body);
        saveToken(jsonDecode(response.body)['access_token']);
        return SignUpResponseModel.fromJson(jsonDecode(response.body));
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
