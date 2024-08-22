// To parse this JSON data, do
//
//     final getServiceDetails = getServiceDetailsFromJson(jsonString);

import 'dart:convert';

GetServiceDetails getServiceDetailsFromJson(String str) => GetServiceDetails.fromJson(json.decode(str));

String getServiceDetailsToJson(GetServiceDetails data) => json.encode(data.toJson());

class GetServiceDetails {
    String? name;
    int? categId;
    dynamic listPrice;

    GetServiceDetails({
        this.name,
        this.categId,
        this.listPrice,
    });

    factory GetServiceDetails.fromJson(Map<String, dynamic> json) => GetServiceDetails(
        name: json["name"],
        categId: json["categ_id"],
        listPrice: json["list_price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "categ_id": categId,
        "list_price": listPrice,
    };
}
