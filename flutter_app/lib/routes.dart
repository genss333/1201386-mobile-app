import 'package:flutter/material.dart';
import 'package:flutter_app/screen1/screen01.dart';
import 'package:flutter_app/screen2/screen02.dart';

final Map<String, Widget Function(BuildContext)> routesApp = {
  'screen01': (context) => const Screen01(),
  'screen02': (context) => const Screen02(),
};
