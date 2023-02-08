import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lore_keeper_frontend/page/success.dart';
import 'package:lore_keeper_frontend/repository/auth_repository.dart';

class LoginController extends GetxController {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  final AuthRepository _authRepository = Get.put(AuthRepository());

  void signIn() async {

    Map<String, dynamic> loginMap = {
      "username" : emailController.text,
      "password" : passWordController.text
    };

    if (await _authRepository.login(loginMap)) {

      Get.to(const SuccessPage());

    } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const AlertDialog(title: SelectableText("Username or password incorrect!"));
          }
        );

    }

  }

}