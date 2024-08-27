// To parse this JSON data, do
//
//     final getPhoneModel = getPhoneModelFromJson(jsonString);

import 'dart:convert';

GetPhoneModel getPhoneModelFromJson(String str) => GetPhoneModel.fromJson(json.decode(str));

String getPhoneModelToJson(GetPhoneModel data) => json.encode(data.toJson());

class GetPhoneModel {
    List<Result>? result;

    GetPhoneModel({
        this.result,
    });

    factory GetPhoneModel.fromJson(Map<String, dynamic> json) => GetPhoneModel(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? phone;

    Result({
        this.phone,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
    };
}
