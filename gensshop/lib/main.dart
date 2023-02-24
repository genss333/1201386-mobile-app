import 'package:flutter/material.dart';
import 'package:gensshop/screens/home/home_screen.dart';
import 'package:gensshop/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.platformBrightnessOf(context);
    final bool darkModeOn = brightness == Brightness.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GensShop',
      theme: getThemeFromKey(darkModeOn ? 'dark' : 'light'),
      home: const HomeScreen(),
    );
  }
}
