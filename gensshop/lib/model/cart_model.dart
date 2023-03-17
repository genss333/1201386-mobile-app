// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String name;
  final String image;
  final int price;
  final int quantity;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
      };
}
