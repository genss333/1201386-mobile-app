import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:gensshop/app_constants.dart';
import 'package:gensshop/data.dart';
import 'package:gensshop/model/order_model.dart';
import 'package:http/http.dart' as http;

class Screen03 extends StatefulWidget {
  const Screen03({super.key});

  @override
  State<Screen03> createState() => _Screen03State();
}

class _Screen03State extends State<Screen03> {
  late List<Data>? listOrder = [];

  void getAPI() async {
    try {
      var url = Uri.http(HOST, '/order/cust', {'cust_id': '13622'});

      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        OrderModel gorder =
            OrderModel.fromJson(convert.jsonDecode(response.body));

        setState(() {
          listOrder = gorder.data;
        });
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  } //getAPI

  @override
  void initState() {
    getAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        getAPI();
      },
      child: ListView.builder(
        itemCount: listOrder!.length,
        itemBuilder: (context, index) {
          Data? order = listOrder![index];
          double price = 0.0;
          if (order.productType == 'food') {
            for (var element in foodList) {
              if (element['name'] == order.productName) {
                price = double.parse(element['price'].toString()) *
                    double.parse(order.orderNum.toString());
              }
            }
          } else {
            for (var element in localDrinkList) {
              if (element['name'] == order.productName) {
                price = double.parse(element['price'].toString()) *
                    double.parse(order.orderNum.toString());
              }
            }
          }
          return Card(
            child: ListTile(
              leading: Image.asset(order.productSource.toString()),
              title: Text(order.productName.toString()),
              subtitle: Text("${order.orderNum} ชิ้น"),
              trailing: Text("${price.toStringAsFixed(2)} บาท"),
            ),
          );
        },
      ),
    );
  }
}
