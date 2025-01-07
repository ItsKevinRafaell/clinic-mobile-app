import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app_kevin/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app_kevin/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> getOrderByPatient() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      await Uri.parse(
          '${GlobalVariable.baseUrl}/api/orders/patient/${userData?.data?.user?.id}'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    log("Status Code: ${response.statusCode}");
    log("Status Code: ${response.body}");
    if (response.statusCode == 200) {
      // return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
      return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }
}
