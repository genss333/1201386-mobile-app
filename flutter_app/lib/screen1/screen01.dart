import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';

class Screen01 extends StatefulWidget {
  const Screen01({super.key});

  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(SCREEN1_TITLE),
      ),
    );
  }
}
