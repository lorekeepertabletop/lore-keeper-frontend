import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/text_styles.dart';

class LandingController extends GetxController {

  Widget createElevatedButton (String text, VoidCallback onTap) {

    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(style: BorderStyle.solid, width: 2),
          shape: const ContinuousRectangleBorder(),
        ),
        child: Text(text, style: TextStyles.styleDefault)
    );

  }

}