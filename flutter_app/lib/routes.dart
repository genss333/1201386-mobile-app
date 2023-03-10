import 'package:flutter/material.dart';
import 'package:flutter_app/screen1/screen01.dart';
import 'package:flutter_app/screen2/screen02.dart';

final Map<String, Widget Function(BuildContext)> routesApp = {
  'screen 1': (context) => const Screen01(),
  'screen 2': (context) => const Screen02(),
};
