import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitLoaded extends SplashState {
  final bool isLoggedIn;

  const InitLoaded({this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn];
}
