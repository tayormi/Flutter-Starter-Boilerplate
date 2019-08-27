import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specta_mobile/blocs/bloc/authentication_bloc.dart';
import 'package:specta_mobile/ui/screens/login/bloc/login_bloc.dart';
import 'package:specta_mobile/ui/screens/login/login_form.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)
          );
        },
        child: LoginForm(),
      ),
    );
  }
}