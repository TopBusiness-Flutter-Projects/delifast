// To parse this JSON data, do
//
//     final getPrivacyPolicyModel = getPrivacyPolicyModelFromJson(jsonString);

import 'dart:convert';

GetPrivacyPolicyModel getPrivacyPolicyModelFromJson(String str) => GetPrivacyPolicyModel.fromJson(json.decode(str));

String getPrivacyPolicyModelToJson(GetPrivacyPolicyModel data) => json.encode(data.toJson());

class GetPrivacyPolicyModel {
    List<Result>? result;
    GetPrivacyPolicyModel({
        this.result,
    });

    factory GetPrivacyPolicyModel.fromJson(Map<String, dynamic> json) => GetPrivacyPolicyModel(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? privacyPolicy;

    Result({
        this.privacyPolicy,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        privacyPolicy: json["privacy_policy"],
    );

    Map<String, dynamic> toJson() => {
        "privacy_policy": privacyPolicy,
    };
}
