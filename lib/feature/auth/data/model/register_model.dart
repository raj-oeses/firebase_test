// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String? uId;
  String? userName;
  String? displayName;
  String? email;
  String? password;
  String? gender;
  DateTime? dob;
  bool? isEmailVerified;
  bool? isAnonymous;
  bool? isNewUser;
  DateTime? creationTime;
  DateTime? lastSignInTime;
  String? phoneNumber;

  RegisterModel({
    this.uId,
    this.userName,
    this.displayName,
    this.email,
    this.password,
    this.gender,
    this.dob,
    this.isEmailVerified,
    this.isAnonymous,
    this.isNewUser,
    this.creationTime,
    this.lastSignInTime,
    this.phoneNumber,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    uId: json["uId"],
    userName: json["userName"],
    displayName: json["displayName"],
    email: json["email"],
    password: json["password"],
    gender: json["gender"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    isEmailVerified: json["isEmailVerified"],
    isAnonymous: json["isAnonymous"],
    isNewUser: json["isNewUser"],
    creationTime: json["creationTime"] == null ? null : DateTime.parse(json["creationTime"]),
    lastSignInTime: json["lastSignInTime"] == null ? null : DateTime.parse(json["lastSignInTime"]),
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "uId": uId,
    "userName": userName,
    "displayName": displayName,
    "email": email,
    "password": password,
    "gender": gender,
    "dob": dob?.toIso8601String(),
    "isEmailVerified": isEmailVerified,
    "isAnonymous": isAnonymous,
    "isNewUser": isNewUser,
    "creationTime": creationTime?.toIso8601String(),
    "lastSignInTime": lastSignInTime?.toIso8601String(),
    "phoneNumber": phoneNumber,
  };
}
