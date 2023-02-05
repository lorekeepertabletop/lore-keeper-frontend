import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lore_keeper_frontend/domain/rec_values/enum/rec_direction.dart';
import 'package:lore_keeper_frontend/domain/rec_values/rec_values.dart';

class HeaderDropdown extends StatefulWidget {

  final Widget header;
  final Widget dropdown;
  final RecDirection recDirection;

  HeaderDropdown({Key? key, required this.header, required this.dropdown, required this.recDirection}) : super(key: key);

  @override
  _HeaderDropdownState createState() => _HeaderDropdownState();
}

class _HeaderDropdownState extends State<HeaderDropdown> {

  OverlayEntry? _overlayEntry;
  final GlobalKey _globalKey = GlobalKey();
  bool _isHoveredHeader = false;
  bool _isHoveredDropdown = false;

  void verifyOverlay() {

    setState(() {
      if (_isHoveredHeader || _isHoveredDropdown) {

        if (_overlayEntry == null) {

          createOverlay();

        }

      } else {

        if (_overlayEntry != null) {

          removeOverlay();

        }

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
            child: Theme(
              data: Theme.of(context),
              child: MouseRegion(
                  child: widget.dropdown,
                  onEnter: (event) {
                    _isHoveredDropdown = true;
                    verifyOverlay();
                  },
                  onExit: (event) {
                    _isHoveredDropdown = false;
                    verifyOverlay();
                  }
              ),
            )
        );
    });

    Overlay.of(context)?.insert(_overlayEntry!);

  }

  void removeOverlay() {

    _overlayEntry?.remove();
    _overlayEntry = null;

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
