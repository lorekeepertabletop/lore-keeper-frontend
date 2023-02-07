import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lore_keeper_frontend/component/button_dropdown.dart';
import 'package:lore_keeper_frontend/domain/rec_values/enum/rec_direction.dart';
import 'package:lore_keeper_frontend/util/hex_color.dart';
import 'package:lore_keeper_frontend/util/text_styles.dart';
import 'package:lore_keeper_frontend/view/login/login_modal.dart';
import 'package:sizer/sizer.dart';

import '../../component/header_dropdown.dart';

class LandingHeader extends StatelessWidget {

  ElevatedButton _createElevatedButton (String text, VoidCallback onTap) {

    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(style: BorderStyle.solid, width: 2),
          shape: const ContinuousRectangleBorder(),
        ),
        child: Text(text, style: TextStyles.styleDefault)
    );

  }

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
              HeaderDropdown(
                  header: Row(
                    children: const [
                      Text("Play Now", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  dropdown: _createElevatedButton("Opção", () {}),
                  recDirection: RecDirection.BOTTOM_LEFT
              ),
              SizedBox(width: 2.w,),
              HeaderDropdown(
                  header: Row(
                    children: const [
                      Text("Games", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  dropdown: _createElevatedButton("Opção", () {}),
                  recDirection: RecDirection.BOTTOM_LEFT
              ),
              SizedBox(width: 2.w,),
              HeaderDropdown(
                  header: Row(
                    children: const [
                      Text("Community", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  dropdown: _createElevatedButton("Opção", () {}),
                  recDirection: RecDirection.BOTTOM_LEFT
              ),
              SizedBox(width: 2.w,),
              HeaderDropdown(
                  header: Row(
                    children: const [
                      Text("Donate", style: TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  dropdown: _createElevatedButton("Opção", () {}),
                  recDirection: RecDirection.BOTTOM_LEFT
              ),
            ],
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("LOGO AQUI"),
                  SizedBox(width: 1.w,),
                  ButtonDropdown(
                      button: Container(
                        padding: const EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          border: Border.fromBorderSide(BorderSide(color: Colors.black))
                        ),
                        child: Row(
                          children: const [
                            Text("Sign In", style: TextStyle(fontWeight: FontWeight.bold)),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                      dropdown: const LoginModal()
                  ),
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
