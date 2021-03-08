import 'package:basedFlutter/presentation/splash/bloc/splash_event.dart';
import 'package:basedFlutter/presentation/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const InitLoaded());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    try {
      if (event is FetchInit) {
        // final bool isLoggedIn = await _checkLogin();
        yield InitLoaded(isLoggedIn: false);
      }
    } catch (_) {}
  }

  // Future<bool> _checkLogin() async {
  //   final bool result = await checkLoginUseCase.call();
  //   return result;
  // }
}
