import 'package:flutter/material.dart';
import 'package:lore_keeper_frontend/domain/rec_values/enum/rec_direction.dart';

import '../controller/header_dropdown_controller.dart';

class HeaderDropdown extends StatelessWidget {

  final Widget header;
  final Widget dropdown;
  final RecDirection recDirection;

  const HeaderDropdown({Key? key, required this.header, required this.dropdown, required this.recDirection}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    HeaderDropdownController controller = HeaderDropdownController(
      headerKey: GlobalKey(),
      dropdown: dropdown,
      recDirection: recDirection
    );

    return MouseRegion(
      key: controller.headerKey,
      onExit: (event) {
        controller.isHoveredHeader.value = false;
        controller.verifyOverlay();
      },
      onEnter: (event) {
        controller.isHoveredHeader.value = true;
        controller.verifyOverlay();
      },
      child: header,
    );

  }

}
