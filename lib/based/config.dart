import 'package:flutter/services.dart';

class Config {
  static const baseUrlConst = 'baseUrl';
  static const debuggableConst = 'debuggable';
  static const clientIdConst = 'clientId';
  static const clientVersionConst = 'clientVersion';
  static const deviceIdConst = 'deviceId';
  static const packageIdConst = 'packageId';
  static const versionCodeConst = 'versionCode';

  static Map<String, dynamic> _config;

  static void setConfig(
    String baseUrl,
    bool isDebug,
    String clientId,
    String clientVersion,
    String deviceId,
    String packageId,
    String versionCode,
  ) {
    final config = {
      baseUrlConst: baseUrl,
      debuggableConst: isDebug,
      clientIdConst: clientId,
      clientVersionConst: clientVersion,
      deviceIdConst: deviceId,
      packageIdConst: packageId,
      versionCodeConst: versionCode
    };
    _config = config;
  }

  static bool isDebuggable() => _config[debuggableConst];

  static String getBaseUrl() => _config[baseUrlConst];

  static String getClientId() => _config[clientIdConst];

  static String getVersion() => _config[clientVersionConst];

  static String getVersionCode() => _config[versionCodeConst];

  static String getDeviceId() => _config[deviceIdConst];

  static String getPackageId() => _config[packageIdConst];
}
