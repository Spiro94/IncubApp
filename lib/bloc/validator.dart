import 'dart:async';

class Validator {
  static String _correoValidar;
//TODO: Enhance names and surnames validation
  final nombresValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (nombre, sink) {
      if (nombre.length > 0) {
        sink.add(nombre);
      } else {
        sink.addError('Ingrese algún dato');
      }
    },
  );

  final apellidosValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (apellido, sink) {
      if (apellido.length > 0) {
        sink.add(apellido);
      } else {
        sink.addError('Ingrese algún dato');
      }
    },
  );

  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      RegExp regExp = new RegExp(pattern);
      if (regExp.hasMatch(email)) {
        sink.add(email);
        _correoValidar = email;
      } else {
        sink.addError('Correo no válido');
      }
    },
  );

  final emailConfirmation = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (_correoValidar == email) {
        sink.add(email);
      } else {
        sink.addError('Correos no coinciden');
      }
    },
  );

  final passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 6) {
        sink.add(password);
      } else {
        sink.addError('Mínimo 6 caracteres');
      }
    },
  );
}
