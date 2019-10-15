import 'package:flutter/material.dart';

import 'package:incubapp/pages/login_page.dart';
import 'package:incubapp/pages/signup_page.dart';

import 'package:incubapp/pages/test_page.dart';

Map<String, dynamic> obtenerRutas() {
  final rutas = {
    'signup': (BuildContext context) => SignupPage(),
    'login': (BuildContext context) => LoginPage(),
    'home1': (BuildContext context) => TestPage(),
  };

  return rutas;
}
