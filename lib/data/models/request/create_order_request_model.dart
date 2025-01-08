import 'dart:convert';

class CreateOrderRequestModel {
  final int patientId;
  final int doctorId;
  final String service;
  final int price;
  final int duration;
  final int clinicId;
  final DateTime schedule;

  CreateOrderRequestModel({
    required this.patientId,
    required this.doctorId,
    required this.service,
    required this.price,
    required this.duration,
    required this.clinicId,
    required this.schedule,
  });

  factory CreateOrderRequestModel.fromJson(String str) =>
      CreateOrderRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreateOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderRequestModel(
        patientId: json["patient_id"],
        doctorId: json["doctor_id"],
        service: json["service"],
        price: json["price"],
        duration: json["duration"],
        clinicId: json["clinic_id"],
        schedule: DateTime.parse(json["schedule"]),
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
      };
}
