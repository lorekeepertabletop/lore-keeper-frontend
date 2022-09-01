import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class HeaderDropdown extends StatefulWidget {

  final String text;
  final GestureTapCallback onTap;
  final Icon? icon;

  const HeaderDropdown(this.text, {Key? key, required this.onTap, this.icon}) : super(key: key);

  @override
  State<HeaderDropdown> createState() => _HeaderDropdownState();
}

class _HeaderDropdownState extends State<HeaderDropdown> {
  bool isHooveredTarget = false;
  bool isHooveredFollower = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHooveredTarget = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHooveredTarget = false;
        });
      },
      child: PortalTarget(
        visible: isHooveredTarget || isHooveredFollower,
        anchor: const Aligned(follower: Alignment.topCenter, target: Alignment.bottomCenter),
        closeDuration: const Duration(milliseconds: 100),
        portalFollower: MouseRegion(
          onEnter: (event) {
            isHooveredFollower = true;
          },
          onExit: (event) {
            setState(() {
              isHooveredFollower = false;
            });
          },
          child: Container(
            width: 110,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black, width: 1.5)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Option 1"),
                SizedBox(height: 10,),
                Text("Option 2"),
                SizedBox(height: 10,),
                Text("Option 3"),
              ],
            ),
          ),
        ),
        child: Row(
          children: [
            SelectableText(widget.text, style: const TextStyle(fontWeight: FontWeight.bold),),
            widget.icon ?? const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
