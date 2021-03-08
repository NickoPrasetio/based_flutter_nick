import 'package:basedFlutter/based/modul/based_modul.dart';
import 'package:basedFlutter/based/network/app_remote_datasource.dart';

void dataModule() {
  injector.registerLazySingleton<AppsRemoteDataSource>(
      () => AppsRemoteDataSourceImpl());
}
