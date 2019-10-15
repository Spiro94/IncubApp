import 'package:flutter/material.dart';
import 'package:incubapp/bloc/providers.dart';
import 'package:incubapp/routes/rutas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: obtenerRutas(),
        theme: ThemeData(
          primaryColor: Colors.orangeAccent,
        ),
      ),
    );
  }
}
