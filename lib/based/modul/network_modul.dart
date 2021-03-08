import 'package:basedFlutter/based/modul/based_modul.dart';
import 'package:basedFlutter/based/network/network_client.dart';

void networkModule() {
  injector.registerLazySingleton(() => NetworkClient());
}