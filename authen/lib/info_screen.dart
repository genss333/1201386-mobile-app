import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Info'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('images/cover.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
              image: const DecorationImage(
                image: AssetImage('images/law.jpg'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Trafalgar Law',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text('Tusspon.moo2@gmail.com'),
          ),
          const ListTile(
            leading: Icon(Icons.phone),
            title: Text('081-123-4567'),
          ),
          const ListTile(
            leading: Icon(Icons.location_pin),
            title: Text('Mahasarakham, Thailand'),
          )
        ],
      ),
    );
  }
}
