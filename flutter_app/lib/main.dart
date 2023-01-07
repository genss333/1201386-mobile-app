import 'package:flutter/material.dart';
import 'package:flutter_app/components/popup_menu.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomeScreen(),
      routes: routesApp,
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text(
          APP_TITLE,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Rowdies',
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                color: Colors.redAccent,
                offset: Offset(1.0, 3.0),
              )
            ],
          ),
        ),
        actions: const [
          PopUpMenuButtonComponent(),
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            BODY_DETAIL,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 35,
              fontFamily: 'Rowdies',
            ),
          ),
        ),
      ),
    );
  }
}
