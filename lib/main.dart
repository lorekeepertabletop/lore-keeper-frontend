import 'package:flutter/material.dart';

import 'util/hex_color.dart';
import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: HexColor("CEE5D0"),
            ),
      ),
      home: const HomePage(),
    );
  }
}
