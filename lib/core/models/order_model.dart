class MainOrderModel {
  dynamic count;
  dynamic prev;
  dynamic current;
  dynamic next;
  dynamic totalPages;
  List<OrderModel>? result;

  MainOrderModel({
    this.count,
    this.prev,
    this.current,
    this.next,
    this.totalPages,
    this.result,
  });

  factory MainOrderModel.fromJson(Map<String, dynamic> json) => MainOrderModel(
        count: json["count"],
        prev: json["prev"],
        current: json["current"],
        next: json["next"],
        totalPages: json["total_pages"],
        result: json["result"] == null
            ? []
            : List<OrderModel>.from(
                json["result"]!.map((x) => OrderModel.fromJson(x))),
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

class OrderModel {
  dynamic id;
  dynamic name;
  dynamic senderStreet;
  dynamic senderMobile;
  dynamic receiverStreet;
  dynamic receiverMobile;
  dynamic totalChargeAmount;
  dynamic senderName;

  dynamic receiverName;
  dynamic notes;
  dynamic currentNameOfCategory;
  List<dynamic>? courierLines;
  int? stateId;
  dynamic stateName;
  dynamic orderName;
  dynamic categoryId;
  dynamic registrationDate;
  OrderModel({
    this.id,
    this.name,
    this.stateName,
    this.senderStreet,
    this.senderMobile,
    this.orderName,
    this.receiverStreet,
    this.receiverMobile,
    this.totalChargeAmount,
    this.notes,
    this.registrationDate,
    this.courierLines,
    this.senderName,
    this.receiverName,
    this.stateId,
    this.categoryId,
    this.currentNameOfCategory,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        name: json["name"],
        stateName: '',
        orderName: '',
        receiverName: json['receiver_name'],
        senderName: json['sender_name'],
        senderStreet: json["sender_street"],
        registrationDate: json["registration_date"],
        senderMobile: json["sender_mobile"],
        receiverStreet: json["receiver_street"],
        receiverMobile: json["receiver_mobile"],
        currentNameOfCategory: '',
        totalChargeAmount: json["total_charge_amount"],
        notes: json["notes"],
        courierLines: json["courier_lines"] == null
            ? []
            : List<int>.from(json["courier_lines"]!.map((x) => x)),
        stateId: json["state_id"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sender_street": senderStreet,
        "sender_mobile": senderMobile,
        "stateName": stateName,
        "orderName": orderName,
        "currentName": currentNameOfCategory,
        "receiver_street": receiverStreet,
        "receiver_mobile": receiverMobile,
        "registration_date": registrationDate,
        "total_charge_amount": totalChargeAmount,
        "notes": notes,
        "sender_name": senderName,
        "courier_lines": courierLines == null
            ? []
            : List<dynamic>.from(courierLines!.map((x) => x)),
        "state_id": stateId,
        "category_id": categoryId,
      };
}
