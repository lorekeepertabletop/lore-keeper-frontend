// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:lore_keeper_frontend/domain/rec_values/rec_values.dart';

enum RecDirection {

  BOTTOM_LEFT,
  BOTTOM_RIGHT;

  RecValues getRecValue(Rect rect) {

    if (this == RecDirection.BOTTOM_LEFT) {

      return RecValues(
        bottom: rect.bottom,
        top: null,
        left: rect.left,
        right: null
      );

    } else {

      return RecValues(
          bottom: rect.bottom,
          top: null,
          left: null,
          right: rect.right
      );

    }

  }

}