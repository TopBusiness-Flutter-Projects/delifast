// To parse this JSON data, do
//
//     final getProviderDetailsModel = getProviderDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProviderDetailsModel getProviderDetailsModelFromJson(String str) =>
    GetProviderDetailsModel.fromJson(json.decode(str));

String getProviderDetailsModelToJson(GetProviderDetailsModel data) =>
    json.encode(data.toJson());

class GetProviderDetailsModel {
  int? id;
  dynamic? name;
  int? partnerId;
  dynamic? image1920;
  dynamic? login;
  dynamic level;
  List<int>? specializationId;

  GetProviderDetailsModel({
    this.id,
    this.name,
    this.partnerId,
    this.image1920,
    this.login,this.level,this.specializationId,
  });

  factory GetProviderDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetProviderDetailsModel(
        id: json["id"],
        name: json["name"],
        partnerId: json["partner_id"],
        image1920: json["image_1920"],
        login: json["login"],
        level: json["level"],
       specializationId: json["specialization_id"] == null ? [] : List<int>.from(json["specialization_id"]!.map((x) => x)),

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partner_id": partnerId,
        "image_1920": image1920,
        "login": login,
        "level": level,
    "specialization_id": specializationId == null ? [] : List<dynamic>.from(specializationId!.map((x) => x)),

      };
}
