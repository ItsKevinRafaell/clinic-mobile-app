import 'dart:convert';

import 'package:flutter_clinicmobile_app_kevin/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<LoginResponseModel?> loginGoogle(String idToken) async {
    final response =
        await http.post(Uri.parse('${GlobalVariable.baseUrl}/api/login/google'),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({'id_token': idToken}));

    if (response.statusCode == 200) {
      return LoginResponseModel.fromMap(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
