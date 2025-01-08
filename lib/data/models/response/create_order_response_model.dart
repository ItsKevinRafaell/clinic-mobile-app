import 'dart:convert';

class CreateOrderResponseModel {
  final String? status;
  final Data? data;

  CreateOrderResponseModel({
    this.status,
    this.data,
  });

  factory CreateOrderResponseModel.fromJson(String str) =>
      CreateOrderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateOrderResponseModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
      };
}

class Data {
  final int patientId;
  final int doctorId;
  final String service;
  final int price;
  final int duration;
  final int clinicId;
  final DateTime schedule;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;
  final String paymentUrl;

  Data({
    required this.patientId,
    required this.doctorId,
    required this.service,
    required this.price,
    required this.duration,
    required this.clinicId,
    required this.schedule,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.paymentUrl,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        service: json["service"],
        price: json["price"],
        duration: json["duration"],
        clinicId: json["clinic_id"],
        schedule: DateTime.parse(json["schedule"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        paymentUrl: json["payment_url"],
      );

  Map<String, dynamic> toMap() => {
        "patient_id": patientId,
        "doctor_id": doctorId,
        "service": service,
        "price": price,
        "duration": duration,
        "clinic_id": clinicId,
        "schedule":
            "${schedule!.year.toString().padLeft(4, '0')}-${schedule!.month.toString().padLeft(2, '0')}-${schedule!.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "payment_url": paymentUrl,
      };
}
