class AllCategoriesModel {
 
  List<CategoriesModelData>? result;

  AllCategoriesModel({
   
    this.result,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      AllCategoriesModel(
        
        result: json["result"] == null
            ? []
            : List<CategoriesModelData>.from(
                json["result"]!.map((x) => CategoriesModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
     
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class CategoriesModelData {
  String? name;

  int? id;
  dynamic? image;

  CategoriesModelData({
    this.name,
    this.id,
    this.image,
  });

  factory CategoriesModelData.fromJson(Map<String, dynamic> json) =>
      CategoriesModelData(
        name: json["name"],
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "image": image,
      };
}
