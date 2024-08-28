
class GetOrderNameModel {
    String? name;

    GetOrderNameModel({
        this.name,
    });

    factory GetOrderNameModel.fromJson(Map<String, dynamic> json) => GetOrderNameModel(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
