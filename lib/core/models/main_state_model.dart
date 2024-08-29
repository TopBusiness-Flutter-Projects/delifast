class MainStateModel {
  int? count;
  dynamic prev;
  int? current;
  dynamic next;
  int? totalPages;
  List<StateModel>? result;

  MainStateModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory MainStateModel.fromJson(Map<String, dynamic> json) => MainStateModel(
        count: json["count"],
        prev: json["prev"],
        current: json["current"],
        next: json["next"],
        totalPages: json["total_pages"],
        result: json["result"] == null
            ? []
            : List<StateModel>.from(json["result"]!.map((x) => StateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "prev": prev,
        "current": current,
        "next": next,
        "total_pages": totalPages,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class StateModel {
  int? id;
  String? name;

  StateModel({
    this.id,
    this.name,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
