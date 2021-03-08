import 'package:basedFlutter/based/app_localization.dart';
import 'package:basedFlutter/based/config.dart';
import 'package:basedFlutter/based/network/app_remote_datasource.dart';
import 'package:basedFlutter/based/routes/routes.dart';
import 'package:basedFlutter/presentation/splash/splash_page.dart';
import 'package:basedFlutter/util/back_button_delegate.dart';
import 'package:basedFlutter/util/channel_platform.dart';
import 'package:basedFlutter/util/font_families.dart';
import 'package:basedFlutter/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'based/modul/based_modul.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initModule();
  Routes.createRoutes();
  await _getBaseConfig();
  runApp(BasedFlutterApp());
}

Future<void> _getBaseConfig() async {
  try {
    final result =
        await ChanelPlatform.baseConfigPlatform.invokeMethod('getBaseConfig');
    Config.setConfig(
      result[Config.baseUrlConst],
      result[Config.debuggableConst],
      result[Config.clientIdConst],
      result[Config.clientVersionConst],
      result[Config.deviceIdConst],
      result[Config.packageIdConst],
      result[Config.versionCodeConst],
    );
  } on PlatformException catch (e) {
    print(e);
  }
}

class BasedFlutterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BasedFlutterApp();
  }
}

class _BasedFlutterApp extends State<BasedFlutterApp> {
  var appsService = injector<AppsRemoteDataSource>();

  @override
  void initState() {
    super.initState();
  }

  // void _navigateToLoginPage() {
  //   Routes.sailor.navigate(Routes.pageLogin,
  //       navigationType: NavigationType.pushReplace,
  //       params: {LoginPage.isChangeNumberPageParam: false});
  // }

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
          body: SplashPage(),
        ),
      ),
    );
  }
}
