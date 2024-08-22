// To parse this JSON data, do
//
//     final getOffersModel = getOffersModelFromJson(jsonString);

import 'dart:convert';

GetOffersModel getOffersModelFromJson(String str) =>
    GetOffersModel.fromJson(json.decode(str));

String getOffersModelToJson(GetOffersModel data) => json.encode(data.toJson());

class GetOffersModel {
  List<OffersResult>? result;

  GetOffersModel({
    this.result,
  });

  factory GetOffersModel.fromJson(Map<String, dynamic> json) => GetOffersModel(
        result: json["result"] == null
            ? []
            : List<OffersResult>.from(
                json["result"]!.map((x) => OffersResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class OffersResult {
  dynamic image;
  dynamic adUrl;
  dynamic offerType;
  dynamic serviceId;
  dynamic serviceOffer;
  dynamic offerDes;
  int? id;

  OffersResult({
    this.image,
    this.adUrl,
    this.offerType,
    this.serviceId,
    this.serviceOffer,
    this.offerDes,
    this.id,
  });

  factory OffersResult.fromJson(Map<String, dynamic> json) => OffersResult(
        image: json["image"],
        adUrl: json["ad_url"],
        offerType: json["offer_type"],
        serviceId: json["service_id"],
        serviceOffer: json["service_offer"],
        offerDes: json["offer_des"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "ad_url": adUrl,
        "offer_type": offerType,
        "service_id": serviceId,
        "service_offer": serviceOffer,
        "offer_des": offerDes,
        "id": id,
      };
}
