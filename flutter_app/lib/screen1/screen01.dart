import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';

class Screen01 extends StatelessWidget {
  const Screen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SCREEN1_TITLE),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Icon(
                Icons.home,
                color: Colors.red,
              ),
              Icon(
                Icons.home,
                color: Colors.blue,
              ),
              Icon(
                Icons.home,
                color: Colors.green,
              ),
              Icon(
                Icons.home,
                color: Colors.yellow,
              ),
              Icon(
                Icons.home,
                color: Colors.purple,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.blue,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.green,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.yellow,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.purple,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              Icon(
                Icons.man,
                color: Colors.red,
              ),
              Icon(
                Icons.man,
                color: Colors.blue,
              ),
              Icon(
                Icons.man,
                color: Colors.green,
              ),
              Icon(
                Icons.man,
                color: Colors.yellow,
              ),
              Icon(
                Icons.man,
                color: Colors.purple,
              )
            ],
          ),
        ],
      ),
    );
  }
}
