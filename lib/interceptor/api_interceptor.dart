import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

    handler.reject(err);

  }
}