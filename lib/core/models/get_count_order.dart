class GetCountOrder {
  dynamic? count;
  dynamic prev;
  dynamic? current;
  dynamic next;
  dynamic? totalPages;
  List<Map<String, dynamic>>? result;

  GetCountOrder({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  // Factory method to create an instance from JSON
  factory GetCountOrder.fromJson(Map<String, dynamic> json) {
    return GetCountOrder(
      count: json['count'] as int?,
      prev: json['prev'],  // dynamic type allows null or any type
      current: json['current'] as int?,
      next: json['next'],  // dynamic type allows null or any type
      totalPages: json['total_pages'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'prev': prev,
      'current': current,
      'next': next,
      'total_pages': totalPages,
      'result': result,
    };
  }
}
