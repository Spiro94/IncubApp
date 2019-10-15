import 'package:flutter/material.dart';
import 'package:incubapp/pages/login_page.dart';

import 'package:incubapp/pages/test_page.dart';

Map<String, dynamic> obtenerRutas() {
  final rutas = {
    'home': (BuildContext context) => LoginPage(),
    'home1': (BuildContext context) => TestPage(),
  };

  return rutas;
}
