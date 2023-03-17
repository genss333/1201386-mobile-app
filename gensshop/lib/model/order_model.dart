class GetOrder {
  List<Data>? data;

  GetOrder({this.data});

  GetOrder.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? orderno;
  String? productname;

  Data({this.orderno, this.productname});

  Data.fromJson(Map<String, dynamic> json) {
    orderno = json['orderno'];
    productname = json['productname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderno'] = orderno;
    data['productname'] = productname;
    return data;
  }
}
