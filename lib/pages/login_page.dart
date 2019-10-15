import 'package:flutter/material.dart';
import 'package:incubapp/bloc/bloc.dart';
import 'package:incubapp/bloc/providers.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('IncubApp'),
      ),
      body: Center(
        child: _crearLogin(context),
      ),
    );
  }

  Widget _crearLogin(BuildContext context) {
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
            _crearBotonRegistrarse(bloc),
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

  Widget _crearNombres(LoginBloc bloc) {
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

  Widget _crearApellidos(LoginBloc bloc) {
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

  Widget _crearCorreoElectronico(LoginBloc bloc) {
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

  Widget _crearConfirmacionCorreoElectronico(LoginBloc bloc) {
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

  Widget _crearPassword(LoginBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.passwordChanged,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            errorText: snapshot.error,
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0),
            suffixIcon: IconButton(
              icon: Icon(Icons.visibility),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  Widget _crearBotonRegistrarse(LoginBloc bloc) {
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
          login(bloc);
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
            //TODO: Change route name for the proper login page.
            Navigator.pushNamed(context, 'home1');
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

  void login(LoginBloc bloc) {
    print('=====================');
    print(bloc.obtenerNombre);
    print(bloc.obtenerApellidos);
    print('=====================');
  }
}
