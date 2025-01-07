import 'dart:convert';

import 'package:flutter_clinicmobile_app_kevin/data/models/response/login_response_model.dart';

class OrderResponseModel {
  final String? status;
  final List<OrderModel>? data;

  OrderResponseModel({
    this.status,
    this.data,
  });

  factory OrderResponseModel.fromJson(String str) =>
      OrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<OrderModel>.from(
                json["data"]!.map((x) => OrderModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class OrderModel {
  final int? id;
  final int? patientId;
  final int? doctorId;
  final int? clinicId;
  final String? service;
  final int? price;
  final String? status;
  final dynamic paymentUrl;
  final int? duration;
  final DateTime? schedule;
  final dynamic createdAt;
  final dynamic updatedAt;
  final UserModel? patient;
  final UserModel? doctor;

  OrderModel({
    this.id,
    this.patientId,
    this.doctorId,
    this.clinicId,
    this.service,
    this.price,
    this.status,
    this.paymentUrl,
    this.duration,
    this.schedule,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.doctor,
  });

  factory OrderModel.fromJson(String str) =>
      OrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        clinicId: json["clinic_id"],
        service: json["service"],
        price: json["price"],
        status: json["status"],
        paymentUrl: json["payment_url"],
        duration: json["duration"],
        schedule:
            json["schedule"] == null ? null : DateTime.parse(json["schedule"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        patient:
            json["patient"] == null ? null : UserModel.fromMap(json["patient"]),
        doctor:
            json["doctor"] == null ? null : UserModel.fromMap(json["doctor"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "patient_id": patientId,
        "doctor_id": doctorId,
        "clinic_id": clinicId,
        "service": service,
        "price": price,
        "status": status,
        "payment_url": paymentUrl,
        "duration": duration,
        "schedule": schedule?.toIso8601String(),
        "created_at": createdAt,
        "updated_at": updatedAt,
        "patient": patient?.toMap(),
        "doctor": doctor?.toMap(),
      };
}
