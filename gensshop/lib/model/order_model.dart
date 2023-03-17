// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.data,
  });

  final List<Data>? data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: json["Data"] == null
            ? []
            : List<Data>.from(json["Data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.orderNo,
    this.productName,
    this.productSource,
    this.orderNum,
    this.custId,
  });

  final int? orderNo;
  final String? productName;
  final String? productSource;
  final int? orderNum;
  final String? custId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderNo: json["order_no"],
        productName: json["product_name"],
        productSource: json["product_source"],
        orderNum: json["order_num"],
        custId: json["cust_id"],
      );

  Map<String, dynamic> toJson() => {
        "order_no": orderNo,
        "product_name": productName,
        "product_source": productSource,
        "order_num": orderNum,
        "cust_id": custId,
      };
}
