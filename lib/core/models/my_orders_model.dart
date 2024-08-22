// To parse this JSON data, do
//
//     final getAllProviderModel = getAllProviderModelFromJson(jsonString);

import 'dart:convert';

GetMyOrdersModel getAllProviderModelFromJson(String str) =>
    GetMyOrdersModel.fromJson(json.decode(str));

String getAllProviderModelToJson(GetMyOrdersModel data) =>
    json.encode(data.toJson());

class GetMyOrdersModel {
  List<OrdersResult>? result;
  GetMyOrdersModel({
    this.result,
  });
  factory GetMyOrdersModel.fromJson(Map<String, dynamic> json) =>
      GetMyOrdersModel(
        result: json["result"] == null
            ? []
            : List<OrdersResult>.from(
                json["result"]!.map((x) => OrdersResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class OrdersResult {
  int? id;
  String? name;
  String? state;
  dynamic date;
  dynamic? totalPrice;
  dynamic? pricePreview;
  OrdersResult({
    this.id,
    this.name,
    this.date,
    this.state,
    this.pricePreview,
    this.totalPrice,
  });
  factory OrdersResult.fromJson(Map<String, dynamic> json) => OrdersResult(
        id: json["id"],
        name: json["name"],
        state: json["state"],
        date: json["date"],
        totalPrice: json["total_price"],
        pricePreview: json["preview_price"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state,
        "date": date,
        "total_price": totalPrice,
        "preview_price": pricePreview,
      };
}
