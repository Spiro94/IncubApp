import 'package:flutter/material.dart';
import 'package:incubapp/bloc/bloc.dart';
import 'package:incubapp/bloc/providers.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Image(
            image: AssetImage('assets/incubapp_logo.jpg'),
          ),
        ),
      ),
      body: Center(
        child: _crearFormularioReg(context),
      ),
    );
  }

  Widget _crearFormularioReg(BuildContext context) {
    final bloc = Provider.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            _crearLabelReg(),
            SizedBox(
              height: 10.0,
            ),
            _crearNombres(bloc),
            _crearApellidos(bloc),
            _crearCorreoElectronico(bloc),
            _crearConfirmacionCorreoElectronico(bloc),
            _crearPassword(bloc),
            SizedBox(
              height: 30.0,
            ),
            _crearBotonRegistrarse(bloc, context),
            SizedBox(
              height: 25.0,
            ),
            _crearLabelReg2(),
            SizedBox(
              height: 15.0,
            ),
            _crearButonesRegExt(),
            SizedBox(
              height: 25.0,
            ),
            _crearLabelReg3(context),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Text _crearLabelReg() {
    return Text(
      'Regístrate',
      style: TextStyle(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
    );
  }

  Widget _crearNombres(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.nombres,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.nombresChanged,
          decoration: InputDecoration(
            hintText: 'Nombres',
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _crearApellidos(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.apellidos,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.apellidosChanged,
          decoration: InputDecoration(
            hintText: 'Apellidos',
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _crearCorreoElectronico(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.correo,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.correoChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Correo electrónico',
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _crearConfirmacionCorreoElectronico(SignupBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.correoConf,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: 'Confirma tu correo electrónico',
                contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
                errorText: snapshot.error),
            onChanged: bloc.correoConfChanged,
          );
        });
  }

  Widget _crearPassword(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordChanged,
          obscureText: _hidePassword,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            errorText: snapshot.error,
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
            suffixIcon: IconButton(
              icon:
                  Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _hidePassword = !_hidePassword;
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget _crearBotonRegistrarse(SignupBloc bloc, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: RaisedButton(
        child: Text('Registrarme'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 5.0,
        color: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () {
          _registrar(bloc, context);
        },
      ),
    );
  }

  Widget _crearLabelReg2() {
    return Text('También regístrate con:');
  }

  Widget _crearButonesRegExt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          child: Text('Facebook'),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('LinkedIn'),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _crearLabelReg3(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('¿Ya tienes una cuenta? '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
          child: Container(
            child: Text(
              'Inicia sesión',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }

  void _registrar(SignupBloc bloc, BuildContext context) {
    print('=====================');
    print(bloc.obtenerNombre);
    print(bloc.obtenerApellidos);
    print('=====================');

    //Navigator.pushNamed(context, 'home1');
  }
}
