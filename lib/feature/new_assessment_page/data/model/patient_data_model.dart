// To parse this JSON data, do
//
//     final patientDataModel = patientDataModelFromJson(jsonString);

import 'dart:convert';

PatientDataModel patientDataModelFromJson(String str) => PatientDataModel.fromJson(json.decode(str));

String patientDataModelToJson(PatientDataModel data) => json.encode(data.toJson());

class PatientDataModel {
  String? status;
  String? measures;
  String? patientName;

  PatientDataModel({
    this.status,
    this.measures,
    this.patientName,
  });

  factory PatientDataModel.fromJson(Map<String, dynamic> json) => PatientDataModel(
    status: json["status"],
    measures: json["measures"],
    patientName: json["patientName"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "measures": measures,
    "patientName": patientName,
  };
}
