import 'package:flutter/material.dart';
import 'package:incubapp/bloc/providers.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('prueba'),
      ),
      body: Center(
        child: Container(
          child: Text('${bloc.obtenerNombre} ${bloc.obtenerApellidos}'),
        ),
      ),
    );
  }
}
