class OrderModel {
  bool? status;
  List<Data>? data;
  String? message;

  OrderModel({this.status, this.data, this.message});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data?.map((v) => v.toJson()).toList();
    data['message'] = message;
    return data;
  }
}

class Data {
  int? orderNo;
  String? productName;
  String? productSource;
  int? orderNum;
  String? custId;
  int? productPrice;

  Data({
    this.orderNo,
    this.productName,
    this.productSource,
    this.orderNum,
    this.custId,
    this.productPrice,
  });

  Data.fromJson(Map<String, dynamic> json) {
    orderNo = json['order_no'];
    productName = json['product_name'];
    productSource = json['product_source'];
    orderNum = json['order_num'];
    custId = json['cust_id'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_no'] = orderNo;
    data['product_name'] = productName;
    data['product_source'] = productSource;
    data['order_num'] = orderNum;
    data['cust_id'] = custId;
    data['product_price'] = productPrice;
    return data;
  }
}
