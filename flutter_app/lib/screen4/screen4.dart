import 'package:flutter/material.dart';

class Screen04 extends StatelessWidget {
  const Screen04({
    super.key,
    required this.imgUrl,
    required this.characterName,
    required this.gender,
  });

  final String imgUrl;
  final String characterName;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Transform.rotate(
            angle: 0.5,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.teal,
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Colors.red,
                    width: 5,
                  ),
                ),
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // trans form text curving
          Positioned(
            bottom: 40,
            right: MediaQuery.of(context).size.width / 2 - 130,
            child: Center(
              child: Text(
                characterName,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 40,
                  fontFamily: 'Rowdies',
                  letterSpacing: 1.5,
                  shadows: [
                    Shadow(
                      color: Colors.blueAccent,
                      offset: Offset(1.0, 3.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
