import 'package:flutter/material.dart';

class Screen03 extends StatelessWidget {
  const Screen03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.5),
          child: Container(
            width: 250,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://static.wikia.nocookie.net/p__/images/8/81/Hancock_and_Salome_render.png/revision/latest?cb=20200419093511&path-prefix=protagonist'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
