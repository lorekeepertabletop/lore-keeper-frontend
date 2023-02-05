

import 'enum/role.dart';

class User {

  int? idUser;
  String username;
  String? email;
  String password;
  List<Role>? roleList;

  User({
    this.idUser,
    required this.username,
    this.email,
    required this.password,
    this.roleList
  });

  factory User.fromJson(Map<String, dynamic> json) {

    return User(
      idUser: json["id_user"] as int,
      username: json["username"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      roleList: List<Role>.from(json["roles"].map((role) => Role.valueOf(role))),
    );

  }

  Map<String, dynamic> toJson() {

    return {
      "username" : username,
      "email" : email,
      "password" : password,
      "roles" : List<String>.from(roleList!.map((role) => role.name))
    };

  }

  @override
  String toString() {

    return "idUser: $idUser, username: $username, email: $email, password: $password, roles: $roleList";

  }

}