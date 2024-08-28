class GetStatesModel {
  final int? count;
  final int? prev;
  final int? current;
  final int? next;
  final int? totalPages;
  final List<Result>? result;

  GetStatesModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory GetStatesModel.fromJson(Map<String, dynamic> json) {
    return GetStatesModel(
      count: json['count'] as int?,
      prev: json['prev'] as int?,
      current: json['current'] as int?,
      next: json['next'] as int?,
      totalPages: json['total_pages'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((item) => Result.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'prev': prev,
      'current': current,
      'next': next,
      'total_pages': totalPages,
      'result': result?.map((item) => item.toJson()).toList(),
    };
  }
}

class Result {
   int? id;
   String? name;
  int ? count;

  Result({
    this.id,
    this.name,
    this.count =0
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
