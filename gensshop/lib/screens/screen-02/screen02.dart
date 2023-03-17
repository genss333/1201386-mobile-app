import 'package:flutter/material.dart';
import 'package:gensshop/data.dart';
import 'package:gensshop/screens/product_detail/product_detail_screen.dart';

class Screen02 extends StatefulWidget {
  const Screen02({super.key});

  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      children: [
        for (var i = 0; i < localDrinkList.length; i++)
          Container(
            margin: const EdgeInsets.all(10.0),
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
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      type: 'localDrink',
                      id: localDrinkList[i]['id'].toString(),
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      image: DecorationImage(
                        image:
                            AssetImage(localDrinkList[i]['image'].toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(localDrinkList[i]['name'].toString()),
                      Text("฿${localDrinkList[i]['price']}"),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
