// To parse this JSON data, do
//
//     final storeDataModel = storeDataModelFromJson(jsonString);

import 'dart:convert';

String storeDataModelToJson(StoreDataModel data) => json.encode(data.toJson());

class StoreDataModel {
  String? id;
  String? fingerRaised;
  String? status;
  String? measures;
  String? patientName;
  int? jillStoryCorrect;
  int? jillStoryIncorrect;
  int? animalIdentifyCorrect;
  int? animalIdentifyInorrect;

  StoreDataModel({
    this.id,
    this.fingerRaised,
    this.status,
    this.measures,
    this.patientName,
    this.jillStoryCorrect,
    this.jillStoryIncorrect,
    this.animalIdentifyCorrect,
    this.animalIdentifyInorrect,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "fingerRaised": fingerRaised,
        "status": status,
        "measures": measures,
        "patientName": patientName,
        "jillStoryCorrect": jillStoryCorrect,
        "jillStoryIncorrect": jillStoryIncorrect,
        "animalIdentifyCorrect": animalIdentifyCorrect,
        "animalIdentifyInorrect": animalIdentifyInorrect,
      };
}
