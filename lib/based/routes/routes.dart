import 'package:basedFlutter/main.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor(
      options:
          const SailorOptions(defaultTransitions: [SailorTransition.fade_in]));
  static const String pageInitial = '/initial';
  static const String pageDashboard = '/pageDashboard';
  static const String pageLogin = '/pageLogin';
  
  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: pageInitial,
        builder: (context, args, params) {
          return BasedFlutterApp();
        },
      ),
    ]);
  }
}
