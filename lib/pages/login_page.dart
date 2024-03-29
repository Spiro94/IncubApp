import 'package:flutter/material.dart';
import 'package:incubapp/bloc/bloc.dart';
import 'package:incubapp/bloc/providers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: _crearFormularioLogin(context),
    );
  }

  Widget _crearFormularioLogin(BuildContext context) {
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
            _crearCorreoElectronico(bloc),
            _crearPassword(bloc),
            SizedBox(
              height: 30.0,
            ),
            _crearBotonLogin(bloc, context),
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
      'Inicia sesión',
      style: TextStyle(
        color: Colors.orangeAccent,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  Widget _crearCorreoElectronico(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.correoLogin,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.correoLoginChanged,
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

  Widget _crearPassword(SignupBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.passwordLogin,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordLoginChanged,
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

  Widget _crearBotonLogin(SignupBloc bloc, BuildContext context) {
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
          _iniciarSesion(bloc, context);
        },
      ),
    );
  }

  Widget _crearLabelReg2() {
    return Text('Inicia sesión con:');
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
        Text('¿Nuevo usuario? '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, 'signup');
          },
          child: Container(
            child: Text(
              'Regístrate',
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

  void _iniciarSesion(bloc, BuildContext context) {}
}
