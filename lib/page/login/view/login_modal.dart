import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lore_keeper_frontend/page/login/controller/login_controller.dart';

import '../../../util/hex_color.dart';

class LoginModal extends StatelessWidget {

  LoginModal({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectableText("Email"),
          TextField(
            controller: controller.emailController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                iconColor: Colors.black,
                icon: Icon(Icons.email),
                hintText: "example@email.com"
            ),
          ),
          const SizedBox(height: 10),
          const Text("Password"),
          TextField(
            controller: controller.passWordController,
            cursorColor: Colors.black,
            obscureText: true,
            decoration: const InputDecoration(
                iconColor: Colors.black,
                icon: Icon(Icons.key),
                hintText: "********"
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () => controller.signIn(),
                  style: ElevatedButton.styleFrom(
                      shape: const ContinuousRectangleBorder(
                          side: BorderSide(color: Colors.black)
                      )
                  ),
                  child: const Text("Sign In", style: TextStyle(color: Colors.black),)
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 14,
                        color: HexColor("#010d5c"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      "Not a member yet?",
                      style: TextStyle(
                        fontSize: 14,
                        color: HexColor("#010d5c"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
