// To parse this JSON data, do
//
//     final getProviderRatesModel = getProviderRatesModelFromJson(jsonString);

import 'dart:convert';

GetProviderRatesModel getProviderRatesModelFromJson(String str) =>
    GetProviderRatesModel.fromJson(json.decode(str));

String getProviderRatesModelToJson(GetProviderRatesModel data) =>
    json.encode(data.toJson());

class GetProviderRatesModel {
  List<RateResult>? result;

  GetProviderRatesModel({
    this.result,
  });

  factory GetProviderRatesModel.fromJson(Map<String, dynamic> json) =>
      GetProviderRatesModel(
        result: json["result"] == null
            ? []
            : List<RateResult>.from(
                json["result"]!.map((x) => RateResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class RateResult {
  int? clientId;
  dynamic? createDate;
  dynamic? numberOfStars;
  dynamic? reviewMsg;

  RateResult({
    this.createDate,
    this.clientId,
    this.numberOfStars,
    this.reviewMsg,
  });

  factory RateResult.fromJson(Map<String, dynamic> json) => RateResult(
        clientId: json["client_id"],
        createDate: json["create_date"],
        numberOfStars: json["number_of_stars"],
        reviewMsg: json["review_msg"],
      );

  Map<String, dynamic> toJson() => {
        "client_id": clientId,
        "create_date": createDate,
        "number_of_stars": numberOfStars,
        "review_msg": reviewMsg,
      };
}
