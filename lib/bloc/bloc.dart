import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:incubapp/bloc/validator.dart';

class LoginBloc with Validator {
  final _nombresController = BehaviorSubject<String>();
  final _apellidosController = BehaviorSubject<String>();
  final _correoController = BehaviorSubject<String>();
  final _correoConfController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get nombresChanged => _nombresController.sink.add;

  Function(String) get apellidosChanged => _apellidosController.sink.add;

  Function(String) get correoChanged => _correoController.sink.add;

  Function(String) get correoConfChanged => _correoConfController.sink.add;

  Function(String) get passwordChanged => _passwordController.sink.add;

  Stream<String> get nombres =>
      _nombresController.stream.transform(nombresValidator);
  Stream<String> get apellidos =>
      _apellidosController.stream.transform(apellidosValidator);
  Stream<String> get correo =>
      _correoController.stream.transform(emailValidator);
  Stream<String> get correoConf =>
      _correoConfController.stream.transform(emailConfirmation);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);

  String get obtenerNombre => _nombresController.value;
  String get obtenerApellidos => _apellidosController.value;
  String get obtenerCorreo => _correoController.value;
  String get obtenerPassword => _passwordController.value;

  dispose() {
    _nombresController?.close();
    _apellidosController?.close();
    _correoController?.close();
    _correoConfController?.close();
    _passwordController?.close();
  }
}
