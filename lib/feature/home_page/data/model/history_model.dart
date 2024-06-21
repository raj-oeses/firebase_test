// To parse this JSON data, do
//
//     final historyModel = historyModelFromMap(jsonString);

import 'dart:convert';

HistoryModel historyModelFromMap(String str) => HistoryModel.fromMap(json.decode(str));

String historyModelToMap(HistoryModel data) => json.encode(data.toMap());

class HistoryModel {
  String? id;
  String? sn;
  String? testName;
  String? name;
  String? gender;
  String? age;
  String? weight;
  DateTime? date;

  HistoryModel({
    this.id,
    this.sn,
    this.testName,
    this.name,
    this.gender,
    this.age,
    this.weight,
    this.date,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    sn: json["sn"],
    testName: json["testName"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    weight: json["weight"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "sn": sn,
    "testName": testName,
    "name": name,
    "gender": gender,
    "age": age,
    "weight": weight,
    "date": date?.toIso8601String(),
  };
}
