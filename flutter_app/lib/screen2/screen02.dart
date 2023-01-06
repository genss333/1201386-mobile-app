import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';

class Screen02 extends StatefulWidget {
  const Screen02({super.key});

  @override
  State<Screen02> createState() => _Screen02State();
}

class _Screen02State extends State<Screen02> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(SCREEN2_TITLE),
      ),
    );
  }
}
