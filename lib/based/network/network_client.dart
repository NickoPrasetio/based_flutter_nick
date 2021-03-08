import 'dart:io';

import 'package:basedFlutter/based/config.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class NetworkClient {
  NetworkClient._internal();
  Dio dio;

  // ignore: sort_constructors_first, sort_unnamed_constructors_first
  NetworkClient() {
    dio = Dio(BaseOptions(headers: {
      'X-Client-ID': Config.getClientId(),
      'X-Client-Version': Config.getVersion(),
      'X-Device-Id': Config.getDeviceId(),
    }));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      SecurityContext sc = SecurityContext();
      final HttpClient httpClient = HttpClient(context: sc);
      return httpClient;
    };
  }

  Dio getClient() {
    return dio;
  }
}
