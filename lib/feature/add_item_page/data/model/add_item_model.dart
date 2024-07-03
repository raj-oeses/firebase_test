// To parse this JSON data, do
//
//     final addItemModel = addItemModelFromJson(jsonString);

import 'dart:convert';

AddItemModel addItemModelFromJson(String str) =>
    AddItemModel.fromJson(json.decode(str));

String addItemModelToJson(AddItemModel data) => json.encode(data.toJson());

class AddItemModel {
  String? id;
  String? productName;
  String? imagePath;
  String? unitType;
  String? cartonQuantity;
  int? cartonCapacity;
  String? cartonPerPrice;
  String? totalBuyAmount;
  int? cartonSellingPrice;
  int? singleItemSellingPrice;
  int? cartonStock;
  int? itemStock;
  int? consignment;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? uId;

  AddItemModel({
    this.id,
    this.productName,
    this.imagePath,
    this.unitType,
    this.cartonQuantity,
    this.cartonCapacity,
    this.cartonPerPrice,
    this.totalBuyAmount,
    this.cartonSellingPrice,
    this.singleItemSellingPrice,
    this.cartonStock,
    this.itemStock,
    this.consignment,
    this.updatedAt,
    this.createdAt,
    this.uId,
  });

  factory AddItemModel.fromJson(Map<String, dynamic> json) => AddItemModel(
        id: json["id"],
        productName: json["productName"],
        imagePath: json["imagePath"],
    unitType: json["unitType"],
        cartonQuantity: json["cartonQuantity"],
        cartonCapacity: json["cartonCapacity"],
        cartonPerPrice: json["cartonPerPrice"],
        totalBuyAmount: json["totalBuyAmount"],
        cartonSellingPrice: json["cartonSellingPrice"],
        singleItemSellingPrice: json["singleItemSellingPrice"],
        cartonStock: json["cartonStock"],
        itemStock: json["itemStock"],
    consignment: json["consignment"]??0,
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        uId: json["uId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "imagePath": imagePath,
        "unitType": unitType,
        "cartonQuantity": cartonQuantity,
        "cartonCapacity": cartonCapacity,
        "cartonPerPrice": cartonPerPrice,
        "totalBuyAmount": totalBuyAmount,
        "cartonSellingPrice": cartonSellingPrice,
        "singleItemSellingPrice": singleItemSellingPrice,
        "cartonStock": cartonStock,
        "itemStock": itemStock,
        "consignment": consignment,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "uId": uId,
      };
}
