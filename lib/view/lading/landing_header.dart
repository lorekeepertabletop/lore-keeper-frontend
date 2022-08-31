import 'package:flutter/material.dart';
import 'package:lore_keeper_frontend/component/button_dropdown.dart';
import 'package:sizer/sizer.dart';

import '../../component/header_dropdown.dart';

class LandingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Row(
            children: [
              SizedBox(width: 2.w,),
              HeaderDropdown("Play Now", onTap: () {},),
              SizedBox(width: 2.w,),
              HeaderDropdown("Games", onTap: () {}),
              SizedBox(width: 2.w,),
              HeaderDropdown("Community", onTap: () {}),
              SizedBox(width: 2.w,),
              HeaderDropdown("Donate", onTap: () {}),
            ],
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("LOGO AQUI"),
                  SizedBox(width: 1.w,),
                  ButtonDropdown("Sign In", onPressed: () {}),
                  SizedBox(width: 1.w,),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.settings),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
