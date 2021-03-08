
import 'package:flutter/services.dart';

class ChanelPlatform {
  static const appPlatform = const MethodChannel('flutter.app.platform');
  static const userPlatform = const MethodChannel('flutter.user.platform');
  static const baseConfigPlatform = const MethodChannel('flutter.base.config');
}