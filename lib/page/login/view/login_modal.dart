import 'package:flutter/material.dart';

import '../../../util/hex_color.dart';

class LoginModal extends StatelessWidget {

  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectableText("Email"),
          const TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                iconColor: Colors.black,
                icon: Icon(Icons.email),
                hintText: "example@email.com"
            ),
          ),
          SizedBox(height: 10),
          SelectableText("Password"),
          const TextField(
            cursorColor: Colors.black,
            obscureText: true,

            decoration: InputDecoration(
                iconColor: Colors.black,
                icon: Icon(Icons.key),
                hintText: "********"
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {},
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
