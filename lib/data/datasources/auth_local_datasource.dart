import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveUserData(LoginResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('user', data.toJson());
  }

  Future<LoginResponseModel?> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final user = await pref.getString('user');
    if (user != null) {
      return LoginResponseModel.fromJson(user);
    } else {
      return null;
    }
  }
}
