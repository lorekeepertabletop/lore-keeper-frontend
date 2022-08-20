import 'package:dio/dio.dart';
import 'package:lore_keeper_frontend/interceptors/api_interceptor.dart';

class DioApi {

  static String backendUrl = "http://lorekepper.herokuapp.com/api/";

  static Dio _getDio({Map<String, dynamic>? headers}) {

    BaseOptions baseOptions = BaseOptions(
        baseUrl: backendUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
    );

    if (headers != null) {

      baseOptions.headers = headers;

    }

    Dio dio = Dio(baseOptions);
    dio.interceptors.add(ApiInterceptor());

    return dio;

  }

  static Future<Response> get(
      String url,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {

    return _getDio(headers: headers).get(url, queryParameters: queryParameters);

  }

  static Future<Response> post(
      String url,
      dynamic data,
      {Map<String, dynamic>? headers, Map<String, dynamic>? queryParameters}) async {

    return _getDio(headers: headers).post(url, data: data, queryParameters: queryParameters);

  }

}
