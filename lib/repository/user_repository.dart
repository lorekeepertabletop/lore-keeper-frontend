import 'package:dio/dio.dart';
import 'package:lore_manager_frontend/domain/user.dart';
import 'package:lore_manager_frontend/util/dio_api.dart';

class UserRepository {

  Future<User> addUser(User user) async {

    Response response = await DioApi.post("/user", user.toJson());
      
    return User.fromJson(response.data);

  }

  Future<User> getUser(int idUser) async {

    Response response = await DioApi.get("/user/$idUser");

    return User.fromJson(response.data);

  }

}