// To parse this JSON data, do
//
//     final getAboutModel = getAboutModelFromJson(jsonString);

import 'dart:convert';

GetAboutModel getAboutModelFromJson(String str) => GetAboutModel.fromJson(json.decode(str));

String getAboutModelToJson(GetAboutModel data) => json.encode(data.toJson());

class GetAboutModel {
    List<Result>? result;

    GetAboutModel({
        this.result,
    });

    factory GetAboutModel.fromJson(Map<String, dynamic> json) => GetAboutModel(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? about;

    Result({
        this.about,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "about": about,
    };
}
