
import 'package:basedFlutter/based/modul/analytic_modul.dart';
import 'package:basedFlutter/based/modul/data_modul.dart';
import 'package:basedFlutter/based/modul/domain_modul.dart';
import 'package:basedFlutter/based/modul/network_modul.dart';
import 'package:basedFlutter/based/modul/notification_modul.dart';
import 'package:basedFlutter/based/modul/preference_modul.dart';
import 'package:basedFlutter/based/modul/presentation_modul.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;

void initModule() {
  networkModule();
  domainModule();
  dataModule();
  presentationModule();
  preferenceModule();
  notificationModule();
  analyticModule();
}
