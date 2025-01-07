import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app_kevin/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app_kevin/data/models/response/doctor_response_model.dart';
import 'package:http/http.dart' as http;

class DoctorRemoteDatasource {
  Future<Either<String, DoctorResponseModel>> getDoctorActive() async {
    final response = await http.get(
      await Uri.parse('${GlobalVariable.baseUrl}/api/doctors/active'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromJson(response.body));
    } else {
      throw Left('Failed to load data');
    }
  }

  Future<Either<String, DoctorResponseModel>> getDoctorTelemedis() async {
    final response = await http.get(
      await Uri.parse('${GlobalVariable.baseUrl}/api/doctors/telemedicine'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromJson(response.body));
    } else {
      throw Left('Failed to load data');
    }
  }
  
  Future<Either<String, DoctorResponseModel>> getDoctorChat() async {
    final response = await http.get(
      await Uri.parse('${GlobalVariable.baseUrl}/api/doctors/chat'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromJson(response.body));
    } else {
      throw Left('Failed to load data');
    }
  }
}
