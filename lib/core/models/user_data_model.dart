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
  dynamic? mobile;
  dynamic? email;
  dynamic? login;
  
  dynamic? image1920;

  Result({
    this.id,
    this.name,
    this.street,
    this.mobile,
    this.image1920,
    this.login,this.email,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        street: json["street"],
        email: json["email"],
        mobile: json["mobile"],
        image1920: json["image_1920"],
        login: json["login"],   

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street": street,
        "image_1920": image1920,
        "login": login,  
        'email': email,
         'mobile': mobile, 

      };
}
