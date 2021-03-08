import 'package:basedFlutter/based/modul/based_modul.dart';
import 'package:basedFlutter/based/network/based_response.dart';
import 'package:basedFlutter/based/network/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class BaseService {
  final content = 'content';
  static const getMethod = 'GET';
  static const postMethod = 'POST';
  static const putMethod = 'PUT';
  static const deleteMethod = 'DELETE';

  Future<BasedResponse> callService({
    @required String url,
    String baseUrl,
    String method = getMethod,
    var dataBody,
    Map<String, Object> queryParam,
    bool requireToken = true,
  }) async {
    try {
      final client = injector<NetworkClient>().getClient();
      client.options.method = method;
      client.options.baseUrl = baseUrl;
      final Response response = await client.request(url = url,
          data: dataBody, queryParameters: queryParam);
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return Success(response.data[content]);
      } else {
        return Error(
            ErrorData(response.data['error']['message'], response.statusCode));
      }
    } on PlatformException catch (e) {
      return Error(ErrorData(e.message, 500));
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return Error(ErrorData('not found', e.response.statusCode));
      } else if (e.response.statusCode == 401 ||
          e.response.statusCode == 403) {}
    }
  }
}
