import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonDropdown<T extends Widget, B extends Widget> extends StatelessWidget {

  final T button;
  final B dropdown;

  const ButtonDropdown({super.key, required this.button, required this.dropdown});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<B>(
      offset: const Offset(0, 7),
      shape: const Border.fromBorderSide(BorderSide(color: Colors.black)),
      color: Colors.green,
      position: PopupMenuPosition.under,
      tooltip: "",
      child: button,
      itemBuilder: (context) => <PopupMenuEntry<B>>[
        PopupMenuItem(
            padding: const EdgeInsets.all(10),
            enabled: false,
            child: dropdown
        )
      ],
    );
  }

}
