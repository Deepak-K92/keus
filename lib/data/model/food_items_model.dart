// To parse this JSON data, do
//
//     final foodItemsModel = foodItemsModelFromJson(jsonString);

import 'dart:convert';

FoodItemsModel foodItemsModelFromJson(String str) =>
    FoodItemsModel.fromJson(json.decode(str));

String foodItemsModelToJson(FoodItemsModel data) => json.encode(data.toJson());

class FoodItemsModel {
  final List<FoodItemDetails>? data;

  FoodItemsModel({
    this.data,
  });

  factory FoodItemsModel.fromJson(Map<String, dynamic> json) => FoodItemsModel(
        data: json["data"] == null
            ? []
            : List<FoodItemDetails>.from(
                json["data"]!.map((x) => FoodItemDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FoodItemDetails {
  final String? name;
  final double? price;
  final String? calories;
  final String? imageUrl;
  final int? id;
  final String? description;
  final int? grams;
  final int? proteins;
  final int? fats;
  final int? carbs;

  FoodItemDetails({
    this.name,
    this.price,
    this.calories,
    this.imageUrl,
    this.id,
    this.description,
    this.grams,
    this.proteins,
    this.fats,
    this.carbs,
  });

  factory FoodItemDetails.fromJson(Map<String, dynamic> json) =>
      FoodItemDetails(
        name: json["name"],
        price: json["price"],
        calories: json["calories"],
        imageUrl: json["image_url"],
        id: json["id"],
        description: json["description"],
        grams: json["grams"],
        proteins: json["proteins"],
        fats: json["fats"],
        carbs: json["carbs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "calories": calories,
        "image_url": imageUrl,
        "id": id,
        "description": description,
        "grams": grams,
        "proteins": proteins,
        "fats": fats,
        "carbs": carbs,
      };
}
