import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:gensshop/app_constants.dart';
import 'package:gensshop/data.dart';
import 'package:http/http.dart' as http;

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.type,
    required this.id,
  }) : super(key: key);

  final String type;
  final String id;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List productDetail = [];
  Future<List> getProductDetail() async {
    if (widget.type == 'food') {
      for (var i = 0; i < foodList.length; i++) {
        if (foodList[i]['id'].toString() == widget.id) {
          setState(() {
            productDetail.add(foodList[i]);
          });
        }
      }
    } else if (widget.type == 'localDrink') {
      for (var i = 0; i < localDrinkList.length; i++) {
        if (localDrinkList[i]['id'].toString() == widget.id) {
          setState(() {
            productDetail.add(localDrinkList[i]);
          });
        }
      }
    }
    return productDetail;
  }

  int quantity = 1;

  //write to local storage
  Future<void> addToCart(Map<String, dynamic> values) async {
    try {
      var url = Uri.http(HOST, '/order/add');

      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: convert.jsonEncode(values));
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.green,
              title: const Text('Add to Cart'),
              content: const Text(
                'Add to Cart Success!!',
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
        debugPrint('Insert not Success!!');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    getProductDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: ListView.builder(
        itemCount: productDetail.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: MediaQuery.of(context).size.height * 0.1,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage('${productDetail[index]['image']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${productDetail[index]['name']}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '฿${productDetail[index]['price']}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Map<String, dynamic> values = {};
            values['cust_id'] = "13622";
            values['product_name'] = productDetail[0]['name'];
            values['product_source'] = productDetail[0]['name'];
            values['order_num'] = quantity;
            addToCart(values);
          },
          label: const Text('Add to Cart'),
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
