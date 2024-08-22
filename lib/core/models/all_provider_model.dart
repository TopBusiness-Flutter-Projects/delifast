// To parse this JSON data, do
//
//     final getAllProviderModel = getAllProviderModelFromJson(jsonString);

import 'dart:convert';

GetAllProviderModel getAllProviderModelFromJson(String str) => GetAllProviderModel.fromJson(json.decode(str));

String getAllProviderModelToJson(GetAllProviderModel data) => json.encode(data.toJson());

class GetAllProviderModel {
    int? count;
    dynamic prev;
    int? current;
    dynamic next;
    int? totalPages;
    List<ProvidrsResult>? result;

    GetAllProviderModel({
        this.count,
        this.prev,
        this.current,
        this.next,
        this.totalPages,
        this.result,
    });

    factory GetAllProviderModel.fromJson(Map<String, dynamic> json) => GetAllProviderModel(
        count: json["count"],
        prev: json["prev"],
        current: json["current"],
        next: json["next"],
        totalPages: json["total_pages"],
        result: json["result"] == null ? [] : List<ProvidrsResult>.from(json["result"]!.map((x) => ProvidrsResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "prev": prev,
        "current": current,
        "next": next,
        "total_pages": totalPages,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class ProvidrsResult {
    int? id;
    String? name;
    int? partnerId;
    dynamic image1920;
    double? lat;
    double? long;
    double? rate;

    ProvidrsResult({
        this.id,
        this.name,
        this.partnerId,
        this.image1920,
        this.lat,this.long,this.rate
    });

    factory ProvidrsResult.fromJson(Map<String, dynamic> json) => ProvidrsResult(
        id: json["id"],
        name: json["name"],
        partnerId: json["partner_id"],
        image1920: json["image_1920"],
        lat: json["partner_latitude"],
        long: json["partner_longitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "partner_id": partnerId,
        "image_1920": image1920,
        "partner_latitude": lat,
        "partner_longitude": long,
    };
}
