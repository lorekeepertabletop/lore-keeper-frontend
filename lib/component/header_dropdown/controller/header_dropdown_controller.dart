import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lore_keeper_frontend/domain/rec_values/enum/rec_direction.dart';

import '../../../domain/rec_values/rec_values.dart';

class HeaderDropdownController extends GetxController with GetTickerProviderStateMixin {

  final GlobalKey headerKey;
  final Widget dropdown;
  final RecDirection recDirection;

  HeaderDropdownController({required this.headerKey, required this.dropdown, required this.recDirection});

  final Rx<OverlayEntry?> _overlayEntry = Rx<OverlayEntry?>(null);
  final RxBool isHoveredHeader = RxBool(false);
  final RxBool isHoveredDropdown = RxBool(false);

  late final AnimationController _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 80)
  );
  late final Animation<double> animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease
  );


  void verifyOverlay() {

    if (_overlayEntry.value == null) {

      _createOverlay();

    }

    if (isHoveredHeader.value || isHoveredDropdown.value) {

      _displayOverlay();

    } else {

      _removeOverlay();

    }

  }

  void _createOverlay() {

    final RenderBox renderBox = headerKey.currentContext?.findRenderObject() as RenderBox;
    RecValues recValues = recDirection.getRecValue(renderBox.localToGlobal(Offset.zero) & renderBox.size);

    _overlayEntry.value = OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        top: recValues.bottom,
        left: recValues.left,
        right: recValues.right,
        child: MouseRegion(
            child: SizeTransition(
              sizeFactor: CurvedAnimation(
                  parent: _animationController,
                  curve: Curves.easeOut
              ),
              child: dropdown,
            ),
            onEnter: (event) {
              isHoveredDropdown.value = true;
              verifyOverlay();
            },
            onExit: (event) {
              isHoveredDropdown.value = false;
              verifyOverlay();
            }
        ),
      );
    });

    Overlay.of(Get.overlayContext!).insert(_overlayEntry.value!);

  }

  void _displayOverlay() {

    _animationController.forward();

  }

  void _removeOverlay() {

    _animationController.reverse();

  }

}