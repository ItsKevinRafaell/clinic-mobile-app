import 'dart:convert';

class LoginResponseModel {
  final String? status;
  final LoginModel? data;

  LoginResponseModel({
    this.status,
    this.data,
  });

  factory LoginResponseModel.fromJson(String str) =>
      LoginResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromMap(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : LoginModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data?.toMap(),
      };
}

class LoginModel {
  final UserModel? user;
  final String? token;
  final bool? isNew;

  LoginModel({
    this.user,
    this.token,
    this.isNew,
  });

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        user: json["user"] == null ? null : UserModel.fromMap(json["user"]),
        isNew: json["is_new"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
        "isNew": isNew,
      };
}

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;
  final dynamic googleId;
  final dynamic ktpNumber;
  final dynamic birthDate;
  final dynamic gender;
  final dynamic phoneNumber;
  final dynamic address;
  final dynamic certification;
  final dynamic telemedicineFee;
  final dynamic chatFee;
  final dynamic openTime;
  final dynamic closeTime;
  final dynamic clinicId;
  final dynamic specialistId;
  final String? status;
  final dynamic image;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.googleId,
    this.ktpNumber,
    this.birthDate,
    this.gender,
    this.phoneNumber,
    this.address,
    this.certification,
    this.telemedicineFee,
    this.chatFee,
    this.openTime,
    this.closeTime,
    this.clinicId,
    this.specialistId,
    this.status,
    this.image,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        role: json["role"],
        googleId: json["google_id"],
        ktpNumber: json["ktp_number"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        certification: json["certification"],
        telemedicineFee: json["telemedicine_fee"],
        chatFee: json["chat_fee"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        clinicId: json["clinic_id"],
        specialistId: json["specialist_id"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "role": role,
        "google_id": googleId,
        "ktp_number": ktpNumber,
        "birth_date": birthDate,
        "gender": gender,
        "phone_number": phoneNumber,
        "address": address,
        "certification": certification,
        "telemedicine_fee": telemedicineFee,
        "chat_fee": chatFee,
        "open_time": openTime,
        "close_time": closeTime,
        "clinic_id": clinicId,
        "specialist_id": specialistId,
        "status": status,
        "image": image,
      };
}
