import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:specta_mobile/blocs/bloc/authentication_bloc.dart';
import 'package:specta_mobile/blocs/bloc/bloc.dart';
import 'package:specta_mobile/blocs/simple_bloc_delegate.dart';
import 'package:specta_mobile/service_locator.dart';
import 'package:specta_mobile/ui/components/loading_indicator.dart';
import 'package:specta_mobile/ui/screens/homepage/homepage.dart';
import 'package:specta_mobile/ui/screens/login/login_page.dart';
import 'package:specta_mobile/ui/screens/splash/splash_page.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc()
        ..dispatch(AppStarted());
      },
      child: SpectaApp(),
    )
  );
}

class SpectaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: BlocProvider.of<AuthenticationBloc>(context),
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage();
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}

