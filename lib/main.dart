import 'package:amplitude_flutter/amplitude.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workfit/base/app_localization.dart';
import 'package:workfit/base/config.dart';
import 'package:workfit/base/module/base_module.dart';
import 'package:workfit/base/routes.dart';
import 'package:workfit/data/datasources/remote/apps_remote_data_source.dart';
import 'package:workfit/presentation/account/login/account/login_page.dart';
import 'package:workfit/presentation/base/base_style.dart';
import 'package:workfit/presentation/splash/splash_page.dart';
import 'package:workfit/util/analytic_handler.dart';
import 'package:workfit/util/back_button_delegate.dart';
import 'package:workfit/util/chanel_platform.dart';
import 'package:workfit/util/notification_handler.dart';
import 'package:workfit/util/palette.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModule();
  Routes.createRoutes();
  await _getBaseConfig();
  runApp(WorkFitApp());
}

Future<void> _getBaseConfig() async {
  try {
    final result =
        await ChanelPlatform.baseConfigPlatform.invokeMethod('getBaseConfig');
    final ByteData primaryCert =
        await _getPrimaryCert(result[Config.primaryCertificateConst]);
    final ByteData backupCert =
        await _getBackupCert(result[Config.backupCertificateConst]);
    Config.setConfig(
      result[Config.baseUrlConst],
      result[Config.debuggableConst],
      result[Config.clientIdConst],
      result[Config.clientVersionConst],
      result[Config.deviceIdConst],
      result[Config.packageIdConst],
      primaryCert,
      backupCert,
      result[Config.versionCodeConst],
      result[Config.amplitudeKeyConst],
    );
  } on PlatformException catch (e) {
    print(e);
  }
}

Future<ByteData> _getPrimaryCert(String path) async {
  return await rootBundle.load('assets/cer/' + path);
}

Future<ByteData> _getBackupCert(String path) async {
  return await rootBundle.load('assets/cer/' + path);
}

class BasedFlutterApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BasedFlutterApp();
  }
}

class _BasedFlutterApp extends State<BasedFlutterApp> {
  var appsService = injector<AppsRemoteDataSource>();
  var notificationHandler = injector<NotificationHandler>();
  var analyticHandler = injector<AnalyticHandler>();
  String _idForDeepLink, _pathForDeepLink, _instanceIdForDeepLink;

  @override
  void initState() {
    super.initState();
    // To Do Later For DeepLink
    // _initDynamicLinks();
    notificationHandler.init(_handleDeepLink);
  }

  Future<void> _initDynamicLinks() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      Routes.sailor.navigate(deepLink.path);
    }
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        Routes.sailor.navigate(deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  void _handleDeepLink(Map<String, dynamic> payload, bool isFromForeground) {
    _idForDeepLink = payload[NotificationHandler.idArgs];
    _pathForDeepLink = payload[NotificationHandler.pathArgs];
    _instanceIdForDeepLink = payload[NotificationHandler.instanceIdArgs];

    if (isFromForeground &&
        _pathForDeepLink != null &&
        _pathForDeepLink.isNotEmpty) {
      Routes.sailor.navigate(_pathForDeepLink, params: {
        NotificationHandler.instanceIdArgs: _instanceIdForDeepLink,
        NotificationHandler.idArgs: _idForDeepLink,
      });
      _pathForDeepLink = '';
    }
  }

  void _navigateToDeepLink() {
    Routes.sailor.navigate(_pathForDeepLink,
        params: {
          NotificationHandler.instanceIdArgs: _instanceIdForDeepLink,
          NotificationHandler.idArgs: _idForDeepLink,
          NotificationHandler.isRootRouteArgs: true,
        },
        navigationType: NavigationType.pushReplace);
    _pathForDeepLink = '';
  }

  void _navigateToDashboard(BuildContext context) {
    Navigator.pushReplacement(context, dashboardPageRoute(context));
  }

  void _navigateToLoginPage() {
    Routes.sailor.navigate(Routes.pageLogin,
        navigationType: NavigationType.pushReplace,
        params: {LoginPage.isChangeNumberPageParam: false});
  }

  void _navigateForBackGroundDeepLink(bool isLoggedIn, BuildContext context) {
    if (!isLoggedIn) {
      _navigateToLoginPage();
    } else if (_pathForDeepLink != null && _pathForDeepLink.isNotEmpty) {
      _navigateToDeepLink();
    } else {
      _navigateToDashboard(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return OKToast(
      child: MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          }),
          backgroundColor: Palette.white,
          brightness: Brightness.light,
          primarySwatch: Palette.materialWhite,
          accentColor: Palette.purpleBlue,
          scaffoldBackgroundColor: Palette.white,
          primaryIconTheme: IconThemeData(color: Palette.purpleBlue),
          appBarTheme: AppBarTheme(
              elevation: 0,
              textTheme: TextTheme(
                  title: TextStyle(
                fontSize: 18,
                color: Palette.dark,
                fontFamily: FontFamilies.headerBold,
              ))),
        ),
        debugShowCheckedModeBanner: false,
        locale: const Locale('id', 'ID'),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analyticHandler.analytics),
        ],
        navigatorKey: Routes.sailor.navigatorKey,
        onGenerateRoute: Routes.sailor.generator(),
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [const Locale('id', 'ID')],
        localizationsDelegates: [
          AppLocalization.delegate,
          const BackButtonTextDelegate('id'),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Scaffold(
          body: SplashPage(deepLinkHandler: _navigateForBackGroundDeepLink),
        ),
      ),
    );
  }
}
