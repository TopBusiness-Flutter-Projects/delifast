// To parse this JSON data, do
//
//     final getOrdersDetailsModel = getOrdersDetailsModelFromJson(jsonString);

import 'dart:convert';

GetOrdersDetailsModel getOrdersDetailsModelFromJson(String str) => GetOrdersDetailsModel.fromJson(json.decode(str));

String getOrdersDetailsModelToJson(GetOrdersDetailsModel data) => json.encode(data.toJson());

class GetOrdersDetailsModel {
    int? id;
    String? name;
    dynamic? date;
    dynamic? totalPrice;
    String? state;
    dynamic? previewPrice;
    dynamic level;
    int? providerId;
    int? categoryId;
    int? serviceId;
    int? quantity;

    GetOrdersDetailsModel({
        this.id,
        this.name,
        this.date,
        this.totalPrice,
        this.state,
        this.previewPrice,
        this.level,
        this.providerId,
        this.categoryId,
        this.serviceId,this.quantity
    });

    factory GetOrdersDetailsModel.fromJson(Map<String, dynamic> json) => GetOrdersDetailsModel(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        totalPrice: json["total_price"],
        state: json["state"],
        previewPrice: json["preview_price"],
        level: json["level"],
        providerId: json["provider_id"],
        categoryId: json["category_id"],
        serviceId: json["service_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "total_price": totalPrice,
        "state": state,
        "preview_price": previewPrice,
        "level": level,
        "provider_id": providerId,
        "category_id": categoryId,
        "service_id": serviceId,
        "quantity": quantity,
    };
}
