import 'package:flutter/material.dart';
import 'package:gensshop/themes/app_themes.dart';

import 'routes/routes.dart';

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
      title: 'final project',
      theme: getThemeFromKey(darkModeOn ? 'dark' : 'light'),
      initialRoute: '/',
      routes: routes,
    );
  }
}
