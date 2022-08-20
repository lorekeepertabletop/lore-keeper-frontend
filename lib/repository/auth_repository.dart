import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lore_keeper_frontend/util/dio_api.dart';

class AuthRepository {

  Future<bool> login(Map<String, dynamic> loginMap) async {

    FormData loginFormData = FormData.fromMap(loginMap);

    try {

      Response response = await DioApi.post("/login", loginFormData);

      return true;

    } on DioError catch(e) {

      if (e.response!.statusCode == HttpStatus.forbidden) {

        return false;

      }

      throw Exception(e);

    }

  }

}