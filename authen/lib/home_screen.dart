import 'package:flutter/material.dart';

import 'info_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(Icons.home),
        title: const Text('Home'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          ListTile(
            onTap: () => _onGoToInfo(context),
            leading: const Icon(Icons.info),
            title: const Text('info'),
          ),
          ListTile(
            onTap: () => _onLogout(context),
            textColor: Colors.red,
            iconColor: Colors.red,
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
          ),
        ],
      )),
    );
  }

  void _onLogout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  _onGoToInfo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InfoScreen(),
      ),
    );
  }
}
