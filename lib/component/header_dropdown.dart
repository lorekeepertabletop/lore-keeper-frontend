import 'package:flutter/material.dart';

class HeaderDropdown extends StatelessWidget {

  final String text;
  final GestureTapCallback onTap;
  final Icon? icon;

  const HeaderDropdown(this.text, {required this.onTap, this.icon});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SelectableText(text, style: const TextStyle(fontWeight: FontWeight.bold),),
          icon ?? const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
