import 'package:basedFlutter/based/modul/based_modul.dart';
import 'package:basedFlutter/presentation/splash/bloc/splash_bloc.dart';
import 'package:basedFlutter/presentation/splash/bloc/splash_event.dart';
import 'package:basedFlutter/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => injector<SplashBloc>()..add(FetchInit()),
        child: SplashWidget(),
      ),
    );
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (BuildContext context, SplashState state) {
        if (state is InitLoaded) {
          return Scaffold(body: _loadingView(context, state.isLoggedIn));
        } else {
          return Container();
        }
      },
    );
  }

  Widget _loadingView(BuildContext context, bool isLoggedIn) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Image.asset('assets/images/based_splash.png'),
      ),
    );
  }
}
