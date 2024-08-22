// To parse this JSON data, do
//
//     final odooErrorModel = odooErrorModelFromJson(jsonString);

import 'dart:convert';

OdooErrorModel odooErrorModelFromJson(String str) => OdooErrorModel.fromJson(json.decode(str));

String odooErrorModelToJson(OdooErrorModel data) => json.encode(data.toJson());

class OdooErrorModel {
    Error? error;

    OdooErrorModel({
        this.error,
    });

    factory OdooErrorModel.fromJson(Map<String, dynamic> json) => OdooErrorModel(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
    };
}

class Error {
   
    String? message;
    Data? data;

    Error({
       
        this.message,
        this.data,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
      
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
      
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? name;

    Data({
        this.name,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
