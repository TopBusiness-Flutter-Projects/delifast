// To parse this JSON data, do
//
//     final getCompanyCurrencyModel = getCompanyCurrencyModelFromJson(jsonString);

import 'dart:convert';

GetCompanyDataModel getCompanyCurrencyModelFromJson(String str) =>
    GetCompanyDataModel.fromJson(json.decode(str));

String getCompanyCurrencyModelToJson(GetCompanyDataModel data) =>
    json.encode(data.toJson());

class GetCompanyDataModel {
 
  List<CompanyCurrencyResult>? result;
  GetCompanyDataModel({
    
    this.result,
  });

  factory GetCompanyDataModel.fromJson(Map<String, dynamic> json) =>
      GetCompanyDataModel(
        
        result: json["result"] == null
            ? []
            : List<CompanyCurrencyResult>.from(
                json["result"]!.map((x) => CompanyCurrencyResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
       
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class CompanyCurrencyResult {
  int? id;
  String? name;
  dynamic? street;
  String? countryCode;
  
  dynamic? vat;
  dynamic? companyRegistry;
  dynamic? logo;

  CompanyCurrencyResult({
    this.id,
    this.name,
    this.street,
    this.countryCode,
  
    this.vat,
    this.companyRegistry,
    this.logo,
  });

  factory CompanyCurrencyResult.fromJson(Map<String, dynamic> json) =>
      CompanyCurrencyResult(
        id: json["id"],
        name: json["name"],
        street: json["street"],
        countryCode: json["country_code"],
   
        vat: json["vat"],
        companyRegistry: json["company_registry"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "street": street,
        "country_code": countryCode,
 
        "vat": vat,
        "company_registry": companyRegistry,
        "logo": logo,
      };
}
