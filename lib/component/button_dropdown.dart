import 'package:flutter/material.dart';

class ButtonDropdown extends StatelessWidget {

  final String text;

  final VoidCallback? onPressed;
  final Icon? icon;

  const ButtonDropdown(this.text, {required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(left: 10),
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(),
          side: const BorderSide(
            style: BorderStyle.solid
          )
        ),
        child: Row(
          children: [
            Text(text, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            icon ?? const Icon(Icons.arrow_drop_down, color: Colors.black,)
          ],
        )
    );
  }
}
