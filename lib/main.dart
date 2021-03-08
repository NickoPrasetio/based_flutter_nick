import 'package:amplitude_flutter/amplitude.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ruangmom/base/config.dart';
import 'package:ruangmom/base/module/base_module.dart';
import 'package:ruangmom/base/routes.dart';
import 'package:ruangmom/data/datasources/remote/apps_remote_data_source.dart';
import 'package:ruangmom/presentation/dashboard/dashboard_page.dart';
import 'package:ruangmom/presentation/splash/splash_page.dart';
import 'package:ruangmom/util/analytic_handler.dart';
import 'package:ruangmom/util/back_button_delegate.dart';
import 'package:ruangmom/util/chanel_platform.dart';
import 'package:ruangmom/util/notification_handler.dart';
import 'package:ruangmom/util/palette.dart';
import 'package:sailor/sailor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'base/app_localization.dart';
import 'presentation/splash/splash_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance();
  await _getBaseConfig();
  initModule();
  Routes.createRoutes();
  _setupCrashlytics();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RuangMomApp());
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
        result[Config.afAppIdConst],
        primaryCert,
        backupCert,
        result[Config.amplitudeKeyConst],
        result[Config.oneLinkUrlConst],
        result[Config.oneSignalAppIdConst],
        result[Config.oneHostRMConst]);
    _setupAppsFlyer();
    _setupAmplitude();
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


void _setupCrashlytics() {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

void _setupAppsFlyer() {
  final AppsFlyerOptions options = AppsFlyerOptions(
    afDevKey: 'HRGTHNQgJu7Xi4QENQY7sN',
    appId: Config.getAfAppId(),
    showDebug: Config.isDebuggable(),
  );
  RuangMomApp.appsflyerSdk = AppsflyerSdk(options);
  RuangMomApp.appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true);
}

void _setupAmplitude() {
  final String amplitudeKey = Config.getAmplitudeKey().toString();
  final Amplitude amplitude = Amplitude(amplitudeKey);
  amplitude.init(amplitudeKey);
  RuangMomApp.amplitudeSdk = amplitude;
}

class RuangMomApp extends StatefulWidget {
  static AppsflyerSdk appsflyerSdk;
  static Amplitude amplitudeSdk;
  static AppLifecycleState _lastLifecyleState = AppLifecycleState.detached;

  static Future<bool> trackEvent(String eventName) {
    final Map eventValues = {};
    return appsflyerSdk.logEvent(eventName, eventValues);
  }

  @override
  State<StatefulWidget> createState() {
    return _RuangMomAppState();
  }

  static AppLifecycleState lifecycleState() {
    return _lastLifecyleState;
  }

  static void updateLifeCycleState(AppLifecycleState state) {
    _lastLifecyleState = state;
  }
}

class _RuangMomAppState extends State<RuangMomApp> {
  var appsService = injector<AppsRemoteDataSource>();
  var notificationHandler = injector<NotificationHandler>();
  var analyticHandler = injector<AnalyticHandler>();
  Map<String, dynamic> _idForDeepLink;
  String _pathForDeepLink, _launchUrlFromDeeplink;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    notificationHandler.init(_handleDeepLink);
    _handleAppLifecycleState();
  }

  void _handleAppLifecycleState() {
    SystemChannels.lifecycle.setMessageHandler((msg) {
      switch (msg) {
        case 'AppLifecycleState.paused':
          RuangMomApp.updateLifeCycleState(AppLifecycleState.paused);
          break;
        case 'AppLifecycleState.inactive':
          RuangMomApp.updateLifeCycleState(AppLifecycleState.inactive);
          break;
        case 'AppLifecycleState.resumed':
          RuangMomApp.updateLifeCycleState(AppLifecycleState.resumed);
          break;
        case 'AppLifecycleState.detached':
          RuangMomApp.updateLifeCycleState(AppLifecycleState.detached);
          break;
        default:
          break;
      }
      return;
    });
  }

  void _handleDeepLink(Map<String, dynamic> payload, bool isFromForeground) {
    _idForDeepLink = payload[NotificationHandler.idArgs];
    _pathForDeepLink = payload[NotificationHandler.pathArgs];
    _launchUrlFromDeeplink = payload[NotificationHandler.urlArgs];
    if (isFromForeground) {
      _navigateToDeepLink();
    }
  }

  void _navigateToDeepLink() {
    if (_idForDeepLink != null) {
      Routes.sailor.navigate(_pathForDeepLink, params: _idForDeepLink);
    } else if (_pathForDeepLink != null) {
      Routes.sailor.navigate(_pathForDeepLink);
    } else if (_launchUrlFromDeeplink != null &&
        _launchUrlFromDeeplink.isNotEmpty) {
      launch(_launchUrlFromDeeplink);
      _launchUrlFromDeeplink = null;
    }
  }

  void _navigateToDashboard(Function postRender) {
    Routes.sailor.navigate(Routes.pageDashboard,
        params: {
          DashboardPage.isLogInParam: true,
          DashboardPage.postRenderParam: postRender
        },
        navigationType: NavigationType.pushReplace);
  }

  void _navigateToPreposition() {
    Routes.sailor.navigate(Routes.pagePreposition,
        navigationType: NavigationType.pushReplace);
  }

  void _navigateForBackgroundDeepLink(bool isLoggedIn) {
    if (!isLoggedIn) {
      _navigateToPreposition();
    } else if (_pathForDeepLink != null) {
      _navigateToDashboard(_navigateToDeepLink);
    } else {
      _navigateToDashboard(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return MaterialApp(
        theme: ThemeData(
          backgroundColor: Palette.white,
          brightness: Brightness.light,
          primarySwatch: Palette.materialWhite,
          accentColor: Palette.orange,
          scaffoldBackgroundColor: Palette.white,
          primaryIconTheme: IconThemeData(color: Palette.orange),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        debugShowCheckedModeBanner: false,
        locale: const Locale('id'),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analyticHandler.analytics),
        ],
        navigatorKey: Routes.sailor.navigatorKey,
        onGenerateRoute: Routes.sailor.generator(),
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [const Locale('id', '')],
        localizationsDelegates: [
          AppLocalization.delegate,
          const BackButtonTextDelegate('id'),
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale == null) {
            debugPrint('*language locale is null!!!');
            return supportedLocales.first;
          }
          // Check if the current device locale is supported
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          // If the locale of the device is not supported, use the first one
          // from the list (English, in this case).
          return supportedLocales.first;
        },
        home: Scaffold(
          body: SplashPage(
              path: _pathForDeepLink,
              id: _idForDeepLink,
              deepLinkHandler: _navigateForBackgroundDeepLink),
        ));
  }
}
