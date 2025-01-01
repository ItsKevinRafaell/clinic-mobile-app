import 'dart:convert';

import 'package:flutter_clinicmobile_app_kevin/core/constants/global_variable.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<String?> loginGoogle(String idToken) async {
    final response =
        await http.post(Uri.parse('${GlobalVariable.baseUrl}/api/login/google'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'id_token': idToken}));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
