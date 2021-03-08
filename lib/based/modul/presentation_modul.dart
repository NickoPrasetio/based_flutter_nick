import 'package:basedFlutter/based/modul/based_modul.dart';
import 'package:basedFlutter/presentation/splash/bloc/splash_bloc.dart';

void presentationModule() {
  injector.registerFactory(() => SplashBloc());
}
