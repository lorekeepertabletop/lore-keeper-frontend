import 'package:flutter/material.dart';
import 'package:lore_keeper_frontend/domain/rec_values/enum/rec_direction.dart';
import 'package:lore_keeper_frontend/domain/rec_values/rec_values.dart';

class HeaderDropdown extends StatefulWidget {

  final Widget header;
  final Widget dropdown;
  final RecDirection recDirection;

  const HeaderDropdown({Key? key, required this.header, required this.dropdown, required this.recDirection}) : super(key: key);

  @override
  State<HeaderDropdown> createState() => _HeaderDropdownState();

}

class _HeaderDropdownState extends State<HeaderDropdown> with TickerProviderStateMixin {

  OverlayEntry? _overlayEntry;
  final GlobalKey _globalKey = GlobalKey();
  bool _isHoveredHeader = false;
  bool _isHoveredDropdown = false;

  late AnimationController _animationController;

  @override
  void initState() {

    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 80));

  }

  void verifyOverlay() {

    setState(() {

      if (_overlayEntry == null) {

        createOverlay();

      }

      if (_isHoveredHeader || _isHoveredDropdown) {

        displayOverlay();

      } else {

        removeOverlay();

      }

    });

  }

  void createOverlay() {

    final RenderBox renderBox = _globalKey.currentContext?.findRenderObject() as RenderBox;
    RecValues recValues = widget.recDirection.getRecValue(renderBox.localToGlobal(Offset.zero) & renderBox.size);

    _overlayEntry = OverlayEntry(builder: (BuildContext context) {
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
              child: widget.dropdown,
            ),
            onEnter: (event) {
              _isHoveredDropdown = true;
              verifyOverlay();
            },
            onExit: (event) {
              _isHoveredDropdown = false;
              verifyOverlay();
            }
        ),
      );
    });

    Overlay.of(context).insert(_overlayEntry!);

  }

  void displayOverlay() {

    _animationController.forward();

  }

  void removeOverlay() {

    _animationController.reverse();

  }

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      key: _globalKey,
      onExit: (event) {
        _isHoveredHeader = false;
        verifyOverlay();
      },
      onEnter: (event) {
        _isHoveredHeader = true;
        verifyOverlay();
      },
      child: widget.header,
    );

  }

}
