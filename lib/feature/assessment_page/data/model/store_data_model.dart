// To parse this JSON data, do
//
//     final storeDataModel = storeDataModelFromJson(jsonString);

import 'dart:convert';

StoreDataModel storeDataModelFromJson(String str) => StoreDataModel.fromJson(json.decode(str));

String storeDataModelToJson(StoreDataModel data) => json.encode(data.toJson());

class StoreDataModel {
  String? id;
  String? fingerRaised;
  int? jillStoryCorrect;
  int? jillStoryIncorrect;
  int? animalIdentifyCorrect;
  int? animalIdentifyInorrect;

  StoreDataModel({
    this.id,
    this.fingerRaised,
    this.jillStoryCorrect,
    this.jillStoryIncorrect,
    this.animalIdentifyCorrect,
    this.animalIdentifyInorrect,
  });

  factory StoreDataModel.fromJson(Map<String, dynamic> json) => StoreDataModel(
    id: json["id"],
    fingerRaised: json["fingerRaised"],
    jillStoryCorrect: json["jillStoryCorrect"],
    jillStoryIncorrect: json["jillStoryIncorrect"],
    animalIdentifyCorrect: json["animalIdentifyCorrect"],
    animalIdentifyInorrect: json["animalIdentifyInorrect"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fingerRaised": fingerRaised,
    "jillStoryCorrect": jillStoryCorrect,
    "jillStoryIncorrect": jillStoryIncorrect,
    "animalIdentifyCorrect": animalIdentifyCorrect,
    "animalIdentifyInorrect": animalIdentifyInorrect,
  };
}
