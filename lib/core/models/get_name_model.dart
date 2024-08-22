// To parse this JSON data, do
//
//     final getNameModel = getNameModelFromJson(jsonString);

import 'dart:convert';

GetNameModel getNameModelFromJson(String str) => GetNameModel.fromJson(json.decode(str));

String getNameModelToJson(GetNameModel data) => json.encode(data.toJson());

class GetNameModel {
    String? name;

    GetNameModel({
        this.name,
    });

    factory GetNameModel.fromJson(Map<String, dynamic> json) => GetNameModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
