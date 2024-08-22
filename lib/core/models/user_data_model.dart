// To parse this JSON data, do
//
//     final getUserDataModel = getUserDataModelFromJson(jsonString);

import 'dart:convert';

GetUserDataModel getUserDataModelFromJson(String str) =>
    GetUserDataModel.fromJson(json.decode(str));

String getUserDataModelToJson(GetUserDataModel data) =>
    json.encode(data.toJson());

class GetUserDataModel {
  List<Result>? result;

  GetUserDataModel({
    this.result,
  });

  factory GetUserDataModel.fromJson(Map<String, dynamic> json) =>
      GetUserDataModel(
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? name;
  dynamic? street;
  int? partnerId;
  dynamic? image1920;
  String? login; List<int>? favoriteUserIds;

  Result({
    this.id,
    this.name,
    this.street,
    this.partnerId,
    this.image1920,
    this.login,this.favoriteUserIds,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        street: json["street"],
        partnerId: json["partner_id"],
        image1920: json["image_1920"],
        login: json["login"],        favoriteUserIds: json["favorite_user_ids"] == null ? [] : List<int>.from(json["favorite_user_ids"]!.map((x) => x)),

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street": street,
        "partner_id": partnerId,
        "image_1920": image1920,
        "login": login,        "favorite_user_ids": favoriteUserIds == null ? [] : List<dynamic>.from(favoriteUserIds!.map((x) => x)),

      };
}
