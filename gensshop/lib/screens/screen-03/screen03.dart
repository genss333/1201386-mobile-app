import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:gensshop/app_constants.dart';
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

  deleteAPI(String product_name) async {
    try {
      var url =
          Uri.http(HOST, '/order/delete', {'product_name': '$product_name'});

      var response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.green,
              title: const Text('Delete Order'),
              content: const Text(
                'Delete Order Success!!',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        debugPrint('Delete not Success!!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
          return Card(
            child: ListTile(
                leading: Image.asset(order.productSource.toString()),
                title: Text(order.productName.toString()),
                subtitle: Text(
                  "${order.orderNum} ชิ้น ${order.productPrice} บาท",
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () => _onDelete(order.productName.toString()),
                )),
          );
        },
      ),
    );
  }

  _onDelete(String product_name) async {
    await deleteAPI(product_name);
    getAPI();
  }
}
